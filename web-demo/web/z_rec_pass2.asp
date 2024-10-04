<!--#include file="comun/menu_sup.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="comun/limpia.asp"-->
<!--#include file="comun/pass_sha256.asp"-->
<%codigo_activacion=request("codigo_activacion")
id_usuario=Mid(codigo_activacion,10,200)
form_op=request("form_op")%>
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<script src="<%=r%>web/lib/js/custom.js"></script>
<script src="<%=r%>web/lib/js/reserva-steps.js"></script>
<div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" style="background-image: url(<%=ruta_banner%>)">
<div class="container"><div class="c-page-title c-pull-left"><h3 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim"><%=titulo_esp_web%> | <%=titulo_esp_div%></h3>
<h4 class="c-font-white c-font-thin c-opacity-07"> <%=texto_esp_web%></h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li><li class="c-font-white">/</li><li class="c-state_active c-font-white">Recuperar contraseña</li></ul></div></div><div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row reserva_check">
<div class="col-md-12 acceso reserva_check">
<%if form_op=""then
Sql= "SELECT * from usuarios where codigo_activacion='"&codigo_activacion&"' and id_usuario="&id_usuario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_nombre=ob_rs("u_nombre")
id_usuario=ob_rs("id_usuario")
usuario_ok="si"
end if
ob_rs.close
if usuario_ok="si"and form_op<>"recupera" then%>
<form class="form" role="form" method="post" action="<%=r%>recover2" id="f_reserva" name="f_reserva">
<input name="form_op" type="hidden" value="recupera"><input name="id_usuario" type="hidden" value="<%=id_usuario%>"><input name="codigo_activacion" type="hidden" value="<%=codigo_activacion%>">
<div class="acceso_in"><div class="acceso_in_in">
<div class="form-group"><i class="fa fa-user"></i><input type="password" placeholder="Nueva contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nueva contraseña*'" class="form-control c-square c-theme input-lg inp" name="pass" id="pass"></div>
<div class="form-group"><i class="fa fa-user"></i><input type="password" placeholder="Repetir contraseña*" onclick="this.placeholder = ''" onblur="this.placeholder = 'Repetir contraseña*'" class="form-control c-square c-theme input-lg inp" name="pass_r" id="pass_r"></div>
<span class="btn_acceso"><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold" onCLick="javascript:recupera_pass2();">Modificar contraseña<i class="fa fa-share" aria-hidden="true" style="margin-left:8px"></i></button></span>
</div>
</div>
</form>
<%end if'USUARIO OK
end if'FORM_OP
if form_op="recupera"then
pass=request("pass")
pass=sha256(pass)
id_usuario=request("id_usuario")
if id_usuario<>""then
mySQL2="UPDATE usuarios SET "
mySQL2=mySQL2 & "u_pass = '" & pass & "'"
mySQL2=mySQL2 & " WHERE id_usuario = " & id_usuario & "" 
set ob_rs2=Ob_Connb.execute(mySQL2)%>
<div class="alert alert-success alert-dismissible" role="alert"> Contraseña modificada con éxito!!.</div>
<%else%>
<div class="alert alert-danger alert-dismissible" role="alert"> Algo ha ido mal en el proceso de cambio de contraseña. Por favor ponte en contacto con nosotros. </div>
<%end if
end if%>
</div></div></div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<script>
function pass() {Ctrl = f_reserva.pass;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la contraseña del usuario.');$('#alerta_tit').html('Contraseña del usuario no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function compara_pass(form){
var Ctrl=document.f_reserva.pass_r;
if (document.f_reserva.pass.value != ''){
if(document.f_reserva.pass.value == document.f_reserva.pass_r.value)
return true;
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> La Contraseña del usuario repetida no coincide.');$('#alerta_tit').html('Contraseña del usuario incorrecta.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
}else{return true;alert();}
}
function recupera_pass2(){
if (!pass()) return;
if (!compara_pass()) return;
$('#spinner_back').fadeIn(100, function(){setTimeout(function(){ document.f_reserva.submit(); }, 0);});
}
</script>