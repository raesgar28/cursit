<!--#include file="../comun/menu_sup.asp"-->
<div class="c-layout-breadcrumbs-1 c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both"><div class="container"><div class="c-page-title c-pull-left">
  <h3 class="c-font-uppercase c-font-sbold">Cursit / Demo</h3></div>
    <ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">
<li><a href="javascript:;">Demo</a></li>
</ul>
</div>
</div>

<div class="c-content-box c-size-md c-bg-white">
<div class="container">
<div class="c-content-feedback-1 c-option-1">
<div class="row">
<div class="col-md-6">

<div class="c-container c-bg-grey-1 c-bg-img-bottom-right" style="background-image:url(assets/base/img/content/misc/feedback_box_2.png)">
<div class="c-content-title-1">
<h3 class="c-font-uppercase c-font-green">¿Te llamamos nosotros?</h3>
<div class="c-line-left c-bg-yellow-2"></div>
<form action="contacto-envio" id="envio_rap" name="envio_rap" method="post">
<div class="input-group input-group-lg c-square  " style="width:100%">
<input class="form-control c-square" placeholder="Déjanos tu teléfono" type="text" id="telefono_rap" name="telefono" value="<%=request("telefono")%>">
<span class="input-group-btn"><button class="btn c-theme-btn c-btn-square c-btn-uppercase c-font-bold" type="button" onClick="javascript:Enviar_rap();"><i class="fa fa-phone" aria-hidden="true"></i>Adelante</button></span>
</div>
<div class="c-checkbox" style="margin-top:25px"><input class="c-check" name="acepto" id="acepto_rap" autocomplete="off" type="checkbox"><label for="acepto_rap" class="check_txt" autocomplete="off"><span class="inc"></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> <span style="font-size:0.8em;display:inline-block;margin-left:55px">Sí, he leído y acepto <a href="javascript:tratamiento_datos();" class="check_a">la cláusula informativa y autorización al tratamiento de los datos</a></span></label>
</div>
</form>
<p>Te llamaremos lo antes posible para concertar contigo una reunión vía Skype o HangOut y mostrarte todas las funcionalidades de Cursit.</p>
</div>
</div>
</div>

<div class="col-md-6">
<div class="c-contact">
<div class="c-content-title-1">
<h3 class="c-font-uppercase c-font-green">Déjanos tus datos si lo prefieres</h3>
<div class="c-line-left c-bg-yellow-2"></div>
<p class="c-font-lowercase">Si lo prefieres, dinos tus datos de contacto y coméntanos cómo quieres que contactemos contigo.</p>
</div>
<form action="contacto-envio" method="post" id="envio" name="envio">
<div class="form-group">
<input placeholder="Persona de contacto*" class="form-control c-square c-theme input-lg" type="text" name="nombre" id="nombre"> </div>
<div class="form-group">
<input placeholder="eMail*" class="form-control c-square c-theme input-lg" type="text" name="email" id="email"> </div>
<div class="form-group">
<input placeholder="Teléfono de contacto" class="form-control c-square c-theme input-lg" type="text"> </div>
<div class="form-group">
<textarea rows="4" name="message" placeholder="Cuéntanos lo que creas conveniente..." class="form-control c-theme c-square input-lg"></textarea>
</div>

<div class="c-checkbox" style="margin-bottom:25px"><input class="c-check" name="acepto" id="acepto" autocomplete="off" type="checkbox"><label for="acepto" class="check_txt" autocomplete="off"><span class="inc"></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, he leído y acepto <a href="javascript:tratamiento_datos();" class="check_a">la cláusula informativa y autorización al tratamiento de los datos</a></label>
</div>
<div class="c-checkbox" style="margin-bottom:25px"><input class="c-check" name="n_letter" id="n_letter" autocomplete="off" value="si" type="checkbox"><label for="n_letter" class="check_txt" autocomplete="off" value="si"><span class="inc"></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, quiero formar parte de la base de datos de Schola para recibir Newswletters promocionales</label></div>
<div class="form-group"><label for="captchacode">código seguro</label><img src="comun/captcha/captcha.asp" name="imgCaptcha" id="imgCaptcha" style="margin-left:8px;"><a href="javascript:void(0)" onclick="RefreshImage('imgCaptcha')"><i class="fa fa-refresh" aria-hidden="true" style="margin-left:8px;margin-right:8px"></i></a><label for="captchacode">&nbsp;</label><input name="captchacode" id="captchacode" size="18" class="caja_contacto_contact" style="border: 2px solid rgb(255, 0, 0);" type="text"></div>
<button type="button" class="btn c-theme-btn c-btn-uppercase btn-lg c-btn-bold c-btn-square" id="envia_form">Enviar</button>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="c-content-box c-size-md c-bg-grey-1"><div class="container">
<div class="c-content-title-1"><h3 class="c-center c-font-uppercase c-font-green">capturas de vista previa</h3>
<div class="c-line-center c-bg-yellow-2"></div><p class="c-center c-font-uppercase">Solo una pequeña muestra de imágenes de funcionamiento de Cursit.</p></div>
<div class="cbp-panel"><div class="c-content-latest-works cbp cbp-l-grid-masonry-projects wow animate fadeInLeft">

