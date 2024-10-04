<!--#include file="../comun/menu_sup.asp"--> 

<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<div class="breadcrumbs">
<h1>Formularios | Gestión Formularios</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=mk&ndos=frm&ntres=&ncuat="))%><a href="<%=r%>formularios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=mk&ndos=frm&ntres=&ncuat=")%>">Listado Formularios</a></li>
</ol>
</div>
<div class="row"><div class="col-md-12"><div class="portlet light portlet-fit portlet-datatable bordered"><div class="portlet-title"><div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">

<%Sql= "SELECT titulo_esp from formularios where id_formulario="&cod&""   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%><%=ob_rs("titulo_esp")%><%end if
ob_rs.close%>

</span></div><div class="actions"><div class="btn-group">
<a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-share"></i>&nbsp;Exportar <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones">
<li><a href="javascript:;" data-action="0" class="tool-action"><i class="icon-printer"></i> Imprimir</a></li>
<li><a href="javascript:;" data-action="2" class="tool-action"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF</a></li>
<li><a href="javascript:;" data-action="3" class="tool-action"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel</a></li>
<li><a href="javascript:;" data-action="4" class="tool-action"><i class="fa fa-file-text-o" aria-hidden="true"></i> CSV</a></li>
</ul>
</div><div class="btn-group" style="margin-left:4px"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;Acciones <i class="fa fa-angle-down"></i></a><ul class="dropdown-menu pull-right">
<li><a href="javascript:eliminarTodas();" ><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
</ul>
</div>
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-action="5" id="columnas"><i class="fa fa-columns" aria-hidden="true"></i>&nbsp;Columnas <i class="fa fa-angle-down"></i></a></div>
</div>
</div>
<div class="portlet-body">
<%if ms="ok_del"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros eliminados con éxito! </div><%end if%>
<div class="table-container">
<form name="formulario" action="acciones.asp" method="post" >
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="accion" type="hidden" value="" autocomplete="off"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off">
<div class="row">

<table class="table table-striped table-bordered table-hover sample_1" id="listado" style="border:none" >

<%Sql= "SELECT * from formulariosCampos where id_formulario="&cod&" order by orden"   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=0%>
<thead>
<tr>
<th style="width:0%;" class="no_exp"><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
<input type="checkbox" class="group-checkable" onClick="checkUncheckAll(this);if (this.checked) marca_sup(1); else marca_sup('-1');" autocomplete="off" name="checkall" id="checkall"><span></span>
</label></th>
<%do while not ob_rs.eof%>
<th style="width:70%;"> <%=ob_rs("nombre")%></th>
<%ob_rs.movenext
i=i+1
loop%>
</tr>
</thead>
<%else
no_hay="si"
end if
ob_rs.close%>





<%Sql= "SELECT id_respuesta from formulariosRes where id_formulario="&cod&" group by id_respuesta, id_formulario"   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>

<tbody>


<%do while not ob_rs.eof %>
<tr>
  <td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_respuesta")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check"  autocomplete="off"><span></span></label></td>


<%Sql2= "SELECT res_nm,res_txt from formulariosRes where id_formulario="&cod&" and id_respuesta="&ob_rs("id_respuesta")&" "   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<td><%if ob_rs2("res_nm")<>0 then%><%=ob_rs2("res_nm")%><%else%><%=ob_rs2("res_txt")%><%end if%></td>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>


</tr>
<%ob_rs.movenext
loop%>






</tbody>
<%end if
ob_rs.close%>




</table>

<!--MODAL ELIMINAR UN SOLO REGISTRO-->

<!--FIN MODAL ELIMINAR UN SOLO REGISTRO-->

<%if no_hay="si" then%><div class="alert-danger sin_regstros"><i class="fa fa-check" aria-hidden="true"></i> No hay ningún registro actualmente! </div><%end if%>

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
<button type="button" class="btn red " onClick="confirmarElimina_b_ok();">Confirmar</button>
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
<!--FIN MODALES-->
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="<%=r%>lib/app/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<style>div.dt-button-collection{position:absolute;top:0px;margin-top:-20px}@media screen and (max-width : 470px){div.dt-button-collection{position:absolute;top:0px;margin-top:-180px}}
@media screen and (min-width : 470px) and (max-width : 680px){div.dt-button-collection{position:absolute;top:0px;margin-top:-100px}}</style>
<script>
/* EN CASO DE OTROS RANGOS DE FILTRO */
$.fn.dataTable.ext.search.push(
function( settings, data, dataIndex ) {
var min = parseInt( $('#min').val(), 10 );
var max = parseInt( $('#max').val(), 10 );
var age = parseFloat( data[3] ) || 0; // DATA[] PARA COLUMNA
if ( ( isNaN( min ) && isNaN( max ) ) ||
( isNaN( min ) && age <= max ) ||
( min <= age   && isNaN( max ) ) ||
( min <= age   && age <= max ) )
{return true;}return false;});
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
{orderable: false, targets:   1},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
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
$('select').select2({minimumResultsForSearch: -1});
$('.date-picker').datepicker({language: 'es'});
});
$('#ffin,#fini').change( function() {$('#listado').DataTable().draw();} );//RANGOS DE FECHAS
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
</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>