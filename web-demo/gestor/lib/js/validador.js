function titulo_esp(form) {		////////////////////////////////////   COMÚN 
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_a";	
validatePrompt (Ctrl, "Debes introducir un título.",id_txt);
return (false);	
} 
else		
return (true);
}
function asunto(form) {		////////////////////////////////////   ASUNTO 
Ctrl = form.asunto;	
if (Ctrl.value == "") {		
id_txt=	"#asunto_a";	
validatePrompt (Ctrl, "Debes introducir un asunto.",id_txt);
return (false);	
} 
else		
return (true);
}
function url(form) {	////////////////////////////////////   WEBS 
Ctrl = form.url;	
var cadena="http://";var cadena2="https://";
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
validatePrompt (Ctrl, "Debes introducir la dirección url COMPLETA   [Ej. http://www.dominio.com]",id_txt);
return (false);	
} 
else		
return (true);
}

function email_f(form) {		////////////////////////////////////   EMAIL 
Ctrl = form.email;	
if (Ctrl.value == "") {		
id_txt=	"#email_a";	
validatePrompt (Ctrl, "Debes introducir un email.",id_txt);
return (false);	
} 
else		
return (true);
}

function email(form){	////////////////////////////////////   WEBS 
var Ctrl=form.email
if(Ctrl.value!=""){
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(Ctrl.value)){return (true);}
else{id_txt="#email_a";validatePrompt (Ctrl, "El email "+Ctrl.value+" introducido no es válido",id_txt);return (false);}
}else{return (true);}}

function f_email(form){	////////////////////////////////////   WEBS 
var Ctrl=form.f_email
if(Ctrl.value!=""){
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(Ctrl.value)){return (true);}
else{id_txt="#f_email_a";validatePrompt (Ctrl, "El email "+Ctrl.value+" introducido para envíos automáticos no es válido",id_txt);return (false);}
}else{return (true);}}

