<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<%proc = request_equerystring("proc") 'INDICA PROCEDENCIA MENU SUP "alumnos"
t = request_equerystring("t")%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Listados | <%if ndos="aca" then%> Academia <%else%>Extraescolares <%end if%></h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li class="active">Listados <%if ndos="aca" then%> Academia <%else%>Extraescolares <%end if%></li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Listado</span><%if pr_contabilidad_ad="si" and t="lst_fact" then%><span class="caption-subject font-green  "> *Selecciona grupos para obtener resultados</span><%end if%></div></div>
<div class="portlet-body">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ok_env_mail"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Mails enviados con éxito!!</div><%end if%>
<%if ms="del_gest"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> registros eliminados con éxito!!</div><%end if%>
<form action="listado2.asp" method="post" name="envio" class="form-horizontal" id="envio"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="t" type="hidden" value="<%=t%>">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-12">

<div class="col-md-6">

<%if ndos="aca" then
Sql= "SELECT anyo, id_precio FROM academia_precios order by anyo desc"   '[ASOCIAMOS CON UNA TEMP]
else
Sql= "SELECT anyo FROM extra_programas group by anyo order by anyo desc"   '[ASOCIAMOS CON UNA TEMP]
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="temporada" style="padding-right:25px">Temporada.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="temporada" id="temporada" class="select-100" multiple="multiple">
<option value="" ></option>
<%do while not ob_rs.eof
if ndos="aca"then%>
<option value="<%=ob_rs("id_precio")%>"><%=ob_rs("anyo")%>&nbsp;</option>
<%else%>
<option value="<%=ob_rs("anyo")%>"><%=ob_rs("anyo")%></option>
<%end if
ob_rs.movenext
loop%>
</select>
<i class="fa fa-calendar" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close '[FIN ASOCIAMOS CON UNA TEMP]%>

<%if ndos="ext"then%>
<%Sql= "SELECT * FROM extra_actividades where borrado <> 'si' order by nombre"   '[ASOCIAMOS ACTIVIDAD]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="actividad" style="padding-right:25px">Actividad.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="actividad" id="actividad" class="select-100" multiple="multiple">
<option value="" ></option>
<%do while not ob_rs.eof

Sql2= "SELECT * FROM extra_colegios where id_colegio = "&ob_rs("id_colegio")&" "
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then
nombre_colegio=ob_rs2("nombre")
end if
ob_rs2.close

Sql2= "SELECT * FROM extra_monitores where id_profesor = "&ob_rs("id_monitor")&" "
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then
nombre_monitor=ob_rs2("nombre")
apellidos_monitor=ob_rs2("apellidos")
end if
ob_rs2.close%>

<option value="<%=ob_rs("id_actividad")%>"><%=ob_rs("nombre")%> // <%=nombre_colegio%> // <%=nombre_monitor%> <%=apellidos_monitor%></option>
<%ob_rs.movenext
loop%>
</select>
<i class="fa fa-bullseye" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close '[FIN ASOCIAMOS ACTIVIDAD]%>
<%end if%>

<%if ndos="aca" then
Sql= "SELECT apellidos, nombre, id_profesor FROM academia_profesores order by nombre"   '[ASOCIAMOS PROFES]
else
Sql= "SELECT apellidos, nombre, id_profesor FROM extra_monitores where borrado <> 'si' or borrado is null order by nombre"   '[ASOCIAMOS PROFES]
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="grupo" style="padding-right:25px">Profesores.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="profesores" id="profesores" class="select-100" multiple="multiple">
<option value="" ></option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_profesor")%>"><%=ob_rs("nombre")%>&nbsp;<%=ob_rs("apellidos")%></option>
<%ob_rs.movenext
loop%>
</select>
<i class="fa fa-graduation-cap" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close '[FIN ASOCIAMOS PROFES]%>

<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="dias" style="padding-right:25px">Días.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="dias" id="dias" class="select-100" multiple="multiple">
<option value="" ></option>
<option value="Lunes">Lunes</option>
<option value="Martes">Martes</option>
<option value="Miercoles">Miércoles</option>
<option value="Jueves">Jueves</option>
<option value="Viernes">Viernes</option>
<option value="Sabado">Sábado</option>
</select>
<i class="fa fa-calendar" aria-hidden="true"></i></div>
</div>
</div>

