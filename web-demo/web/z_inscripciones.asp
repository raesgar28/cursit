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
<a href="<%=r%>zona-privada">Zona usuario</a></li><li>/</li><li class="c-state_active">Inscripciones</li></ul></div></div>
<div class="container reserva_check">
<!--#include file="comun/z_menu.asp"-->
<div class="c-layout-sidebar-content ">
<div class="c-content-title-1">
<h3 class="">Inscripciones</h3>
<div class="c-line-left"></div>
<%Sql= "SELECT id_programa FROM programas_tmp, alumnos_tmp WHERE (programas_tmp.id_usuario= "&session("id_usuario")&" or programas_tmp.id_agente_cod= "&session("id_usuario")&")  AND programas_tmp.id_alumno=alumnos_tmp.id_alumno"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ok_tmp="si"
end if
ob_rs.close
Sql= "SELECT id_programa FROM programas, alumnos WHERE (programas.id_usuario= "&session("id_usuario")&" or programas.id_agente_cod= "&session("id_usuario")&") AND programas.id_alumno=alumnos.id_alumno"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ok_def="si"
end if
ob_rs.close
if ok_tmp="si" or ok_def="si" then%>
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:10px"></i>Alumnos inscritos <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:25px;margin-right:7px;"></i><i class="fa fa-user" aria-hidden="true"></i> <%=session("us_nombre")%> <%=session("us_apellidos")%></h3>
</div>
<div class="panel-body"> Listado de alumnos inscritos con este usuario y situación actual de cada uno.</div>
</div>
<%Sql= "SELECT a_nombre, a_apellidos, programas.id_alumno, id_item, f_inicio, id_programa, falta_pagar, estadoPago,nom_item,programas.fecha_in, cod_descuento, id_item, id_categoria, id_curso, cancela, fecha_cancela FROM programas, alumnos WHERE (programas.id_usuario= "&session("id_usuario")&" or programas.id_agente_cod= "&session("id_usuario")&")  AND programas.id_alumno=alumnos.id_alumno order by a_apellidos, f_inicio DESC"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if i=""then i=1%>
<div class="conten_tabla">
<table class="table">
<thead>
<tr>
<th style="width:25px;">#</th>
<th style="width:235px;">Nombre</th>
<th style="width:250px;">Inscrito en</th>
<th style="text-align:center;width:150px">Año</th>
<th style="text-align:center;width:110px">Estado</th>
<th style="text-align:center;width:110px"></th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<th scope="row"><%=i%></th>
<td><%=ob_rs("a_apellidos")%>, <%=ob_rs("a_nombre")%>  <%if ob_rs("cancela")="si" then%>
<span style="color:#F00;cursor:pointer;float:right;margin-left:7px"><i class="fa fa-ban inp_n" data-toggle="tooltip" data-placement="top" title="Programa cancelado"></i></span>
<%end if%></td>
<td><%if ob_rs("id_item")<>0 and ob_rs("id_item")<>"" then
Sql2= "SELECT titulo_esp FROM items WHERE id_item = "&ob_rs("id_item")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%><%=ob_rs2("titulo_esp")%><%else%>--<%end if%><%ob_rs2.close%><%else%><%=ob_rs("nom_item")%><%end if%> <%if ob_rs("cod_descuento")<>"" then%><i class="fa fa-tag inp_n" data-toggle="tooltip" data-placement="top" title="Descuento aplicado" style="margin-left:5px;color:#999"></i><%end if%></td>
<td style="text-align:center;"><%if id_item<>0 and id_item<>""then%><%=year(ob_rs("f_inicio"))%><%else%><%=year(ob_rs("fecha_in"))%><%end if%></td>
<td style="text-align:center;"><span data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>" class="inp_n" style="color:#F00;cursor:pointer"><%if ob_rs("falta_pagar")<>"0"then%><%=FormatNumber(ccur(ob_rs("falta_pagar")),2)%>&nbsp;€<%end if%></span>
<%if ob_rs("id_item") =0 and ob_rs("id_curso") =0 and ob_rs("id_categoria") =0 then%> <i class="fa fa-trash inp_n" title="Programa eliminado" style="color:#ccc;cursor:pointer"><%end if%> 
</td>
<td>
<form action="inscripciones-det" method="post"><input name="id_programa" type="hidden" value="<%=ob_rs("id_programa")%>"><input name="id_alumno" type="hidden" value="<%=ob_rs("id_alumno")%>">
<button type="submit" class="btn btn-primary" style="font-size:0.9em;padding-top:3px;padding-bottom:3px;">Gestionar</button></form>
</td>
</tr>
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
<div id="eliminar_alumno" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar eliminación de alumno</span></h4>
</div>
<div class="modal-body"><p><span>¿Seguro que quieres elimi</span></p></div>
<div class="modal-footer"><input name="id_alumnor_e" id="id_alumnor_e" type="hidden" value="">
<button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="confirmar_eliminar();">Confirmar</button>
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
function a_eliminar_alumno_reg(id_alumno){
$('#eliminar_alumno').modal('show');
$("#eliminar_alumno #id_alumnor_e").val( id_alumno );
$("#inscribir_observaciones #id_alumnor").val('');
$("#formalizar_alumno #id_alumnor_f").val('');}
function confirmar_eliminar(id_alumno){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_usu_alu_reg_eli.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#alumno_new_ok').html(data);
$(document).scrollTop( $("#alumno_new_ok").offset().top-150 );  
reg_dentro2();
}
});
return false;}
function confirmar_formalizar(){
$('#spinner_back_usu').fadeIn(100, function(){});
programa=$("#formalizar_alumno #id_programa_f").val()
$('#spinner_back_usu').fadeIn(100, function(){setTimeout(function(){ window.location.href = "<%=r%>web/z_pr_metodos_pago.asp?id_programa="+programa+"&rd=../&r=../"; }, 230);});}
</script>