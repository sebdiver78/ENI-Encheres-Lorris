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

import fr.eni.enchere.bll.ArticleManager;
import fr.eni.enchere.bo.Article;
import fr.eni.enchere.bo.Categories;

/**
 * Servlet implementation class ServletAccueil
 */
@WebServlet(
		urlPatterns= {
				"/",
				"/rechercher"
				
		})
		
	
public class ServletAccueil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAccueil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getServletPath().equals("/")) { 
		//recup libelle categorieBDD
		Categories categorie = new Categories();
		List<Categories> listeCategories = new ArrayList<>();
		
		ArticleManager articleManager = new ArticleManager();
		
		listeCategories = articleManager.selectLibelleCategorie();
		request.setAttribute("listeCategories", listeCategories);
		
		List<Article> listeArticles = new ArrayList<Article>();
		listeArticles = articleManager.listeTousLesArticles();
		System.out.println("ServletAccueil ListeArticle = "+ listeArticles.toString());
		request.setAttribute("listeArticles", listeArticles);
		System.out.println("***SERVLET_Accueil partie /");
		
		} 
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Accueil.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		if (idCat != 0 && filtre != null || filtre != "") {
			if (idCat!=0 && filtre == null || filtre =="") {
				for (Article articleListe : listeArticles) {
					if (idCat == articleListe.getIdCategorie()) {
						listeAEnvoyer.add(articleListe);
						
					}
					
					
										
				} 
				
				request.setAttribute("listeArticles", listeAEnvoyer);
				
			} else if (idCat==0 && (filtre != null || filtre != "")) {
				
				
				for (Article article : listeArticles) {
					if (article.getNomArticle().contains(filtre)) {
						
						listeAEnvoyer.add(article);	
						}
										
				} 
				request.setAttribute("listeArticles", listeAEnvoyer);
				
			} else { 
					System.out.println("****filtre+cat***");
					for (Article article : listeArticles) {
						
											
						if (article.getNomArticle().contains(filtre) && idCat == article.getIdCategorie()) {
							
								
								listeAEnvoyer.add(article);
							
										
	
					}request.setAttribute("listeArticles", listeAEnvoyer);
			}	
			}
			
		} else {
			
			listeAEnvoyer = listeArticles;
			request.setAttribute("listeArticles", listeAEnvoyer);
					
					
				}
			
		
			
			
		
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/Accueil.jsp");
		rd.forward(request, response);
		
	}
			
}
