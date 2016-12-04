/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.Medalhas;
import Utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Juarez
 */
public class MedalhasDAO {
    
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public MedalhasDAO(){
        this.con = ConnectionFactory.openConnection();
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    public boolean insert(Medalhas medalhas){
        
        String SQL_CONSULT_MAX = "SELECT MAX(codigo) FROM medalhas";
        int id = 0;
        
        try {
            ps = con.prepareStatement(SQL_CONSULT_MAX);
            rs = ps.executeQuery();
            
            while(rs.next()){
                id = rs.getInt("max");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MedalhasDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        String sql = "INSERT INTO medalhas(codigo, ouro, prata, bronze, cod_pais, cod_esporte) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id+1);
            ps.setInt(2, medalhas.getOuro());
            ps.setInt(3, medalhas.getPrata());
            ps.setInt(4, medalhas.getBronze());
            ps.setString(5, medalhas.getPais());
            ps.setInt(6, medalhas.getEsporte());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(MedalhasDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    
    public List<Medalhas> getQuadroMedalhas(){
    
        List<Medalhas> mList = new ArrayList();
        
        String sql =    "SELECT P.nome AS pais, SUM(M.ouro) AS ouro, SUM(M.prata) AS prata, SUM(M.bronze) AS bronze, SUM(ouro+prata+bronze) AS total\n" +
                        "FROM medalhas M\n"+
                        "JOIN paises P ON cod_pais = P.cod_sigla\n"+
                        "GROUP BY P.nome\n"+
                        "ORDER BY total DESC";
        
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if(rs != null){
                while(rs.next()){
                    Medalhas medalhas = new Medalhas();
                    medalhas.setPais(rs.getString(1));
                    medalhas.setOuro(rs.getInt(2));
                    medalhas.setPrata(rs.getInt(3));
                    medalhas.setBronze(rs.getInt(4));
                    medalhas.setTotal(rs.getInt(5));

                    mList.add(medalhas);
                }
                return mList;
            }else{
                return null;
            }            
            
        } catch (SQLException ex) {
            Logger.getLogger(MedalhasDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
    public void closePrepareStatment(){
        try {
            if(!ps.isClosed()){
                ps.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(MedalhasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void closeResultSet(){
        try {
            if(!rs.isClosed()){
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(MedalhasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void closeConnection(){
        closeResultSet();
        closePrepareStatment();
        ConnectionFactory.closeConnection(con);
    }
    
}
