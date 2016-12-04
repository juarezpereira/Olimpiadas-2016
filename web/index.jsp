<%-- 
    Document   : index
    Created on : 02/12/2016, 15:13:02
    Author     : Juarez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="js/Olimpiadas.js"></script>
    </head>
    <body>     
        <div class="container">
            <div class="jumbotron col-md-12">
                <h2 class="col-md-8 col-md-offset-2">Sistema Olímpico</h2>
            </div>
            <div class="panel panel-default col-md-3">
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
                        <li><a href="#register" data-toggle="tab">Registrar-se</a></li>
                        <li><a href="#medalhas" data-toggle="tab">Quadro de Medalhas</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="login">
                        <jsp:include page="JSP/Login.jsp"/>
                    </div>
                    <div class="tab-pane" id="register">
                        <jsp:include page="JSP/Register.jsp"/>
                    </div>
                    <div class="tab-pane" id="medalhas">
                        <jsp:include page="JSP/Medalhas.jsp"/>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
