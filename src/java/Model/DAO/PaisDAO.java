/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import Model.Pais;
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
public class PaisDAO {

    private static final String SELECT_PAISES = "SELECT * FROM paises";

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public PaisDAO() {
        this.con = ConnectionFactory.openConnection();
    }

    public String inserir(Pais pais) {
        String sql = "INSERT INTO paises(cod_sigla, nome) VALUES (?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, pais.getCodigoPais());
            ps.setString(2, pais.getNome());

            if (ps.executeUpdate() > 0) {
                return "Inserido";
            } else {
                return "Error";
            }
        } catch (SQLException e) {
            Logger.getLogger(PaisDAO.class.getName()).log(Level.SEVERE, null, e);
            return e.getMessage();
        }
        
    }

    public String alterar(Pais pais) {
        String sql = "UPDATE paises SET nome = ? WHERE codig = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, pais.getNome());
            ps.setString(2, pais.getCodigoPais());

            if (ps.executeUpdate() > 0) {
                return "Alterado com sucesso.";
            } else {
                return "Erro ao Alterar";
            }
        } catch (SQLException e) {
            Logger.getLogger(PaisDAO.class.getName()).log(Level.SEVERE, null, e);
            return e.getMessage();
        }
        
    }

    public String excluir(Pais pais) {
        String sql = "DELET FROM paises WHERE cod_sigla = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, pais.getCodigoPais());

            if (ps.executeUpdate() > 0) {
                return "Excluido com sucesso.";
            } else {
                return "Erro ao excluir";
            }
        } catch (SQLException e) {
            Logger.getLogger(PaisDAO.class.getName()).log(Level.SEVERE, null, e);
            return e.getMessage();
        }

    }    
    
    public List<Pais> getPaises() {
        List<Pais> list = new ArrayList<>();

        try {
            ps = con.prepareStatement(SELECT_PAISES);
            rs = ps.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    Pais pais = new Pais();
                    pais.setCodigoPais(rs.getString(1));
                    pais.setNome(rs.getString(2));

                    list.add(pais);
                }
                return list;
            } else {
                return null;
            }
        } catch (SQLException e) {
            Logger.getLogger(PaisDAO.class.getName()).log(Level.SEVERE, null, e);
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
        } catch (SQLException ex) {
            Logger.getLogger(PaisDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        ConnectionFactory.closeConnection(con);
    }
}
