<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Pour récupérer le fichier css  -->
	<style><%@include file="../../styleCss/style.css"%></style> 
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styleCss/style.css" /> --%> 

    				<title>ENI-Enchères Session</title>
  </head>
  <body> 
    <div class="container">
        <div class="row">
        	<div class="col-sm-8" style="margin-left: 0.65%">
                <a href="<%=request.getContextPath() %>/AccueilSession" ><img id="logo-encheres" src="./images/logo-eni-encheres.png" alt="photo ici"></a>   
            </div> 
            <div class="col-sm-12" style="text-align: right; margin-bottom: 20px"> 
                <a href="<%=request.getContextPath() %>#">Enchères</a>
				<a href="<%=request.getContextPath() %>/VendreUnArticle">Vendre un article</a>
            	<a href="${pageContext.request.contextPath}/Profil?id=${sessionScope.sessionUtilisateur.noUtilisateur}">Mon profil</a>
												  <!-- /rien pour retour à l'accueil -->
				<a href="<%=request.getContextPath() %> ">Déconnexion</a> 
            </div>
            <p>Bonjour ${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</p>
        	<p>Crédit disponible : ${sessionScope.sessionUtilisateur.credit }</p>
        </div>
    </div>
    <div class="col-sm-12" style="text-align: center;">
        <h2>Liste des enchères</h2>          
    </div>
    <div class="container">
        <div class="row">
          <h4 id="filtre">Filtres :</h4>  
          <div class="col-6">
              <div id="input" class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">?</span>
                <input type="text" class="form-control" placeholder="Le nom de l'article contient" aria-label="Username" aria-describedby="basic-addon1">
              </div>
            <br>
              <div class="container">
                  <div class="row">
                      <div class="col-sm-6">
                        <h4>Catégorie:</h4>
                      </div>
                      <div class="col-sm-6">
                        <select class="form-select" aria-label="Default select example">
                            <option value="0">Toutes</option>
                            <c:forEach var="cat" items="${listeCategories}">
                            <c:set var="idCat" value="${cat.idCategorie }"/>
							<option value ="<c:out value="${cat.idCategorie}" />">${cat.libelle}</option>
							</c:forEach>
                          </select>
                      </div>
                  </div>
              </div>
   		 </div>
         <div class="col-sm-6">
           <button id="rechercher" type="button" class="btn btn-outline-primary btn-lg" style="margin-left: 120px; margin-top: 20px;">Rechercher</button>
         </div>
        </div>
    </div>
    <div class="container">  
    	<div class="row">
			<div class="col-sm-3" style="margin-top: 20px;margin-left: 25px">
				<div style="margin-left: ">
				<input type="radio" id="achats" value="achats" name="choix"checked>Achats
				<br>
				<input type="checkbox" style="margin-left: 30px" value="encheres ouvertes" checked>enchères ouvertes
				<br>
				<input type="checkbox" style="margin-left: 30px" value="mes encheres en cours">mes enchères en cours
				<br>
				<input type="checkbox" style="margin-left: 30px" value="mes encheres remportées">mes enchères remportées
				</div>
			</div>
			<br>
			<div class="col-sm-4" style="margin-top: 20px;margin-left: 20px">
				<input type="radio" value="ventes" name="choix" >Mes ventes
				<br>
				<input type="checkbox" style="margin-left: 30px" value="mes ventes en cours">mes ventes en cours
				<br>
				<input type="checkbox" style="margin-left: 30px" value="ventes non débutées">ventes non débutées
				<br>
				<input type="checkbox" style="margin-left: 30px" value="ventes terminées">ventes terminées
			</div>
		</div>
	</div>
    <br>  
    <div class="container">
    <p style="text-align: center;"> Il y a ${listeArticles.size()} objets en vente</p>
    <div class="row">
        <div class="col-sm-6">
          	<c:set var="i" value="${1}"/>
			<c:forEach var="art" items="${listeArticles}"  >
			<h2>${art.nomArticle}</h2> 
			<p>Prix : ${art.prixVente} points</p>
			<p>Fin de l'enchère : ${art.dateFinEnchere}</p>
			<p> Vendeur : <a href="ProfilUser?id=${art.utilisateur.noUtilisateur}">${art.utilisateur.pseudo}</a></p>
			<br/>
			<c:set var="i" value="${i +1 }"/>
			</c:forEach>
        </div>
        <div class="col-sm-6">
          	<c:set var="i" value="${1}"/>
			<c:forEach var="art" items="${listeArticles}"  >
			<h2>${art.nomArticle}</h2> 
			<p>Prix : ${art.prixVente} points</p>
			<p>Fin de l'enchère : ${art.dateFinEnchere}</p>
			<p> Vendeur : <a href="ProfilUser?id=${art.utilisateur.noUtilisateur}">${art.utilisateur.pseudo}</a></p>
			<br/>
			<c:set var="i" value="${i +1 }"/>
			</c:forEach>
        </div>
    </div>
</div>
<footer>
	<div class="barblanc"><img id="logo-eni" src="./images/logo-eni.png" alt="photo ici"></div>
	<div class="barbleu"><p class="nous">Réalisé par Sebastien et Lorris</p></div>
</footer>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

  </body>
</html>
