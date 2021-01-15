<%@page import="fr.eni.enchere.bo.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Détail vente</title>
</head>
<body>
<%
	Article articleEnCours = new Article();
	articleEnCours = (Article) request.getAttribute("articleEnchere");

%>

<h1>Détail vente</h1>
<form method ="post" action="actionArticle">
	<h1>${articleEnchere.nomArticle }</h1>
	<h2>Description : ${articleEnchere.descriptionArticle }</h2>
	<p>Catégorie : ${articleEnchere.categorie.libelle}</p>
	
	<label for="enchereActuelle">Meilleure offre</label>
	<input type="number" id="enchereActuelle" name="enchereActuelle"  value="<%=Math.round(articleEnCours.getPrixVente())%>"/></p>
	
	<p>Fin de l'enchère : ${articleEnchere.dateFinEnchere }</p>
	<p>Retrait : ${articleEnchere.retrait.rue } ${articleEnchere.retrait.codePostal } ${articleEnchere.retrait.ville }
	<p>Vendeur : ${articleEnchere.utilisateur.pseudo }</p>
	<input type="hidden" id="idArticle" name="idArticle" value="<c:out value="${articleEnchere.idArticle}"/>"/>
	<input type="text" id="idUSerSession" name="idUserSession" value="<c:out value="${sessionScope.sessionUtilisateur.noUtilisateur}"/>"/>
	

	
		<label for="proposition">Ma proposition</label>
		<input type="number" id="proposition" name="proposition"/>
		<input type="submit" value="Enchérir"/>	
	</form>
	<a href="AccueilSession"><input type="button" value="annuler"/></a>
	
</body>
</html>