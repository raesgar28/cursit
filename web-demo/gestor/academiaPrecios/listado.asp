<!--#include file="../comun/menu_sup.asp"--> 
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<div class="breadcrumbs">
<h1>Precios | Gestión Precios</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><a href="#">Listado Precios</a></li>
</ol>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit portlet-datatable bordered">
<div class="portlet-title">
<div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | Precios Registrados</span></div>
<div class="actions" >
<div class="btn-group alto-37" >
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn sbold red">Añadir nuevo&nbsp;<i class="fa fa-plus"></i></a>
</div>
<div class="btn-group alto-37"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;Acciones <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right">
<li><a href="javascript:eliminarTodas();" ><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
</ul>
</div>
</div>
</div>
<div class="portlet-body">
<%if ms="ok_del"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros eliminados con éxito! </div><%end if%>
<%if ms="ok_vis"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Visibilidad modificada con éxito! </div><%end if%>
<div class="table-container">
<form name="formulario" action="acciones.asp" method="post" >
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="accion" type="hidden" value="" autocomplete="off"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off">
<%Sql= "SELECT * from academia_precios order by anyo desc"   
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<table class="table table-striped table-bordered table-hover sample_1" id="listado" style="border:none" >
<thead>
<tr>
<th class="no_exp">
<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
<input type="checkbox" class="group-checkable" onClick="checkUncheckAll(this);if (this.checked) marca_sup(1); else marca_sup('-1');" autocomplete="off" name="checkall" id="checkall"><span></span>
</label>
</th>
<th> Temporada</th>
<th class="txt_centro"> acc. </th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_precio")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check"  autocomplete="off"><span></span></label></td>
<td><%=ob_rs("anyo")%></td>
<td>
  <div class="btn-group" id="col_rel">
  <a class="btn btn-xs green dropdown-toggle" href="javascript:;" data-toggle="dropdown" >Acciones<i class="fa fa-angle-down"></i></a>
  <ul class="dropdown-menu pull-right" id="acciones" >
  <%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_precio")))%>
  <li><a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_precio"))%>" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a></li>
  <li class="divider"></li>
  <li><a href="javascript:eliminarUna<%=i%>(<%=ob_rs("id_precio")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
  </ul>
  </div>
</td>
</tr>
<!--MODAL ELIMINAR UN SOLO REGISTRO-->
<div class="modal fade" id="confirmaEliminaUna<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el registro seleccionado?</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaUna_ok<%=i%>();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function eliminarUna<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('show');}
function confirmarEliminaUna_ok<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_precio")%>&accion=del';}
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
</div>
</div>
</div>
</div>
</div>
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
</div>
</div>
</div>
</div>
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
{orderable: false, targets:   2},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
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
"order": [[1, 'des']],
"lengthMenu": [[20, 50, 75, 100, -1],[20, 50, 75, 100, "Todos"]],
"pageLength": 20,
"dom": "<'row' <'col-md-12'B>><'table-scrollable't><'row' <'col-md-12'>>", 
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