<%if ndos="aca"then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meses" style="padding-right:25px">Meses.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="meses" id="meses" class="select-100" multiple="multiple">
<option value="" ></option>
<option value="septiembre">Septiembre</option>
<option value="octubre">Octubre</option>
<option value="noviembre">Noviembre</option>
<option value="diciembre">Diciembre</option>
<option value="enero">Enero</option>
<option value="febrero">Febrero</option>
<option value="marzo">Marzo</option>
<option value="abril">Abril</option>
<option value="mayo">Mayo</option>
<option value="junio">Junio</option>
<option value="julio">Julio</option>
<option value="agosto">Agosto</option>
</select>
<i class="fa fa-calendar" aria-hidden="true"></i></div>
</div>
</div>
<%end if%>

</div>

<div class="col-md-6">

<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="bajas" style="padding-right:25px">Estado.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="bajas" id="bajas" class="select-100" >
<option value="" ></option>
<option value="ver_bajas">Ver bajas</option>
</select>
<i class="fa fa-ban" aria-hidden="true"></i></div>
</div>
</div>

<%if ndos="aca"then
Sql= "SELECT grupo from academia_alumnos group by grupo order by grupo"   '[ASOCIAMOS GRUPO]
else
Sql= "SELECT curso from extra_alumnos group by curso order by curso"
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="curso" style="padding-right:25px">Curso.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="curso" id="curso" class="select-100" multiple="multiple">
<option value="" ></option>
<%do while not ob_rs.eof
if ndos="aca" then
grupo = ob_rs("grupo")
grupo = replace(grupo,"_"," ")%>
<option value="<%=ob_rs("grupo")%>"><%=grupo%>&nbsp;</option>
<%else
grupo = ob_rs("curso")
grupo = replace(grupo,"_"," ")%>
<%if grupo="" then%>
<option value="<%=ob_rs("curso")%>">Sin grupo asignado</option>
<%else%>
<option value="<%=ob_rs("curso")%>"><%=grupo%></option>
<%end if%>
<%end if%>
<%ob_rs.movenext
loop%>
</select>
<i class="fa fa-calendar" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close '[FIN ASOCIAMOS GRUPO]%>

<%if ndos="ext"then%>
<%Sql= "SELECT grupo from extra_alumnos where grupo <> '' group by grupo order by grupo"   '[ASOCIAMOS Grupos]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="grupo" style="padding-right:25px">Grupo.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="grupo" id="grupo" class="select-100" multiple="multiple">
<option value="" ></option>
<%do while not ob_rs.eof
grupo = ob_rs("grupo")
grupo = replace(grupo,"_"," ")%>
<option value="<%=ob_rs("grupo")%>"><%=grupo%></option>
<%ob_rs.movenext
loop%>
</select>
<i class="fa fa-graduation-cap" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close '[FIN ASOCIAMOS Grupos]%>
<%end if%>

<%if ndos="aca"then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="forma_pago" style="padding-right:25px">Pago.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="forma_pago" id="forma_pago" class="select-100" >
<option value="" ></option>
<option value="efectivo">Efectivo</option>
<option value="bancario">Bancario</option>
<option value="tarjeta">Tarjeta</option>
</select>
<i class="fa fa-money" aria-hidden="true"></i></div>
</div>
</div>
<%end if%>


<%if ndos="aca"then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="acp_imagen" style="padding-right:25px">Cede imagen.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="acp_imagen" id="acp_imagen" class="select-100" >
<option value="" ></option>
<option value="si">Sí</option>
<option value="no">No</option>
</select>
<i class="fa fa-picture-o" aria-hidden="true"></i></div>
</div>
</div>
<%end if%>

