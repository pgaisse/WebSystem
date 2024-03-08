let pass1 = document.querySelector('#adviser_password');
let pass2 = document.querySelector('#adviser_repassword');
let result = document.querySelector('#cont');
let bsubmit = document.querySelector('#bsubmit');
let select = document.querySelector('#search');
let box = document.querySelector('#search_input');
let selectElement = document.createElement('select');
var inputElement = document.querySelector('#table_name');
var formularioCreado = false;
function  loadTable(objeto){
    alert(objeto);
}

function checkpassword(){
    
    if(pass2.value.length != 0)
    {
        if(pass1.value == pass2.value){
            result.innerHTML='Matching';
            bsubmit.removeAttribute('Disabled');
        }
        else{
            result.innerHTML='Not Matching';
            bsubmit.setAttribute("Disabled",true);


        }
    }
}

function bringForm(obj){
        let defaultDamages = document.querySelector('#defaultDamages');
        // Prevenir el envío del formulario por defecto
        alert(defaultDamages.value);
        event.preventDefault();

        // Verificar si el formulario ya ha sido creado
        if (!formularioCreado) {
          // Obtener la tabla existente
          var tabla = document.getElementById('table');
    
          // Crear una nueva fila
          var fila = tabla.insertRow();
    
          // Crear las celdas de la fila
          for (var i = 1; i <= 6; i++) {
            var celda = fila.insertCell();
    
            // Las dos primeras celdas están libres
            if (i > 2) {
              // Crear los campos de texto
              if (i === 3 || i === 4) {
                // Crear select con dos opciones
                var select = document.createElement('select');
                for (var j = 1; j <= 2; j++) {
                  var opcion = document.createElement('option');
                  opcion.value = 'opcion' + j;
                  opcion.text = 'Opción ' + j;
                  select.appendChild(opcion);
                }
                celda.appendChild(select);
              } else if (i === 5) {
                // Crear campo numerico
                var inputNumerico = document.createElement('input');
                inputNumerico.type = 'number';
                inputNumerico.name = 'campo' + (i - 2);
                inputNumerico.placeholder = 'Campo ' + (i - 2);
                celda.appendChild(inputNumerico);
              } else if (i === 6) {
                // Crear campo de texto
                var inputTexto = document.createElement('input');
                inputTexto.type = 'text';
                inputTexto.name = 'campo' + (i - 2);
                inputTexto.placeholder = 'Campo ' + (i - 2);
                celda.appendChild(inputTexto);
              }
            }
          }
    
          // Crear el botón de envío
          var boton = document.createElement('button');
          boton.type = 'button'; // Cambiar el tipo de botón a "button"
          boton.innerHTML = 'Enviar';
          celda.appendChild(boton);
    
          // Establecer el indicador de formulario creado a true
          formularioCreado = true;
        }
    
    
}


function generatedatafield(){ 
    let val = select.value;    
    var arreglo = val.split('_');
    if (val.includes('id_')){
        tablaName=arreglo[1]+'s';
    }
    else if (val.includes('status_')){
        tablaName=arreglo[0];
        
    }
    else{
        tablaName=arreglo[0]+'s';
    }
   
    box.value='';


    
    if (val.includes('date')) {
        box.setAttribute('type','Date');
        try{selectElement.parentNode.replaceChild(box,selectElement);}
        catch{ console.log("no se requiere reemplazo")}
        
    
    
    } else if(val.includes('id_')) {
        box.setAttribute('type','Number');
        try{selectElement.parentNode.replaceChild(box,selectElement);}
        catch{ console.log("no se requiere reemplazo")}
    
    } else if(val.includes('status')) {
        selectElement.id = 'search_input';
        selectElement.name = 'search_input';
        selectElement.class='search_input';

        // Opciones del select
        var opciones = ['No iniciado', 'En proceso', 'Finalizado'];

        // Agregar opciones al select
        for (var i = 0; i < opciones.length; i++) {
            var opcion = document.createElement('option');
            opcion.value = (i);
            opcion.text = opciones[i];
            selectElement.appendChild(opcion);
        }

        // Reemplazar el input con el select
        try{box.parentNode.replaceChild(selectElement, box);}
        catch{ console.log("no se requiere reemplazo")}
        
   
    }

    else{
        box.setAttribute('type','text');
        try{ selectElement.parentNode.replaceChild(box,selectElement);}
        catch{ console.log("no se requiere reemplazo")}
    }

    inputElement.value =  tablaName;

}


function fajax(){
    
}