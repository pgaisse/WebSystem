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
function loadTable(objeto) {
  alert(objeto);
}



document.addEventListener('DOMContentLoaded', function () {
  const campoNumerico = document.getElementById('damage_size');
  const campoArchivo = document.getElementById('files');
  const botonUpload = document.getElementById('upload'); // ID ajustado aquí


  const campoNumerico1 = document.getElementById('sector_w_size');
  const campoNumerico2 = document.getElementById('sector_l_size');
  const campoNumerico3 = document.getElementById('sector_h_size');
  // alert (campoNumerico1+ "     " + campoNumerico2 +"     "+ campoNumerico3);

  const campoArchivo1 = document.getElementById('files_');
  const campoArchivo2 = document.getElementById('files_1');
  const botonUpload2 = document.getElementById('upload_');



  function revisarCampos() {
    // Verificar que el campo numérico tenga un valor y que se haya seleccionado un archivo
    const numericoCompleto = campoNumerico.value.trim() !== '';
    const archivoSeleccionado = campoArchivo.files.length > 0;

    // Habilitar el botón de subida si ambos campos están completos
    botonUpload.disabled = !(numericoCompleto && archivoSeleccionado);
  }

  function revisarCampos2() {

    // Verificar que el campo numérico tenga un valor y que se haya seleccionado un archivo
    const numericoCompleto1 = campoNumerico1.value.trim() !== '';
    const numericoCompleto2 = campoNumerico2.value.trim() !== '';
    const numericoCompleto3 = campoNumerico3.value.trim() !== '';
    const archivoSeleccionado1 = campoArchivo1.files.length > 0;
    const archivoSeleccionado2 = campoArchivo2.files.length > 0;
    //alert(numericoCompleto2 +"   "+ archivoSeleccionado2 +"   "+  archivoSeleccionado1 +"   "+  numericoCompleto1 +"   "+  numericoCompleto3)
    // Habilitar el botón de subida si ambos campos están completos
    botonUpload2.disabled = !(numericoCompleto2 && archivoSeleccionado2 && archivoSeleccionado1 && numericoCompleto1 && numericoCompleto3);
  }
  // Escuchar por cambios en el campo numérico y el campo de archivo
  if (campoNumerico1 && campoNumerico2 && campoNumerico3 && campoArchivo1 && campoArchivo2) {
    campoNumerico1.addEventListener('input', revisarCampos2);
    campoNumerico2.addEventListener('input', revisarCampos2);
    campoNumerico3.addEventListener('input', revisarCampos2);

    campoArchivo1.addEventListener('change', revisarCampos2);
    campoArchivo2.addEventListener('change', revisarCampos2);
  }


  if (campoNumerico && campoArchivo) {

    campoNumerico.addEventListener('input', revisarCampos);
    campoArchivo.addEventListener('change', revisarCampos);
  }

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
  $('#files_').change(function () {
    var i = $(this).prev('label').clone();
    var file = $('#files_')[0].files[0].name;
    $(this).prev('label').text(file);
  });
  $('#files_1').change(function () {
    var i = $(this).prev('label').clone();
    var file = $('#files_1')[0].files[0].name;
    $(this).prev('label').text(file);
  });

});


function generatedatafield() {
  event.preventDefault();
  var statusvals = document.querySelectorAll('input[name="status[]"]');
  // alert(JSON.stringify(statusvals.values,null,2));
  var opciones = [];
  let val = select.value;
  var arreglo = val.split('_');
  if (val.includes('id_')) {
    tablaName = arreglo[1] + 's';
  }
  else if (val.includes('status_')) {
    tablaName = arreglo[0];

  }
  else {
    tablaName = arreglo[0] + 's';
  }

  box.value = '';



  if (val.includes('date')) {
    box.setAttribute('type', 'Date');
    try { selectElement.parentNode.replaceChild(box, selectElement); }
    catch { console.log("no se requiere reemplazo") }



  } else if (val.includes('id_')) {
    box.setAttribute('type', 'Number');
    try { selectElement.parentNode.replaceChild(box, selectElement); }
    catch { console.log("no se requiere reemplazo") }

  } else if (val.includes('status')) {
    selectElement.id = 'search_input';
    selectElement.name = 'search_input';
    selectElement.class = 'search_input';

    // Opciones del select
    statusvals.forEach(function (campo) {
      alert(campo.value);
      opciones.push(campo.value);
    });

    //var opciones = ['No iniciado', 'En proceso', 'Finalizado'];

    // Agregar opciones al select
    for (var i = 0; i < opciones.length; i++) {
      var opcion = document.createElement('option');
      opcion.value = opciones[i];
      opcion.text = opciones[i];
      selectElement.appendChild(opcion);
    }

    // Reemplazar el input con el select
    try { box.parentNode.replaceChild(selectElement, box); }
    catch { console.log("no se requiere reemplazo") }


  }

  else {
    box.setAttribute('type', 'text');
    try { selectElement.parentNode.replaceChild(box, selectElement); }
    catch { console.log("no se requiere reemplazo") }
  }

  inputElement.value = tablaName;

}


document.querySelectorAll('.miniatura').forEach(item => {
  item.addEventListener('click', function () {
    const rutaImagenCompleta = this.getAttribute('data-full-image');
    const contenedor = document.getElementById('imagenCompletaContenedor');
    const imagenCompleta = document.getElementById('imagenCompleta');


    imagenCompleta.src = ''; // Limpia la fuente anterior por si hubiera una carga en progreso
    imagenCompleta.src = rutaImagenCompleta; // Establece la nueva ruta de la imagen completa
    contenedor.style.display = 'block'; // Muestra el contenedor con la imagen completa
  });
});

// Opcional: Cerrar la imagen completa al hacer clic fuera de ella
if (document.getElementById('imagenCompletaContenedor')) {
  document.getElementById('imagenCompletaContenedor').addEventListener('click', function () {
    document.getElementById('imagenCompleta').src = '';
    const nav = document.getElementsByClassName('sb-nav-fixed sb-sidenav-toggled');
    const contima = document.getElementsByClassName('imagenCompletaContenedor');
    contima.style.display = 'none';
    nav.style.display = 'block';
    this.style.display = 'none';
  });


  document.getElementById('imagenCompletaContenedor').addEventListener('click', function (event) {
    if (event.target === this) {
      this.style.display = 'none'; // Oculta el contenedor
      // Remueve el src de la imagen grande, efectivamente "descargándola"
      document.getElementById('imagenCompleta').src = '';
    }
  });

}

document.getElementById('toggleButton').addEventListener('click', function () {
  var formDiv = document.getElementById('form');
  if (formDiv.style.display === 'none') {
    formDiv.style.display = 'block'; // Muestra el div
    this.innerText = 'Ocultar'; // Cambia el texto del botón a 'Ocultar'
  } else {
    formDiv.style.display = 'none'; // Oculta el div
    this.innerText = 'Mostrar'; // Cambia el texto del botón a 'Mostrar'
  }
});


$(".alert").alert('close')