<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<%op_alta=request("op_alta")
op_baja=request("op_baja")
op_total=request("op_total")
op_grupo=request("op_grupo")
op_colegio=request("op_colegio")
op_profesor=request("op_profesor")
op_actividad=request("op_actividad")
op_email=request("op_email")
op_telefono=request("op_telefono")
op_movil=request("op_movil")
op_imagen=request("op_imagen")
op_cuenta=request("op_cuenta")
temporada=request("temporada")
meses=request("meses")
curso=request("curso")
tipo=request("tipo")
actividad =request("actividad")
grupo=request("grupo")
forma_pago=request("forma_pago")
colegios=request("colegios")
dias=request("dias")
bajas=request("bajas")
profesores=request("profesores")
acp_imagen=request("acp_imagen")

'SELECCION
if ndos="aca" then 
seleccion = "SELECT * FROM academia_clases INNER JOIN academia_alumnos ON academia_clases.id_alumno = academia_alumnos.id_alumno WHERE academia_clases.id_clase <> null "
else
seleccion = "SELECT * FROM extra_programas INNER JOIN extra_alumnos ON extra_programas.id_alumno = extra_alumnos.id_alumno WHERE extra_programas.id_extraescolar <> null "
end if

'TEMPORADA
if temporada<>""then 
cadena_rel = split(temporada, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
if ndos="aca" then
seleccion= seleccion &" AND (academia_clases.id_precio = "&cadena_rel(i)&""
else
seleccion= seleccion &" AND (extra_programas.anyo = '"&cadena_rel(i)&"'"
end if
else
if ndos="aca" then
seleccion= seleccion &" OR academia_clases.id_precio = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR extra_programas.anyo = '"&cadena_rel(i)&"'"
end if
end if
next
seleccion= seleccion&")"
end if 

'PROFESORES
if profesores<>""then 
cadena_rel = split(profesores, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
if ndos="aca" then
seleccion= seleccion &" AND (academia_clases.id_profesor = "&cadena_rel(i)&""
else
seleccion= seleccion &" AND (extra_programas.id_monitor = "&cadena_rel(i)&""
end if
else
if ndos="aca" then
seleccion= seleccion &" OR academia_clases.id_profesor = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR extra_programas.id_monitor = "&cadena_rel(i)&""
end if
end if
next
seleccion= seleccion&")"
end if 

'DIAS
if dias<>""then 
cadena_rel = split(dias, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND ("
if cadena_rel(i)="Lunes" then  
if ndos="aca" then
seleccion= seleccion & " academia_clases.lunes='si' " 
else
seleccion= seleccion & " extra_programas.lunes='si' " 
end if
end if
if cadena_rel(i)="Martes" then  
if ndos="aca" then
seleccion= seleccion & " academia_clases.martes='si' " 
else
seleccion= seleccion & " extra_programas.martes='si' " 
end if
end if
if cadena_rel(i)="Miercoles" then  
if ndos="aca" then
seleccion= seleccion & " academia_clases.miercoles='si' " 
else
seleccion= seleccion & " extra_programas.miercoles='si' " 
end if
end if
if cadena_rel(i)="Jueves" then  
if ndos="aca" then
seleccion= seleccion & " academia_clases.jueves='si' " 
else
seleccion= seleccion & " extra_programas.jueves='si' " 
end if
end if
if cadena_rel(i)="Viernes" then  
if ndos="aca" then
seleccion= seleccion & " academia_clases.viernes='si' " 
else
seleccion= seleccion & " extra_programas.viernes='si' " 
end if
end if
if cadena_rel(i)="Sabado" then  
if ndos="aca" then
seleccion= seleccion & " academia_clases.sabado='si' " 
else
seleccion= seleccion & " extra_programas.sabado='si' "
end if
end if

else

if trim(cadena_rel(i))="Lunes" then
if ndos="aca" then 
seleccion= seleccion &" OR academia_clases.lunes = 'si' "
else
seleccion= seleccion &" OR extra_programas.lunes = 'si' "
end if
end if
if trim(cadena_rel(i))="Martes" then 
if ndos="aca" then 
seleccion= seleccion &" OR academia_clases.martes = 'si' "
else
seleccion= seleccion &" OR extra_programas.martes = 'si' "
end if
end if
if trim(cadena_rel(i))="Miercoles" then 
if ndos="aca" then 
seleccion= seleccion &" OR academia_clases.miercoles = 'si' "
else
seleccion= seleccion &" OR extra_programas.miercoles = 'si' "
end if
end if
if trim(cadena_rel(i))="Jueves" then
if ndos="aca" then  
seleccion= seleccion &" OR academia_clases.jueves = 'si' "
else
seleccion= seleccion &" OR extra_programas.jueves = 'si' "
end if
end if
if trim(cadena_rel(i))="Viernes" then 
if ndos="aca" then 
seleccion= seleccion &" OR academia_clases.viernes = 'si' "
else
seleccion= seleccion &" OR extra_programas.viernes = 'si' "
end if
end if
if trim(cadena_rel(i))="Sabado" then 
if ndos="aca" then 
seleccion= seleccion &" OR academia_clases.sabado = 'si' "
else
seleccion= seleccion &" OR extra_programas.sabado = 'si' "
end if
end if
end if
next
seleccion= seleccion&")"
end if 

'MESES
if meses<>""then 
cadena_rel = split(meses, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND ("
if cadena_rel(i)="septiembre" then  
seleccion= seleccion & " academia_clases.septiembre='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.septiembre_p = '"&forma_pago&"')"end if 
septiembre_cuenta="si"
end if
if cadena_rel(i)="octubre" then  
seleccion= seleccion & " academia_clases.octubre='si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.octubre_p = '"&forma_pago&"')" end if
octubre_cuenta="si"
end if
if cadena_rel(i)="noviembre" then  
seleccion= seleccion & " academia_clases.noviembre='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.noviembre_p = '"&forma_pago&"')" end if
noviembre_cuenta="si"
end if
if cadena_rel(i)="diciembre" then  
seleccion= seleccion & " academia_clases.diciembre='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.diciembre_p = '"&forma_pago&"')" end if
diciembre_cuenta="si"
end if
if cadena_rel(i)="enero" then  
seleccion= seleccion & " academia_clases.enero='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.enero_p = '"&forma_pago&"')" end if
enero_cuenta="si"
end if
if cadena_rel(i)="febrero" then  
seleccion= seleccion & " academia_clases.febrero='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.febrero_p = '"&forma_pago&"')" end if
febrero_cuenta="si"
end if
if cadena_rel(i)="marzo" then  
seleccion= seleccion & " academia_clases.marzo='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.marzo_p = '"&forma_pago&"')" end if
marzo_cuenta="si"
end if
if cadena_rel(i)="abril" then  
seleccion= seleccion & " academia_clases.abril='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.abril_p = '"&forma_pago&"')" end if
abril_cuenta="si"
end if
if cadena_rel(i)="mayo" then  
seleccion= seleccion & " academia_clases.mayo='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.mayo_p = '"&forma_pago&"')" end if
mayo_cuenta="si"
end if
if cadena_rel(i)="junio" then  
seleccion= seleccion & " academia_clases.junio='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.junio_p = '"&forma_pago&"')" end if
junio_cuenta="si"
end if
if cadena_rel(i)="julio" then  
seleccion= seleccion & " academia_clases.julio='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.julio_p = '"&forma_pago&"')" end if
julio_cuenta="si"
end if
if cadena_rel(i)="agosto" then  
seleccion= seleccion & " academia_clases.agosto='si' " 
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.agosto_p = '"&forma_pago&"')" end if
agosto_cuenta="si"
end if
else
if trim(cadena_rel(i))="septiembre" then 
seleccion= seleccion &" OR academia_clases.septiembre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.septiembre_p = '"&forma_pago&"')" end if 
septiembre_cuenta="si"
end if
if trim(cadena_rel(i))="octubre" then 
seleccion= seleccion &" OR academia_clases.octubre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.octubre_p = '"&forma_pago&"')" end if 
octubre_cuenta="si"
end if
if trim(cadena_rel(i))="noviembre" then 
seleccion= seleccion &" OR academia_clases.noviembre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.noviembre_p = '"&forma_pago&"')" end if 
noviembre_cuenta="si"
end if
if trim(cadena_rel(i))="diciembre" then 
seleccion= seleccion &" OR academia_clases.diciembre = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.diciembre_p = '"&forma_pago&"')" end if 
diciembre_cuenta="si"
end if
if trim(cadena_rel(i))="enero" then 
seleccion= seleccion &" OR academia_clases.enero = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.enero_p = '"&forma_pago&"')" end if 
enero_cuenta="si"
end if
if trim(cadena_rel(i))="febrero" then 
seleccion= seleccion &" OR academia_clases.febrero = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.febrero_p = '"&forma_pago&"')" end if 
febrero_cuenta="si"
end if
if trim(cadena_rel(i))="marzo" then 
seleccion= seleccion &" OR academia_clases.marzo = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.marzo_p = '"&forma_pago&"')" end if 
marzo_cuenta="si"
end if
if trim(cadena_rel(i))="abril" then 
seleccion= seleccion &" OR academia_clases.abril = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.abril_p = '"&forma_pago&"')" end if 
abril_cuenta="si"
end if
if trim(cadena_rel(i))="mayo" then 
seleccion= seleccion &" OR academia_clases.mayo = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.mayo_p = '"&forma_pago&"')" end if 
mayo_cuenta="si"
end if
if trim(cadena_rel(i))="junio" then 
seleccion= seleccion &" OR academia_clases.junio = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.junio_p = '"&forma_pago&"')" end if 
junio_cuenta="si"
end if
if trim(cadena_rel(i))="julio" then 
seleccion= seleccion &" OR academia_clases.julio = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.julio_p = '"&forma_pago&"')" end if 
julio_cuenta="si"
end if
if trim(cadena_rel(i))="agosto" then 
seleccion= seleccion &" OR academia_clases.agosto = 'si' "
if forma_pago<>""then seleccion= seleccion &" AND (academia_clases.agosto_p = '"&forma_pago&"')" end if 
agosto_cuenta="si"
end if
end if
next
seleccion= seleccion&")"
end if 
                                   
'BAJAS
if bajas<>""then 
if ndos="aca" then
seleccion= seleccion &" AND (year(academia_clases.fecha_baja) <> 1000 AND year(academia_clases.fecha_baja) <> 2001 AND academia_clases.fecha_baja <> null)"
else
seleccion= seleccion &" AND (year(extra_programas.fecha_baja) <> 1000 AND year(extra_programas.fecha_baja) <> 2001 AND extra_programas.fecha_baja <> null)"
end if
end if 		


if acp_imagen<>""then seleccion= seleccion &" AND (academia_alumnos.acp_imagen = '"&acp_imagen&"')" end if


'CURSOS 
if curso<>""then 
cadena_rel = split(curso, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
if ndos="aca" then
seleccion= seleccion &" AND (academia_alumnos.grupo = '"&trim(cadena_rel(i))&"'"
else
seleccion= seleccion &" AND (extra_alumnos.curso = '"&trim(cadena_rel(i))&"'"
end if
else
if ndos="aca" then
seleccion= seleccion &" OR academia_alumnos.grupo = '"&trim(cadena_rel(i))&"'"
else
seleccion= seleccion &" OR extra_alumnos.curso = '"&trim(cadena_rel(i))&"'"
end if
end if
next
seleccion= seleccion&")"
end if 


'PAGOS
if forma_pago<>"" and meses="" then 
seleccion= seleccion &" AND (academia_clases.septiembre_p = '"&forma_pago&"' OR academia_clases.octubre_p = '"&forma_pago&"' OR academia_clases.noviembre_p = '"&forma_pago&"' OR academia_clases.diciembre_p = '"&forma_pago&"' OR academia_clases.enero_p = '"&forma_pago&"' OR academia_clases.febrero_p = '"&forma_pago&"' OR academia_clases.marzo_p = '"&forma_pago&"' OR academia_clases.abril_p = '"&forma_pago&"' OR academia_clases.mayo_p = '"&forma_pago&"' OR academia_clases.junio_p = '"&forma_pago&"' OR academia_clases.julio_p = '"&forma_pago&"' OR academia_clases.agosto_p = '"&forma_pago&"')"
end if 


'ACTIVIDADES
if actividad<>""then 
cadena_rel = split(actividad, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (extra_programas.id_actividad = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR extra_programas.id_actividad = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 

'GRUPO 
if grupo<>""then 
cadena_rel = split(grupo, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (extra_programas.grupo = '"&trim(cadena_rel(i))&"'"
else
seleccion= seleccion &" OR extra_programas.grupo = '"&trim(cadena_rel(i))&"'"
end if
next
seleccion= seleccion&")"
end if 
			 
'COLEGIO 
if colegios<>""then 
cadena_rel = split(colegios, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (extra_programas.id_colegio = "&trim(cadena_rel(i))&""
else
seleccion= seleccion &" OR extra_programas.id_colegio = "&trim(cadena_rel(i))&""
end if
next
seleccion= seleccion&")"
end if %>									 

<span style="color:#CCC;display:block;margin-bottom:25px">Cadena: <%=seleccion%></span>
<div class="breadcrumbs"><h1>Alumnos | Listado de Alumnos | <%if ndos="aca" then%> Academia <%else%>Extraescolares <%end if%></h1>
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
<%Sql= seleccion 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<table class="table table-striped table-bordered table-hover sample_1" id="listado" style="border:none" >
<thead>
<tr>
<th>id#</th>
<th>Apellidos, Nombre</th>
<th>Curso actual</th>
<th style="text-align:center">Alta</th>
<%if op_baja="si" then%><th>Baja</th><%end if%>
<%if op_grupo="si" then%><th style="text-align:center">Grupo</th><%end if%>
<%if op_colegio="si" then%><th>Colegio</th><%end if%>
<%if op_profesor="si" then%><th>Profesor</th><%end if%>
<%if op_actividad="si" then%><th>Actividad</th><%end if%>
<%if op_email="si" then%><th>eMail</th><%end if%>
<%if op_telefono="si" then%><th>Teléfono</th><%end if%>
<%if op_movil="si" then%><th>Móvil</th><%end if%>
<%if op_cuenta="si" then%><th style="min-width:240px">Cuenta Bancaria</th><%end if%>
<%if op_imagen="si" then%><th style="max-width:140px">Cesión imagen</th><%end if%>

<%if op_total="si" then%><th>Total</th><%end if%>
</tr>
</thead>
<tbody>
<%suma_septiembre=0
suma_octubre=0
suma_noviembre=0
suma_diciembre=0
suma_enero=0
suma_febrero=0
suma_marzo=0
suma_abril=0
suma_mayo=0
suma_junio=0
suma_julio=0
suma_agosto=0
do while not ob_rs.eof%>
<tr>
<td>
<%if ndos="aca" then%>
<%=ob_rs("academia_alumnos.id_alumno")%>
<%else%>
<%=ob_rs("extra_alumnos.id_alumno")%>
<%end if%>
</td>
<td>
<%if ndos="aca" then%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("academia_alumnos.id_alumno")))%>
<a href="../academiaAlumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("academia_alumnos.id_alumno"))%>" style="color:#666">
<%else%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("extra_alumnos.id_alumno")))%>
<a href="../academiaExtAlumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("extra_alumnos.id_alumno"))%>" style="color:#666">
<%end if%>
<i class="fa fa-search-plus" aria-hidden="true"></i>
<%=ob_rs("apellidos")%>, <%=ob_rs("nombre")%></a>
</td>
<td>
<%if ndos="aca" then%>
<%=replace(ob_rs("academia_alumnos.grupo"),"_"," ")%>
<%else%>
<%=replace(ob_rs("curso"),"_"," ")%>
<%end if%>
</td>
<%fecha=ob_rs("fecha_alta")
fecha_now=FormatDateTime(cdate(ob_rs("fecha_alta")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%>
<td align="center" data-order="<%=fecha_now%>">
<%=FormatDateTime(cdate(ob_rs("fecha_alta")),2)%>
</td>
<%if op_baja="si" then%>
<%fecha=ob_rs("fecha_baja")
if fecha<>"" and fecha<>"01/01/2001" and fecha<>"01/01/1000" and fecha<>"01/11/211" then
fecha_now=FormatDateTime(cdate(ob_rs("fecha_baja")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))
end if%>
<td align="center" data-order="<%=fecha_now%>">
<%if fecha<>"" and fecha<>"01/01/2001" and fecha<>"01/01/1000" and fecha<>"01/11/211" then%><%=FormatDateTime(cdate(ob_rs("fecha_baja")),2)%><%end if%>
</td><%end if%>
<%if op_grupo="si" then%><td style="text-align:center"><%=ob_rs("extra_programas.grupo")%></td><%end if%>
<%if op_colegio="si" then%><td>
<%Sql2= "SELECT nombre from extra_colegios WHERE id_colegio="&ob_rs("extra_programas.id_colegio")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%=ob_rs2("nombre")%>
<%end if%>
</td><%end if%>
<%if op_profesor="si" then%><td>
<%Sql2= "SELECT nombre from extra_monitores WHERE id_profesor="&ob_rs("id_monitor")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%=ob_rs2("nombre")%>
<%end if%>
</td><%end if%>
<%if op_actividad="si" then%><td>
<%Sql2= "SELECT nombre from extra_actividades WHERE id_actividad="&ob_rs("id_actividad")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%=ob_rs2("nombre")%>
<%end if%>
</td><%end if%>
<%if op_email="si" then%><td><%=ob_rs("mail_contacto")%></td><%end if%>
<%if op_telefono="si" then%><td><%=ob_rs("telefono_contacto")%></td><%end if%>
<%if op_movil="si" then%><td><%=ob_rs("movil_contacto")%></td><%end if%>
<%if op_cuenta="si" then%><td><%=ob_rs("n_cuenta")%></td><%end if%>
<%if op_imagen="si" then%><td style="text-align:center"><%=ob_rs("acp_imagen")%></td><%end if%>


<%if meses="" then
septiembre_cuenta="si"
octubre_cuenta="si"
noviembre_cuenta="si"
diciembre_cuenta="si"
enero_cuenta="si"
febrero_cuenta="si"
marzo_cuenta="si"
abril_cuenta="si"
mayo_cuenta="si"
junio_cuenta="si"
julio_cuenta="si"
agosto_cuenta="si"
end if%>

<%if op_total="si" then
suma_alumno=0%><td>
<%if ob_rs("septiembre_op") <>"" AND septiembre_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("septiembre_op")),2) end if
if ob_rs("octubre_op") <>"" AND octubre_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("octubre_op")),2) end if
if ob_rs("noviembre_op") <>"" AND noviembre_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("noviembre_op")),2) end if
if ob_rs("diciembre_op") <>"" AND diciembre_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("diciembre_op")),2) end if
if ob_rs("enero_op") <>"" AND enero_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("enero_op")),2) end if
if ob_rs("febrero_op") <>"" AND febrero_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("febrero_op")),2) end if
if ob_rs("marzo_op") <>"" AND marzo_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("marzo_op")),2) end if
if ob_rs("abril_op") <>"" AND abril_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("abril_op")),2) end if
if ob_rs("mayo_op") <>"" AND mayo_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("mayo_op")),2) end if
if ob_rs("junio_op") <>"" AND junio_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("junio_op")),2) end if
if ob_rs("julio_op") <>"" AND julio_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("julio_op")),2) end if
if ob_rs("agosto_op") <>"" AND agosto_cuenta="si" then suma_alumno = cdbl(suma_alumno) + FormatNumber(ccur(ob_rs("agosto_op")),2) end if%>
<%if suma_alumno <> 0 then%> <%= FormatNumber(ccur(suma_alumno),2) %> €<%end if%>
</td><%end if%>
</tr>

