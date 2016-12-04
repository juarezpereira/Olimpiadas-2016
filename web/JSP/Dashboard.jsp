<%-- 
    Document   : Dashboard
    Created on : 02/12/2016, 15:19:46
    Author     : Juarez
--%>

<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    private Usuario currentUser;
%>

<%
    this.currentUser = (Usuario) session.getAttribute("usuario");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="js/Olimpiadas.js"></script>
        <script>
            function logout() {
                var xHttpRequest;

                if (window.XMLHttpRequest) {
                    this.xHttpRequest = new XMLHttpRequest();
                } else {
                    this.xHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                }

                xHttpRequest.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        alert("Usuario desconectado!");
                    }
                };
                xHttpRequest.open("POST","/Logout",true);
                xHttpRequest.send();
            }
        </script>
    </head>
    <body>     
        <div class="container">
            <div class="jumbotron col-md-12">
                <h2 class="col-md-8 col-md-offset-2">Bem-vindo, <%= currentUser.getNameUser()%></h2>
            </div>
            <div class="panel panel-default col-md-3">
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#paises"   data-toggle="tab">Paises</a></li>
                        <li><a href="#esportes" data-toggle="tab">Esportes</a></li>
                        <li><a href="#medalhas" data-toggle="tab">Medalhas</a></li>
                        <li><a href="#sair"     data-toggle="tab"><p onclick="logout()">Sair</p></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane" id="paises">
                        <jsp:include page="JSP/RegistroPais.jsp"/>
                    </div>
                    <div class="tab-pane" id="esportes">
                        <jsp:include page="JSP/RegistroEsporte.jsp"/>
                    </div>
                    <div class="tab-pane" id="medalhas">
                        <jsp:include page="JSP/RegistroMedalha.jsp"/>
                    </div>
                    <div class="tab-pane active" id="quadromedalhas">
                        <jsp:include page="JSP/Medalhas.jsp"/>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