function id_division(form) {		////////////////////////////  WEBS 
Ctrl = form.id_division;	
if (Ctrl.value == "") {		
id_txt=	"#id_division_a";	
validatePrompt (Ctrl, "Debes seleccionar una división de negocio.",id_txt);
return (false);	
} 
else		
return (true);
}
function url_esp(form) {	////////////////////////////////////   CATEGORIAS 
Ctrl = form.url_esp;	
var cadena="http://";var cadena2="https://";var cadena3="http";var cadena4="www";
if (Ctrl.value == "" || Ctrl.value.indexOf(cadena) != -1 || Ctrl.value.indexOf(cadena2) != -1 || Ctrl.value.indexOf(cadena3) != -1 || Ctrl.value.indexOf(cadena4) != -1) {		
id_txt=	"#url_esp_a";	
validatePrompt (Ctrl, "Debes introducir la dirección url amigable sin HTTP:// ni WWW. en la sección SEO   [Ej. palabra-clave-url]",id_txt);
return (false);	
} 
else		
return (true);
}
function titulo_crm_esp(form) {		////////////////////////////////////   CATEGORIAs 
Ctrl = form.titulo_crm_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_crm_esp_a";	
validatePrompt (Ctrl, "Debes introducir un título de uso interno (CRM)",id_txt);
return (false);	
} 
else		
return (true);
}
function id_web(form) {	
Ctrl = form.id_web;	
if (Ctrl.value == "") {		
id_txt=	"#id_web_a";	
validatePrompt (Ctrl, "Selecciona una web.",id_txt);
return (false);	
} 
else		
return (true);
}
function id_categoria(form) {		////////////////////////////////////   SECCIONES 
Ctrl = form.id_categoria;	
if (Ctrl.value == "") {		
id_txt=	"#id_categoria_a";	
validatePrompt (Ctrl, "Selecciona una categoría.",id_txt);
return (false);	
} 
else		
return (true);
}
function id_seccion(form) {		////////////////////////////////////   SUBSECCIONES 
Ctrl = form.id_seccion;	
if (Ctrl.value == "") {		
id_txt=	"#id_seccion_a";	
validatePrompt (Ctrl, "Selecciona una sección.",id_txt);
return (false);	
} 
else		
return (true);
}
function email_p(form){	////////////////////////////////////   PROVEEDORES 
var Ctrl=form.email_p
if(Ctrl.value!=""){
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(Ctrl.value)){return (true);}
else{id_txt="#email_p_a";validatePrompt (Ctrl, "El email "+Ctrl.value+" introducido no es válido",id_txt);return (false);}
}else{return (true);}}
function ciudad(form) {		////////////////////////////////////   AEROPUERTOS 
Ctrl = form.ciudad;	
if (Ctrl.value == "") {		
id_txt=	"#ciudad_a";	
validatePrompt (Ctrl, "Por favor introduce una ciudad.",id_txt);
return (false);	
} 
else		
return (true);
}
function idioma(form) {		////////////////////////////////////   IDIOMAS 
Ctrl = form.idioma;	
if (Ctrl.value == "") {		
id_txt=	"#idioma_a";	
validatePrompt (Ctrl, "Por favor introduce un idioma.",id_txt);
return (false);	
} 
else		
return (true);
}	
function titulo_esp_d(form) {		////////////////////////////////////   DESTINOS 
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_a";	
validatePrompt (Ctrl, "Debes introducir un país.",id_txt);
return (false);	
} 
else		
return (true);
}
function url_esp_d(form) {	////////////////////////////////////   DESTINOS 
Ctrl = form.url_esp;	
var cadena="http://";var cadena2="https://";var cadena3="http";var cadena4="www";
if (Ctrl.value == "" || Ctrl.value.indexOf(cadena) != -1 || Ctrl.value.indexOf(cadena2) != -1 || Ctrl.value.indexOf(cadena3) != -1 || Ctrl.value.indexOf(cadena4) != -1) {		
id_txt=	"#url_esp_a";	
validatePrompt (Ctrl, "Debes introducir la dirección url amigable sin HTTP:// ni WWW. en la sección SEO   [Ej. palabra-clave-url]",id_txt);
return (false);	
} 
else		
return (true);
}
function titulo_esp_ci(form) {		////////////////////////////////////   CIUDADES  
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_a";	
validatePrompt (Ctrl, "Introduce el nombre de la ciudad.",id_txt);
return (false);	
} 
else		
return (true);
}
function id_destino(form) {
Ctrl = form.id_destino;	
if (Ctrl.value == "") {		
id_txt=	"#id_destino_a";	
validatePrompt (Ctrl, "Selecciona un destino (país).",id_txt);
return (false);	
} 
else		
return (true);
}
function titulo_esp_c(form) {		////////////////////////////////////   ITEMS  
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_a";	
validatePrompt (Ctrl, "Introduce el nombre de programa.",id_txt);
return (false);	
} 
else		
return (true);
}
function titulo_of_esp(form) {
Ctrl = form.titulo_of_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_of_esp_a";	
validatePrompt (Ctrl, "Introduce el nombre Oficial de programa.",id_txt);
return (false);	
} 
else		
return (true);
}		
function id_subseccion(form) {
Ctrl = form.id_subseccion;	
if (Ctrl.value == "" && form.id_seccion.value =="") {		
id_txt=	"#id_subseccion_a";	
validatePrompt (Ctrl, "Por favor selecciona una Subsección o Sección.",id_txt);
return (false);	
} 
else		
return (true);
}	
function id_destino(form) {
Ctrl = form.id_destino;	
if (Ctrl.value == "") {
id_txt=	"#id_destino_a";	
validatePrompt (Ctrl, "Por favor selecciona Destino (país).",id_txt);
return (false);	
} 
else
return (true);
}
function id_idioma(form) {
Ctrl = form.id_idioma;	
if (Ctrl.value == "") {
id_txt=	"#id_idioma_a";	
validatePrompt (Ctrl, "Por favor selecciona un Idioma.",id_txt);
return (false);	
} 
else
return (true);
}		
function pr_reserva(form) {
Ctrl = form.pr_reserva;	
if (Ctrl.value == "") {
id_txt=	"#pr_reserva_a";	
validatePrompt (Ctrl, "Introduce un precio para la reserva o pon 0.",id_txt);
return (false);	
} 
else
return (true);
}			
function titulo_esp_alo(form) {		////////////////////////////////////   ALOJAMIENTOS TIPOS 
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_a";	
validatePrompt (Ctrl, "Por favor introduce un Tipo de Alojamiento.",id_txt);
return (false);	
} 
else		
return (true);
}		
function titulo_esp_qui(form) {		////////////////////////////////////   QUINCENAS 
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_a";	
validatePrompt (Ctrl, "Por favor introduce un nombre o concepto de Quincena.",id_txt);
return (false);	
} 
else		
return (true);
}		
function f_inicio_qui(form) {
Ctrl = form.f_inicio;	
if (Ctrl.value == "") {		
id_txt=	"#f_inicio_a";	
validatePrompt (Ctrl, "Por favor introduce un fecha de inicio de Quincena.",id_txt);
return (false);	
} 
else		
return (true);
}	
function f_fin_qui(form) {
Ctrl = form.f_fin;	
if (Ctrl.value == "") {		
id_txt=	"#f_fin_a";	
validatePrompt (Ctrl, "Por favor introduce un fecha de finalización de Quincena.",id_txt);
return (false);	
} 
else		
return (true);
}	
function titulo_esp_fluc(form) {		////////////////////////////////////   COMÚN 
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_f";	
validatePrompt (Ctrl, "Debes introducir una descripción.",id_txt);
return (false);	
} 
else		
return (true);
}
function fluctuacion(form) {		////////////////////////////////////   COMÚN 
Ctrl = form.fluctuacion;	
if (Ctrl.value == "") {		
id_txt=	"#fluctuacion_f";	
validatePrompt (Ctrl, "Debes introducir una fluctuación.",id_txt);
return (false);	
} 
else		
return (true);
}
function u_nombre(form) {		////////////////////////////////////   NOMBRE  
Ctrl = form.u_nombre;	
if (Ctrl.value == "") {		
id_txt=	"#u_nombre_a";	
validatePrompt (Ctrl, "Introduce el nombre de este usuario.",id_txt);
return (false);	
} 
else		
return (true);
}

