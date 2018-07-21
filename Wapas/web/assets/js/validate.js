var inputnombres = [];
var inputemails = [];
var inputtelefono = [];
var inputfecha = [];

var nombre_regex = /([A-Za-z ])+/g;
var email_regex = /^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$/gm;
var telefono_regex = /([0-9]{8,10})?/;
var fecha_regex = /[0-9]{2}-[0-9]{2}-[0-9]{4}/;


$(function(){
  inputnombres = $(".input-nombre");
  inputemails = $(".input-email");
  inputtelefono = $("input-telefono");
  inputfecha = $("input-fecha");
});

function validate(){
  var isvalid = true;

  console.log(inputnombres)

  for (var i = 0; i < inputemails.length; i++) {
    if (!email_regex.test(inputemails.value)) {
      isvalid = false;
    }
  }

  for (i = 0; i < inputnombres.length; i++) {
    if (!nombre_regex.test(inputnombres.value)) {
      isvalid = false;
    }
  }

  for (i = 0; i < inputtelefono.length; i++) {
    if (!telefono_regex.test(inputtelefono.value)) {
      isvalid = false;
    }
  }

  for (var i = 0; i < inputfecha.length; i++) {
    if (!fecha_regex.test(inputfecha.value)) {
      isvalid = false;
    }
  }

  return isvalid
}
