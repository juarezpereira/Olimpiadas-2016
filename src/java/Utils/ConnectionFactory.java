/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Juarez
 */
public class ConnectionFactory {
    
    public static Connection openConnection(){
    
        Connection con;
        
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/db_olimpiada","postgres","admin");
            System.out.println("Utils.ConnectionFactory.openConnection(): Connected");
            return con;
        } catch ( SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Utils.ConnectionFactory.openConnection(): NotConnected");
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Utils.ConnectionFactory.openConnection(): NotConnected = ClassNootFound");
            return null;
        }
    
    }
    
    public static void closeConnection(Connection con){
        try {
            con.close();
            System.out.println("Utils.ConnectionFactory.closeConnection(): Desconected");
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
