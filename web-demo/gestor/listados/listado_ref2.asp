<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<%refPago=request("refPago")%>
<div class="breadcrumbs"><h1>Alumnos | Listado de Alumnos</h1>
<ol class="breadcrumb"><li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li><li><a href="#">Listado</a></li></ol></div>
<div class="row"><div class="col-md-12"><div class="portlet light portlet-fit portlet-datatable bordered"><div class="portlet-title"><div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | Alumnos </span></div><div class="actions"><div class="btn-group"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-share"></i>&nbsp;Exportar <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones"><li><a href="javascript:;" data-action="0" class="tool-action"><i class="icon-printer"></i> Imprimir</a></li><li><a href="javascript:;" data-action="2" class="tool-action"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF</a></li><li><a href="javascript:;" data-action="3" class="tool-action"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel</a></li><li><a href="javascript:;" data-action="4" class="tool-action"><i class="fa fa-file-text-o" aria-hidden="true"></i> CSV</a></li></ul>
</div>
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-action="5" id="columnas"><i class="fa fa-columns" aria-hidden="true"></i>&nbsp;Columnas <i class="fa fa-angle-down"></i></a></div></div></div>
<div class="portlet-body">
<div class="table-container">
<div class="row"><!-- FILTRO FECHAS-->
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="ffin" name="ffin" placeholder="Hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
</div>
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker margin-bottom-5 " data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="fini" name="fini" placeholder="Desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></div>   
</div><!-- FIN FILTRO FECHAS-->
<%if refPago<>"" then
Sql= "SELECT  refPago AS refPago, refPagoPay AS refPagoPay, id_programa AS id_programa, estadoPago AS estadoPago, metodoPago AS metodoPago, fechaPago AS fecha FROM programas WHERE refPagoPay ='"&refPago&"' OR refPago ='"&refPago&"' UNION select refPago AS refPago, refPagoPay AS refPagoPay, id_programa AS id_programa, estadoPago AS estadoPago, metodoPago AS metodoPago, fecha AS fecha FROM programasAnticipos WHERE refPagoPay ='"&refPago&"' OR refPago ='"&refPago&"'" 
else
Sql= "SELECT  refPago AS refPago, refPagoPay AS refPagoPay, id_programa AS id_programa, estadoPago AS estadoPago, metodoPago AS metodoPago, fechaPago AS fecha  FROM programas WHERE (refPagoPay <>'' AND refPagoPay IS NOT NULL) OR (refPago <>'' AND refPago IS NOT NULL) UNION select refPago AS refPago, refPagoPay AS refPagoPay, id_programa AS id_programa, estadoPago AS estadoPago, metodoPago AS metodoPago, fecha AS fecha FROM programasAnticipos WHERE (refPagoPay <>'' AND refPagoPay IS NOT NULL) OR (refPago <>'' AND refPago IS NOT NULL)" 
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<table class="table table-striped table-bordered table-hover sample_1" id="listado" style="border:none" >
<thead>
<tr>
<th>id#</th>
<th>Apellidos, Nombre</th>
<th>Programa</th>
<th style="text-align:center">Fecha Pago</th>
<th>Estado</th>
<th>Método</th>
<th style="text-align:center">Ref. pago</th>
<th style="text-align:center">&nbsp;</th>
</tr>
</thead>

<tbody>
<%do while not ob_rs.eof%>
<tr>
<td><%=ob_rs("id_programa")%></td>
<td>


