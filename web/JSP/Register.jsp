<%-- 
    Document   : Register
    Created on : 02/12/2016, 15:18:25
    Author     : Juarez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="panel panel-default">
    <div class="panel-heading">Registro</div>
    <div class="panel-body">
        <form method="POST" action="register" onsubmit="return validarFormulario()">
            <label for="idUser"><p>Usuario:</p></label>
            <input class="form-control" type="text" name="user" id="idUser" placeholder="Usuario">
            <br>
            <label for="idPass"><p>Senha:</p></label>
            <input class="form-control" type="password" name="pass" id="idPass" placeholder="Senha">
            <br>
            <label for="idPassConfirm"><p>Confirmar senha:</p></label>
            <input class="form-control" type="password" name="passc" id="idPassConfirm" placeholder="Confirmar senha">
            <br>
            <input class="btn btn-primary col-md-12" type="submit" value="Registrar">
        </form>
    </div>
</div>

