<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<%anyo_act2=request_equerystring("anyo_act2")
if anyo_act2="" then anyo_act2=year(date) end if%>
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<div class="breadcrumbs">
<h1>Usuarios | Gestión <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%></h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><a href="#">Listado <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%></a></li>
</ol>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit portlet-datatable bordered">
<div class="portlet-title">
<div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%> registrados | <%if anyo_act2="1000" then%>2 años anteriores<%end if%><%if anyo_act2="2000" then%>Todos los años anteriores<%end if%><%if anyo_act2<>"1000" and anyo_act2<>"2000"then%>AÑO <%=year(date)%><%end if%></span><span style="font-size:0.8em;margin-left:10px;color:#999">(*En acciones puedes modificar el criterio de selección de años)</span></div>
<div class="actions">
<%if ntres="ag" then%>
<div class="btn-group hidden"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn sbold red">Añadir nuevo&nbsp;<i class="fa fa-plus"></i></a></div><%end if%>
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;Acciones <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right">
<li><a href="javascript:habilitadoTodas();" ><i class="fa fa-circle-o" aria-hidden="true"></i> Habilitado</a></li>
<li><a href="javascript:habilitadoNoTodas();" ><i class="fa fa-ban" aria-hidden="true"></i> No habilitado</a></li>
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=1000&cod_cat="&cod_cat&"&t="&t&"&verp="&verp))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=1000&cod_cat="&cod_cat&"&t="&t&"&verp="&verp)%>" ><i class="fa fa-calendar-minus-o" aria-hidden="true"></i> Ver 2 años anteriores a <%=year(date)%></a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=&cod_cat="&cod_cat&"&t="&t&"&verp="&verp))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=&cod_cat="&cod_cat&"&t="&t&"&verp="&verp)%>" ><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Ver solo <%=year(date)%></a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=1000&cod_cat="&cod_cat&"&t="&t&"&verp="&verp))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=2000&cod_cat="&cod_cat&"&t="&t&"&verp="&verp)%>" ><i class="fa fa-calendar-minus-o" aria-hidden="true"></i> Ver desde inicio</a></li>
<li class="divider"></li>
<li><a href="javascript:eliminarTodas();" ><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
</ul>
</div>
<div class="btn-group">
<a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-share"></i>&nbsp;Exportar <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones">
<li><a href="javascript:;" data-action="0" class="tool-action"><i class="icon-printer"></i> Imprimir</a></li>
<li><a href="javascript:;" data-action="2" class="tool-action"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF</a></li>
<li><a href="javascript:;" data-action="3" class="tool-action"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel</a></li>
<li><a href="javascript:;" data-action="4" class="tool-action"><i class="fa fa-file-text-o" aria-hidden="true"></i> CSV</a></li>
</ul>
</div>
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-action="5" id="columnas"><i class="fa fa-columns" aria-hidden="true"></i>&nbsp;Columnas <i class="fa fa-angle-down"></i></a></div>
</div>
</div>
<div class="portlet-body">
<%if ms="ok_del"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros eliminados con éxito! </div><%end if%>
<%if ms="ok_vis"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Visibilidad modificada con éxito! </div><%end if%>
<%if ms="ok_des"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros destacados/no derstacados con éxito! </div><%end if%>
<%if ms="ok_dis"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Disponibilidad modificada con éxito! </div><%end if%>
<div class="table-container">
<form name="formulario" action="acciones.asp" method="post" >
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="accion" type="hidden" value="" autocomplete="off"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off">
<div class="row"><!-- FILTRO FECHAS-->
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="ffin" name="ffin" placeholder="Hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
</div>
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker margin-bottom-5 " data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="fini" name="fini" placeholder="Desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></div>   
</div><!-- FIN FILTRO FECHAS-->
<%if ntres="ag" then
Sql= "SELECT u_nombre, u_apellidos, fecha_in, u_agente, id_usuario, habilitado from usuarios WHERE u_agente='si'"   
else
anyo_pas=year(date)-1
anyo_ahora=year(date)
if anyo_act2=1000 then
anyo_act2=year(date)-2
Sql= "SELECT u_nombre, u_apellidos, fecha_in, u_agente, id_usuario, habilitado from usuarios WHERE (u_agente IS NULL OR u_agente<>'si' ) AND (year(fecha_In)>= "&anyo_act2&" and year(fecha_in)<= "&anyo_pas&") "   
else
if anyo_act2=2000 then
anyo_act2=1000
anyo_pas=year(date)-3
Sql= "SELECT u_nombre, u_apellidos, fecha_in, u_agente, id_usuario, habilitado from usuarios WHERE (u_agente IS NULL OR u_agente<>'si' and id_usuario=1250) AND (year(fecha_In)>= "&anyo_act2&" and year(fecha_in)<= "&anyo_pas&") "   
else
Sql= "SELECT u_nombre, u_apellidos, fecha_in, u_agente, id_usuario, habilitado from usuarios WHERE (u_agente IS NULL OR u_agente<>'si') AND year(fecha_In)>= "&anyo_act2&""   
end if
end if
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
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
<th>Nombre</th>
<th style="text-align:center"> Habilitado </th>
<th style="text-align:center"> Alumnos </th>
<th style="text-align:center"> Fecha Registro </th>
<th class="txt_centro"> acc. </th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_usuario")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check"  autocomplete="off"><span></span></label></td>
<td><%=ob_rs("u_apellidos")%>, <%=ob_rs("u_nombre")%></td>
<td style="text-align:center"><%if ob_rs("habilitado")="si"then%><i class="fa fa-check f_green" aria-hidden="true"></i><span class="f_white_p">Sí</span><%else%><i class="fa fa-times f_red" aria-hidden="true"></i><span class="f_white_p">No</span><%end if%></td>
<td style="text-align:center">
<%Sql2= "SELECT id_programa FROM programas, alumnos WHERE (id_usuario="&ob_rs("id_usuario")&" or id_agente_cod ="&ob_rs("id_usuario")&" ) and programas.id_alumno=alumnos.id_alumno"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%=ob_rs2.RecordCount%>
<%else%>-
<%end if
ob_rs2.close%>
</td>
<td style="text-align:center"><%if ob_rs("fecha_in")<>""then%><%=FormatDateTime(cdate(ob_rs("fecha_in")),2)%><%end if%></td>
<td><div class="coje_acc">
<div class="btn-group" id="col_rel">
<a class="btn btn-xs green dropdown-toggle" href="javascript:;" data-toggle="dropdown" >Acciones<i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones" >
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_usuario")))%>
<li><a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_usuario"))%>" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a></li>
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_usuario")&"&accion=hab"))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_usuario")&"&accion=hab")%>&" ><i class="fa fa-eye" aria-hidden="true"></i> Habilitado</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_usuario")&"&accion=hab_no"))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_usuario")&"&accion=hab_no")%>&"  ><i class="fa fa-eye-slash" aria-hidden="true"></i> No habilitado</a></li>
<li class="divider"></li>
<li><a href="javascript:eliminarUna<%=i%>(<%=ob_rs("id_usuario")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
</ul>
</div>
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
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_usuario")%>&accion=del';}</script>
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

<div class="modal fade" id="confirmaHabilitado" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas HABILITAR los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarHabilitado_ok();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="confirmaNoHabilitado" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas DESHABILITAR los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarNoHabilitado_ok();">Confirmar</button>
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
$.fn.dataTableExt.afnFiltering.push(
function( oSettings, aData, iDataIndex ) {
var iFini = document.getElementById('fini').value;
var iFfin = document.getElementById('ffin').value;
var iStartDateCol = 5;                              // INDICA COLUMNA PARA BUSCAR FECHA
var iEndDateCol = 5;                               // INDICA COLUMNA PARA BUSCAR FECHA
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


function habilitadoTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaHabilitado').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarHabilitado_ok(){
	document.formulario.accion.value="hab";
	$('#confirmaHabilitado').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function habilitadoNoTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaNoHabilitado').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarNoHabilitado_ok(){
	document.formulario.accion.value="hab_no";
	$('#confirmaNoHabilitado').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}


</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>