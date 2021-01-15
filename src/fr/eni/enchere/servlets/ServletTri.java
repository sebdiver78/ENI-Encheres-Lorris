package fr.eni.enchere.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.eni.enchere.bll.ArticleManager;
import fr.eni.enchere.bo.Article;
import fr.eni.enchere.bo.Categories;
import fr.eni.enchere.bo.Utilisateur;

/**
 * Servlet implementation class ServletTri
 */
@WebServlet("/triSession")
		
public class ServletTri extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTri() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/restreint/accueilSession.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Utilisateur utilisateurSession = new Utilisateur();
		utilisateurSession = (Utilisateur) session.getAttribute("sessionUtilisateur");
		
		int idCat =Integer.parseInt(request.getParameter("idCat"));
		String filtre = request.getParameter("filtre");
		System.out.println("*********SERVLET ACCUEIL doPOST*****");
		System.out.println("Idcat= "+idCat + " filtre ="+filtre);
		
		Categories categorie = new Categories();
		List<Categories> listeCategories = new ArrayList<>();
		
		ArticleManager articleManager = new ArticleManager();
		// requete pour remplir liste CATEGORIE
		listeCategories = articleManager.selectLibelleCategorie();
		request.setAttribute("listeCategories", listeCategories);
		
		//REQUETE pour remplir listeArticle
		List<Article> listeArticles = new ArrayList<Article>();
		List<Article> listeAEnvoyer = new ArrayList<Article>();
		
		listeArticles = articleManager.listeTousLesArticles();
		
		
	
		//requete pour FILTRES
		//par défaut enchères ouvertes checked
		String retourBouton = request.getParameter("achatEnchere");
		List<Article> listeArticlesTriees = new ArrayList<Article>();
		System.out.println("------retour BOUTON------------");
		System.out.println("bouton selectionné "+ retourBouton.toString());
		//selection des encheres ou articles dans la liste par boutons
		//avant d'utiliser les filtres
		listeArticlesTriees = articleManager.listeArticlesPourTriBouton(retourBouton, utilisateurSession);
		System.out.println("***********SERVLET TRI**********");
		System.out.println("liste Article triee " + listeArticlesTriees.toString());
		//si bouton encheres  on va ds enchereManager methode qui renvoie 
		//1 des 3 liste d'enchères
		//à filtre
		
		//si bouton ventes on va ds articleManager methode qui renvoie 
		//1 des 3 liste d'articles à filtrer
		
		//retour une liste qui portera le meme nom pour article et enchere
		
		listeAEnvoyer = articleManager.filtreArticles(idCat, filtre, listeArticlesTriees);
		System.out.println("listeAEnvoyer" + listeAEnvoyer.toString());
		request.setAttribute("listeArticles", listeAEnvoyer);
		
		/*
		if (idCat != 0 && filtre != null || filtre != "") {
			if (idCat!=0 && filtre == null || filtre =="") {
				for (Article articleListe : listeArticlesTriees) {
					if (idCat == articleListe.getIdCategorie()) {
						listeAEnvoyer.add(articleListe);
						
					}
					
					
										
				} 
				
				request.setAttribute("listeArticles", listeAEnvoyer);
				
			} else if (idCat==0 && (filtre != null || filtre != "")) {
				
				
				for (Article article : listeArticlesTriees) {
					if (article.getNomArticle().contains(filtre)) {
						
						listeAEnvoyer.add(article);	
						}
										
				} 
				request.setAttribute("listeArticles", listeAEnvoyer);
				
			} else { 
					System.out.println("****filtre+cat***");
					for (Article article : listeArticlesTriees) {
						
											
						if (article.getNomArticle().contains(filtre) && idCat == article.getIdCategorie()) {
							
								
								listeAEnvoyer.add(article);
							
										
	
					}request.setAttribute("listeArticles", listeAEnvoyer);
			}	
			}
			
		} else {
			
			listeAEnvoyer = listeArticlesTriees;
			request.setAttribute("listeArticles", listeAEnvoyer);
					
					
				}
			
		*/
			
			
		
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/restreint/accueilSession.jsp");
		rd.forward(request, response);
		
	}
			

	

}