<div class="cbp-item">
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap"><img src="img/reserva-cursos-idiomas.jpg" alt=""> </div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="img/reserva-cursos-amplio.gif" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="Ejemplo de interfaz para el usuario / alumno y método de reserva">zoom</a>
</div>
</div>
</div>
</div>
</div>

<div class="cbp-item ">
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap"><img src="img/registro.jpg" alt=""> </div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="img/registro-amplio.gif" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="Pantalla de registro de usuario nuevo">zoom</a>
</div>
</div>
</div>
</div>
</div>

<div class="cbp-item">
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap">
<img src="img/proceso-reserva-curso-idiomas.jpg" alt=""> </div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="img/proceso-reserva-curso-idiomas-b.gif" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="Otra pantalla del proceso de reserva">view video</a>
</div>
</div>
</div>
</div>
</div>

<div class="cbp-item">
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap"><img src="img/area-privada.jpg" alt=""> </div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="img/area-privada-b.gif" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="Interfaz del área de usuario">zoom</a></div>
</div>
</div>
</div>
</div>

<div class="cbp-item">
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap"><img src="img/preinscripciones-curso-idiomas-p.jpg" alt=""> </div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="img/preinscripciones-curso-idiomas.gif" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="Listado de preinscripciones">zoom</a></div>
</div>
</div>
</div>
</div>

<div class="cbp-item">
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap"><img src="img/crm-cursos-idiomas-imagenes-video-b.jpg" alt=""> </div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="img/crm-cursos-idiomas-imagenes-video.jpg" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="Infinitas imágenes para mostrar tu oferta">zoom</a></div>
</div>
</div>
</div>
</div>

<div class="cbp-item" >
<div class="cbp-caption">
<div class="cbp-caption-defaultWrap"><img src="img/proceso-reserva-pago.jpg" alt=""> </div>
<div class="cbp-caption-activeWrap">
<div class="c-masonry-border"></div>
<div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body">
<a href="img/proceso-reserva-pago-b.gif" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="Con los métodos de pago que prefieras">zoom</a></div>
</div>
</div>
</div>
</div>

</div></div></div></div>
<div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i> <span>Tratamiento datos</span></h4></div><div class="modal-body"><p><span></span></p><p>
<br>
TITULARIDAD DEL SITIO WEB
<br>
<br>
Conforme a lo establecido en la Ley de Servicios de la Sociedad de la Información y de Comercio Electrónico, le informamos que este portal está gestionado por Ramón Espinosa Garde, propietario de Wishing Well, con N.I.F. 44379724M y domicilio fiscal en c/ Villareal, 3 - Valencia (España) y dirección de correo electrónico ramon@wishingwell.es.
 <br>
<br>
CLAVE PERSONAL DE ACCESO
 <br>
<br>
En el supuesto de que se hubiera facilitado a los usuarios o clientes la posibilidad de crear claves personales de acceso, compuestas por un código de cliente (login) y una contraseña (password) para poder visitar zonas de uso restringido, éstos serán los únicos que podrán hacer uso del mismo y, en consecuencia, se responsabilizarán por todas las operaciones realizadas con dichas claves.
<br>
<br>
A este fin, el usuario deberá seleccionar unos caracteres que no sean fácilmente identificables y mantenerlos en secreto. Facilitar, usar, intentar descifrar las claves de acceso de otros o desvelarlas a otras personas no autorizadas es considerado como una grave violación de las normas de utilización y seguridad. Si el usuario tuviera razones para creer que su clave es o puede ser conocido por alguna persona no autorizada para ello, deberá ponerlo inmediatamente en conocimiento de Wishing Well a través del correo: domains@wishingwell.es para que le sea asignada una nueva.
 <br>
<br>
DERECHOS DE PROPIEDAD INTELECTUAL
 <br>
<br>
Todos los contenidos que se muestran en el sitio web y en especial, diseños, textos, gráficos, logos, iconos, botones, software, nombres comerciales, marcas, dibujos industriales o cualesquiera otros signos susceptibles de utilización industrial y comercial están sujetos a derechos de propiedad intelectual e industrial de Wishing Well o de terceros titulares de los mismos que han autorizado debidamente su inclusión en el sitio web.
 <br>
