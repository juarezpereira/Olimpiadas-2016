/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.Usuario;
import Utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Juarez
 */
public class UsuarioDAO {
    
    private static final String INSERT = "INSERT INTO usuario (name, password) VALUES (?, ?)";
       
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public UsuarioDAO(){
        this.con = ConnectionFactory.openConnection();
    }
    
    public boolean registerUser(Usuario user){
        try {
            ps = con.prepareStatement(INSERT);
            ps.setString(1, user.getNameUser());
            ps.setString(2, user.getPassword());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public Usuario loginUser(Usuario user){
        
        String SELECT = "SELECT * FROM usuario WHERE name = ?";
        
        try {
            ps = con.prepareStatement(SELECT);
            ps.setString(1, user.getNameUser());
            
            rs = ps.executeQuery();
            
            Usuario usuario = null;
            if(rs.next()){
                usuario = new Usuario();
                usuario.setID(rs.getInt("id"));
                usuario.setNameUser(rs.getString("name"));
                usuario.setPassword(rs.getString("password"));
            }
            return usuario;
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
       
    }
    
    private void closePreparedStatement() throws SQLException{
        if(!ps.isClosed())
            ps.close();
    }

    private void closeResultSet() throws SQLException{
        if(!rs.isClosed())
            rs.close();
    }
    
    public void closeConnection(){
        try {
            closeResultSet();
            closePreparedStatement();
            if(!con.isClosed())
                con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
