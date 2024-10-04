<!--#include file="comun/menu_sup.asp"-->





<div class="c-layout-breadcrumbs-1 c-bgimage-full c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza2" style="background-image: url(<%=ruta_banner%>)">
<div class="c-breadcrumbs-wrapper">
<div class="container">
<div class="c-page-title c-pull-left"><h1 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim "><%=titulo_esp_web%> | <%=titulo_esp_div%></h1>
<h2 class="c-font-white c-font-thin c-opacity-07"><%=alt_banner%></h2>
</div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">
<li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li>
<li class="c-font-white">/</li>
<li class="c-state_active c-font-white" alt="<%=titulo_esp%>"><%=titulo_esp%></li>
</ul>
</div>
</div>
</div>










<%if tipo<>"nt" and tipo<>"ct"and id_general<>"" then 'GENERALES ////////////////////////////////////%>
<div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row"><div class="col-sm-12"><%=texto_esp%>
<%if id_formulario<>0 then
Sql= "SELECT titulo_esp, texto_esp FROM formularios WHERE id_formulario="&id_formulario&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="c-content-box c-size-md "><div class="container" style="padding:0"><div class="c-content-feedback-1 c-option-1"><div class="row"><div class="col-md-6"><div class="c-container c-bg-green c-bg-img-bottom-right" style="background-image:url('<%=r%>web/lib/img/feedback_box_1.png')"><div class="c-content-title-1 c-inverse"><h3 class="c-font-uppercase c-font-bold"><%=titulo_esp%></h3><div class="c-line-left"></div><p class="c-font-lowercase"><%=ob_rs("texto_esp")%></p></div></div>
<div class="c-container c-bg-grey-1 c-bg-img-bottom-right" style="background-image:url('<%=r%>web/lib/img/feedback_box_2.png')">
<div class="c-content-title-1"><h3 class=" c-font-bold">¿Quieres saberlo todo?</h3><div class="c-line-left"></div><div id="mc_embed_signup"><form  action="https://getupidiomas.us19.list-manage.com/subscribe?u=bf34b4cddaef6715a27ff1427&id=092b01e5de" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate><div id="mc_embed_signup_scroll" class="nl_full"><div class="nl_"><div class="form-group"><input type="email" value="" name="EMAIL" class="email form-control c-square c-theme input-lg" id="mce-EMAIL" placeholder="email" required></div></div><div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_be3341363ba98f7e9b56d51e1_708aac5ddf" tabindex="-1" value=""></div><div class="nl_"><button type="submit" value="Suscribirme a Newsletter" name="subscribe" id="mc-embedded-subscribe" class="button btn c-theme-btn c-btn-uppercase btn-lg c-btn-bold c-btn-square">Suscribirme a Newsletter<i class="fa fa-envelope" style="margin-left:8px"></i></button></div></div></form></div></div></div></div>
<div class="col-md-6"><div class="c-contact"><div class="c-content-title-1"><h3 class="c-font-uppercase c-font-bold"><%=ob_rs("titulo_esp")%></h3><div class="c-line-left"></div></div>
<form action="formulario" method="post" id="envio" name="envio">
<input name="id_formulario" id="id_formulario"  type="hidden" value="<%=id_formulario%>">
<%Sql2= "SELECT * FROM formulariosCampos WHERE id_formulario="&id_formulario&" order by orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>

