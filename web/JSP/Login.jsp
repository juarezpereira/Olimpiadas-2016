<%-- 
    Document   : Login
    Created on : 02/12/2016, 15:00:44
    Author     : Juarez
--%>

<%@page import="Model.DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="panel panel-default">
    <div class="panel-heading">Login</div>
    <div class="panel-body">
        <form method="POST" action="Login" onsubmit="return validarLogin()">
            <label for="idUser"><p>Usuario:</p></label>
            <input class="form-control" type="text" name="user" id="idUser" placeholder="Usuario">
            <br>
            <label for="idPass"><p>Senha:</p></label>
            <input class="form-control" type="password" name="pass" id="idPass" placeholder="Senha">
            <br>
            <input class="btn btn-primary col-md-12" type="submit" value="Entrar">
        </form>
    </div>
</div>
