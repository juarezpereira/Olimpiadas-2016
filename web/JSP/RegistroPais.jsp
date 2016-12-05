<%-- 
    Document   : RegistroPais
    Created on : 02/12/2016, 14:40:13
    Author     : Juarez
--%>

<%@page import="Model.Pais"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.DAO.PaisDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    private PaisDAO mDataAccess = new PaisDAO();
    private List<Pais> mList = new ArrayList();
%>

<%
    this.mList.addAll(mDataAccess.getPaises());
%>
<!DOCTYPE html>
<div class="panel panel-default">
    <div class="panel-heading">Registro País</div>
    <div class="panel-body">
        <form method="POST" action="/dashboard/CadastroPas">
            <label for="idSigla"><p>Sigla:</p></label>
            <input class="form-control" type="text" name="siglaPais" id="idSigla" maxlength="3" placeholder="Sigla">
            <br>
            <label for="idNome"><p>Nome:</p></label>
            <input class="form-control" type="text" name="namePais" id="idNome" placeholder="País">
            <br>
            <input class="btn btn-primary col-md-12" type="submit" value="Registrar País">
        </form>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">Países</div>
    <div class="panel-body">
        <p>Mais de 200 países membros do Comitê Olímpico Internacional (COI) competem nos Jogos Rio 2016. Confira abaixo a lista completa!</p>
    </div>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Sigla</th>
                <th>País</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < mList.size(); i++) {
            %>
            <tr>
                <td><%= mList.get(i).getCodigoPais()%></td>
                <td><%= mList.get(i).getNome()%></td>
                <td><a href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
