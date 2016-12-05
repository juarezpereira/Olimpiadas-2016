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
        <form method="POST" onsubmit="efetuarRegistro()">
            <label for="idUserR"><p>Usuario:</p></label>
            <input class="form-control" type="text" name="user" id="idUserR" placeholder="Usuario">
            <br>
            <label for="idPassR"><p>Senha:</p></label>
            <input class="form-control" type="password" name="pass" id="idPassR" placeholder="Senha">
            <br>
            <label for="idPassCR"><p>Confirmar senha:</p></label>
            <input class="form-control" type="password" name="passc" id="idPassCR" placeholder="Confirmar senha">
            <br>
            <input class="btn btn-primary col-md-12" type="submit" value="Registrar">
        </form>
    </div>
</div>
<script lang="javascript">
    function efetuarRegistro() {
        if (validarRegistro()) {
            registro();
            return false;
        }
        return false;
    }
    
    function validarRegistro() {
        var usuario = document.getElementById('idUserR').value;
        var senha = document.getElementById('idPassR').value;
        var senhaconfirma = document.getElementById('idPassCR').value;

        var regra1 = new RegExp(/[a-z]{1,}/).test(senha);
        var regra2 = new RegExp(/[A-Z]{1,}/).test(senha);
        var regra3 = new RegExp(/[0-9]{1,}/).test(senha);
        var regra4 = senha.length >= 8;

        if (!usuario) {
            alert("Preencha o campo usuario");
            document.getElementById('idUserR').focus();
            return false;
        }

        if (!senha) {
            alert("Preencha o campo senha");
            document.getElementById('idPassR').focus();
            return false;
        }

        if (!senhaconfirma) {
            alert("Confirme o campo senha");
            document.getElementById('idPassCR').focus();
            return false;
        }
        
        if (senha != senhaconfirma){
            alert("Senhas incompativeis");
            document.getElementById('idPassCR').focus();
            return false;
        }

        if (!(regra1 && regra2 && regra3 && regra4)) {
            alert("A senha deve ter no mínimo 8 caracteres, com pelo menos 1 letra maiúscula, 1 letra minúscula e 1 digito.");
            document.getElementById('idPassR').focus();
            return false;
        }

        return true;
    }

    function registro() {
        var usuarioR = document.getElementById('idUserR').value.trim();
        var senhaR = document.getElementById('idPassR').value.trim();

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

        xHttp.open("POST", "/Olimpiadas/Registrar");
        xHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xHttp.send("usuario=" + usuarioR + "&senha=" + senhaR);
    }
</script>

