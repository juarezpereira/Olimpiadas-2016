/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Juarez
 */
public class FilterSessao implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse resp = ((HttpServletResponse)response);
        HttpServletRequest req = ((HttpServletRequest)request);
        HttpSession session = ((HttpServletRequest)request).getSession(false);
        String loginURI = req.getContextPath() + "/index.jsp";
              
        
        if(session != null && session.getAttribute("usuario") != null){
            chain.doFilter(request, response);
        }else{
            resp.sendRedirect(loginURI);
        }
    }

    @Override
    public void destroy() {

    }

    
    
}
