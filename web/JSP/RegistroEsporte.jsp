<%-- 
    Document   : RegistroEsporte
    Created on : 02/12/2016, 14:39:58
    Author     : Juarez
--%>

<%@page import="Model.Esporte"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO.EsporteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! 
    private EsporteDAO mDataAcess = new EsporteDAO();
    private List<Esporte> mList = new ArrayList();
%>

<% 
    this.mList.addAll(mDataAcess.getEsportes());
%>
<!DOCTYPE html>
<div class="panel panel-default">
    <div class="panel-heading">Registro Esporte</div>
    <div class="panel-body">
        <form method="POST" action="dashboard/CadastroEsporte">
            <label for="idName"><p>Nome:</p></label>
            <input class="form-control" type="text" name="nameEsporte" id="idName" placeholder="Esporte">
            <br>
            <input class="btn btn-primary col-md-12" type="submit" value="Registrar Esporte">
        </form>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">Esportes</div>
    <div class="panel-body">
        <p>Você vai vibrar e se emocionar com a disputa de 42 modalidades Olímpicas. Em 19 dias de competição, 306 provas valem medalhas: 136 femininas, 161 masculinas e nove mistas.</p>
    </div>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Nome</th>
                <th class="col-md-1"></th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < mList.size(); i++) {%>
            <tr>
                <td><%= mList.get(i).getNome()%></td>
                <td>
                    <button class="btn btn-default" type="button" name="esporteId" value="<%= mList.get(i).getId()%>" data-toggle="modal" data-target="#modalExcluir">
                        <span class="glyphicon glyphicon-trash btn-excluir"></span>
                    </button>
                </td>
            </tr>
            <% }%>
        <tbody>
    </table>
</div>
<div class="modal fade" id="modalExcluir">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <p>Esportes</p>
            </div>
            <div class="modal-body">
                <p>Deseja Excluir?</p>
            </div>
            <div class="modal-footer">
                <form method="POST" action="cadastro">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" name="esporte" value="" class="btn btn-primary">Excluir</button>    
                </form>
            </div>
        </div>
    </div>
</div>
