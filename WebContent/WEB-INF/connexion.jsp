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
	<style><%@include file="../styleCss/style.css"%></style> 
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styleCss/style.css" /> --%>

    				 <title>ENI-Encheres Accueil</title>
  </head>
  
  <body> 	
    <div class="container" style="margin-top: 20px">
        <div class="row">
             <div class="col-sm-8">
             								      <!-- /rien pour retour à l'accueil -->
                <a href="<%=request.getContextPath() %> "><img src="./images/logo-eni-encheres.png" alt="photo ici"></a>
            </div>  
		    <main>
				<form method="post" action="Connexion">
				<div class="formulaire">
					<label for="identifiant">Identifiant :</label>
					<input type="text" id="email" name="email"/>
					<br/>
					<label for="motdepasse">Mot de passe :</label>
					<input type="password" id="motDePasse" name="motDePasse"/>
					<br/>
				</div>	
				<div class="connexion">
					<input type="submit" value="Connexion"/>
					<input type="checkbox" id="souvenir" name="souvenir" value="oui"/>Se souvenir de moi
					<a href="" >Mot de passe oublié</a>
				</div>
				<div class="creerCompte">
					<a href="<%=request.getContextPath() %>/Ajout"><input type="button" value="Créer un compte"/></a>
				</div>
				</form>				
				
			</main>
    	</div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
 
 </body>
</html>