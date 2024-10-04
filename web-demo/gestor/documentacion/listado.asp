<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<div class="breadcrumbs">
<h1>Documentación | Categorías Documentación</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><a href="#">Listado Categorías</a></li>
</ol>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit portlet-datatable bordered">
<div class="portlet-title">
<div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | Categorías Registradas</span></div>
<div class="actions" >
<div class="btn-group alto-37" >
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn sbold red">Añadir nueva&nbsp;<i class="fa fa-plus"></i></a>
</div>
<div class="btn-group alto-37"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;Acciones</a>
<ul class="dropdown-menu pull-right">
<li><a href="javascript:disponibleTodas();" ><i class="fa fa-check" aria-hidden="true"></i> Activa</a></li>
<li><a href="javascript:disponibleNoTodas();" ><i class="fa fa-times" aria-hidden="true"></i> No activa</a></li>
<li class="divider"></li><li><a href="javascript:eliminarTodas();" ><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li></ul></div></div></div>
<div class="portlet-body"><%if ms="ok_del"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros eliminados con éxito! </div><%end if%><%if ms="ok_dis"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Disponibilidad modificada con éxito! </div><%end if%><div class="table-container"><form name="formulario" action="acciones.asp" method="post" >
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="accion" type="hidden" value="" autocomplete="off"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off">
<%Sql= "SELECT id_catDocumentacion, titulo_esp, disponible, texto_esp, fecha_in from catDocumentacion"   
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<table class="table table-striped table-bordered table-hover sample_1" id="listado" style="border:none" >
<thead><tr>
<th class="no_exp">
<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
<input type="checkbox" class="group-checkable" onClick="checkUncheckAll(this);if (this.checked) marca_sup(1); else marca_sup('-1');" autocomplete="off" name="checkall" id="checkall"><span></span>
</label>
</th>
<th> Nombre categoría</th>
<th>Asociación</th>
<th> Activa </th>
<th> Fecha Registro </th>
<th class="txt_centro"> acc. </th></tr></thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_catDocumentacion")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check"  autocomplete="off"><span></span></label></td>
<td> <%=ob_rs("titulo_esp")%> </td>
<td>
<%Sql2= "SELECT id_categoria from catDocumentacion_rel WHERE id_catDocumentacion="&ob_rs("id_catDocumentacion")&""   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT titulo_esp from categorias WHERE id_categoria="&ob_rs2("id_categoria")&""   
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("titulo_Esp")%>, 
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_seccion from catDocumentacion_rel WHERE id_catDocumentacion="&ob_rs("id_catDocumentacion")&""   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT titulo_esp from secciones WHERE id_seccion="&ob_rs2("id_seccion")&""   
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("titulo_Esp")%>, 
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_seccion from catDocumentacion_rel WHERE id_catDocumentacion="&ob_rs("id_catDocumentacion")&""   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT titulo_esp from secciones WHERE id_seccion="&ob_rs2("id_seccion")&""   
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("titulo_Esp")%>, 
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_destino from catDocumentacion_rel WHERE id_catDocumentacion="&ob_rs("id_catDocumentacion")&""   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT titulo_esp from destinos WHERE id_destino="&ob_rs2("id_destino")&""   
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("titulo_Esp")%>, 
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_item from catDocumentacion_rel WHERE id_catDocumentacion="&ob_rs("id_catDocumentacion")&""   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT titulo_esp from items WHERE id_item="&ob_rs2("id_item")&""   
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("titulo_Esp")%>, 
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_usuario from catDocumentacion_rel WHERE id_catDocumentacion="&ob_rs("id_catDocumentacion")&""   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT u_nombre, u_apellidos from usuarios WHERE id_usuario="&ob_rs2("id_usuario")&""   
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("u_nombre")%>&nbsp;<%=ob_rs3("u_apellidos")%>,  
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT id_alumno from catDocumentacion_rel WHERE id_catDocumentacion="&ob_rs("id_catDocumentacion")&""   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
Sql3= "SELECT a_nombre, a_apellidos from alumnos WHERE id_alumno="&ob_rs2("id_alumno")&""   
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("a_nombre")%>&nbsp;<%=ob_rs3("a_apellidos")%>,  
<%end if
ob_rs3.close
ob_rs2.movenext
loop
end if
ob_rs2.close%>
</td>
<td><%if ob_rs("disponible")="si"then%><i class="fa fa-check f_green" aria-hidden="true"></i><span class="f_white_p">Sí</span><%else%><i class="fa fa-times f_red" aria-hidden="true"></i><span class="f_white_p">No</span><%end if%></td>
<%fecha_now=FormatDateTime(cdate(ob_rs("fecha_in")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%>
<td data-order="<%=fecha_now%>"> <%=FormatDateTime(cdate(ob_rs("fecha_in")),2)%> </td>
<td><div class="btn-group" id="col_rel">
<a class="btn btn-xs green dropdown-toggle" href="javascript:;" data-toggle="dropdown" >Acciones<i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones" >
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_catDocumentacion")))%>
<li><a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_catDocumentacion"))%>" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a></li>
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&check="&ob_rs("id_catDocumentacion")&"&accion=dis"))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&check="&ob_rs("id_catDocumentacion")&"&accion=dis")%>&" ><i class="fa fa-check" aria-hidden="true"></i> Activa</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&check="&ob_rs("id_catDocumentacion")&"&accion=dis_no"))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&check="&ob_rs("id_catDocumentacion")&"&accion=dis_no")%>&"  ><i class="fa fa-times" aria-hidden="true"></i> No activa</a></li>
<li class="divider"></li>
<li><a href="javascript:eliminarUna<%=i%>(<%=ob_rs("id_catDocumentacion")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
<li class="divider"></li>
<li><a href="javascript:eliminarDocumentos<%=i%>(<%=ob_rs("id_catDocumentacion")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar documentos anteriores <i class="fa fa-exclamation" aria-hidden="true"></i>
</a></li>
<script>function eliminarDocumentos<%=i%>(){$('#eliminaDocumentos<%=i%>').modal('show');}
function confirmarDocumento_del<%=i%>(){$('#eliminaDocumentos<%=i%>').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_catDocumentacion")%>&accion=del_doc';}</script>
</ul></div></td></tr>
<!--MODAL ELIMINAR UN SOLO REGISTRO-->
<div class="modal fade" id="eliminaDocumentos<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4>
</div><div class="modal-body" id="alerta_txt"> ¿Seguro que deseas ELIMINAR los DOCUMENTOS de años anteriores a (<%=year(date)%>) de <%=ob_rs("titulo_esp")%>? </div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarDocumento_del<%=i%>();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div></div></div></div>
<div class="modal fade" id="confirmaEliminaUna<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el registro seleccionado?</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaUna_ok<%=i%>();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function eliminarUna<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('show');}
function confirmarEliminaUna_ok<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_catDocumentacion")%>&accion=del';}
</script>
<!--FIN MODAL ELIMINAR UN SOLO REGISTRO-->
<%ob_rs.movenext
i=i+1
loop%>
</tbody>
</table>
<%else 'NO HAY NINGÚN REGISTRO%>
<div class="alert-danger sin_regstros"><i class="fa fa-check" aria-hidden="true"></i> No hay ningún registro actualmente! </div>
<%end if 'FIN BUCLE TABLA
ob_rs.close
ob_conn.close%>
</form>
</div></div></div></div></div>
<!--MODALES-->
<div class="modal fade" id="confirmaElimina" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el/los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarElimina_ok();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div></div></div></div>
<div class="modal fade" id="sinSeleccion" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No has seleccionado ningún registro</h4>
</div>
<div class="modal-body" id="alerta_txt"> Debes seleccionar al menos un registro para poder realizar alguna acción. </div>
<div class="modal-footer">
<button type="button" class="btn green btn-green" data-dismiss="modal">Ok</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="confirmaDisponible" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas hacer DISPONIBLES el o los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarDisponible_ok();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="confirmaNoDisponible" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas hacer NO DISPONIBLES el o los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarNoDisponible_ok();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="<%=r%>lib/app/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script>




$(document).ready(function() {
var initTable3 = function () {
var table = $('#listado');
var oTable = table.dataTable({
"language": {
"aria": {"sortAscending": ": activate to sort column ascending","sortDescending": ": activate to sort column descending"},
"emptyTable": "No hay registros con esos criterios",
"info": "_START_ a _END_ de _TOTAL_ registros encontrados",
"infoEmpty": "No entries found",
"infoFiltered": "(de un total de _MAX_ registros)",
"lengthMenu": "_MENU_ ",
"search": "Buscar: ",
"zeroRecords": "No se encontraron registros",
"processing": "Un momento...cargando datos..." },
processing: true,//responsive: true,
columnDefs: [ 
{orderable: false, targets:   0},
{orderable: false, targets:   5},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
{ responsivePriority: 1, targets: 1 },
{ responsivePriority: 2, targets: -1 }
],
buttons: [
{extend: 'print', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'copy', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'pdf', className: 'esconde' , exportOptions: {columns: ':visible'} },
{ extend: 'excel', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'csv', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'colvis', className: 'esconde',  columns: (':not(.no_exp)')}
],
"order": [[1, 'asc']],
"lengthMenu": [[20, 50, 75, 100, -1],[20, 50, 75, 100, "Todos"]],
"pageLength": 20,
"dom": "<'row' <'col-md-12'B>><'table-scrollable't><'row' <'col-md-12'>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", 
});
$('#acciones > li > a.tool-action').on('click', function() {var action = $(this).attr('data-action');oTable.DataTable().button(action).trigger();});
$('#columnas').on('click', function() {var action = $(this).attr('data-action');oTable.DataTable().button(action).trigger();});
}
initTable3();
});









//CHEQUEAR CHECKBOXES
<%if i<>""then%>
function marca_sup(parametro){
document.formulario.check_on_sup.value= (parseInt(document.formulario.check_on_sup.value)+parseInt(parametro));
if (document.getElementById('checkall').checked && document.formulario.check_on.value==0 )
{document.formulario.check_on.value=parseInt(document.formulario.check_on.value)+<%=i%>;}
else{
if (document.formulario.check_on.value!=0 && document.formulario.check_on_sup.value==0 ){
document.formulario.check_on.value=0;
}}
}
<%end if%>
function marca(parametro){document.formulario.check_on.value= (parseInt(document.formulario.check_on.value)+parseInt(parametro));}
function eliminarTodas(){
if (document.formulario.check_on.value>0 ) {
if (confirm("Seguro que quieres eliminar los registros?")){document.formulario.submit();}
}else{alert("No has seleccionado ningún registro.");}
}
function checkUncheckAll(theElement){
var theForm = theElement.form, z = 0;
for(z=0; z<theForm.length;z++){
if(theForm[z].type == 'checkbox' && theForm[z].name != 'checkall'){theForm[z].checked = theElement.checked;}
}
}
function checkUncheckSome(controller,theElements) {
var formElements = theElements.split(',');
var theController = document.getElementById(controller);
for(var z=0; z<formElements.length;z++){
theItem = document.getElementById(formElements[z]);
if(theItem.type && theItem.type=='checkbox'){
theItem.checked=theController.checked;
} else {
theInputs = theItem.getElementsByTagName('input');
for(var y=0; y<theInputs.length; y++){
if(theInputs[y].type == 'checkbox' && theInputs[y].id != theController.id){
theInputs[y].checked = theController.checked;
}
}
}
}
}
function eliminarTodas(){          //////////////////////////////////  ACCIONES ELIMINAR / VISIBLE / DESTACADO /....
if (document.formulario.check_on.value>0 ) {
$('#confirmaElimina').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarElimina_ok(){
	document.formulario.accion.value="del";
	$('#confirmaElimina').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}                               ////////////////////////////////// FIN  ACCIONES ELIMINAR / VISIBLE / DESTACADO /....
setTimeout(function(){ $('.alert').fadeOut("slow")}, 2000);//RESPUESTA DE ACCIONES
</script>