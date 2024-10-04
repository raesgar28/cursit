<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<%op_pagos=request("op_pagos")
op_fech_ini=request("op_fech_ini")
op_fech_fin=request("op_fech_fin")
op_semanas=request("op_semanas")
op_aeropuertos=request("op_aeropuertos")
op_sexo=request("op_sexo")
op_enfermedades=request("op_enfermedades")
op_seg_cancela=request("op_seg_cancela")
op_total=request("op_total")
op_provincia=request("op_provincia")
op_ciudad=request("op_ciudad")
op_pasaporte=request("op_pasaporte")
op_mov_padre=request("op_mov_padre")
op_mov_madre=request("op_mov_madre")
op_nif=request("op_nif")
op_mail=request("op_mail")
op_mail_padre=request("op_mail_padre")
op_mail_madre=request("op_mail_madre")
op_falta=request("op_falta")
op_movil=request("op_movil")
op_movil_sms=request("op_movil_sms")
op_colegio=request("op_colegio")
op_agente=request("op_agente")
op_n_padre=request("op_n_padre")
op_n_madre=request("op_n_madre")
op_transfer=request("op_transfer")
op_cumple=request("op_cumple")
op_direccion=request("op_direccion")
op_medicamentos=request("op_medicamentos")
op_cad_pasaporte=request("op_cad_pasaporte")
op_observaciones=request("op_observaciones")
op_pagado=request("op_pagado")
id_categoria=request("id_categoria")
id_seccion=request("id_seccion")
id_destino=request("id_destino")
id_item=request("id_item")
id_usuario=request("id_usuario")
id_alumno=request("id_alumno")
provincia=request("provincia")
ciudad=request("ciudad")
anyo=request("anyo")
mes=request("mes")
anyo_fact=request("anyo_fact")
id_agente=request("id_agente")
op_opciones=request("op_opciones")
op_seg_medico=request("op_seg_medico")
if anyo<>""then anyo=replace(anyo," ","") end if
if mes<>""then mes=replace(mes," ","") end if
if ciudad<>""then ciudad=replace(ciudad," ","") end if
if provincia<>"" then provincia=replace(provincia,", ",",") end if
pagos=request("pagos")
't=request("t")'lst_fact 'fact
refFact=request("refFact")
refPago=request("refPago")
cod_descuento=request("cod_descuento")
op_observaciones_int=request("op_observaciones_int")

'SELECCION
if id_usuario<>"" or id_agente<>"" then
seleccion = "SELECT * FROM programas, alumnos, usuarios WHERE id_programa IS NOT NULL "
else
if refFact<>"" and t="cont" or t="fact" or t="lst_fact"then
if  t="lst_fact" then
seleccion = "SELECT * FROM programas, alumnos WHERE programas.id_programa"
else
seleccion = "SELECT * FROM programas, alumnos,facturas WHERE programas.id_programa AND facturas.id_programa = programas.id_programa"
end if
else
if t="fact" then
seleccion = "SELECT * FROM programas, alumnos, facturas WHERE (programas.n_factura IS NOT NULL OR facturas.n_factura IS NOT NULL  AND facturas.id_programa = programas.id_programa) "
else
if t="refPago"then
if refPago<>"" then
seleccion = "SELECT * FROM programas, alumnos WHERE (refPago = '"&refPago&"' or refPagoPay='"&refPago&"') "
else
seleccion = "SELECT * FROM programas, alumnos WHERE (refPago IS NOT NULL OR refPagoPay IS NOT NULL) "
end if
else
seleccion = "SELECT * FROM programas, alumnos WHERE id_programa IS NOT NULL"
end if
end if
end if
end if

