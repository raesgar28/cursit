<!--#include file="comun/menu_sup.asp"-->
<!--#include file="comun/z_check_user.asp"-->
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<%if session("id_usuario")<>"" then
Sql= "SELECT u_telefono,u_email,u_movil,u_direccion,u_ciudad, u_provincia, u_pais,u_empresa from usuarios where id_usuario= "&session("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
u_telefono=ob_rs("u_telefono")
u_movil=ob_rs("u_movil")
u_direccion=ob_rs("u_direccion")
u_ciudad=ob_rs("u_ciudad")
u_provincia=ob_rs("u_provincia")
u_pais=ob_rs("u_pais")
u_empresa=ob_rs("u_empresa")
end if
ob_rs.close
else
response.redirect(r&"zona-privada")
end if%>
<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both"><div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-sbold"><%=titulo_esp_web%></h3><h4 class=""><%=titulo_esp_div%></h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li>
<a href="<%=r%>zona-privada">Zona usuario</a></li><li>/</li><li class="c-state_active">Pre-inscripciones</li></ul></div></div>
<div class="container reserva_check">
<!--#include file="comun/z_menu.asp"-->
<div class="c-layout-sidebar-content ">
<div class="c-content-title-1">
<h3 class="">Pre-inscripciones</h3>
<div class="c-line-left"></div>
<%Sql= "SELECT id_programa FROM programas_tmp, alumnos_tmp WHERE (programas_tmp.id_usuario= "&session("id_usuario")&" or programas_tmp.id_agente_cod= "&session("id_usuario")&" ) AND programas_tmp.id_alumno=alumnos_tmp.id_alumno"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ok_tmp="si"
end if
ob_rs.close
Sql= "SELECT id_programa FROM programas, alumnos WHERE(programas.id_usuario= "&session("id_usuario")&" or programas.id_agente_cod= "&session("id_usuario")&") AND programas.id_alumno=alumnos.id_alumno"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ok_def="si"
end if
ob_rs.close

if ok_tmp="si" or ok_def="si" then%>
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:10px"></i>Alumnos Pre-inscritos <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:25px;margin-right:7px;"></i><i class="fa fa-user" aria-hidden="true"></i> <%=session("us_nombre")%> <%=session("us_apellidos")%></h3>
</div>
<div class="panel-body"> Listado de alumnos Pre-inscritos con este usuario. <br />Situa el cursor sobre los iconos incluidos en la columna "Formalizar" (si los hubiera) para ver el estado de la preinscripción</div>
</div>
<%Sql= "SELECT a_nombre, a_apellidos, programas_tmp.id_alumno, id_item, f_inicio, id_programa, estadoPago, metodoPago, cod_descuento FROM programas_tmp, alumnos_tmp WHERE (programas_tmp.id_usuario= "&session("id_usuario")&" or programas_tmp.id_agente_cod= "&session("id_usuario")&") AND programas_tmp.id_alumno=alumnos_tmp.id_alumno GROUP BY programas_tmp.id_alumno, a_nombre, a_apellidos, id_item, f_inicio, id_programa, estadoPago, metodoPago, cod_descuento ORDER BY a_apellidos, id_programa DESC"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="conten_tabla">
<table class="table">
<thead>
<tr>
<th style="width:25px;">#</th>
<th style="width:250px;">Nombre</th>
<th style="width:210px;">Preinscrito en</th>
<th style="text-align:center;width:100px">Año</th>
<th style="text-align:center;width:100px">Presupuesto</th>
<th style="text-align:center;width:50px">Formalizar</th>
<th style="text-align:center;width:50px">Eliminar</th>
</tr>
</thead>
<tbody>
<%i=1
do while not ob_rs.eof%>
<form id="f_reserva<%=i%>" name="f_reserva<%=i%>">
<tr id="tr<%=i%>">
<th scope="row"><%=i%></th>
<td><%=ob_rs("a_apellidos")%>, &nbsp;<%=ob_rs("a_nombre")%></td>
<td><%if ob_rs("id_item")<>0 and ob_rs("id_item")<>"" then
Sql2= "SELECT titulo_esp FROM items WHERE id_item = "&ob_rs("id_item")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%><%=ob_rs2("titulo_esp")%><%else%>--<%end if%><%ob_rs2.close%><%end if%> <%if ob_rs("cod_descuento")<>"" then%><i class="fa fa-tag inp_n" data-toggle="tooltip" data-placement="top" title="Descuento aplicado" style="margin-left:5px;color:#999"></i><%end if%></td>
<td style="text-align:center;"><%if year(ob_rs("f_inicio"))<>1111 and year(ob_rs("f_inicio"))<>1000 and year(ob_rs("f_inicio"))<>2003 then%><%=year(ob_rs("f_inicio"))%><%end if%></td>
<td style="text-align:center;"><a href="#/" onClick="javascript:a_pdf_presupuesto(<%=ob_rs("id_programa")%>);"><span class="fa fa-download" aria-hidden="true"></span></a></td>
<td style="text-align:center">
  <%if ob_rs("estadoPago")<>""then
if ob_rs("estadoPago")="Pendiente Transferencia" then%>
  <a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%> Formalizar por otro medio"><i class="fa fa-exchange" aria-hidden="true" style="color:#ccc;cursor:pointer"></i><i class="fa fa-money" aria-hidden="true" style="margin-left:7px;"></i></a>
  <%end if
if ob_rs("estadoPago")="Pendiente Pago Oficina" then%>
  <i class="fa fa-money inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
  <%end if
if ob_rs("estadoPago")="Aceptada" and ob_rs("metodoPago")="pag_tarjeta" then%>
  <i class="fa fa-credit-card inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
  <%end if
if ob_rs("estadoPago")="Aceptada" and ob_rs("metodoPago")="pag_paypal" then%>
  <i class="fa fa-cc-paypal inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
  <%end if
if ob_rs("estadoPago")="Pendiente" and ob_rs("metodoPago")="pag_paypal" then%>
  <a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar (pago PayPal)"><i class="fa fa-cc-paypal inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer;margin-right:4px"></i><i class="fa fa-money" aria-hidden="true"></i></a>
  <%end if
if ob_rs("estadoPago")="Pendiente" and ob_rs("metodoPago")="pag_tarjeta" then%>
  <a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar (pago tarjeta)"><i class="fa fa-credit-card inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer;margin-right:4px"></i><i class="fa fa-money" aria-hidden="true"></i></a>
  <%end if
if ob_rs("estadoPago")="Pendiente de formalizar" then%>
  <a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar (pago tarjeta)"><i class="fa fa-money" aria-hidden="true"></i></a>
  <%end if
if ob_rs("estadoPago")="Aceptada" then%>
  <i class="fa fa-check inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
  <%end if
if ob_rs("estadoPago")="Denegada" then%>
  <a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%> <br> Volver a formalizar" > <%if ob_rs("metodoPago")="pag_tarjeta" then%><i class="fa fa-credit-card" aria-hidden="true" style="color:#ccc;cursor:pointer"></i><%end if%><%if ob_rs("metodoPago")="pag_paypal" then%><i class="fa fa-cc-paypal" aria-hidden="true" style="color:#ccc;cursor:pointer"></i><%end if%>  <i class="fa fa-times" aria-hidden="true" style="color:#F00"></i></a>
  <%end if
else%>
  <a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar"><i class="fa fa-clock-o" aria-hidden="true" style="color:#ccc;margin-right:6px"></i><i class="fa fa-money" aria-hidden="true"></i></a>
  <%end if%>
</td>
<td style="text-align:center"><a href="#/" onClick="javascript:a_eliminar_alumno_reg<%=i%>(<%=ob_rs("id_alumno")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
</tr>
<div id="eliminar_alumno<%=i%>" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar eliminación de alumno</span></h4>
</div>
<div class="modal-body"><p><span>¿Seguro que quieres eliminar este alumno de Preinscripciones?</span></p></div>
<div class="modal-footer"><input name="id_alumnor_e" id="id_alumnor_e" type="hidden" value="">
<button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="confirmar_eliminar<%=i%>();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div>
</div>
</div>
</div>
</form>
<script>
function a_eliminar_alumno_reg<%=i%>(id_alumno){
$('#eliminar_alumno<%=i%>').modal('show');
$("#eliminar_alumno<%=i%> #id_alumnor_e").val( id_alumno );
$("#inscribir_observaciones #id_alumnor").val('');
$("#formalizar_alumno #id_alumnor_f").val('');}
function confirmar_eliminar<%=i%>(id_alumno){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_alu_reg_eli.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva<%=i%>").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$("#tr<%=i%>").remove();
}
});
return false;}
</script>
<%ob_rs.movenext
i=i+1
loop%>
</tbody>
</table>
</div>
<%end if
ob_rs.close
else%>
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:10px"></i>Alumnnos registrados <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:25px;margin-right:7px;"></i><i class="fa fa-user" aria-hidden="true"></i> <%=session("us_nombre")%>&nbsp;<%=session("us_apellidos")%></h3>
</div>
<div class="panel-body"> Actualmente no hay ningún alumno dado de alta bajo este usuario.  </div>
</div>
<%end if%>
</div>
</div>
</div>
<div id="formalizar_alumno" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Formalizar reserva</span></h4>
</div>
<div class="modal-body"><p><span>¿Seguro que quieres formalizar la reserva del alumno?</span></p></div>
<div class="modal-footer"><input name="id_alumnor_f" id="id_alumnor_f" type="hidden" value=""><input name="id_programa_f" id="id_programa_f" type="hidden" value=""><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="confirmar_formalizar();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div>
</div>
</div>
</div>



<div id="spinner_back_usu" ><div id="spinner" class="spinner_usu" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Comprobando datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<script>


$(document).ready(function(e) {
$(".inp_n").tooltip({html:true});
$('#spinner_back_usu').hide();})


function a_formalizar_alumno_reg(id_alumno, id_programa){
$('#formalizar_alumno').modal('show');
$("#formalizar_alumno #id_alumnor_f").val( id_alumno );
$("#formalizar_alumno #id_programa_f").val( id_programa );
$("#inscribir_observaciones #id_alumnor").val('');
$("#eliminar_alumno #id_alumnor_e").val('');}

function a_pdf_presupuesto(programa){window.location.href = "web/pr_pdf_preins.asp?id_programa="+programa;}

function confirmar_formalizar(){
$('#spinner_back_usu').fadeIn(100, function(){});
programa=$("#formalizar_alumno #id_programa_f").val();
alumno=$("#formalizar_alumno #id_alumnor_f").val();
$('#spinner_back_usu').fadeIn(100, function(){setTimeout(function(){ window.location.href = "<%=r%>formalizar-reserva/"+programa+"/"+alumno+""; }, 230);});}



</script>