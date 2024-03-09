let pass1 = document.querySelector('#adviser_password');
let pass2 = document.querySelector('#adviser_repassword');
let result = document.querySelector('#cont');
let bsubmit = document.querySelector('#bsubmit');
let select = document.querySelector('#search');
let box = document.querySelector('#search_input');
let selectElement = document.createElement('select');
var inputElement = document.querySelector('#table_name');
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