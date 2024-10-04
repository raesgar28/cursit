<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<%ver=request("ver")
if ver ="" then ver = request_equerystring("ver")
if t ="" then t = request_equerystring("t")%>
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<div class="breadcrumbs">
<h1>Preinscripciones | Gestión Preinscripciones</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><a href="#">Listado Preinscripciones</a></li>
</ol>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit portlet-datatable bordered">
<div class="portlet-title">
<div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | Preinscripciones registradas</span></div>
<div class="actions">
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;Acciones <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos=css&ntres=s&ncuat=&ver=vencidas"))%><a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos=&ntres=s&ncuat=&ver=vencidas")%>" ><i class="fa fa-ban" aria-hidden="true"></i> Ver fuera de plazo</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos=css&ntres=s&ncuat=&ver="))%><a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos=&ntres=s&ncuat=&ver=")%>" ><i class="fa fa-clock-o" aria-hidden="true"></i> Ver todas</a></li>
<li><a href="javascript:bloquearTodas();" ><i class="fa fa-lock" aria-hidden="true"></i> Bloquear</a></li>
<li><a href="javascript:desbloquearTodas();" ><i class="fa fa-unlock" aria-hidden="true"></i> Desbloquear</a></li>
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
<div class="btn-group" style="display:none"><a class="btn sbold green" href="javascript:;" data-action="5" id="columnas"><i class="fa fa-columns" aria-hidden="true"></i>&nbsp;Columnas <i class="fa fa-angle-down"></i></a></div>
</div>
</div>
<div class="portlet-body">
<%if ms="ok_del"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros eliminados con éxito! </div><%end if%>
<%if ms="ok_bloq"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros bloqueados con éxito! </div><%end if%>
<%if ms="ok_desbloq"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros desbloqueados con éxito! </div><%end if%>
<%if ms="ok_env_mail"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Mail reenviado con éxito! </div><%end if%>
<%if ms="ko_env_mail"then%><div class="alert alert-warning"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Hubo algún problema en el reenvío de mails </div><%end if%>
<div class="table-container">
<form name="formulario" action="acciones.asp" method="post" >
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="accion" type="hidden" value="" autocomplete="off"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off"><input name="ver" id="ver" type="hidden" value="<%=ver%>" autocomplete="off">
<div class="row"><!-- FILTRO FECHAS-->
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="ffin" name="ffin" placeholder="Hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
</div>
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker margin-bottom-5 " data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="fini" name="fini" placeholder="Desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></div>
</div><!-- FIN FILTRO FECHAS-->
<%hoy=date
hoy=day(hoy)
if t="" then
if ver="vencidas"then
Sql= "SELECT * from programas_tmp WHERE "&hoy&" - day(fecha_in)  >=3 " 
else
Sql= "SELECT * from programas_tmp"   
end if
else't
if t="fuera_pago"then
Sql= "SELECT * from programas_tmp WHERE "&hoy&" - day(fecha_in) >=3 AND (estadoPago<>'Aceptada' OR estadoPago IS NULL)"   
end if
if t="pago_compl"then
Sql= "SELECT * from programas_tmp WHERE estadoPago='Aceptada'"   
end if
if t="pago_pendiente"then
Sql= "SELECT * from programas_tmp WHERE estadoPago<>'Aceptada' OR estadoPago IS NULL"   
end if
end if't
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
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
<th> Apellidos, Nombre</th>
<th > Programa</th>
<th><span style="width:100%;display:block;text-align:center"> Categoría</span></th>
<th><span style="width:100%;display:block;text-align:center"> Reserva</span></th>
<th><span style="width:100%;display:block;text-align:center">  Pago</span></th>
<th><span style="width:100%;display:block;text-align:center"> Estado</span> </th>
<th><span style="width:100%;display:block;text-align:center"> Ref. Pago</span></th>
<th><span style="width:100%;display:block;text-align:center">  Registro</span> </th>
<th align="center" style="min-width:100px"><span style="width:100%;display:block;text-align:center">Avisos</span></th>
<th class="txt_centro" style="min-width:75px"><span style="width:100%;display:block;text-align:center"> acc.</span> </th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof
observaciones_tmp=ob_rs("a_observaciones_curso")%>
<tr>
<td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_programa")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check"  autocomplete="off"><span></span></label></td>
<td><%Sql2= "SELECT a_apellidos, a_nombre, id_alumno_r from alumnos_tmp WHERE id_alumno="&ob_rs("id_alumno")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_alumno_r=ob_rs2("id_alumno_r")%>
<%=ob_rs2("a_apellidos")%>,&nbsp;<%=ob_rs2("a_nombre")%> 
<%if observaciones_tmp<>"" AND observaciones_tmp<>", " then%><a href="javascript:lanza_info<%=i%>();" style="float:right;color:#32C5D2;margin-left:8px"><i class="fa fa-info-circle" aria-hidden="true"></i></a> 
<script>function lanza_info<%=i%>(){$('#info_tmp<%=i%>').modal('show');}</script>
<div class="modal fade" id="info_tmp<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#32C5D2" aria-hidden="true"></i>  Observaciones del alumno</h4></div>
<div class="modal-body" ><%=observaciones_tmp%> </div>
<div class="modal-footer"><button type="button" class="btn green btn-green" data-dismiss="modal">Ok, leído</button></div></div></div></div>
<%end if
end if
ob_rs2.close%>
<%Sql2= "SELECT u_apellidos, u_nombre, u_empresa FROM usuarios WHERE id_usuario="&ob_rs("id_usuario")&" AND u_agente='si' "   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<a href="#" style="float:right;color:#32C5D2""><i class="fa fa-user-secret inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Agente:&nbsp;<%=ob_rs2("u_nombre")%>&nbsp;<%=ob_rs2("u_apellidos")%>&nbsp;-&nbsp;<%=ob_rs2("u_empresa")%>" style="color:#32C5D2;cursor:pointer"></i></a>
<%end if
ob_rs2.close%>
</td>
<td><%Sql2= "SELECT titulo_esp,datos_familia_ob, pre_medida FROM items WHERE id_item="&ob_rs("id_item")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
datos_familia_ob=ob_rs2("datos_familia_ob")
pre_medida=ob_rs2("pre_medida")
%><%end if
ob_rs2.close%><%=ob_rs("nom_item")%>
</td>
<td align="center"><%Sql2= "SELECT categorias.id_categoria, titulo_esp, titulo_crm_esp FROM rel, categorias WHERE id_item="&ob_rs("id_item")&" AND rel.id_categoria=categorias.id_categoria"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%> 
<%=ob_rs2("titulo_esp")%>
<%end if
ob_rs2.close%></td>
<td align="center"><%if ob_rs("precioReserva")<>"" and ob_rs("precioReserva")<>"0" then%><%=FormatNumber(ccur(ob_rs("precioReserva")),2)%>&nbsp;<%if ob_rs("moneda")="eur"then%>&euro;<%end if%><%end if%> </td>
<td align="center"><%select case ob_rs("metodoPago")
case "pag_transferencia"
metodo="<i class=""fa fa-exchange inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por transferencia"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_tarjeta"
metodo="<i class=""fa fa-credit-card inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por tarjeta de crédito"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_paypal"
metodo="<i class=""fa fa-paypal inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por PayPal"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_oficina"
metodo="<i class=""fa fa-money inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago en metálico"" style=""cursor:pointer;color:#32C5D2""></i>"
end select%><%=metodo%></td>

