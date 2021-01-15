<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">

    				<title>ENI-Enchères Inscription</title>
</head>

<body>
    <div class="container"  style="margin-top:20px">
   	  <div class="profil">
        <div class="row">
           <div class="col-sm-12">
           <a href="<%=request.getContextPath() %>/" style="text-decoration: none; color: blue; font-size: 40px; font-weight: bold;">ENI-Enchères</a>
           </div>
           <h4 style="text-align: center">Créer un compte</h4>
           <div class="row" style="margin-top:20px">
              <div class="col-lg-12 col-lg-offset-1">
                  <form id="contact-form" method="post" action="Ajout" role="form">
                      <div class="row">
                          <div class="col-md-6">
                              <label for="Pseudo">Pseudo : *</label>
                              <input type="text" id="pseudo" name="pseudo" class="form-control" value="<c:out value=" ${utilisateur.pseudo }" />"/>
                              <span>${erreurs['pseudo']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="nom">Nom : *</label>
							  <input type="text" id="nom" name="nom" class="form-control" value="<c:out value="${utilisateur.nom }"/>"/>
							  <span>${erreurs['nom']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="Prenom">Prénom : *</label>
                              <input type="text" id="prenom" name="prenom" class="form-control" value="<c:out value=" ${utilisateur.prenom }" />"/>
                              <span>${erreurs['prenom']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="email">Email : *</label>
							  <input type="email" id="email" name="email" class="form-control" value="<c:out value="${utilisateur.email }"/>"/>
							  <span>${erreurs['email']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="telephone">Téléphone : *</label>
							  <input type="text" id="telephone" name="telephone" class="form-control" value="<c:out value="${utilisateur.telephone }"/>"/>
							  <span>${erreurs['telephone']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="rue">Rue : *</label>
							  <input type="text" id="rue" name="rue" class="form-control" value="<c:out value="${utilisateur.rue }"/>"/>
							  <span>${erreurs['rue']}</span>
                              <p class="comments"></p>
                          </div><div class="col-md-6">
							  <label for="codePostal">Code Postal : *</label>
							  <input type="number" id="codePostal" name="codePostal" class="form-control" value="<c:out value="${utilisateur.codePostal }"/>"/>
							  <span>${erreurs['codePostal']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="ville">Ville :</label>
							  <input type="text" id="ville" name="ville" class="form-control" value="<c:out value="${utilisateur.ville }"/>"/>
							  <span>${erreurs['ville']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="motDePasse">Mot de Passe : *</label>
							  <input type="password" id="motDePasse" name="motDePasse" class="form-control" value="<c:out value="${utilisateur.motDePasse }"/>">
							  <span>${erreurs['motDePasse']}</span>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-6">
                              <label for="confirmation">Confirmation mot de passe: *</label>
							  <input type="password" id="confirmation" name="confirmation" class="form-control"/>
                              <p class="comments"></p>
                          </div>
                          <div class="col-md-12">
                              <p><strong>* Ces informations sont requises</strong></p>
                          </div>
                      </div>
                      <div class="row">
	                      <div class="col-sm-6">
	                      	<a href="<%=request.getContextPath() %>/AccueilSession">
				            <button id="creer" type="submit" class="btn btn-outline-primary btn-lg" style="margin-top: 10px; margin-left: 30%;">Créer</button>
			            	</a>
				            <a href="<%=request.getContextPath() %>/">
				            <button id="annuler" type="button" class="btn btn-outline-primary btn-lg" style="margin-top: 10px;">Annuler</button>
			            	</a>
				          </div>
			          </div>
			          <p>${form.resultat}</p>
        			  <p>${erreurs['motDePasse']} </p>
                  </form>
              </div>
          </div>
		</div>
        </div>
    </div>
    
</body>
</html>