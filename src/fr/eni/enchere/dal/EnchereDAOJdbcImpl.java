package fr.eni.enchere.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import fr.eni.enchere.bo.Article;
import fr.eni.enchere.bo.Enchere;
import fr.eni.enchere.bo.Utilisateur;

public class EnchereDAOJdbcImpl implements EnchereDAO{

	private static final String INSERT_ENCHERE = "INSERT INTO ENCHERES (montant, idArticle, idUser) VALUES (?,?,?)";
	private static final String GET_ALL_ENCHERE = "SELECT * FROM ENCHERES ";
	private static final String DELETE_ENCHERE = "DELETE FROM ENCHERES WHERE idArticle = ?";
	private static final String UPDATE_ENCHERE = "UPDATE ENCHERES SET idUser = ?, montant= ?, date = ? WHERE idArticle =?";
	
	@Override
	public void insertEnchere(Enchere enchere) {
		
		
		try (Connection cnx = ConnectionProvider.getConnection()) {
			PreparedStatement rqt = cnx.prepareStatement(INSERT_ENCHERE);
			rqt.setInt(1, enchere.getMontantEnchere());
			rqt.setInt(2, enchere.getIdArticle());
			rqt.setInt(3, enchere.getNoUtilisateur());
			rqt.executeUpdate();

			System.out.println("INSERT ENCHERE");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

	@Override
	public Utilisateur getEnchereByUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Article getEnchereByArticle() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Enchere> getListeEncheres() {
		List<Enchere> listeEncheres = new ArrayList<Enchere>();
		
		try (Connection cnx = ConnectionProvider.getConnection()) {
			
			PreparedStatement rqt = cnx.prepareStatement(GET_ALL_ENCHERE);
			
			ResultSet rs = rqt.executeQuery();
			
			while (rs.next()) {
				Enchere enchere = new Enchere();
				enchere.setIdArticle(rs.getInt("idArticle"));
				enchere.setNoUtilisateur(rs.getInt("idUser"));
				enchere.setMontantEnchere(rs.getInt("montant"));
				
				listeEncheres.add(enchere);
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("**************ENCHERE JDBC LISTE**********");
		System.out.println("liste encheres = "+ listeEncheres.toString());
		return listeEncheres;
	}

	@Override
	public void deleteEnchere(int idArticle) {
		System.out.println("DELETE ENCHERE JDBC");
		try(Connection cnx = ConnectionProvider.getConnection()) {
			PreparedStatement rqt = cnx.prepareStatement(DELETE_ENCHERE);
			rqt.setInt(1, idArticle);
			rqt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void updateEnchere(int idArticle, int idUserSession, int montant, LocalDate date) {
		// TODO Auto-generated method stub
try(Connection cnx = ConnectionProvider.getConnection()) {
			
			PreparedStatement rqt = cnx.prepareStatement(UPDATE_ENCHERE);
			
			//String dateConv = date.toString();
			rqt = cnx.prepareStatement(UPDATE_ENCHERE);
			rqt.setInt(1, idUserSession);
			rqt.setInt(2, montant);
			rqt.setDate(3, java.sql.Date.valueOf(date));
			rqt.setInt(4, idArticle);
			
			rqt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}
	}



	@Override
	public List<Enchere> getListeEncheresPourTri() {
		// TODO Auto-generated method stub
		return null;
	}
	


	
		
		
		
	


		
	

	

}