<%if ndos="aca" then
if ob_rs("septiembre_op")<>"" then suma_septiembre=ob_rs("septiembre_op") + suma_septiembre end if
if ob_rs("octubre_op")<>"" then suma_octubre=ob_rs("octubre_op") + suma_octubre end if
if ob_rs("noviembre_op")<>"" then suma_noviembre=ob_rs("noviembre_op") + suma_noviembre end if
if ob_rs("diciembre_op")<>"" then suma_diciembre=ob_rs("diciembre_op") + suma_diciembre end if
if ob_rs("enero_op")<>"" then suma_enero=ob_rs("enero_op") + suma_enero end if
if ob_rs("febrero_op")<>"" then suma_febrero=ob_rs("febrero_op") + suma_febrero end if
if ob_rs("marzo_op")<>"" then suma_marzo=ob_rs("marzo_op") + suma_marzo end if
if ob_rs("abril_op")<>"" then suma_abril=ob_rs("abril_op") + suma_abril end if
if ob_rs("mayo_op")<>"" then suma_mayo=ob_rs("mayo_op") + suma_mayo end if
if ob_rs("junio_op")<>"" then suma_junio=ob_rs("junio_op") + suma_junio end if
if ob_rs("julio_op")<>"" then suma_julio=ob_rs("julio_op") + suma_julio end if
if ob_rs("agosto_op")<>"" then suma_agosto=ob_rs("agosto_op") + suma_agosto end if
suma_tot=suma_alumno+suma_tot
end if
ob_rs.movenext
i=i+1
loop%>

