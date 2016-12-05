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
        <form method="POST" onsubmit="return efetuarLogin()">
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
<script lang="javascript">
    function efetuarLogin() {
        if (validarLogin()) {
            login();
            return false;
        }
        return false;
    }

    function validarLogin() {
        var user = document.getElementById('idUser').value;
        var pass = document.getElementById('idPass').value;

        var regra1 = new RegExp(/[a-z]{1,}/).test(pass);
        var regra2 = new RegExp(/[A-Z]{1,}/).test(pass);
        var regra3 = new RegExp(/[0-9]{1,}/).test(pass);
        var regra4 = pass.length >= 8;

        if (!user) {
            alert("Preencha o campo usuario");
            document.getElementById('idUser').focus();
            return false;
        }

        if (!pass) {
            alert("Preencha o campo senha");
            document.getElementById('idPass').focus();
            return false;
        }

        if (!(regra1 && regra2 && regra3 && regra4)) {
            alert("A senha deve ter no mínimo 8 caracteres, com pelo menos 1 letra maiúscula, 1 letra minúscula e 1 digito.");
            document.getElementById('idPass').focus();
            return false;
        }

        return true;
    }

    function login() {
        var user = document.getElementById('idUser').value.trim();
        var pass = document.getElementById('idPass').value.trim();

        var xHttp;

        if (window.XMLHttpRequest) {
            xHttp = new XMLHttpRequest();
        } else {
            xHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xHttp.onreadystatechange = function () {
            if (xHttp.readyState == 4 && (xHttp.status == 200)) {
                var resposta = JSON.parse(xHttp.responseText);
                
                if(resposta){
                    window.location.assign(resposta.response);
                }
            }
        };

        xHttp.open("POST", "/Olimpiadas/Login");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("user=" + user + "&pass=" + pass);
    }
</script>