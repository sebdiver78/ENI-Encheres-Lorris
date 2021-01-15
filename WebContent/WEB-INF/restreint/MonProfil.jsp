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

   					 <title>ENI-Encheres profil</title>
  </head>
<body>
    <div class="container" style="margin-top: 20px">
        <div class="row">
             <div class="col-sm-8">
                <a href="<%=request.getContextPath() %>/AccueilSession "><img id="logo-encheres" src="./images/logo-eni-encheres.png" alt="photo ici"></a>
            </div> 
            <div class="col-sm-12" style="text-align: right; margin-bottom: 20px"> 
                <a href="<%=request.getContextPath() %>#">Enchères</a>
				<a href="<%=request.getContextPath() %>/VendreUnArticle">Vendre un article</a>
											      <!-- /rien pour retour à l'accueil -->
				<a href="<%=request.getContextPath() %> ">Déconnexion</a> 
            </div>
        	<p>Crédit disponible : ${sessionScope.sessionUtilisateur.credit }</p>
        </div>
    </div>         
  
	<div class="profil">
	<form method="post" action="Update?id=${sessionScope.sessionUtilisateur.noUtilisateur}">
		<div class="col1">
			<label for="Pseudo">Pseudo :</label>
			<input type="text" id="pseudo" name="pseudo" value="<c:out value="${utilisateur.pseudo }"/>"/>
			<span>${erreurs['pseudo']}</span>
			<!--  -->
			<label for="Prenom">Prénom :</label>
			<input type="text" id="prenom" name="prenom" value="<c:out value="${utilisateur.prenom }"/>"/>
			<span>${erreurs['prenom']}</span>
			
			<label for="telephone">Téléphone :</label>
			<input type="text" id="telephone" name="telephone" value="<c:out value="${utilisateur.telephone }"/>"/>
			<span>${erreurs['telephone']}</span>
			
			<label for="codePostal">Code Postal :</label>
			<input type="number" id="codePostal" name="codePostal" value="<c:out value="${utilisateur.codePostal }"/>"/>
			<span>${erreurs['codePostal']}</span>
			
			<label for="nom">Nom :</label>
			<input type="text" id="nom" name="nom" value="<c:out value="${utilisateur.nom }"/>"/>
			<span>${erreurs['nom']}</span>
			
			<label for="motDePasse">Mot de passe actuel :</label>
			<input type="password" id="motDePasse" name="motDePasse" value="<c:out value="${utilisateur.motDePasse }"/>">
			<span>${erreurs['motDePasse']}</span>
			
			<label for="motDePasse">Nouveau mot de passe :</label>
			<input type="password" id="newMotDePasse" name="newMotDePasse" >
			<span>${erreurs['motDePasse']}</span>
			
			<label for="email">Email :</label>
			<input type="email" id="email" name="email" value="<c:out value="${utilisateur.email }"/>"/>
			<span>${erreurs['email']}</span>
			
			<label for="rue">Rue :</label>
			<input type="text" id="rue" name="rue" value="<c:out value="${utilisateur.rue }"/>"/>
			<span>${erreurs['rue']}</span>
			
			<label for="ville">Ville :</label>
			<input type="text" id="ville" name="ville" value="<c:out value="${utilisateur.ville }"/>"/>
			<span>${erreurs['ville']}</span>
			
			<label for="confirmation">Confirmation :</label>
			<input type="password" id="confirmation" name="confirmation"/>
	</div>
	
	<p>Crédit : ${utilisateur.credit}</p>
	
		<input type="submit" value="Enregistrer"/>
		
		<a href="Delete?id=${sessionScope.sessionUtilisateur.noUtilisateur}"><input type="button" value="Supprimer mon compte"/></a>
	
	<p>${form.resultat}</p> 
	<p>${erreurs['motDePasse']} </p>
	
	</form>
	</div>
	<footer>
      	<div class="barblanc"><img id="logo-eni" src="./images/logo-eni.png" alt="photo ici"></div>
      	<div class="barbleu"><p class="nous">Réalisé par Sebastien et Lorris</p></div>
      </footer>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>