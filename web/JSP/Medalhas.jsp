<%-- 
    Document   : Medalhas
    Created on : 02/12/2016, 15:31:27
    Author     : Juarez
--%>

<%@page import="Model.Medalhas"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO.MedalhasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    private MedalhasDAO mDataAccess = new MedalhasDAO();
%>

<%
    List<Medalhas> mList = new ArrayList();
    mList.addAll(mDataAccess.getQuadroMedalhas());
%>

<div class="panel panel-default">
    <div class="panel-heading">Registrar Medalhas</div>
    <div class="panel-body">
        <img src="img/logo.png" class="center-block img-responsive" width="50%"/>
    </div>
    <table class="table table-striped">
        <thead>
            <tr>
                <th class="col-md-5">Pais</th>
                <th class="col-md-2"><img src="icones/medal-ouro.svg" width="15%"></th>
                <th class="col-md-2"><img src="icones/medal-prata.svg" width="15%"></th>
                <th class="col-md-2"><img src="icones/medal-bronze.svg" width="15%"></th>
                <th class="col-md-1">Total</th>
            </tr>
        </thead>
        <tbody>
            <%  for (int i = 0; i < mList.size(); i++) {%>
            <tr>                    
                <td><%= mList.get(i).getPais()%></td>
                <td><%= mList.get(i).getOuro()%></td>
                <td><%= mList.get(i).getPrata()%></td>
                <td><%= mList.get(i).getBronze()%></td>
                <td><%= mList.get(i).getTotal()%></td>
            </tr>
            <% }%>
        </tbody>
    </table>
</div>
