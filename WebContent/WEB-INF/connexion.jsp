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
    <link rel="stylesheet" href="css/styleAccueil.css">

    <title>ENI-Encheres Accueil</title>
  </head>
  <body> 	
    <div class="container" style="margin-top: 20px">
        <div class="row">
             <div class="col-sm-8"> 
                <a href="<%=request.getContextPath() %>/" style="text-decoration: none; color: blue; font-size: 40px; font-weight: bold;">ENI-Enchères</a>
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
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
  </body>
</html>