function u_apellidos(form) {		////////////////////////////////////   APELLIDOS US  
Ctrl = form.u_apellidos;	
if (Ctrl.value == "") {		
id_txt=	"#u_apellidos_a";	
validatePrompt (Ctrl, "Introduce los apellidos de este usuario.",id_txt);
return (false);	
} 
else		
return (true);
}

function u_email(form){	////////////////////////////////////   USUARIOS MAIL 
var Ctrl=form.u_email
if(Ctrl.value!=""){
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(Ctrl.value)){return (true);}
else{id_txt="#u_email_a";validatePrompt (Ctrl, "El email "+Ctrl.value+" introducido no es válido",id_txt);return (false);}
}else{return (true);}}


function codigo(form) {		////////////////////////////////////   DESCUENTOS 
Ctrl = form.codigo;	
if (Ctrl.value == "") {		
id_txt=	"#codigo_a";	
validatePrompt (Ctrl, "Debes introducir un código.",id_txt);
return (false);	
} 
else		
return (true);
}


function nombre(form) {		////////////////////////////////////   NOMBRE CONTACTO 
Ctrl = form.nombre;	
if (Ctrl.value == "") {		
id_txt=	"#nombre_a";	
validatePrompt (Ctrl, "Debes introducir un nombre.",id_txt);
return (false);	
} 
else		
return (true);
}


function apellidos(form) {		////////////////////////////////////   APELLIDOS CONTACTO 
Ctrl = form.apellidos;	
if (Ctrl.value == "") {		
id_txt=	"#apellidos_a";	
validatePrompt (Ctrl, "Debes introducir los apellidos.",id_txt);
return (false);	
} 
else		
return (true);
}


function anyo(form) {		////////////////////////////////////   APELLIDOS CONTACTO 
Ctrl = form.anyo;	
if (Ctrl.value == "") {		
id_txt=	"#anyo_a";	
validatePrompt (Ctrl, "Debes introducir una temporada (aaaa-aaaa).",id_txt);
return (false);	
} 
else		
return (true);
}



