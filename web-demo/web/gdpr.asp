<!--#include file="comun/menu_sup.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="comun/limpia.asp"-->
<%form_op=request("form_op")%>
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<script src="<%=r%>web/lib/js/custom.js"></script>
<div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" style="background-image: url(<%=ruta_banner%>)">
<div class="container"><div class="c-page-title c-pull-left"><h3 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim"><%=titulo_esp_web%> | <%=titulo_esp_div%></h3>
<h4 class="c-font-white c-font-thin c-opacity-07">No dejes de estar informado de todo</h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white">Suscripción a Newsletter</li></ul></div></div><div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row reserva_check">
<div class="col-md-12 acceso reserva_check">
<%if form_op=""then
session("mail_en")=""%>
<div style="text-align:left;margin-bottom:25px;">
<h3>Permisos de marketing</h3>
Cursit Idiomas utilizará la información que proporcione en este formulario para estar en contacto con usted y proporcionar noticias, ofertas y acciones de marketing. Por favor, háganos saber todas las formas en las que le gustaría saber de nosotros:
</div>
<form class="form" role="form" method="post" action="<%=r%>gdpr-ok" id="login_p" name="login_p">
<input name="form_op" type="hidden" value="recupera">
<div class="acceso_in" style="margin-bottom:55px">
<div style="text-align:left;margin-bottom:25px;">
<div class="c-checkbox">
<input name="acp_mail" type="checkbox" class="c-check" id="acp_mail" autocomplete="off" >
<label for="acp_mail" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-envelope-o" aria-hidden="true" style="color:#999"></i> Email</label>
</div>
</div>
<div class="acceso_in_in">
<div class="form-group"><i class="fa fa-user"></i><input type="text" placeholder="Mail de usuario*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Mail de usuario*'" class="form-control c-square c-theme input-lg inp" name="log_usuario" id="log_usuario" value="<%=request("email_chimp")%>"></div>
<span class="btn_acceso"><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold" onCLick="javascript:recupera_pass();" style="width:100%">Solicitar suscripción<i class="fa fa-share" aria-hidden="true" style="margin-left:8px"></i></button></span>
</div>
</div>
</form>
<div style="text-align:left;margin-bottom:25px;">
Puede cambiar de opinión en cualquier momento haciendo clic en el enlace para darse de baja en el pie de página de cualquier correo electrónico que reciba de nosotros, o comunicándose con nosotros a sat@cursit.com. Trataremos su información con respeto. Para obtener más información acerca de nuestras prácticas de privacidad, visite nuestro sitio web. Al hacer clic a continuación, acepta que podamos procesar su información de acuerdo con estos términos.
<h3>GDPR</h3>
Usamos MailChimp como plataforma para envío automático de marketing mail. Haciendo click en "Solicitar suscripción" aceptas estar informado de que la información que nos proporcionas será transferida a MailChimp para ser procesada de acuerdo con su propia <a href="https://mailchimp.com/legal/privacy/" target="_blank">Política de Privacidad</a> y <a href="https://mailchimp.com/legal/terms/" target="_blank">Términos</a>.
</div>
<%else
if form_op="recupera" then
u_email=trim(request("log_usuario"))
Sql= "SELECT u_email, id_usuario from usuarios where u_email= '"&u_email&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
id_usuario=ob_rs("id_usuario")
else%>
<div class="alert alert-success alert-dismissible" role="alert"> El email introducido no corresponde a ningún usuario.</div>
<%end if
ob_rs.close

if id_usuario<>"" then
Dim IP
IP = Request.ServerVariables("HTTP_X_FORWARDED_FOR") ' se chequea si hay un proxy
If IP ="" Then IP = Request.ServerVariables("REMOTE_ADDR") ' si no hay proxy se toma la IP original
mySQL="UPDATE usuarios SET "
mySQL=mySQL & "n_letter = 'si', "
mySQL=mySQL & "n_letter_ip = '" & ip & "',"
mySQL=mySQL & "n_letter_hora = '" & now & "'"
mySQL=mySQL & " WHERE id_usuario = " & id_usuario & "" 
set ob_rs=Ob_Connb.execute(mySQL)%>
<div class="alert alert-success alert-dismissible" role="alert"> Aceptación de recepción de eMail marketing procesada con éxito.<br><br>Muchas gracias.</div>
<%end if
end if
end if%>
</div></div></div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<script>
function log_usuario() {Ctrl = login_p.log_usuario;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el mail o usuario.');$('#alerta_tit').html('Usuario o mail no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function acp_condiciones(){
if (document.getElementById("acp_mail").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes seleccionar "Email" como método de contacto.');$('#alerta_tit').html('Aceptar método de contacto para eMail marketing.');$('#alerta').modal('show');return (false)}}
function recupera_pass(){if (!log_usuario()) return;if (!acp_condiciones()) return;$('#spinner_back').fadeIn(100, function(){setTimeout(function(){ document.login_p.submit(); }, 0);});}</script>