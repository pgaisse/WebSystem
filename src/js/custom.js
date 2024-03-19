let pass1 = document.querySelector('#adviser_password');
let pass2 = document.querySelector('#adviser_repassword');
let result = document.querySelector('#cont');
let bsubmit = document.querySelector('#bsubmit');
let select = document.querySelector('#search');
let box = document.querySelector('#search_input');
let img = document.querySelector('#imagebox');
let imga = document.querySelector('#imagea');
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


document.addEventListener('DOMContentLoaded', function() {
    const campoNumerico = document.getElementById('damage_size');
    const campoArchivo = document.getElementById('files');
    const botonUpload = document.getElementById('upload'); // ID ajustado aquí

    function revisarCampos() {
      // Verificar que el campo numérico tenga un valor y que se haya seleccionado un archivo
      const numericoCompleto = campoNumerico.value.trim() !== '';
      const archivoSeleccionado = campoArchivo.files.length > 0;

      // Habilitar el botón de subida si ambos campos están completos
      botonUpload.disabled = !(numericoCompleto && archivoSeleccionado);
    }
    // Escuchar por cambios en el campo numérico y el campo de archivo
    campoNumerico.addEventListener('input', revisarCampos);
    campoArchivo.addEventListener('change', revisarCampos);
  });



function showImage(images) {
 
        img.src='/'+images;
        imagea.href='/'+images;


    
    

    //img.forEach(function(img) {
      //  img.style.display = 'none';
    //});
}


$('.portfolio-menu ul li').click(function(){
    $('.portfolio-menu ul li').removeClass('active');
    $(this).addClass('active');
    
    var selector = $(this).attr('data-filter');
    $('.portfolio-item').isotope({
        filter:selector
    });
    return  false;
});
$(document).ready(function() {
var popup_btn = $('.popup-btn');
popup_btn.magnificPopup({
type : 'image',
gallery : {
    enabled : true
}
});
});


$(document).ready(function () {
	$('#files').change(function () {
		var i = $(this).prev('label').clone();
		var file = $('#files')[0].files[0].name;
		$(this).prev('label').text(file);
	}); 
    $('#files1').change(function () {
		var i = $(this).prev('label').clone();
        var file = $('#files1')[0].files[0].name;
        $(this).prev('label').text(file);
	}); 
    $('#files2').change(function () {
		var i = $(this).prev('label').clone();
		var file = $('#files2')[0].files[0].name;
        $(this).prev('label').text(file);
	}); 

 });


function generatedatafield(){ 
    event.preventDefault();
  
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


document.querySelectorAll('.miniatura').forEach(item => {
    item.addEventListener('click', function() {
      const rutaImagenCompleta = this.getAttribute('data-full-image');
      const contenedor = document.getElementById('imagenCompletaContenedor');
      const imagenCompleta = document.getElementById('imagenCompleta');
      
      
      imagenCompleta.src = ''; // Limpia la fuente anterior por si hubiera una carga en progreso
      imagenCompleta.src = rutaImagenCompleta; // Establece la nueva ruta de la imagen completa
      contenedor.style.display = 'block'; // Muestra el contenedor con la imagen completa
    });
  });
  
  // Opcional: Cerrar la imagen completa al hacer clic fuera de ella
  document.getElementById('imagenCompletaContenedor').addEventListener('click', function() {
    document.getElementById('imagenCompleta').src = '';
    const nav = document.getElementsByClassName('sb-nav-fixed sb-sidenav-toggled');
    const contima = document.getElementsByClassName('imagenCompletaContenedor');
    contima.style.display='none';
    nav.style.display='block';

    this.style.display = 'none';
  });

  document.getElementById('imagenCompletaContenedor').addEventListener('click', function(event) {
    if (event.target === this) {
      this.style.display = 'none'; // Oculta el contenedor
      // Remueve el src de la imagen grande, efectivamente "descargándola"
      document.getElementById('imagenCompleta').src = '';
    }
  });
  


  