<%if ndos="ext"then%>
<%Sql= "SELECT id_colegio, nombre FROM extra_colegios order by nombre"   '[ASOCIAMOS colegios]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="colegios" style="padding-right:25px">Colegio.</label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="colegios" id="colegios" class="select-100" multiple="multiple">
<option value="" ></option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_colegio")%>"><%=ob_rs("nombre")%></option>
<%ob_rs.movenext
loop%>
</select>
<i class="fa fa-university" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close '[FIN ASOCIAMOS colegios]%>
<%end if%>

</div>



</div></div></div></div>

<div class="form-body">                                                 
<div class="form-actions"><div class="row"><div class="col-md-12"><div class="col-md-5"><a href="javascript:toggle_to();" class="btn green"><i class="fa fa-list" aria-hidden="true"></i> opciones a mostrar</a></div></div></div></div>
<div class="form-body" id="opciones"> <div class="form-actions"><div class="row"><div class="col-md-12" ><div class="col-md-7" style="padding-left:0px;margin-bottom:25px"><div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox form-md-checkboxes col-md-4" style="color:#999">


<div class="md-checkbox"><input type="checkbox" name="op_baja" id="op_baja" class="md-check" value="si" ><label for="op_baja"><span></span><span class="check"></span><span class="box"></span> fecha baja. </label></div>
<%if ndos="ext"then%>
<div class="md-checkbox"><input type="checkbox" name="op_grupo" id="op_grupo" class="md-check" value="si" ><label for="op_grupo"><span></span><span class="check"></span><span class="box"></span> grupo. </label></div>
<%end if%>
<%if ndos="aca"then%>
<div class="md-checkbox"><input type="checkbox" name="op_total" id="op_total" class="md-check" value="si" ><label for="op_total"><span></span><span class="check"></span><span class="box"></span> total pagado. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_cuenta" id="op_cuenta" class="md-check" value="si" ><label for="op_cuenta"><span></span><span class="check"></span><span class="box"></span> número de cuenta. </label></div>
<%end if%>
<%if ndos="ext"then%>
<div class="md-checkbox"><input type="checkbox" name="op_colegio" id="op_colegio" class="md-check" value="si" ><label for="op_colegio"><span></span><span class="check"></span><span class="box"></span> colegio. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_profesor" id="op_profesor" class="md-check" value="si" ><label for="op_profesor"><span></span><span class="check"></span><span class="box"></span> profesor. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_actividad" id="op_actividad" class="md-check" value="si" ><label for="op_actividad"><span></span><span class="check"></span><span class="box"></span> actividad. </label></div>
<%end if%>
</div>

</div>




<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox form-md-checkboxes col-md-4" style="color:#999">

<div class="md-checkbox"><input type="checkbox" name="op_email" id="op_email" class="md-check" value="si" ><label for="op_email"><span></span><span class="check"></span><span class="box"></span> email. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_telefono" id="op_telefono" class="md-check" value="si" ><label for="op_telefono"><span></span><span class="check"></span><span class="box"></span> telefono. </label></div>
<%if ndos="ext" then%>
<div class="md-checkbox"><input type="checkbox" name="op_movil" id="op_movil" class="md-check" value="si" ><label for="op_movil"><span></span><span class="check"></span><span class="box"></span> movil. </label></div>
<%end if%>

<%if ndos="aca"then%>
<div class="md-checkbox"><input type="checkbox" name="op_imagen" id="op_imagen" class="md-check" value="si" ><label for="op_imagen"><span></span><span class="check"></span><span class="box"></span> cesión de imagen. </label></div>
<%end if%>
</div>

</div>


</div></div></div></div></div></div>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_listado1(this.form);"  language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> realizar la selección</button>
</div></div></div></div>
</div>
<!--ACCIONES fin form-body-->
</form>
</div></div></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
$('#opciones').hide();
function Enviar_listado1 (form)  {	////////////////////////////////////   WEBS 
$('#spinner_back').show();
$('#spinner').show();
setTimeout(function(){ document.envio.submit(); }, 300);
return;}
function toggle_to(){$("#opciones").slideToggle( "slow" );}
$(document).ready(function() {$('select').select2({minimumResultsForSearch: -1,language: "es"})})
</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>