<%if ob_rs2("tipo_input")<>"mem" then%>
<div class="form-group"><input type="text" placeholder="<%=ob_rs2("nombre")%><%if ob_rs2("obligatorio")="si"then%>*<%end if%>" class="form-control c-square c-theme input-lg" <%if ob_rs2("longitud")<>0 then%>style="width:<%=ob_rs2("longitud")%>%"<%end if%> name="<%=ob_rs2("nombre_nombre")%>" id="<%=ob_rs2("nombre_nombre")%>"></div>
<%else%>
<div class="form-group"><textarea rows="5" name="<%=ob_rs2("nombre_nombre")%>" placeholder="<%=ob_rs2("nombre")%><%if ob_rs2("obligatorio")="si"then%>*<%end if%>" class="form-control c-theme c-square input-lg" id="<%=ob_rs2("nombre_nombre")%>"></textarea></div>
<%end if%>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
<div class="c-checkbox" style="margin-bottom:25px"><input type="checkbox" class="c-check" name="acepto" id="acepto" autocomplete="off"><label for="acepto" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, he leído y acepto <a href="javascript:tratamiento_datos();" class="check_a">la cláusula informativa y autorización al tratamiento de los datos</a></label>
<div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<%Sql2= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
texto_td=ob_rs2("texto_esp")
titulo_td=ob_rs2("titulo_esp")
end if
ob_rs2.close%>
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i> <span><%=titulo_td%></span></h4></div><div class="modal-body"><p><span><%=texto_td%></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div>
</div>
</div>
<div class="form-group"><label for="captchacode">c&oacute;digo seguro</label><img src="<%=r%>web/comun/captcha/captcha.asp" name="imgCaptcha" id="imgCaptcha"  style="margin-left:8px;"><a href="javascript:void(0)" onClick="RefreshImage('imgCaptcha')"><i class="fa fa-refresh" aria-hidden="true" style="margin-left:8px;margin-right:8px"></i></a><label for="captchacode">&nbsp;</label><input name="captchacode" type="text" id="captchacode" size="18" class="caja_contacto_contact"></div>
<button type="button" class="btn c-theme-btn c-btn-uppercase btn-lg c-btn-bold c-btn-square" id="envia_form">Enviar formulario</button>
</form>
</div></div></div></div></div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<script>
function tratamiento_datos(){$('#tratamiento_datos').modal('show');}
function RefreshImage(valImageId) {
var objImage = document.images[valImageId];
if (objImage == undefined) {return;}var now = new Date();
objImage.src = objImage.src.split('?')[0] + '?x=' + now.toUTCString();}
$(document).ready(function(){$("#envia_form").click(function() {
$.getJSON("<%=r%>web/comun/captcha/captcha.asp?validateCaptchaCode=" +  $("#captchacode").val() + "&format=json&jsoncallback=?", function(data){
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
<%Sql2= "SELECT * FROM formulariosCampos WHERE id_formulario="&id_formulario&" and obligatorio='si' order by orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
if ob_rs2("dato")="d_email" then%>
function <%=ob_rs2("nombre_nombre")%>(form){
var resultado
var str=document.envio.<%=ob_rs2("nombre_nombre")%>.value;
var Ctrl=document.envio.<%=ob_rs2("nombre_nombre")%>;
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(str))
resultado=true
else{
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail introducido no es correcto.');$('#alerta_tit').html('eMail introducido incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
resultado=false
}return (resultado)}
<%else%>
function <%=ob_rs2("nombre_nombre")%>() {Ctrl = document.envio.<%=ob_rs2("nombre_nombre")%>;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el campo <%=ob_rs2("nombre")%>.');$('#alerta_tit').html('<%=ob_rs2("nombre")%> no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
<%end if%>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
function correcto(){if (document.getElementById("acepto").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar la Cláusula Informativa y Autorización al Tratamiento de datos.');$('#alerta_tit').html('Aceptar cláusula informativa.');$('#alerta').modal('show');return (false)}}
function Enviar (form)  {
<%Sql2= "SELECT * FROM formulariosCampos WHERE id_formulario="&id_formulario&" and obligatorio='si' order by orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
if (!<%=ob_rs2("nombre_nombre")%>(form)) return;
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
if (!correcto(form)) return;
return true;}
</script>
<div id="spinner_back_usu" style="display:none"><div id="spinner" class="spinner_usu" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Enviando datos...</div></div>
<style>.spinner_usu {position: fixed; top: 25%; left: 50%;margin-left: -125px;margin-top: -50px;text-align:center;z-index:1234;overflow: hidden;width: 350px;height: 220px;background:#fff;padding-top:25px;color:#32C5D2;font-weight:bold;-webkit-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.75);-moz-box-shadow:0px 0px 8px 0px rgba(50, 50, 50, 0.75);box-shadow:0px 0px 8px 0px rgba(50, 50, 50,0.75);}#spinner_back_usu{position: fixed; background:rgba(0,0,0,0.5);position: fixed; top: 0; left: 0;width:100%;height:100%;overflow: hidden;text-align:center;z-index:111111111;}</style>
<%end if
ob_rs.close
end if%>
<%if tipo="mp" then 'MAPA WBB//////////////////////////////////%>
<ul style="float:left;" class="mapa">
<%Sql= "SELECT menu, posicion, id_general, id_categoria FROM menus WHERE menu = 2 order by posicion" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
if ob_rs("id_categoria")<>0 then
Sql2= "SELECT id_categoria, titulo_esp, url_esp, visible FROM categorias WHERE id_categoria = "&ob_rs("id_categoria")&" and visible='si' " 
else
Sql2= "SELECT id_general, titulo_esp, url_esp, visible FROM generales WHERE id_general = "&ob_rs("id_general")&"  and visible='si' " 
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<li style="margin-bottom:60px;display:block;float:left"><a href="<%=r%><%=ob_rs2("url_esp")%>" style="width:100%;text-align:left;display:inline-block;margin-bottom:10px;border-bottom:1px solid #ccc"><%=ob_rs2("titulo_esp")%></a>
<%Sql3= "SELECT rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden, en_menu FROM rel, secciones where rel.id_categoria = "&ob_rs("id_categoria")&" and rel.id_seccion=secciones.id_seccion and secciones.visible='si' group by rel.id_seccion, rel.id_categoria, secciones.id_seccion, secciones.url_esp, secciones.titulo_esp, secciones.orden, en_menu ORDER BY secciones.orden" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>    
<ul style="float:left;display:inline-block;">
<li><%if ob_rs3("en_menu")="si"then%><a href="<%=r%><%=ob_rs2("url_esp")%>/<%=ob_rs3("url_esp")%>"><%=ob_rs3("titulo_esp")%><%end if%></a>
<ul>
<%Sql5= "SELECT rel.id_destino, destinos.titulo_esp, destinos.url_esp, multi FROM rel, destinos WHERE rel.id_seccion="&ob_rs3("secciones.id_seccion")&" and rel.id_subseccion=0 and rel.id_destino=destinos.id_destino and id_categoria = "&ob_rs("id_categoria")&"  GROUP BY rel.id_destino, destinos.titulo_esp, destinos.url_esp, destinos.orden, multi, id_categoria ORDER BY destinos.orden"
Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
if not ob_rs5.eof then 
do while not ob_rs5.eof
Sql55= "SELECT id_destino FROM rel WHERE id_destino="&ob_rs5("id_destino")&" and id_subseccion=0 and id_categoria="&ob_rs("id_categoria")&" " 
Set Ob_RS55 = Server.CreateObject("ADODB.Recordset")
Ob_RS55.Open Sql55, ob_conn,adOpenStatic, adCmdText
if not ob_rs55.eof then %>
<li><h3><a href="<%=r%><%=ob_rs2("url_esp")%>/<%=ob_rs3("url_esp")%>/<%=ob_rs5("url_esp")%>"><%=ob_rs5("titulo_esp")%></a></h3><ul>
<%Sql6= "SELECT titulo_esp, url_esp, inc_cat,inc_sec,inc_sub,inc_des,show_cat, id_categoria, visible FROM rel, items WHERE rel.id_destino="&ob_rs5("id_destino")&" and rel.id_item= items.id_item and rel.id_seccion="&ob_rs3("secciones.id_seccion")&" and (eliminado IS NULL or eliminado='') and visible='si' ORDER BY items.orden" 
Set Ob_RS6 = Server.CreateObject("ADODB.Recordset")
Ob_RS6.Open Sql6, ob_conn,adOpenStatic, adCmdText
if not ob_rs6.eof then 
do while not ob_rs6.eof
if ob_rs6("id_categoria")=ob_rs("id_categoria") then%>
<li><a href="<%=r%><%if ob_rs6("inc_cat")="si"then%><%=ob_rs2("url_esp")%>/<%end if%><%if ob_rs6("inc_sec")="si"then%><%=ob_rs3("url_esp")%>/<%end if%><%if ob_rs6("inc_des")="si"then%><%=ob_rs5("url_esp")%>/<%end if%><%=ob_rs6("url_esp")%>"><%=ob_rs6("titulo_esp")%></a></li>
<%else
if ob_rs6("show_cat")="si" and ob_rs5("multi")="si" then'AQUI HAY LIO CON CATEGORIAS%>
<li><a href="<%=r%><%if ob_rs6("inc_cat")="si"then%><%=ob_rs2("url_esp")%>/<%end if%><%if ob_rs6("inc_sec")="si"then%><%=ob_rs3("url_esp")%>/<%end if%><%if ob_rs6("inc_des")="si"then%><%=ob_rs5("url_esp")%>/<%end if%><%=ob_rs6("url_esp")%>"><%=ob_rs6("titulo_esp")%></a></li>
<%end if
end if
ob_rs6.movenext
loop
end if
ob_rs6.close
end if
ob_rs55.close%>
</ul>
</li>
<%ob_rs5.movenext
loop
end if
ob_rs5.close 'FIN NO TIENE SUBSECCIONES%>
</ul>
</li></ul>
<%ob_rs3.movenext
loop
end if
if ob_rs("id_general")<>0 then
Sql3= "SELECT rel.id_pag_sup, rel.id_general, generales.titulo_esp, generales.url_esp, generales.orden, generales.visible FROM rel, generales where rel.id_pag_sup = "&ob_rs("id_general")&" and rel.id_general=generales.id_general and generales.visible='si' group by rel.id_pag_sup,rel.id_general, generales.titulo_esp, generales.url_esp, generales.orden, generales.visible order by generales.orden" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<ul>
<%do while not ob_rs3.eof%><li><a href="<%=r%><%=ob_rs3("url_esp")%>"><%=ob_rs3("titulo_esp")%></a></li>
<%ob_rs3.movenext
loop%>
</ul>
<%end if
ob_rs3.close
end if%>
</li>
<%end if
ob_rs2.close
ob_rs.movenext
loop
end if
ob_rs.close%>
</ul>
<a href="#" style="width:100%;text-align:left;display:block;">elige destino</a>
<%Sql= "SELECT id_categoria, titulo_esp, url_esp, orden FROM categorias WHERE visible='si' order by orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
c=1%>
<ul >
<%do while not ob_rs.eof%>
<li style="float:left;width:30%;"><a href="#<%=ob_rs("id_categoria")%>"><%=ob_rs("titulo_esp")%></a>
<ul>
<%Sql2= "SELECT id_destino, url_esp, titulo_esp, orden FROM destinos WHERE visible='si' order by orden" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<%Sql3= "SELECT rel.id_destino, rel.id_categoria FROM rel where rel.id_destino="&ob_rs2("id_destino")&" and rel.id_categoria="&ob_rs("id_categoria")&" and rel.id_item<>0 group by rel.id_destino, rel.id_categoria" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<li><h3><a href="<%=r%><%=ob_rs("url_esp")%>/<%=ob_rs2("url_esp")%>"><%=ob_rs2("titulo_esp")%></a></h3>
<ul>
<%Sql4= "SELECT rel.id_destino, rel.id_ciudad, ciudades.id_ciudad, ciudades.url_esp, ciudades.titulo_esp FROM rel, ciudades WHERE rel.id_destino="&ob_rs3("id_destino")&" and rel.id_ciudad<>0 and rel.id_item<>0 and  rel.id_ciudad=ciudades.id_ciudad and rel.id_categoria="&ob_rs("id_categoria")&" group by  rel.id_destino,rel.id_ciudad,  ciudades.id_ciudad, ciudades.url_esp, ciudades.titulo_esp"
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof%>
<li><a href="<%=r%>lst/<%=ob_rs("url_esp")%>/<%=ob_rs2("url_esp")%>/<%=ob_rs4("url_esp")%>"><%=ob_rs4("titulo_esp")%></a></li>
<%ob_rs4.movenext
loop
end if
ob_rs4.close%>
</ul>
</li>
<%ob_rs3.movenext
loop
end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close%>
</ul>
</li>
</ul>
<%ob_rs.movenext
c=c+1
loop%>
</ul>
<%end if
ob_rs.close
Sql= "SELECT menu, posicion, id_general, id_categoria FROM menus WHERE menu = 4  or menu=3 order by posicion" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%><ul style="width:100%;float:left"><%do while not ob_rs.eof
if ob_rs("id_categoria")<>0 then
Sql2= "SELECT id_categoria, titulo_esp, url_esp, visible FROM categorias WHERE id_categoria = "&ob_rs("id_categoria")&" and visible='si' " 
else
Sql2= "SELECT id_general, titulo_esp, url_esp, visible, tipo FROM generales WHERE id_general = "&ob_rs("id_general")&"  and visible='si' " 
end if
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
if ob_rs("id_categoria")=0 then tipo=ob_rs2("tipo") end if%>
<li><a href="<%=r%><%=ob_rs2("url_esp")%>"><%=ob_rs2("titulo_esp")%></a></li>
<%end if
ob_rs2.close
ob_rs.movenext
loop%>
</ul>
<%end if
ob_rs.close
end if%>
</div></div></div></div>
<%if pr_team="si" then 'EQUIPO //////////////////////////////////%>
<!--#include file="../conex/conex_back.asp"-->
<%if id_general<>"" then
Sql= "SELECT adminsArchivos.nombre,admins.nombre, admins.apellidos, admins.mail,admins.puesto FROM admins, adminsArchivos WHERE admins.id_admin=adminsArchivos.id_admin AND adminsArchivos.nombre<>'' AND admins.pr_team='si' ORDER BY pr_team_od" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%><div class="c-content-box c-size-md" style="background:#fafafa"><div class="container"><div class="c-content-team-1-slider" data-slider="owl" data-items="3"><div class="c-content-title-1"><h3 class="c-center c-font-uppercase c-font-bold">Nuestro equipo</h3><div class="c-line-center c-theme-bg"></div></div>
<div class="row"><%do while not ob_rs.eof
Set fso = CreateObject("Scripting.FileSystemObject")
if fso.FileExists (Server.MapPath(rd&"up_docs/admins/" & ob_rs("adminsArchivos.nombre"))) then
imagen_team= r&"up_docs/admins/"&ob_rs("adminsArchivos.nombre")
else
imagen_team=r&"web/lib/img/no-imagen.gif"
end if%>
<div class="col-md-4 col-sm-6 c-margin-b-30"><div class="c-content-person-1 c-option-2"><div class="c-caption c-content-overlay"><div class="c-overlay-wrapper">
<div class="c-overlay-content"><a href="<%=r%>up_docs/admins/<%=ob_rs("adminsArchivos.nombre")%>" data-lightbox="fancybox" data-fancybox-group="gallery-4"><i class="icon-magnifier"></i></a></div>
</div><img class="c-overlay-object " src="<%=imagen_team%>" style="height:350px" alt="<%=ob_rs("admins.nombre")%>&nbsp;<%=ob_rs("apellidos")%>"> </div><div class="c-body" style="min-height:150px">
<div class="c-head"><div class="c-name c-font-uppercase c-font-bold"><%=ob_rs("admins.nombre")%>&nbsp;<%=ob_rs("apellidos")%></div>
<%if ob_rs("mail")<>""then%><ul class="c-socials c-theme-ul-ul"><li><a href="mailto:<%=ob_rs("mail")%>" class="socicon-mail tooltips" data-original-title="Mail"></a></li></ul><%end if%>
</div><div class="c-position"><%=ob_rs("puesto")%> </div></div></div></div>
<%ob_rs.movenext
imagen_team=""
loop%></div></div></div></div>
<%end if
end if
ob_rs.close%>  
<%end if%>
<%Sql= "SELECT rel.id_archivo, rel.id_general, archivos.orden, archivos.alt, archivos.nombre, archivos.campo FROM rel, archivos  WHERE rel.id_general="&id_general&" and rel.id_archivo<>0 and rel.id_archivo=archivos.id_archivo and archivos.campo<>'archivo_2' order by archivos.orden" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="c-content-box c-size-md c-bg-grey-1"><div class="container"><div class="c-content-team-1-slider" data-slider="owl" data-items="3"><div class="c-content-title-1"><h3 class="c-center c-font-uppercase c-font-bold">Imágenes Relacionadas</h3><div class="c-line-center c-theme-bg"></div></div>
<div class="row"><div class="cbp-panel"><div id="grid-container" class="cbp cbp-l-grid-masonry-projects">
<%do while not ob_rs.eof%>
<div class="cbp-item graphic"><div class="cbp-caption"><div class="cbp-caption-defaultWrap">
<%if ob_rs("campo")="archivo_19" or ob_rs("campo")="archivo_20" or ob_rs("campo")="archivo_17" or ob_rs("campo")="archivo_18" then
txt_ver="ver vídeo"%>
<img src="<%=r%>web/lib/img/ver_video.jpg"> 
<%else
txt_ver="ver imagen"%>
<img src="<%=ob_rs("nombre")%>" alt="<%=ob_rs("alt")%>"> 
<%end if%>
</div>
<div class="cbp-caption-activeWrap"><div class="c-masonry-border"></div><div class="cbp-l-caption-alignCenter">
<div class="cbp-l-caption-body"><a href="<%=ob_rs("nombre")%>" class="cbp-lightbox cbp-l-caption-buttonRight btn c-btn-square c-btn-border-1x c-btn-white c-btn-bold c-btn-uppercase" data-title="<%=ob_rs("alt")%>"><%=txt_ver%></a></div></div></div></div><div class="caption_imagen"><%=ob_rs("alt")%></div></div>
<%ob_rs.movenext
loop%></div></div></div></div></div></div>
<%end if
ob_rs.close
end if 'FIN GENERALES ////////////////////////////////////
if tipo="ct" then 'CONTACTO ////////////////////////////////////
tipo_pag="ct"
if texto_esp<>""then%><div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="c-content-feedback-1 c-option-1"><div class="row"><div class="col-md-6"><div class="c-container c-bg-green c-bg-img-bottom-right" style="background-image:url('<%=r%>web/lib/img/feedback_box_1.png')"><div class="c-content-title-1 c-inverse"><h3 class="c-font-uppercase c-font-bold"><%if titulo_esp="Reuni&oacute;n"then%>¿Quieres asistir a la reunión?<%else%>¿Quieres saber más?<%end if%></h3><div class="c-line-left"></div><p class="c-font-lowercase"><%=texto_esp%></p></div></div><%end if%>
<div class="c-container c-bg-grey-1 c-bg-img-bottom-right" style="background-image:url('<%=r%>web/lib/img/feedback_box_2.png')">
<div class="c-content-title-1"><h3 class=" c-font-bold">¿Quieres saberlo todo?</h3><div class="c-line-left"></div><div id="mc_embed_signup"><form  action="https://getupidiomas.us19.list-manage.com/subscribe?u=bf34b4cddaef6715a27ff1427&id=092b01e5de" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate><div id="mc_embed_signup_scroll" class="nl_full"><div class="nl_"><div class="form-group"><input type="email" value="" name="EMAIL" class="email form-control c-square c-theme input-lg" id="mce-EMAIL" placeholder="email" required></div></div><div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_be3341363ba98f7e9b56d51e1_708aac5ddf" tabindex="-1" value=""></div><div class="nl_"><button type="submit" value="Suscribirme a Newsletter" name="subscribe" id="mc-embedded-subscribe" class="button btn c-theme-btn c-btn-uppercase btn-lg c-btn-bold c-btn-square">Suscribirme a Newsletter<i class="fa fa-envelope" style="margin-left:8px"></i></button></div></div></form></div></div></div></div>
<div class="col-md-6"><div class="c-contact"><div class="c-content-title-1"><h3 class="c-font-uppercase c-font-bold"><%=titulo_esp%></h3><div class="c-line-left"></div><p class="c-font-lowercase"><%=texto_esp2%></p></div>
<form action="contacto-envio" method="post" id="envio" name="envio"><div class="form-group"><%if titulo_esp="Reuni&oacute;n"then%><input type="hidden" name="rn" id="rn" value="si"><%end if%><input type="text" placeholder="Nombre*" class="form-control c-square c-theme input-lg" name="nombre" id="nombre"></div>
<div class="form-group"><input type="text" placeholder="apellidos*" class="form-control c-square c-theme input-lg" name="apellidos" id="apellidos"></div>
<div class="form-group"><input type="text" placeholder="eMail*" class="form-control c-square c-theme input-lg" name="email" id="email"></div><div class="form-group"><input type="text" placeholder="Teléfono de contacto" class="form-control c-square c-theme input-lg" id="telefono" name="telefono"></div><div class="form-group"><textarea rows="8" name="comentario" placeholder="<%if titulo_esp="Reuni&oacute;n"then%>Por favor indica número de asistentes. <%end if%>Dudas, comentarios,..." class="form-control c-theme c-square input-lg" id="comentario"></textarea></div>
<div class="c-checkbox" style="margin-bottom:25px"><input type="checkbox" class="c-check" name="acepto" id="acepto" autocomplete="off"><label for="acepto" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, he leído y acepto <a href="javascript:tratamiento_datos();" class="check_a">la cláusula informativa y autorización al tratamiento de los datos</a></label><div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_td=ob_rs("texto_esp")
titulo_td=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i> <span><%=titulo_td%></span></h4></div><div class="modal-body"><p><span><%=texto_td%></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div></div>
<div class="c-checkbox" style="margin-bottom:25px"><input type="checkbox" class="c-check" name="n_letter" id="n_letter" autocomplete="off" value="si"><label for="n_letter" class="check_txt" autocomplete="off" value="si"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, quiero formar parte de la base de datos de Cursit Idiomas para recibir Newswletters promocionales</label></div>
<div class="form-group"><label for="captchacode">c&oacute;digo seguro</label><img src="<%=r%>web/comun/captcha/captcha.asp" name="imgCaptcha" id="imgCaptcha"  style="margin-left:8px;"><a href="javascript:void(0)" onClick="RefreshImage('imgCaptcha')"><i class="fa fa-refresh" aria-hidden="true" style="margin-left:8px;margin-right:8px"></i></a><label for="captchacode">&nbsp;</label><input name="captchacode" type="text" id="captchacode" size="18" class="caja_contacto_contact"></div>
<button type="button" class="btn c-theme-btn c-btn-uppercase btn-lg c-btn-bold c-btn-square" id="envia_form">Enviar formulario</button>
</form></div></div></div></div></div></div>
<div class="c-content-box c-size-md c-bg-img-top c-no-padding c-pos-relative" style="margin-bottom:65px"><div class="container"><div class="c-content-contact-1 c-opt-1"><div class="row" data-auto-height=".c-height"><div class="col-sm-8 c-desktop"></div><div class="col-sm-4"><div class="c-body"><div class="c-section"><h3><%=titulo_esp_web%></h3></div>
<div class="c-section"><div class="c-content-label c-font-uppercase c-font-bold c-theme-bg">Dirección</div>
<p><%=direccion%>
<br/><%=cod_postal%>
<br/><%=ciudad%> (<%=provincia%>), España</p>
</div>
<div class="c-section">
<div class="c-content-label c-font-uppercase c-font-bold c-theme-bg">Contacts</div>
<p>
<strong>T</strong> <%=telefono%><%if datos_complementarios<>"" then%><br/><strong>F</strong> <%=datos_complementarios%><%end if%></p>
</div>
<div class="c-section">
<div class="c-content-label c-font-uppercase c-font-bold c-theme-bg">Social</div>
<br/>
<ul class="c-content-iconlist-1 c-theme">
<%if rd_facebook<>""then%><li><a href="<%=rd_facebook%>"><i class="icon-social-facebook"></i></a></li><%end if%>
<%if rd_twitter<>""then%><li><a href="<%=rd_twitter%>"><i class="icon-social-twitter"></i></a></li><%end if%>
<%if rd_youtube<>""then%><li><a href="<%=rd_youtube%>"><i class="icon-social-youtube"></i></a></li><%end if%>
<%if rd_pinterest<>""then%><li><a href="<%=rd_pinterest%>"><i class="fa fa-pinterest"></i></a></li><%end if%>
<%if rd_blog<>""then%><li><a href="<%=rd_blog%>"><i class="fa fa-wordpress"></i></a></li><%end if%>
<%if rd_linkedin<>""then%><li><a href="<%=rd_linkedin%>"><i class="fa fa-linkedin"></i></a></li><%end if%>
<%if rd_instagram<>""then%><li><a href="<%=rd_instagram%>"><i class="fa fa-instagram"></i></a></li><%end if%>
<%if rd_tumblr<>""then%><li><a href="<%=rd_tumblr%>"><i class="fa fa-tumblr"></i></a></li><%end if%>
<%if rd_flickr<>""then%><li><a href="<%=rd_flickr%>"><i class="fa fa-flickr"></i></a></li><%end if%>
<%if rd_reddit<>""then%><li><a href="<%=rd_reddit%>"><i class="fa fa-reddit"></i></a></li><%end if%>
<%if rd_google_plus<>""then%><li><a href="<%=rd_google_plus%>"><i class="fa fa-google-plus"></i></a></li><%end if%>
</ul></div></div></div></div></div></div>
<div id="gmapbg" class="c-content-contact-1-gmap" style="height: 615px;"></div></div>
<%end if 'FIN CONTACTO ////////////////////////////////////
If tipo="nt" then'NOTICIAS
pag = request.QueryString("pag")
topeLados = 5
if pag = "" then pag=1'Const adCmdText = &H0001'Const adOpenStatic = 3%>
<div class="c-content-box c-size-md"><div class="container"><div class="row"><div class="col-md-12"><div class="c-content-blog-post-card-1-grid"><div class="row">
<%Sql= "SELECT titulo_esp, url_esp, texto_esp, id_noticia, fecha_in FROM noticias ORDER BY fecha_in desc" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
ob_rs.PageSize = 6
ob_rs.AbsolutePage = pag
NumPag = ob_rs.PageCount
i=1
While (not ob_rs.eof and i < ob_rs.PageSize )
id_noticia=ob_rs("id_noticia")
Sql2= "SELECT nombre FROM rel, archivos WHERE id_noticia="&id_noticia&" and rel.id_archivo= archivos.id_archivo and campo='archivo_1' and tipo='img'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
img_nom=ob_rs2("nombre")
else
img_nom=r&"web/lib/img/logos/no-foto.gif"
end if
ob_rs2.close
'if i=0 then%>
<div class="col-md-6">
<%'end if%>
<div class="c-content-blog-post-card-1 c-option-2 c-bordered">
<div class="c-media c-content-overlay" style="text-align:center">
<div class="c-overlay-wrapper"><div class="c-overlay-content"><a href="<%=r%><%=ob_rs("url_esp")%>" title=""><i class="icon-link"></i></a></div></div>
<img class="c-overlay-object img-responsive" src="<%=img_nom%>" alt="" style="margin:0 auto;"> </div>
<div class="c-body">
<div class="c-title c-font-bold c-font-uppercase"><a href="<%=r%><%=ob_rs("url_esp")%>"><%=ob_rs("titulo_esp")%></a></div>
<div class="c-author"><a href="http://www.cursit.com/"><span class="c-font-uppercase">Cursit Idiomas</span></a> 
<span class="c-font-uppercase"><%if ob_rs("fecha_in")<>""then%><%=day(ob_rs("fecha_in"))%>&nbsp;<%=left(MonthName(month(ob_rs("fecha_in"))),3)%>&nbsp;<%=year(ob_rs("fecha_in"))%><%end if%></span>
</div>
<%=replace(ob_rs("texto_esp"),"http://www.getupdiomas","http://www.cursit")%></div></div>
<!--<%'if i=2 then%></div><div class="col-md-6"><%'end if%><%'if i=5 then%></div><%'end if%>-->
</div>
<%if i=2 then
i=0%><div class="col-md-12"></div><%end if%>
<%i = i + 1
ob_rs.movenext
wend
else%>
<div class="alert alert-danger alert-dismissible margin-120" role="alert" > Actualmente no hay noticias.</div>
<%end if
ob_rs.close
dim inicio,flechaAnt,flechaPos           'PAGINACION
if pag="ult" then pag=NumPag
if cint(pag)>cint(topeLados+1) then flechaAnt=pag-cint(topeLados+1) else flechaAnt=0
if cint(pag) < cint(NumPag+topeLados+1) then flechaPos=cint(pag+topeLados+1) else flechaPos=0
if cint(pag)>cint(topeLados+1) then inicio=pag-topeLados else inicio=1
if cint(pag+topeLados)< cint(NumPag) then fin=pag+topeLados else fin=NumPag
if cint(flechaAnt)=0 then fin=cint(topeLados*2+1)
if cint(fin)>cint(NumPag) then fin=NumPag
if NumPag>1 then%> 
<div class="c-pagination" style="padding-bottom:90px">    
<ul class="c-content-pagination c-theme pull-right">P&aacute;ginas::         
<%if (pag>topePag) and flechaAnt>0 then %>
<li class="c-prev"><a href="<%=r%><%=url_general%>/<%=flechaAnt%>" title="Página anterior de Cursit Idiomas · Listado de Noticias"><i class="fa fa-angle-left"></i></a></li>
<%end if
For i=inicio to fin
if i = cint(pag) then%>
<li class="c-active">
<a href="<%=r%><%=url_general%>/<%=i%>" title="Página <%=i%> de Cursit Idiomas · Listado de Noticias"><%=i%></a></li>
<%else%>
<li>
<a href="<%=r%><%=url_general%>/<%=i%>" title="Página <%=i%> de Cursit Idiomas · Listado de Noticias"><%=i%></a>
</li>
<%end if
Next
if cint(flechaPos)>0 and cint(pag+topeLados)<cint(NumPag) then%>
<li class="c-next"><a href="<%=r%><%=url_general%>/<%=flechaPos%>"><i class="fa fa-angle-right"></i></a></li>
<%end if%>
</ul>
</div>
<%end if'FIN PAGINACION%> 
</div></div></div></div></div>
<%end if ' CASO NOTICIAS%>
<!--#include file="comun/menu_inf.asp"-->
<%if tipo_pag="ct" then 'CONTACTO OTRA VEZ MAPA%>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="spinner_back_usu" style="display:none"><div id="spinner" class="spinner_usu" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Enviando datos...</div></div>
<style>.spinner_usu {position: fixed; top: 25%; left: 50%;margin-left: -125px;margin-top: -50px;text-align:center;z-index:1234;overflow: hidden;width: 350px;height: 220px;background:#fff;padding-top:25px;color:#32C5D2;font-weight:bold;-webkit-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.75);-moz-box-shadow:0px 0px 8px 0px rgba(50, 50, 50, 0.75);box-shadow:0px 0px 8px 0px rgba(50, 50, 50,0.75);}#spinner_back_usu{position: fixed; background:rgba(0,0,0,0.5);position: fixed; top: 0; left: 0;width:100%;height:100%;overflow: hidden;text-align:center;z-index:111111111;}</style>
<script src="//maps.google.com/maps/api/js?key=AIzaSyD-h8bR3fvRJbxUSjcdkBCy3jV_cTD0iLI&sensor=true" type="text/javascript"></script><script src="web/lib/app/gmaps/gmaps.js" type="text/javascript"></script><script>var PageContact=function(){var n=function(){var n=new GMaps({div:"#gmapbg",lat:39.481400,lng:-0.356017,scrollwheel:!1});n.addMarker({lat:39.481400,lng:-0.356017,title:"Localización",infoWindow:{content:"<h3>Cursit Idiomas</h3><p>C/ Daniel Balaciart, 6, Entlo E · 46020 · Valencia</p>"}})};return{init:function(){n()}}}();$(document).ready(function(){PageContact.init()});
function tratamiento_datos(){$('#tratamiento_datos').modal('show');}
function RefreshImage(valImageId) {
var objImage = document.images[valImageId];
if (objImage == undefined) {return;}var now = new Date();
objImage.src = objImage.src.split('?')[0] + '?x=' + now.toUTCString();}
$(document).ready(function(){$("#envia_form").click(function() {
$.getJSON("<%=r%>web/comun/captcha/captcha.asp?validateCaptchaCode=" +  $("#captchacode").val() + "&format=json&jsoncallback=?", function(data){
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
</script>
<%end if%>