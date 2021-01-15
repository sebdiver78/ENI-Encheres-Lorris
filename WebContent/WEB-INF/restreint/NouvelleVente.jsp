<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Nouvelle vente</title>
</head>
<body>

<h1>Nouvelle vente</h1>
<p>Bienvenue ${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</p>

<form action="VendreUnArticle" method="post">
	<label for="article">Article</label>
	<input type="text" id="article" name="article"/>
	<br/>
	<label for="description">Description</label>
	<input type="text-area" id="description" name="description"/>
	<br/>
	<label for="categorie">Catégorie :</label>
	<select id ="categorie" name="categorie" required>
		<option value="">--choisir une catégorie--</option>
		
		<c:forEach var="cat" items="${listeCategories}">
		
		
				<option value ="<c:out value="${cat.idCategorie}" />">${cat.libelle} </option>
		
		</c:forEach>
		
	</select>
	<br/>
	<label for="photo">Photo de l'article</label>
	<p>upload photo en attente</p>
	<br/>
	<label for="miseAPrix">Mise a prix</label>
	<input type="number" id="miseAPrix" name="miseAPrix" required/>
	<br/>
	<label for="dateDebutEnchere">Début de l'enchère</label>
	<input type="date" id="dateDebutEnchere" name="dateDebutEnchere" required/>
	<br/>
	<label for="dateFinEnchere">Fin de l'enchère</label>
	<input type="date" id="dateFinEnchere" name="dateFinEnchere" required/>
	<br/>
	<fieldset>
		<legend>Retrait</legend>
		<label for="rue">Rue</label>
		<input type="text" id="text" name="rue" value="<c:out value="${sessionScope.sessionUtilisateur.rue}"/>" />
		<br/>
		<label for="codePostal">Code Postal</label>
		<input type="text" id="codePostal" name="codePostal" value="<c:out value="${sessionScope.sessionUtilisateur.codePostal }"/>"/>
		<br/>
		<label for="ville">Ville</label>
		<input type="text" id="ville" name="ville" value="<c:out value="${sessionScope.sessionUtilisateur.ville }"/>"/>
		<br/>
	
	</fieldset>

	<input type="submit" value="Enregistrer"/>
	<a href="Annuler"><input type="button" value="Annuler"/></a>


</form>

</body>
</html>