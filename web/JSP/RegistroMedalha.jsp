<%-- 
    Document   : RegistroMedalha
    Created on : 02/12/2016, 14:40:28
    Author     : Juarez
--%>

<%@page import="Model.Esporte"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Pais"%>
<%@page import="java.util.List"%>
<%@page import="Model.DAO.EsporteDAO"%>
<%@page import="Model.DAO.PaisDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    private PaisDAO mDataAccessPais = new PaisDAO();
    private EsporteDAO mDataAccessEsporte = new EsporteDAO();
    private List<Pais> mListPaises = new ArrayList();
    private List<Esporte> mListEsportes = new ArrayList();
%>

<%
    this.mListPaises.addAll(mDataAccessPais.getPaises());
    this.mListEsportes.addAll(mDataAccessEsporte.getEsportes());
%>
<div class="panel panel-default">
    <div class="panel-heading">Registrar Medalhas</div>
    <div class="panel-body">
        <form method="POST" action="CadastroMedalhas" class="form-horizontal">
            <label for="idPaises"><p>País:</p></label>
            <select class="form-control" id="idPaises" name="siglaPais">
                <% for (int i = 0; i < mListPaises.size(); i++) {%>
                <option value="<%= mListPaises.get(i).getCodigoPais()%>">
                    <%= mListPaises.get(i).getNome()%>
                </option>
                <% } %>
            </select>
            <br>
            <label for="idEsportes"><p>Esporte:</p></label>
            <select class="form-control" id="idEsportes" name="idEsporte">
                <% for (int i = 0; i < mListEsportes.size(); i++) {%>
                <option value="<%= mListEsportes.get(i).getId()%>">
                    <%= mListEsportes.get(i).getNome()%>
                </option>
                <% }%>
            </select>
            <br>
            <label for="medalhas"><p>Medalha:</p></label>
            <div class="btn-group btn-group-justified" data-toggle="buttons" id="medalhas">
                <label class="btn btn-primary active" id="ouro">
                    <input type="radio" name="medalha" id="ouro" value="1" checked>Ouro
                </label>
                <label class="btn btn-primary" id="prata">
                    <input type="radio" name="medalha" id="prata" value="2">Prata
                </label>
                <label class="btn btn-primary" id="bronze">
                    <input type="radio" name="medalha" id="bronze" value="3">Bronze
                </label>
            </div>
            <br>
            <input class="btn btn-primary col-md-12" type="submit" value="Registrar Medalha">
        </form>
    </div>
</div>