//////////////////////////////////////////////////////////////////////////////    ENVIAR    //////////////////////////////////////////////////////	
function Enviar (form)  {
    if (!titulo_esp(form)) return;
	if (!url_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_divisiones (form)  {	////////////////////////////////////   DIVISIONES 
    if (!titulo_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_webs (form)  {	////////////////////////////////////   WEBS 
    if (!titulo_esp(form)) return;
	if (!id_division(form)) return;
	if (!f_email(form)) return;
	if (!email(form)) return;
	//if (!url(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_categorias (form)  {	////////////////////////////////////   CATEGORIAS 
    if (!titulo_esp(form)) return;
	if (!titulo_crm_esp(form)) return;
	if (!id_web(form)) return;
	if (!url_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_datosComunes (form)  {	////////////////////////////////////   WEBS 
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_secciones (form)  {	////////////////////////////////////   SECCIONES 
    if (!titulo_esp(form)) return;
	if (!id_categoria(form)) return;
	if (!url_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_subsecciones (form)  {	////////////////////////////////////   subSECCIONES 
    if (!titulo_esp(form)) return;
	if (!id_seccion(form)) return;
	if (!url_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_proveedores (form)  {	////////////////////////////////////   subSECCIONES 
    if (!titulo_esp(form)) return;
	if (!email(form)) return;
	if (!email_p(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_aeropuertos (form)  {	////////////////////////////////////   AEROPUERTOS 
    if (!ciudad(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_idiomas (form)  {	////////////////////////////////////   IIDOMAS 
    if (!idioma(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_destinos (form)  {	////////////////////////////////////   DESTINOS 
    if (!titulo_esp_d(form)) return;
	if (!url_esp_d(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_ciudades (form)  {	////////////////////////////////////   CIUDADES 
    if (!titulo_esp_ci(form)) return;
	if (!id_destino(form)) return;
	if (!url_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_items (form)  {	////////////////////////////////////   ITEMS 
    if (!titulo_esp_c(form)) return;
	if (!titulo_of_esp(form)) return;
	if (!id_seccion(form)) return;
	//if (!id_subseccion(form)) return;
	if (!id_destino(form)) return;
	if (!id_idioma(form)) return;
	if (!pr_reserva(form)) return;
	if (!url_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_alo_tipo (form)  {	////////////////////////////////////   ALOJAMIENTOS TIPO 
   if (!titulo_esp_alo(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_quincena (form)  {	////////////////////////////////////   QUINCENAS 
   if (!titulo_esp_qui(form)) return;
   if (!f_inicio_qui(form)) return;
   if (!f_fin_qui(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_metodosPago (form)  {	////////////////////////////////////   METODOS PAGO 
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function titulo_esp_cc(form) {		////////////////////////////////////   CURSOS 
Ctrl = document.envio.titulo_esp_cc;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_cc";	
validatePrompt (Ctrl, "Debes introducir un título.",id_txt);
return (false);	
} 
else		
return (true);
}
function url_esp_cc(form) {	////////////////////////////////////   CURSOS 
Ctrl = document.envio.url_esp_cc;	
var cadena="http://";var cadena2="https://";var cadena3="http";var cadena4="www";
if (Ctrl.value == "" || Ctrl.value.indexOf(cadena) != -1 || Ctrl.value.indexOf(cadena2) != -1 || Ctrl.value.indexOf(cadena3) != -1 || Ctrl.value.indexOf(cadena4) != -1) {		
id_txt=	"#url_esp_c";	
validatePrompt (Ctrl, "Debes introducir la dirección url amigable sin HTTP:// ni WWW. en la sección SEO   [Ej. palabra-clave-url]",id_txt);
return (false);	
} 
else		
return (true);
}
function Enviar_cursos (form)  {	////////////////////////////////////   CURSOS 
   if (!titulo_esp_cc(form)) return;
   if (!url_esp_cc(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_alojamientos (form)  {	////////////////////////////////////   AALOJAMIENTOS 
   //if (!titulo_esp_cc(form)) return;
   //if (!url_esp_cc(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_duplicar (form)  {	////////////////////////////////////   ALOJAMIENTOS TIPO 
   if (!titulo_esp(form)) return;
   if (!titulo_of_esp(form)) return;
   if (!url_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_cambiar_cat (form)  {	////////////////////////////////////   QUINCENAS 
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_generales (form)  {	////////////////////////////////////   DESTINOS 
    if (!titulo_esp(form)) return;
	if (!url_esp_d(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_redes (form)  {	////////////////////////////////////   DESTINOS 
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_fluctuaciones (form)  {	////////////////////////////////////   FLUCTACIONES 
    if (!titulo_esp_fluc(form)) return;
	if (!fluctuacion(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_documentacion (form)  {	////////////////////////////////////   DOCUMENTACION 
    if (!titulo_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_usuarios (form)  {	////////////////////////////////////   USUARIOS 
    if (!u_nombre(form)) return;
	if (!u_apellidos(form)) return;
	if (!u_email(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_packs (form)  {	////////////////////////////////////   PACKS 
    if (!titulo_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_descuentos (form)  {	////////////////////////////////////   FLUCTACIONES 
    if (!titulo_esp(form)) return;
	if (!codigo(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_formularios (form)  {	////////////////////////////////////   FORMULARIOS 
    if (!titulo_esp(form)) return;
	if (!email_f(form)) return;
	if (!email(form)) return;
	if (!asunto(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_contactos (form)  {
    if (!nombre(form)) return;
	if (!apellidos(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_cat_contactos (form)  {
    if (!titulo_esp(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_academia_alumno (form)  {
    if (!nombre(form)) return;
	if (!apellidos(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_incripcion_clase (form)  {
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.inscribir.submit(); }, 300);
	return;
}
function Enviar_profesores (form)  {
    if (!nombre(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
function Enviar_colegios (form)  {
    if (!nombre(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}

function Enviar_precios (form)  {
    if (!anyo(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
////////////////////////////////////////////////////////////////  COMUNES   /////////////////////////////////////
function validatePrompt (Ctrl, PromptStr, id_txt) {	
	 $(id_txt).addClass( "has-error" );
	 $( ""+id_txt+" .help-block" ).removeClass( "help-block" ).addClass( "help-block-error" );
	 $( ""+id_txt+" .form-control-focus" ).addClass( "display-hide" );
	 $("#form_errors").removeClass( "display-hide" );
	 $("#alerta").modal();
	 $("#alerta_txt").text(PromptStr);
	 return;
}
function resetea_error(id_txt){
	$("#"+id_txt).removeClass( "has-error" );
	$( "#"+id_txt+" .help-block-error" ).removeClass( "help-block-error" ).addClass( "help-block" );
	$( "#"+id_txt+" .form-control-focus" ).removeClass( "display-hide" )
	$("#form_errors").fadeOut( "slow" );
}