</table>
<%if op_total="si" then%>
<div style="width:100%;max-width:550px;border:1px solid #32C5D2;text-align:center;margin:0 auto;padding:20px;margin-top:25px;margin-bottom:0px"><span style="font-size:1.2em;color:#32C5D2">Suma total. </span><span style="font-size:1.2em;color:#F00"><%=FormatNumber(suma_tot,2)%> €</span>
<div style="width:90%;margin-top:25px;padding-top:25px;border-top:1px solid #ddd">
<span style="width:30%;text-align:right;display:inline-block;">Sept:</span> <span style="width:30%;text-align:left;display:inline-block;"><%=FormatNumber(suma_septiembre,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Oct:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_octubre,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Nov:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_noviembre,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Dic:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_diciembre,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Ene:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_enero,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Feb:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_febrero,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Mar:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_marzo,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Abr:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_abril,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">May:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_mayo,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Jun:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_junio,2)%> €</span> <br>
<span style="width:30%;text-align:right;display:inline-block;">Jul:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_julio,2)%> € </span><br>
<span style="width:30%;text-align:right;display:inline-block;">Ago:</span> <span style="width:30%;text-align:left;display:inline-block;"> <%=FormatNumber(suma_agosto,2)%> €</span> <br>
</div>
</div>
<%end if%>

<%else 'NO HAY NINGÚN REGISTRO%>
<div class="alert-danger sin_regstros"><i class="fa fa-check" aria-hidden="true"></i> No hay ningún registro actualmente! </div>
<%end if 'FIN BUCLE TABLA
ob_rs.close
ob_conn.close%></div></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
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
//{orderable: false, targets:   3},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
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
$(".inp_n").tooltip({html:true});</script><script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>