<%Sql2= "SELECT  id_alumno, nom_item FROM programas WHERE id_programa="&ob_rs("id_programa")&""
Ob_Commandb.CommandText = Sql2
SET Ob_RS2 = Ob_Commandb.Execute ()
if not ob_rs2.eof then
nom_item=ob_rs2("nom_item")
id_alumno=ob_rs2("id_alumno")
if ob_rs2("id_alumno")<>""then
Sql3= "SELECT  a_nombre, a_apellidos FROM alumnos WHERE id_alumno="&ob_rs2("id_alumno")&""
Ob_Commandb.CommandText = Sql3
SET Ob_RS3 = Ob_Commandb.Execute ()
if not ob_rs3.eof then%>
<%=ob_rs3("a_apellidos")%>, <%=ob_rs3("a_nombre")%> 
<%end if
ob_rs3.close
end if
ob_rs2.close
end if%>
</td>
<td><%=nom_item%></td>
<td style="text-align:center"><%=ob_rs("fecha")%></td>
<td><%=ob_rs("estadoPago")%></td>
<td><%=ob_rs("metodoPago")%></td>
<td style="text-align:center"><%=ob_rs("refPago")%><%=ob_rs("refPagoPay")%></td>
<td style="text-align:center">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&id_alumno&"&verp="&vepr&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa")))%>
<a href="../alumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&id_alumno&"&verp="&p&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa"))%>" a class="btn btn-sm green"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Ver datos</a> 
</td>
</tr>
<%i=i+1
ob_rs.movenext
loop%>
</tbody>
</table>
<%else 'NO HAY NINGÚN REGISTRO%>
<div class="alert-danger sin_regstros"><i class="fa fa-check" aria-hidden="true"></i> No hay ningún registro actualmente! </div>
<%end if 'FIN BUCLE TABLA
ob_rs.close
ob_conn.close%></div></div></div></div></div>
<!--#include file="../comun/menu_inf.asp"--> <script src="<%=r%>lib/app/datatables/datatables.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script><script src="<%=r%>lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<style>div.dt-button-collection{position:absolute;top:0px;margin-top:-20px}@media screen and (max-width : 470px){div.dt-button-collection{position:absolute;top:0px;margin-top:-180px}}
@media screen and (min-width : 470px) and (max-width : 680px){div.dt-button-collection{position:absolute;top:0px;margin-top:-100px}}</style>
<script>
$.fn.dataTableExt.afnFiltering.push(
function( oSettings, aData, iDataIndex ) {
var iFini = document.getElementById('fini').value;
var iFfin = document.getElementById('ffin').value;
var iStartDateCol = 3;                              // INDICA COLUMNA PARA BUSCAR FECHA
var iEndDateCol = 3;                               // INDICA COLUMNA PARA BUSCAR FECHA
iFini=iFini.substring(6,10) + iFini.substring(3,5)+ iFini.substring(0,2);
iFfin=iFfin.substring(6,10) + iFfin.substring(3,5)+ iFfin.substring(0,2);
var datofini=aData[iStartDateCol].substring(6,10) + aData[iStartDateCol].substring(3,5)+ aData[iStartDateCol].substring(0,2);
var datoffin=aData[iEndDateCol].substring(6,10) + aData[iEndDateCol].substring(3,5)+ aData[iEndDateCol].substring(0,2);
if ( iFini === "" && iFfin === "" ){return true;}
else if ( iFini <= datofini && iFfin === ""){return true;}
else if ( iFfin >= datoffin && iFini === ""){return true;}
else if (iFini <= datofini && iFfin >= datoffin){return true;}return false;});
/* EN CASO DE OTROS RANGOS DE FILTRO */
$.fn.dataTable.ext.search.push(
function( settings, data, dataIndex ) {
var min = parseInt( $('#min').val(), 12 );
var max = parseInt( $('#max').val(), 12 );
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
{orderable: false, targets:   7},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
{ responsivePriority: 1, targets: 1 },
{ responsivePriority: 2, targets: -1 }
],
buttons: [
{extend: 'print', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'copy', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'pdf', className: 'esconde' , exportOptions: {columns: ':visible'} },
{ extend: 'excel', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'csv', className: 'esconde', exportOptions: {columns: ':visible'} },
{ extend: 'colvis', className: 'esconde',  columns: (':not(.no_exp)')}],
"order": [[1, 'asc']],
"lengthMenu": [[20, 50, 75, 100, -1],[20, 50, 75, 100, "Todos"]],
"pageLength": 50,
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
</script><script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>