<br>
En ningún caso se entenderá que se concede licencia alguna o se efectúa renuncia, transmisión, cesión total o parcial de dichos derechos ni se confiere ningún derecho ni expectativa de derecho, y en especial, de alteración, explotación, reproducción, distribución o comunicación pública sobre dichos contenidos sin la previa autorización expresa de Wishing Well o de los titulares correspondientes.


</p><p></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>



<div class="c-content-box c-size-md c-bg-grey-2">
<div class="container">
<div class="c-content-bar-3">
<div class="row">
<div class="col-md-7">
<div class="c-content-title-1">
<h3 class="c-font-uppercase">ACCEDE A LA WEB DEMO</h3>
<p class="c-font-white">Ponemos a tu disposición una web de demostración de Cursit en funcionamiento. Todas las funcionalidades están habilitadas, pero si deseas conocer el Back Office y saber cómo interactuar con tus clientes contacta con nosotros.</p>
</div>
</div>
<div class="col-md-3 col-md-offset-2">
<div class="c-content-v-center" style="height: 110px;">
<div class="c-wrapper">
<div class="c-body">
<a href="http://www.cursit.com/web-demo/" class="btn c-theme-btn btn-md c-btn-square c-btn-border-2x c-theme-btn c-btn-uppercase c-btn-bold">Acceso a Web Demo</a>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="spinner_back_usu" style="display:none"><div id="spinner" class="spinner_usu" ><img src="<%=r%>img/carga.gif" width="128" height="128"><br><br>Enviando datos...</div></div>
<style>.spinner_usu {position: fixed; top: 25%; left: 50%;margin-left: -125px;margin-top: -50px;text-align:center;z-index:1234;overflow: hidden;width: 350px;height: 220px;background:#fff;padding-top:25px;color:#32C5D2;font-weight:bold;-webkit-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.75);-moz-box-shadow:0px 0px 8px 0px rgba(50, 50, 50, 0.75);box-shadow:0px 0px 8px 0px rgba(50, 50, 50,0.75);}#spinner_back_usu{position: fixed; background:rgba(0,0,0,0.5);position: fixed; top: 0; left: 0;width:100%;height:100%;overflow: hidden;text-align:center;z-index:111111111;}</style>
<!--#include file="../comun/menu_inf.asp"-->
<script>
$(document).ready(function(){$("#envia_form").click(function() {
$.getJSON("comun/captcha/captcha.asp?validateCaptchaCode=" +  $("#captchacode").val() + "&format=json&jsoncallback=?", function(data){
if (data.status == "1")
{if (Enviar() == true){
$('#spinner_back_usu').show();
setTimeout(function(){ document.envio.submit(); }, 300);
}result = true;}else{
if (data.session == "0")
RefreshImage("imgCaptcha");
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Por favor introduce las letras y números correctos en la caja de Código Seguro!');$('#alerta_tit').html('Introduce el código.');$('#alerta').modal('show');
$('#captchacode').css('border', '2px solid #FF0000');$('#captchacode').click(function() {$('#captchacode').css('border', '1px solid #D0D7DE');});
result = false;}});});});
function nombre() {Ctrl = document.envio.nombre;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce tu nombre.');$('#alerta_tit').html('Nombre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function email(form){
var resultado
var str=document.envio.email.value;
var Ctrl=document.envio.email;
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(str))
resultado=true
else{
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail introducido no es correcto.');$('#alerta_tit').html('eMail introducido incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
resultado=false
}return (resultado)}
function correcto(){if (document.getElementById("acepto").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar la Cláusula Informativa y Autorización al Tratamiento de datos.');$('#alerta_tit').html('Aceptar cláusula informativa.');$('#alerta').modal('show');return (false)}}
function Enviar (form)  {if (!nombre(form)) return;if (!email(form)) return;if (!correcto(form)) return;return true;}
function telefono_rap() {Ctrl = document.envio_rap.telefono_rap;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce tu teléfono o email.');$('#alerta_tit').html('Teléfono o email no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function correcto_rap(){if (document.getElementById("acepto_rap").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar la Cláusula Informativa y Autorización al Tratamiento de datos.');$('#alerta_tit').html('Aceptar cláusula informativa.');$('#alerta').modal('show');return (false)}}
function Enviar_rap (form)  {
if (!telefono_rap(form)) return;if (!correcto_rap(form)) return;
$('#spinner_back_usu').show();setTimeout(function(){ document.envio_rap.submit(); }, 300);return true;}
function tratamiento_datos(){$('#tratamiento_datos').modal('show');}
</script>