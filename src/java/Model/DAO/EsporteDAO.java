/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.Esporte;
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
public class EsporteDAO {

    private static final String SELECT_ESPORTES = "SELECT * FROM esportes";

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public EsporteDAO() {
        this.con = ConnectionFactory.openConnection();
    }

    public boolean inserir(Esporte esporte) {

        String SQL_CONSULT_MAX = "SELECT MAX(codigo) FROM esportes";
        int id = 0;

        try {
            ps = con.prepareStatement(SQL_CONSULT_MAX);
            rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt("max");
            }

        } catch (SQLException ex) {
            Logger.getLogger(EsporteDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

        String SQL_INSERT = "INSERT INTO esportes(codigo, nome) VALUES (?, ?)";

        try {
            ps = con.prepareStatement(SQL_INSERT);
            ps.setInt(1, id + 1);
            ps.setString(2, esporte.getNome());

            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(EsporteDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public List<Esporte> getEsportes() {
        List<Esporte> list = new ArrayList<>();

        try {
            ps = con.prepareStatement(SELECT_ESPORTES);
            rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    Esporte esporte = new Esporte();
                    esporte.setId(rs.getInt(1));
                    esporte.setNome(rs.getString(2));

                    list.add(esporte);
                }
                return list;
            } else {
                return null;
            }
        } catch (SQLException e) {
            Logger.getLogger(EsporteDAO.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    public void closePrepareStatment() throws SQLException {
        if (!ps.isClosed()) {
            ps.close();
        }
    }

    public void closeResultSet() throws SQLException {
        if (!rs.isClosed()) {
            rs.close();
        }
    }

    public void closeConnection() {
        try {
            closeResultSet();
            closePrepareStatment();
            if (!con.isClosed()) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EsporteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
