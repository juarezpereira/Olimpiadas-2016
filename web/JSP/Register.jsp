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
        <form method="POST" action="" onsubmit="register()">
            <label for="idUserR"><p>Usuario:</p></label>
            <input class="form-control" type="text" name="user" id="idUserR" placeholder="Usuario">
            <br>
            <label for="idPassR"><p>Senha:</p></label>
            <input class="form-control" type="password" name="pass" id="idPassR" placeholder="Senha">
            <br>
            <label for="idPassCR"><p>Confirmar senha:</p></label>
            <input class="form-control" type="password" name="passc" id="idPassCR" placeholder="Confirmar senha" onblur="validarForm()">
            <br>
            <input class="btn btn-primary col-md-12" type="submit" value="Registrar">
        </form>
    </div>
</div>
<script lang="javascript">
    function validarForm() {
        var user = document.getElementById('idUserR').value;
        var pass = document.getElementById('idPassR').value;
        var passc = document.getElementById('idPassCR').value;

        var regra1 = new RegExp(/[a-z]{1,}/).test(pass);
        var regra2 = new RegExp(/[A-Z]{1,}/).test(pass);
        var regra3 = new RegExp(/[0-9]{1,}/).test(pass);
        var regra4 = pass.length >= 8;

        if (!user) {
            alert("Preencha o campo usuario");
            document.getElementById('idUserR').focus();
            return false;
        }

        if (!pass) {
            alert("Preencha o campo senha");
            document.getElementById('idPassR').focus();
            return false;
        }

        if (!passc) {
            alert("Confirme o campo senha");
            document.getElementById('idPassR').focus();
            return false;
        }
        
        if (pass != passc){
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

    function register() {
        var user = document.getElementById('idUserR').value.trim();
        var pass = document.getElementById('idPassR').value.trim();

        var XMLHttpRequest = new XMLHttpRequest();
        XMLHttpRequest.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                alert("LOGADO!");
                }
          };
        XMLHttpRequest.open("GET", "/Olimpiadas/registrar?User=" + user + "&Pass=" + pass);
        XMLHttpRequest.send();
    }
</script>

