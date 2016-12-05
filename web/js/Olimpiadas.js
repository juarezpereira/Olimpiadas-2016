/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validarLogin(){
    var user = document.getElementById('idUser').value;
    var pass = document.getElementById('idPass').value;
    
    var regra1 = new RegExp(/[a-z]{1,}/).test(pass);
    var regra2 = new RegExp(/[A-Z]{1,}/).test(pass);
    var regra3 = new RegExp(/[0-9]{1,}/).test(pass);
    var regra4 = pass.length >= 8;
    
    if(!user){
        alert("Preencha o campo usuario");
        document.getElementById('idUser').focus();
        return false;
    }
    
    if(!pass){
        alert("Preencha o campo senha");
        document.getElementById('idPass').focus();
        return false;
    }
    
    if(!(regra1 && regra2 && regra3 && regra4)){
        alert("A senha deve ter no mínimo 8 caracteres, com pelo menos 1 letra maiúscula, 1 letra minúscula e 1 digito.");
        document.getElementById('idPass').focus();
        return false;
    }
    
    return true;
}

function validarLogin(){
    var xHttpRequest = new XMLHttpRequest();
    
    xHttpRequest.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            redirecionarPagina(this);
        }
    };
    xHttpRequest.open("POST");
    xHttpRequest.send();
}

function redirecionarPagina(xHttp){
    
}

