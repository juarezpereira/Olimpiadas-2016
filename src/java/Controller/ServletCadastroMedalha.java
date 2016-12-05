/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAO.MedalhasDAO;
import Model.Medalhas;
import Utils.ConnectionFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Juarez
 */
public class ServletCadastroMedalha extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String siglaPais = request.getParameter("siglaPais");
        int idEsporte = Integer.valueOf(request.getParameter("idEsporte"));
        int medalha = Integer.valueOf(request.getParameter("medalha"));
        
        Medalhas medalhas = Medalhas.getDefault();
        medalhas.setPais(siglaPais);
        medalhas.setEsporte(idEsporte);
        
        switch(medalha){
            case 1:
                medalhas.setOuro(1);
                break;
            case 2:
                medalhas.setPrata(1);
                break;
            case 3:
                medalhas.setBronze(1);
                break;
        }
        
        MedalhasDAO dao = new MedalhasDAO();
        
        if(dao.insert(medalhas)){
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("JSP/Error.jsp");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