if id_categoria<>""then 
cadena_rel = split(id_categoria, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (programas.id_categoria = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR programas.id_categoria = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 

if id_seccion<>""then 
seleccion= seleccion &" AND ("
cadena_rel = split(id_seccion, ", ")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" programas.id_seccion LIKE  '%"&cadena_rel(i)&"%' "
else
seleccion= seleccion &" or programas.id_seccion LIKE  '%"&cadena_rel(i)&"%' "
end if
next
seleccion= seleccion &")"
end if 
if id_subseccion<>""then 
cadena_rel = split(id_subseccion, ",")
for i=0 to ubound(cadena_rel)
seleccion= seleccion &" AND programas.id_subseccion = "&cadena_rel(i)&""
next
end if  

if id_item<>""then 
seleccion= seleccion &" AND ("
cadena_rel = split(id_item, ", ")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" programas.id_item LIKE  '%"&cadena_rel(i)&"%' "
else
seleccion= seleccion &" or programas.id_item LIKE  '%"&cadena_rel(i)&"%' "
end if
next
seleccion= seleccion &")"
end if 
if id_usuario<>""then 
cadena_rel = split(id_usuario, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (usuarios.id_usuario = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR usuarios.id_usuario = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if id_agente<>""then 
cadena_rel = split(id_agente, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (usuarios.id_usuario = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR usuarios.id_usuario = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if id_destino<>""then 
cadena_rel = split(id_destino, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (programas.id_destino = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR programas.id_destino = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if id_alumno<>""then 
cadena_rel = split(id_alumno, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (alumnos.id_alumno = "&cadena_rel(i)&""
else
seleccion= seleccion &" OR alumnos.id_alumno = "&cadena_rel(i)&""
end if
next
seleccion= seleccion&")"
end if 
if ciudad<>""then 
cadena_rel = split(ciudad, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (alumnos.a_ciudad = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR alumnos.a_ciudad = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if provincia<>""then 
cadena_rel = split(provincia, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (alumnos.a_provincia = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR alumnos.a_provincia = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if anyo<>""then 
cadena_rel = split(anyo, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (year(f_inicio) = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR year(f_inicio) = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if mes<>""then 
cadena_rel = split(mes, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (month(f_inicio) = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR month(f_inicio) = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if 
if id_usuario<>"" or id_agente<>"" then
seleccion= seleccion &" AND alumnos.id_alumno=programas.id_alumno AND usuarios.id_usuario=programas.id_usuario"
else
seleccion= seleccion &" AND alumnos.id_alumno=programas.id_alumno"
end if 
if pagos<>""then 
pagos_nom=pagos
cadena_rel = split(pagos, ", ")
for i=0 to ubound(cadena_rel)
if i=0 then
if pagos_nom="pendientes" then
seleccion= seleccion &" AND (falta_pagar <> 0 "
else
seleccion= seleccion &" AND (falta_pagar = 0 "
end if
else
if pagos_nom="pendientes" then
seleccion= seleccion &" OR falta_pagar <>0 "
else
seleccion= seleccion &" OR falta_pagar =0 "
end if
end if
next
seleccion= seleccion &")"
end if 
if cod_descuento<>""then 
cadena_rel = split(cod_descuento, ",")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (programas.cod_descuento = '"&cadena_rel(i)&"'"
else
seleccion= seleccion &" OR programas.cod_descuento = '"&cadena_rel(i)&"'"
end if
next
seleccion= seleccion&")"
end if
if refFact<>""then 
refFact_n=refFact
cadena_rel = split(refFact, ", ")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" AND (programas.n_factura = '"&refFact_n&"' "
end if
next
refFact_n=refFact
cadena_rel = split(refFact, ", ")
for i=0 to ubound(cadena_rel)
if i=0 then
seleccion= seleccion &" OR facturas.n_factura = '"&refFact_n&"' "
end if
next
seleccion= seleccion &" )"
else
if t="fact" then
seleccion=seleccion &" AND programas.id_programa=facturas.id_programa AND (programas.n_factura IS NOT NULL OR facturas.n_factura IS NOT NULL) AND (programas.n_factura <>'' OR facturas.n_factura <>'')"
end if
end if                                     '[FIN REQUEST]

if t="fact" and anyo_fact="" then
seleccion ="SELECT * FROM programas, alumnos WHERE programas.id_programa  AND alumnos.id_alumno=programas.id_alumno AND (programas.n_factura IS NOT NULL AND programas.n_factura <>'' )"
end if
if t="fact" and anyo_fact<>"" then
anyo_fact=mid(anyo_fact,3,2)
seleccion ="SELECT * FROM programas, alumnos WHERE (programas.id_programa  AND alumnos.id_alumno=programas.id_alumno) AND INSTR(mid(n_factura,7,2),'"&anyo_fact&"') "
end if%>

<span style="color:#CCC;display:block;margin-bottom:25px">Cadena: <%=seleccion%></span>
<div class="breadcrumbs"><h1>Alumnos | Listado de Alumnos</h1>
<ol class="breadcrumb"><li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li><li><a href="#">Listado</a></li></ol></div>
<div class="row"><div class="col-md-12"><div class="portlet light portlet-fit portlet-datatable bordered"><div class="portlet-title"><div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | Alumnos </span></div><div class="actions"><div class="btn-group"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-share"></i>&nbsp;Exportar <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones"><li><a href="javascript:;" data-action="0" class="tool-action"><i class="icon-printer"></i> Imprimir</a></li><li><a href="javascript:;" data-action="2" class="tool-action"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF</a></li><li><a href="javascript:;" data-action="3" class="tool-action"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel</a></li><li><a href="javascript:;" data-action="4" class="tool-action"><i class="fa fa-file-text-o" aria-hidden="true"></i> CSV</a></li></ul>
</div>
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-action="5" id="columnas"><i class="fa fa-columns" aria-hidden="true"></i>&nbsp;Columnas <i class="fa fa-angle-down"></i></a></div></div></div>
<div class="portlet-body">
<div class="table-container">
<div class="row"><!-- FILTRO FECHAS-->
<%if op_pagado="si" then%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(a) = total facturas anexas <%end if%><%if op_total="si" then%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;En importe total NO se contabiliza el importe de facturas anexas <%end if%><%if op_falta="si" then%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;En falta pagar SI se contabiliza el importe de facturas anexas 
<%end if%>
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="ffin" name="ffin" placeholder="Hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
</div>
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker margin-bottom-5 " data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="fini" name="fini" placeholder="Desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></div>   
</div><!-- FIN FILTRO FECHAS-->
<%Sql= seleccion 
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
<th style="text-align:center">Registro</th>
<%if op_pagos="si" then%><th>Estado</th><%end if%>
<%if op_fech_ini="si" then%><th>F. Inicio</th><%end if%>
<%if op_fech_fin="si" then%><th>F. Fin</th><%end if%>
<%if op_semanas="si" then%><th>Semanas</th><%end if%>
<%if op_aeropuertos="si" then%><th>Aeropuerto</th><%end if%>
<%if op_sexo="si" then%><th>Sexo</th><%end if%>
<%if op_enfermedades="si" then%><th>Enfermedades</th><%end if%>
<%if op_seg_cancela="si" then%><th>Seg. Cancelación</th><%end if%>
<%if op_seg_medico="si" then%><th>Seguro médico</th><%end if%>
<%if op_total="si" then%><th>Imp. Total</th><%end if%>
<%if op_provincia="si" then%><th>Provincia</th><%end if%>
<%if op_ciudad="si" then%><th>Ciudad</th><%end if%>
<%if op_pasaporte="si" then%><th>Pasaporte</th><%end if%>
<%if op_mov_padre="si" then%><th>Móv. Padre</th><%end if%>
<%if op_mov_madre="si" then%><th>Móv. Madre</th><%end if%>
<%if op_movil="si" then%><th>Móv. Alumno</th><%end if%>
<%if op_movil_sms="si" then%><th>Móvil SMS</th><%end if%>
<%if op_nif="si" then%><th>NIF</th><%end if%>
<%if op_mail="si" then%><th>eMail</th><%end if%>
<%if op_mail_padre="si" then%><th>eMail padre</th><%end if%>
<%if op_mail_madre="si" then%><th>eMail madre</th><%end if%>
<%if op_falta="si" then%><th>Falta pagar</th><%end if%>
<%if op_pagado="si" then%><th>Total Pagado</th><%end if%>
<%if t="lst_fact" then%><th style="min-width:85px;text-align:center">Facturado</th><%end if%>
<%if op_colegio="si" then%><th style="min-width:150px;text-align:center">Colegio</th><%end if%>
<%if t="fact"then%><th style="text-align:center;max-width:85px">Fac. principal</th><%end if%>
<%if t="fact" then%><th style="text-align:center">Fac. anexa</th><%end if%>
<%if t="refPago" then%><th style="text-align:center">Ref. pago</th><%end if%>
<%if op_agente="si" then%>
<th>Agente / Usuario</th><%end if%>
<%if op_n_padre="si" then%><th>Padre</th><%end if%>
<%if op_n_madre="si" then%><th>Madre</th><%end if%>
<%if op_transfer="si" then%><th>Transfer</th><%end if%>
<%if op_cumple="si" then%><th>Cumpleaños</th><%end if%>
<%if op_direccion="si" then%><th>Dirección</th><%end if%>
<%if op_medicamentos="si" then%><th>Medicamentos</th><%end if%>
<%if op_cad_pasaporte="si" then%><th>Cad. Pasaporte</th><%end if%>
<%if op_opciones="si" then%><th>Opciones escogidas</th><%end if%>
<%if op_observaciones="si" then%><th>Observaciones</th><%end if%>
<%if op_observaciones_int="si" then%><th>Obs. Internas</th><%end if%>
</tr>
</thead>
<tbody>
<%no_loop=1
do while not ob_rs.eof and no_loop=1
if refFact<>"" or t="fact" then
cod_prog=ob_rs("id_programa")
else
cod_prog=ob_rs("id_programa")
end if
observaciones_tmp=ob_rs("a_observaciones_curso")
id_usuario=ob_rs("id_usuario")
'if t="fact" then%>
<tr>
<td><%=ob_rs("programas.id_alumno")%></td>
<td><%Sql2= "SELECT a_apellidos, a_nombre from alumnos WHERE id_alumno="&ob_rs("programas.id_alumno")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("programas.id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&cod_prog))%><a href="../alumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("programas.id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&cod_prog)%>" style="color:#666">
<i class="fa fa-search-plus" aria-hidden="true"></i> <%=ob_rs2("a_apellidos")%>,&nbsp;<%=ob_rs2("a_nombre")%></a>  
<%end if
ob_rs2.close%>
<%if ob_rs("cancela")="si" then%>
<span style="color:#F00;cursor:pointer;float:right;margin-left:7px"><i class="fa fa-ban inp_n" data-toggle="tooltip" data-placement="top" title="Programa cancelado"></i></span>
<%end if%>
</td>
<td><%Sql2= "SELECT titulo_esp,datos_familia_ob FROM items WHERE id_item="&ob_rs("id_item")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
datos_familia_ob=ob_rs2("datos_familia_ob")%><%end if
ob_rs2.close%><%=ob_rs("nom_item")%></td>
<%fecha_now=FormatDateTime(cdate(ob_rs("programas.fecha_in")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%><td align="center" data-order="<%=fecha_now%>"><%=FormatDateTime(cdate(ob_rs("programas.fecha_in")),2)%></td>
<%if op_pagos="si" then%><td>
<%if ob_rs("suma_total")>ob_rs("falta_pagar") and ob_rs("falta_pagar")<>0 then%>Pendiente<%else%>Pagado<%end if%></td><%end if%>
<%if op_fech_ini="si" then%><%fecha_now=FormatDateTime(cdate(ob_rs("f_inicio")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%><td data-order="<%=fecha_now%>">
<%if year(ob_rs("f_inicio")) <>1000 and year(ob_rs("f_inicio")) <>1111 and year(ob_rs("f_inicio")) <>""  then%>
<%=ob_rs("f_inicio")%>
<%end if%>
</td>
<%end if
fecha_now=""%>
<%if op_fech_fin="si" then%>
<%if year(ob_rs("f_fin")) =1000 or year(ob_rs("f_fin")) =1111 or year(ob_rs("f_fin")) =""  then
f_fin=ob_rs("f_inicio")+ob_rs("semanas") * 7
else
f_fin=ob_rs("f_fin")
end if
fecha_now=FormatDateTime(cdate(f_fin),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%>
<td data-order="<%=fecha_now%>"><%=f_fin%>
</td><%end if%>
<%if op_semanas="si" then%><td style="text-align:center"><%if ob_rs("semanas")=0 then%>-<%else%><%=ob_rs("semanas")%><%end if%></td><%end if%>
<%if op_aeropuertos="si" then%><td style="text-align:center">
<%if ob_rs("id_aeropuerto")<>0 then
Sql2= "SELECT ciudad FROM aeropuertos WHERE id_aeropuerto="&ob_rs("id_aeropuerto")&""   '[ASOCIAMOS CON UN USUARIOS]
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<%=ob_rs2("ciudad")%>
<%else%>-<%end if
else%>-<%end if%>
</td><%end if%>
<%if op_sexo="si" then%><td><%=ob_rs("a_sexo")%></td><%end if%>
<%if op_enfermedades="si" then%><td><%=ob_rs("a_enfermedades")%></td><%end if%>
<%if op_seg_cancela="si" then%><td><%=ob_rs("pr_cancelacion")%></td><%end if%>
<%if op_seg_medico="si" then%><td><%=ob_rs("pr_medico")%></td><%end if%>
<%if op_total="si" then%><td style="text-align:center"><%if ob_rs("suma_total")<>0 then%><%=FormatNumber(ob_rs("suma_total"),2)%> €<%else%> - <%end if%></td><%end if%>
<%if op_provincia="si" then%><td><%=ob_rs("a_provincia")%></td><%end if%>
<%if op_ciudad="si" then%><td><%=ob_rs("a_ciudad")%></td><%end if%>
<%if op_pasaporte="si" then%><td><%=ob_rs("a_pasaporte")%></td><%end if%>
<%if op_mov_padre="si" then%><td><%=ob_rs("a_p_movil")%></td><%end if%>
<%if op_mov_madre="si" then%><td><%=ob_rs("a_m_movil")%></td><%end if%>
<%if op_movil="si" then%><td><%=ob_rs("a_movil")%></td><%end if%>
<%if op_movil_sms="si" then%><td><%=ob_rs("a_movil_sms")%></td><%end if%>
<%if op_nif="si" then%><td><%=ob_rs("a_nif")%></td><%end if%>
<%if op_mail="si" then%><td><%=ob_rs("a_email")%></td><%end if%>
<%if op_mail_padre="si" then%><td><%=ob_rs("a_p_email")%></td><%end if%>
<%if op_mail_madre="si" then%><td><%=ob_rs("a_m_email")%></td><%end if%>



<%if op_falta="si" then%><td style="text-align:center">
<%Sql3= "SELECT precio1,precio2,precio3, total FROM facturas WHERE id_programa="&ob_rs("id_programa")&" and estadoPago<>'Aceptada' or estadoPago IS NULL"   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
p_fact_anex=0
if ob_rs3("total")<>0 then p_fact_anex=p_fact_anex + ob_rs3("total") else p_fact_anex= ob_rs3("precio1") + ob_rs3("precio2") + ob_rs3("precio3") + p_fact_anex end if
ob_rs3.movenext
loop
end if
if p_fact_anex="" then p_fact_anex=0 end if
if p_fact_anex > 0 or ob_rs("falta_pagar") > 0 then%>
<%=FormatNumber(ob_rs("falta_pagar")+ p_fact_anex,2)%> € 
<%else%>
<i class="fa fa-check" aria-hidden="true" style="color:#999"></i>
<%end if%>
</td><%
p_fact_anex=""
end if%>


<%if op_pagado="si" then%><td>
<%if ob_rs("id_programa")<>"" then

p_pagado=0
Sql3= "SELECT pr_cancelacion_pr,precioReserva FROM programas WHERE id_programa="&ob_rs("id_programa")&" and estadoPago='Aceptada'"   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
p_pagado= ob_rs3("pr_cancelacion_pr") + ob_rs3("precioReserva")
end if
if p_pagado<>0 then p_pagado = FormatNumber(p_pagado,2) else p_pagado = 0 end if


p_anticipo=0
Sql3= "SELECT precio FROM programasAnticipos WHERE id_programa="&ob_rs("id_programa")&" and estadoPago='Aceptada'"   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
p_anticipo= p_anticipo + ob_rs3("precio")
ob_rs3.movenext
loop
end if
if p_anticipo<>0 then p_anticipo = FormatNumber(p_anticipo,2) end if


p_total_pagado=CDbl(p_anticipo)+p_pagado
if p_total_pagado<>0 then p_total_pagado = FormatNumber(p_total_pagado,2) end if %>
<%=p_total_pagado%> € 


<%if ob_rs("suma_total") - p_total_pagado <> ob_rs("falta_pagar") then%><br><span style="color:#F00"><%=FormatNumber(ob_rs("suma_total") - p_total_pagado,2)%> €</span><%end if%>

<%p_pagado_anex=0
Sql3= "SELECT precio1,precio2,precio3,precio4, total FROM facturas WHERE id_programa="&ob_rs("id_programa")&" and estadoPago='Aceptada'"   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
p_pagado_anex= ob_rs3("precio1") + ob_rs3("precio2") + ob_rs3("precio3") + ob_rs3("precio4") + p_pagado_anex 
ob_rs3.movenext
loop
end if
end if
if p_pagado_anex<>0 then 
p_pagado_anex = FormatNumber(p_pagado_anex,2)%>
<br><span style="color:#999"><%=p_pagado_anex%> € (a)</span>
<%end if%>
</td>
<%p_fact_anex=""
p_total_pagado=""
p_anticipo=""
p_pagado=""
p_pagado_anex=""
end if%>


<%if t="lst_fact" then%><td style="text-align:center">
<%if ob_rs("id_programa")<>"" then
p_fact_anex=0
Sql3= "SELECT precio1,precio2,precio3, total FROM facturas WHERE id_programa="&ob_rs("id_programa")&""   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
if ob_rs3("total")<>"0" then p_fact_anex=p_fact_anex + ob_rs3("total") else p_fact_anex= ob_rs3("precio1") + ob_rs3("precio2") + ob_rs3("precio3") + p_fact_anex end if
ob_rs3.movenext
loop
end if
end if
pagado=p_fact_anex + ob_rs("suma_total") - ob_rs("falta_pagar")
if pagado<>0 then pagado = FormatNumber(pagado,2)%>
<%=pagado%> €
</td><%
pagado_tot=CDbl(pagado_tot)+CDbl(pagado)
pagado=""
p_fact_anex=""
end if%>




<%if op_colegio="si" then%><td><%=ob_rs("a_colegio")%></td><%end if%>
<%if t="fact" then%><td style="text-align:center">
<%if ob_rs("n_factura")<>"" then%>
<span class="hidden"><%=mid(ob_rs("n_factura"),7,2)&mid(ob_rs("n_factura"),1,6)%></span>
<%=ob_rs("n_factura")%>
<%else%>Sin numerar<%end if%>
</td><%end if%>
<%if t="fact" then%><td style="text-align:center">
<%Sql3= "SELECT n_factura FROM facturas WHERE id_programa="&ob_rs("id_programa")&" "   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<%'if ob_rs("facturas.n_factura")<>"" then%><%'=ob_rs("facturas.n_factura")%><%'else%><%=ob_rs3("n_factura")%><br><%'end if%>
<%ob_rs3.movenext
loop
end if
ob_rs3.close%>
</td><%end if%>
<%if t="refPago" then%><td style="text-align:center"><%if ob_rs("refPago")<>"" then%><%=ob_rs("refPago")%><%else%>-<%end if%></td><%end if%>
<%if op_agente="si" then%><td>
<%if ob_rs("id_agente_cod")<>0 and ob_rs("id_agente_cod")<>"" then
Sql3= "SELECT u_nombre, u_apellidos, u_empresa FROM usuarios WHERE id_usuario="&ob_rs("id_agente_cod")&" "   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("u_nombre")%>&nbsp;<%=ob_rs3("u_apellidos")%>&nbsp;(<%=ob_rs3("u_empresa")%>)
<%end if
end if%>
<%if (ob_rs("id_usuario")<>0 and ob_rs("id_usuario")<>"") and (ob_rs("id_agente_cod")=0 or ob_rs("id_agente_cod")="") then
Sql3= "SELECT u_nombre, u_apellidos, u_empresa FROM usuarios WHERE id_usuario="&ob_rs("id_usuario")&" "   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<%=ob_rs3("u_nombre")%>&nbsp;<%=ob_rs3("u_apellidos")%>&nbsp;(<%=ob_rs3("u_empresa")%>)
<%end if
end if%>
</td><%end if%>
<%if op_n_padre="si" then%><td><%=ob_rs("a_p_nombre")%>&nbsp;<%=ob_rs("a_p_apellidos")%></td><%end if%>
<%if op_n_madre="si" then%><td><%=ob_rs("a_m_nombre")%>&nbsp;<%=ob_rs("a_m_apellidos")%></td><%end if%>
<%if op_transfer="si" then%><td><%Sql3= "SELECT nom_opcion_curso FROM programasop WHERE id_programa="&ob_rs("id_programa")&" and transfer='si'"   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<%=ob_rs3("nom_opcion_curso")%><br>
<%ob_rs3.movenext
loop
end if
ob_rs3.close%></td><%end if%>
<%if op_cumple="si" then%><td style="text-align:center"><%=ob_rs("a_cumple")%></td><%end if%>
<%if op_direccion="si" then%><td><%=ob_rs("a_direccion")%>&nbsp;<%=ob_rs("a_ciudad")%>&nbsp;<%=ob_rs("a_provincia")%>&nbsp;<%=ob_rs("a_pais")%></td><%end if%>
<%if op_medicamentos="si" then%><td><%=ob_rs("a_medicamentos")%></td><%end if%>
<%if op_cad_pasaporte="si" then%><td style="text-align:center"><%=ob_rs("a_pas_cad")%></td><%end if%>
<%if op_opciones="si" then%><td style="text-align:left">
<%Sql3= "SELECT nom_opcion_curso FROM programasOp WHERE id_programa="&ob_rs("id_programa")&" and nom_opcion_curso<>'' and id_itemSubop <> 0"   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
salta="si"
do while not ob_rs3.eof%>
-.<%=ob_rs3("nom_opcion_curso")%><br />
<%ob_rs3.movenext
loop
end if
ob_rs3.close
Sql3= "SELECT nom_opcion_prog FROM programasOp WHERE id_programa="&ob_rs("id_programa")&" and nom_opcion_prog<>'' and id_itemop <> 0"   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
salta="si"
do while not ob_rs3.eof%>
-.<%=ob_rs3("nom_opcion_prog")%><br />
<%ob_rs3.movenext
loop
end if
ob_rs3.close%>
<%Sql3= "SELECT concepto FROM programasOpAdd WHERE id_programa="&ob_rs("id_programa")&" "   '[ASOCIAMOS CON UN PROGRAMA]
Set ob_rs3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
if salta="si"then%><%end if%><%
do while not ob_rs3.eof%>
-.<%=ob_rs3("concepto")%><br>
<%ob_rs3.movenext
loop
end if
ob_rs3.close%>
</td>
<%end if%>
<%if op_observaciones="si" then%><td><%=ob_rs("a_observaciones_curso")%></td><%end if%>
<%if op_observaciones_int="si" then%><td><%=ob_rs("a_observaciones_crm")%></td><%end if%>
</tr>
<%'end if't=fact
ob_rs.movenext
i=i+1
no_loop=no_loop+1
if refFact="" then no_loop=1 end if
loop%></table>
<%if t="lst_fact" then%><div style="width:100%;max-width:550px;border:1px solid #32C5D2;text-align:center;margin:0 auto;padding:20px;margin-top:25px;margin-bottom:0px"><span style="font-size:1.2em;color:#32C5D2">Suma total. </span><span style="font-size:1.2em;color:#F00"><%=FormatNumber(pagado_tot,2)%> €</span></div><%end if%>
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