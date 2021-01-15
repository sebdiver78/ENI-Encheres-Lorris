<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Profil utilisateur</title>
</head>
<body>

<h1>ENI-Enchères</h1>

<p>Pseudo : ${utilisateur.pseudo }</p>
<br/>
<p>Nom : ${utilisateur.nom }</p>
<br/>
<p>Prénom : ${utilisateur.prenom }</p>
</br>
<p>Email : ${utilisateur.telephone }</p>
</br>
<p>Rue : ${utilisateur.rue }</p>
</br>
<p>Code Postal ${utilisateur.codePostal }</p>
</br>
<p>Ville ${utilisateur.ville }</p>

<a href="AccueilSession">Retour</a>
<footer>
	<div class="barblanc"><img id="logo-eni" src="./images/logo-eni.png" alt="photo ici"></div>
	<div class="barbleu"><p class="nous">Réalisé par Sebastien et Lorris</p></div>
</footer>

</body>
</html>