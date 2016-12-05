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
        <form method="POST" action="dashboard/CadastroPais">
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
                <td><a href="#" onClick="deletPais(<%= mList.get(i).getCodigoPais()%>)"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
<script lang="javascript">
    function deletPais(sigla) {
        var xHttp;

        if (window.XMLHttpRequest) {
            xHttp = new XMLHttpRequest();
        } else {
            xHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xHttp.onreadystatechange = function () {
            if (xHttp.readyState == 4 && (xHttp.status == 200)) {
                var resposta = JSON.parse(xHttp.responseText);

                alert(resposta.response);
            }
        }
        xHttp.open("POST", "/Olimpiadas/dashboard/deletar");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("delet=pais&id=" + sigla);
    }

</script>
