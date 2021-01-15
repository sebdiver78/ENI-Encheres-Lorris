package fr.eni.enchere.bll;

import java.time.LocalDate; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import fr.eni.enchere.bo.Enchere;
import fr.eni.enchere.bo.Utilisateur;
import fr.eni.enchere.dal.ArticleDAO;
import fr.eni.enchere.dal.DAOFactory;
import fr.eni.enchere.dal.EnchereDAO;
import fr.eni.enchere.dal.UtilisateurDAO;

public class EnchereManager {
	
	
private EnchereDAO enchereDAO;
	
	public EnchereManager() {
		this.enchereDAO = DAOFactory.getEnchereDAO();

}
	
	
	private String resultat;
	//liste erreurs
	private Map<String, String> erreurs = new HashMap<String, String>();
	
	public String getResultat() {
		return resultat;
	}
	
	public Map<String, String> getErreur() {
		return erreurs;
	}
	
	
	
	private void setErreur(String champ, String message) {
		erreurs.put(champ, message);
	}

	//**************METHODE ENCHERE MANAGER-----------------------
	
	
	//METHODE MANAGER APPELEE PAR SERVLET QUI, SI ENCHERE DEJA EXISTATNE SUR LE MEME OBJET (dans l'ordre) 
	// RECREDITE ANCIEN ENCHERISSEUR
	//EFFACE ENCHERE EN COURS DE L'	ANCIEN ENCHERISSEUR
	//AJOUTE LA NOUVELLE ENCHERE
	
	public Utilisateur valideInsertEnchere(int idArticle, int idUserSession, int montant, int enchereActuelle, int credit) {
		Enchere enchere = new Enchere();
		int nouveauCredit;
		Utilisateur utilisateur = new Utilisateur();
		System.out.println("CREDIT SESSION "+ credit);
		UtilisateurManager utilisateurManager = new UtilisateurManager();
		ArticleManager articleManager = new ArticleManager();
		LocalDate dateEnchere =LocalDate.now();
		
	
		
		try {
			
			validationMontant(montant, enchereActuelle);
		} catch (Exception e) {
			
			setErreur("Montant", e.getMessage());
		}
		enchere.setMontantEnchere(montant);
		enchere.setIdArticle(idArticle);
		enchere.setNoUtilisateur(idUserSession);
		
		
		System.out.println("************ENCHERE MANAGER INSERTION***********");
		System.out.println("Enchere = "+ enchere.toString());
		try {
			
			
			validationCredit(credit, montant);
		} catch (Exception e) {
			
			setErreur("Credit", e.getMessage());
		}
		
		nouveauCredit=credit-montant;
		System.out.println("ENCHERE MAJ CREDIT "+ nouveauCredit);
		
		
		
		
		if (erreurs.isEmpty()) {// si pas d'erreur
			//EnchereManager enchereManager = new EnchereManager();
			//avant de supprimer
			//List<Enchere> listeEncheres = new ArrayList<Enchere>();//on recupere la liste des encheres
			EnchereManager enchereManager = new EnchereManager();
			//listeEncheres = enchereDAO.getListeEncheres();
			Utilisateur utilisateurARecrediter = new Utilisateur();
			if (!verifSIEnchereExiste(idArticle, idUserSession, montant, enchereActuelle, credit, dateEnchere)) {
				
				System.out.println("nouvelle enchere car pas d'objet ds la liste");
				utilisateurManager.UpdateCredit(nouveauCredit, idUserSession);
				this.enchereDAO.insertEnchere(enchere);
				articleManager.updatePrixArticle(idArticle, montant);
				utilisateurManager.UpdateCredit(nouveauCredit, idUserSession);
				
			}
			
			
			System.out.println(("idArticle =" +idArticle));
			
			resultat = "Enchère validée";
		} else {
			System.out.println(erreurs.toString());
			resultat =" Echec validation enchère";
		}
		
		System.out.println("EnchereMANAGER resultat : "+ resultat);
		System.out.println("*****************************");
		utilisateur.setCredit(nouveauCredit);
		return utilisateur;
	}
	
	
	//***************************************
	//methode verifie si il y a déjà une enchère, si oui recrédite (update) l'ancien encherisseur
	//et update l'enchere en cours
	//************************************************
	
	public boolean verifSIEnchereExiste(int idArticle, int idUserSession, int montant, int enchereActuelle, int credit, LocalDate date) {
		Boolean result = false;
		ArticleManager articleManager = new ArticleManager();
		UtilisateurManager utilisateurManager = new UtilisateurManager();
		List<Enchere> listeEncheres = new ArrayList<Enchere>();//on recupere la liste des encheres
		EnchereManager enchereManager = new EnchereManager();
		listeEncheres = enchereDAO.getListeEncheres();
		Utilisateur utilisateurARecrediter = new Utilisateur();
		for (Enchere e : listeEncheres) {
			if (e.getIdArticle() == idArticle) {//si il y a dejà une fiche enchere pour l'article en cours
				int idUtilisateurARecrediter = e.getNoUtilisateur();//recupere l'ID de ancien utilisateur
				utilisateurARecrediter = utilisateurManager.selectUtilisateurId(idUtilisateurARecrediter);//recupere l'objet utilisateurARecrediter
				int montantARecrediter = utilisateurARecrediter.getCredit()+e.getMontantEnchere(); //recupere ancien credit utilisateurACrediter et rajoute le montant de sa précédente enchère
				System.out.println("Montant Recredit update = " + utilisateurARecrediter.getCredit() +" +" + e.getMontantEnchere());
				//update credit utilisateurACrediter
				utilisateurManager.UpdateCredit(montantARecrediter, idUtilisateurARecrediter);
				//update fiche enchere
				enchereDAO.updateEnchere(idArticle, idUserSession, montant,date);
				articleManager.updatePrixArticle(idArticle, montant);
				result = true;
				
			} 
				
		
		
			}
		System.out.println("result de verifCreditUpdateEnchere= " + result);
		return result;
	}
			
		
	//***************************************************************
	//Methode qui trie la liste d'encheres suivant la valeur renvoyée par le bouton
	//*****************************************************************
	
	
	//encheres ouvertes=listeEnchere-enchereIdUserSession
	//encheres en cours=listeEncheres avec idUserSession seulement
	//encheres remportées=listeEncheres avec idUserSession et dont article.getDateFinEnchere>NOW
	
	
	//appelle par enchereDAO methode de enchereDAOJdbcImpl getListeEncheresPourTri
	//renvoie LISTE ENCHERES TRIEE
	
	
	
	
	
	//****************************************
	//methode validation
	//******************************************
	
	
	private void validationMontant(int montant, int enchereEncours) throws Exception {
		System.out.println("Montant et enchereActuelle" + montant +" "+ enchereEncours);
		if(montant != 0) {
			if (montant <= enchereEncours) {
				
				throw new Exception ("Saisir un montant supérieur à l'enchère actuelle");
			}
			
		} else {
			
			throw new Exception ("Saisir un montant");
		}
		
	}
	
	
	private void validationCredit(int credit, int montant) throws Exception {
		
		if((credit - montant)>0) {
			System.out.println("Credit OK");
			
		} else {
			throw new Exception ("Crédit trop faible");
		}
		
		
	}
	
}