<td style="text-align:center">
<%if ob_rs("estadoPago")<>"Esperando Presupuesto" AND ob_rs("estadoPago")<>"" then%><%=ob_rs("estadoPago")%><%else%>
<%if pre_medida="si" then%>
Elaborar presupuesto<i class="fa fa-pencil-square-o inp_n" aria-hidden="true" style="color:#F00;margin-left:8px" data-toggle="tooltip" data-placement="top" title="Cliente esperando presupuesto"></i>
<%else%>
Pendiente de formalizar
<%end if%>
<%end if%></td>

<td align="center"><%=ob_rs("refPago")%> <%if ob_rs("refPagoPay")<>""then%>&nbsp;[<%=ob_rs("refPagoPay")%>]<%end if%></td>
<%fecha_now=FormatDateTime(cdate(ob_rs("fecha_in")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%>
<td align="center" data-order="<%=fecha_now%>">
<%if ob_rs("fecha_in")<>""then%><%=FormatDateTime(cdate(ob_rs("fecha_in")),2)%><%end if%>
</td>
<td align="center" class="avisos_lst"><%if DateDiff("d",ob_rs("fecha_in"),date)>=3 and (ob_rs("estadoPago")<>"Aceptada" or isNull(ob_rs("estadoPago")))then%>&nbsp;<i class="fa fa-clock-o inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Plazo de pago vencido" style="color:#F00;cursor:pointer"></i><%else%>&nbsp;<i class="fa fa-clock-o inp_n" aria-hidden="true" style="color:#ddd;"></i><%end if%>
<%if datos_familia_ob="si"then
Sql2= "SELECT a_p_nombre, a_p_apellidos, a_m_nombre, a_m_apellidos, a_p_email, a_p_movil, a_m_email, a_m_movil FROM alumnos_tmp WHERE id_alumno="&ob_rs("id_alumno")&" "   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
if (isNull(ob_rs2("a_p_nombre")) or ob_rs2("a_p_nombre")="") and (isNull(ob_rs2("a_m_nombre")) or ob_rs2("a_m_nombre")="") then falla_dato="si" end if
if (isNull( ob_rs2("a_p_apellidos")) or  ob_rs2("a_p_apellidos")="") and (isNull(ob_rs2("a_m_apellidos")) or ob_rs2("a_m_apellidos")="") then falla_dato="si" end if
if (isNull(ob_rs2("a_p_email")) or ob_rs2("a_p_email")="") and (isNull(ob_rs2("a_m_email")) or ob_rs2("a_m_email")="") then falla_dato="si" end if
if (isNull(ob_rs2("a_p_movil")) or ob_rs2("a_p_movil")="") and (isNull(ob_rs2("a_p_movil")) or ob_rs2("a_p_movil")="") then falla_dato="si" end if
end if
ob_rs2.close
if falla_dato="si"then
Sql2= "SELECT a_p_nombre, a_p_apellidos, a_m_nombre, a_m_apellidos, a_p_email, a_p_movil, a_m_email, a_m_movil FROM alumnos WHERE id_alumno="&id_alumno_r&" "   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
if (isNull(ob_rs2("a_p_nombre")) or ob_rs2("a_p_nombre")="") and (isNull(ob_rs2("a_m_nombre")) or ob_rs2("a_m_nombre")="") then falla_dato2="si" end if
if (isNull( ob_rs2("a_p_apellidos")) or  ob_rs2("a_p_apellidos")="") and (isNull(ob_rs2("a_m_apellidos")) or ob_rs2("a_m_apellidos")="") then falla_dato2="si" end if
if (isNull(ob_rs2("a_p_email")) or ob_rs2("a_p_email")="") and (isNull(ob_rs2("a_m_email")) or ob_rs2("a_m_email")="") then falla_dato2="si" end if
if (isNull(ob_rs2("a_p_movil")) or ob_rs2("a_p_movil")="") and (isNull(ob_rs2("a_p_movil")) or ob_rs2("a_p_movil")="") then falla_dato2="si" end if
else
falla_dato2="si"
end if
ob_rs2.close
end if
datos_familia_ob=""
end if
if falla_dato="si" AND falla_dato2="si" then%>
<i class="fa fa-users inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Faltan datos familiares para este programa" style="color:#F00;cursor:pointer"></i>
<%else%>
<i class="fa fa-users" aria-hidden="true" style="color:#ddd"></i>
<%end if
falla_dato=""
falla_dato2=""
Sql2= "SELECT alumnos_archivos_tmp.id_archivo, alumnos_archivos_tmp.id_alumno, archivos_tmp.id_archivo FROM alumnos_archivos_tmp, archivos_tmp WHERE alumnos_archivos_tmp.id_alumno="&ob_rs("id_alumno")&" AND alumnos_archivos_tmp.id_archivo=alumnos_archivos_tmp.id_archivo"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
num_doc_tmp=ob_rs2.RecordCount
end if
ob_rs2.close
if id_alumno_r<>""then
Sql2= "SELECT alumnos_archivos.id_archivo, alumnos_archivos.id_alumno, archivos.id_archivo FROM alumnos_archivos, archivos WHERE alumnos_archivos.id_alumno="&id_alumno_r&" AND alumnos_archivos.id_archivo=alumnos_archivos.id_archivo"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
num_doc=ob_rs2.RecordCount
end if
ob_rs2.close
end if

if num_doc_tmp="4" or num_doc="4" then%>
<i class="fa fa-files-o" aria-hidden="true" style="color:#ccc;"></i>
<%else%>
<i class="fa fa-files-o inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Faltan archivos (DNI o Pasaporte) escaneados" style="color:#F00;cursor:pointer"></i>
<%end if
num_doc_tmp=""
num_doc=""%>
<%if ob_rs("bloqueada")="si"then%><i class="fa fa-lock" aria-hidden="true" style="color:#ddd"></i><%else%><i class="fa fa-unlock-alt inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Plaza desbloqueada" style="color:#F00;cursor:pointer"></i><%end if%>
<%if ob_rs("guardado")="si"then%><i class="fa fa-floppy-o inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Datos modificados por comercial" style="color:#32C5D2;cursor:pointer"></i><%else%><i class="fa fa-floppy-o" aria-hidden="true" style="color:#ddd;cursor:pointer"></i><%end if%>
<%if ob_rs("cod_descuento")<>""then%><i class="fa fa-tags inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Descuento [<%=ob_rs("cod_descuento")%>] aplicado" style="color:#32C5D2;cursor:pointer"></i><%else%><i class="fa fa-tags" aria-hidden="true" style="color:#ddd;cursor:pointer"></i><%end if%>
</td>
<td>
<div class="btn-group" id="col_rel">
<a class="btn btn-xs green dropdown-toggle" href="javascript:;" data-toggle="dropdown" >Acciones<i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones" >
<%if ob_rs("bloqueada")="si"then%><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_programa")&"&ver="&ver))%>
<li><a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_programa")&"&ver="&ver)%>" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Alta / Gestión</a></li>
<li class="divider"></li><%end if%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=desbloq&ver="&ver))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=desbloq&ver="&ver)%>&" ><i class="fa fa-unlock-alt" aria-hidden="true"></i> Desbloquear</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=bloq&ver="&ver))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=bloq&ver="&ver)%>&"  ><i class="fa fa-lock" aria-hidden="true"></i> Bloquear</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=env_mail&ver="&ver))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=env_mail&ver="&ver)%>&" ><i class="fa fa-envelope-o" aria-hidden="true"></i> Reenviar mail <i class="fa fa-share" aria-hidden="true"></i></a></li>
<li><a href="../<%=r%>web/pr_pdf_preins.asp?id_programa=<%=ob_rs("id_programa")%>" ><i class="fa fa-download" aria-hidden="true" ></i> Descargar Preinscripción</a></li>
<li class="divider"></li>
<li><a href="javascript:eliminarUna<%=i%>(<%=ob_rs("id_programa")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
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
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_programa")%>&accion=del';}</script>
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
<div class="modal fade" id="confirmaBloquea" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas BLOQUEAR el o los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarBloquea();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="confirmaDesbloquea" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas DESBLOQUEAR el o los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarDesbloquea();">Confirmar</button>
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
var iStartDateCol = 8;                              // INDICA COLUMNA PARA BUSCAR FECHA
var iEndDateCol = 8;                               // INDICA COLUMNA PARA BUSCAR FECHA
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
{orderable: false, targets:   10},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
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
"dom": "<'row' <'col-md-5'B>><'table-scrollable't><'row' <'col-md-12'>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", 
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
$(".inp_n").tooltip({html:true});
</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>