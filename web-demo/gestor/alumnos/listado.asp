<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<%anyo_act=request_equerystring("anyo_act")
vision=request_equerystring("vision")
if anyo_act<>"" then
session("anyo_act")=anyo_act
anyo_act=anyo_act
else
anyo_act=session("anyo_act")
end if
if anyo_act=""then anyo_act=year(date)end if
if vision<>"" then
session("vision")=vision
vision=vision
else
vision=session("vision")
end if
Sql= "SELECT titulo_crm_esp,id_categoria from categorias where id_categoria="&cod_cat&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tit_categoria=ob_rs("titulo_crm_esp")
end if
ob_rs.close%>
<div class="breadcrumbs">
<h1>Alumnos | Gestión de <%=tit_categoria%></h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><a href="#">Listado <%=tit_categoria%></a></li>
</ol>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit portlet-datatable bordered">
<div class="portlet-title">
<div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | Alumnos registrados <%if anyo_act="1000" then%>(todos los años)<%else%>(solo <%=year(date)%> y <%=year(date)-1%>)<%end if%></span></div>
<div class="actions">
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;Acciones <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act=1000&cod_cat="&cod_cat))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act=1000&cod_cat="&cod_cat)%>" ><i class="fa fa-calendar-minus-o" aria-hidden="true"></i> Ver años anteriores a <%=year(date)-1%></a></li>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act=0&cod_cat="&cod_cat)%>" ><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Ver recientes</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&vision=3&cod_cat="&cod_cat))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&vision=3&cod_cat="&cod_cat)%>" ><i class="fa fa-eye" aria-hidden="true"></i> Ver datos completos</a></li>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&vision=0&cod_cat="&cod_cat)%>" ><i class="fa fa-eye-slash" aria-hidden="true"></i> Ver datos básicos</a></li>
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
<%if ms="ok_del"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros eliminados con éxito!</div><%end if%>
<%if ms="ok_env_mail"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Mail reenviado con éxito! </div><%end if%>
<%if ms="ko_env_mail"then%><div class="alert alert-warning"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Hubo algún problema en el reenvío de mails </div><%end if%>
<%if ms="ok_del_prog"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Programa eliminado de manera definitiva con éxito!</div><%end if%>
<div class="table-container">
<form name="formulario" action="acciones.asp" method="post" >
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="accion" type="hidden" value="" autocomplete="off"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off"><input name="ver" id="ver" type="hidden" value="<%=ver%>" autocomplete="off"><input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<div class="row"><!-- FILTRO FECHAS-->
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="ffin" name="ffin" placeholder="Hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
</div>
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker margin-bottom-5 " data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="fini" name="fini" placeholder="Desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></div>   
</div><!-- FIN FILTRO FECHAS-->
<%anyo_pas=year(date)-2
if anyo_act=1000 then
Sql= "SELECT * from programas WHERE id_categoria="&cod_cat&" and year(fecha_in)>= "&anyo_act&" and year(fecha_in)<= "&anyo_pas&"  ORDER BY fechaPago DESC"  
else
Sql= "SELECT * from programas WHERE id_categoria="&cod_cat&" and  year(fecha_in)>= "&anyo_pas+1&" ORDER BY fechaPago DESC"  
end if
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
<th> Programa</th>
<%if vision="3" then%>
<th> Total</th>
<th align="center" style="min-width:100px"> Pagado</th>
<th> Último Pago</th>
<th>Pago</th>
<th>Estado</th>
<th> Ref. Pago</th>
<%end if%>
<th>  Registro </th>
<%if vision="3" then%>
<th align="center" style="min-width:100px">Avisos</th>
<%end if%>
<th class="txt_centro" style="min-width:75px">&nbsp;</th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof
cod_prog=ob_rs("id_programa")
observaciones_tmp=ob_rs("a_observaciones_curso")
id_usuario=ob_rs("id_usuario")
'cancela=ob_rs("cancela")%>
<tr>
<td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_programa")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check"  autocomplete="off"><span></span></label></td>
<td><%Sql2= "SELECT a_apellidos, a_nombre from alumnos WHERE id_alumno="&ob_rs("id_alumno")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%><%=ob_rs2("a_apellidos")%>,&nbsp;<%=ob_rs2("a_nombre")%>
<%if ob_rs("cancela")="si" then%>
<span style="color:#F00;cursor:pointer;float:right;margin-left:7px"><i class="fa fa-ban inp_n" data-toggle="tooltip" data-placement="top" title="Programa cancelado"></i></span>
<%end if%>
 
<%if ob_rs("eliminado")="si" then%>
<a href="javascript:eliminarUnaDef<%=i%>(<%=ob_rs("id_programa")%>);" style="color:#ccc;cursor:pointer;float:right"><i class="fa fa-trash inp_n" data-toggle="tooltip" data-placement="top" title="Programa eliminado   Eliminar definitivamente"></i></a>

<div class="modal fade" id="confirmaEliminaUnaDef<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el registro seleccionado?<br>Ten en cuenta que no podrás recuperarlo de ninguna manera.</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaUnaDef_ok<%=i%>();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function eliminarUnaDef<%=i%>(){$('#confirmaEliminaUnaDef<%=i%>').modal('show');}
function confirmarEliminaUnaDef_ok<%=i%>(){$('#confirmaEliminaUnaDef<%=i%>').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_programa")%>&accion=del_def&cod_cat=<%=cod_cat%>';}</script>
<%end if%><%if observaciones_tmp<>"" AND observaciones_tmp<>", " then%><a href="javascript:lanza_info<%=i%>();" style="float:right;color:#32C5D2"><i class="fa fa-info-circle" aria-hidden="true"></i></a> 
<script>function lanza_info<%=i%>(){$('#info_tmp<%=i%>').modal('show');}</script>
<div class="modal fade" id="info_tmp<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#32C5D2" aria-hidden="true"></i>  Observaciones del alumno</h4></div>
<div class="modal-body" ><%=observaciones_tmp%> </div>
<div class="modal-footer"><button type="button" class="btn green btn-green" data-dismiss="modal">Ok, leído</button></div></div></div></div>
<%end if
end if
ob_rs2.close%></td>
<td><%Sql2= "SELECT titulo_esp,datos_familia_ob FROM items WHERE id_item="&ob_rs("id_item")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
datos_familia_ob=ob_rs2("datos_familia_ob")%><%end if
ob_rs2.close%><%=ob_rs("nom_item")%></td>
<%if vision="3" then
pagado=ob_rs("pr_cancelacion_pr")
if ob_rs("precioReserva")<>"" then pagado=pagado+ob_rs("precioReserva") end if
fecha_pago_prog=ob_rs("fechaPago")
ultimo_pago=pagado
ultimo_estado=ob_rs("estadoPago")
ultimo_metodo=ob_rs("metodoPago")
suma_total=ob_rs("suma_total")
suma_facturas=0
'SUMAMOS A SUMA TOTAL LAS FACTURAS
Sql2= "SELECT total,gen_ajuste,fac_ajuste, fecha_pago, estadoPago FROM facturas WHERE id_programa="&ob_rs("id_programa")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
if gen_ajuste="si" then suma_facturas=suma_facturas+ob_rs2("fac_ajuste") else suma_facturas=suma_facturas+ob_rs2("total") end if
fecha_pago_fac=ob_rs2("fecha_pago")
if fecha_pago_fac> fecha_pago_prog then 
ultimo_pago=ob_rs2("total")
ultimo_estado=ob_rs2("estadoPago")
ultimo_metodo=ob_rs2("metodoPago")
end if
if ob_rs2("estadoPago")="Aceptada" then pagado = pagado + ob_rs2("total") end if
ob_rs2.movenext
loop
end if
ob_rs2.close
suma_total=CDbl(suma_total)+CDbl(suma_facturas)
'DE ANTICIPOS
suma_anticipos=0
pag_ant=0
Sql2= "SELECT precio,fecha,pagado, estadoPago,metodoPago FROM programasAnticipos WHERE id_programa="&ob_rs("id_programa")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
if ob_rs2("estadoPago")="Aceptada" or ob_rs2("pagado")="si" then  suma_anticipos=suma_anticipos+ob_rs2("precio") end if
fecha_pago_ant=ob_rs2("fecha")
if fecha_pago_ant> fecha_pago_prog and fecha_pago_ant> fecha_pago_prog then 
ultimo_pago=ob_rs2("precio")
ultimo_estado=ob_rs2("estadoPago")
ultimo_metodo=ob_rs2("metodoPago")
end if
if ob_rs2("estadoPago")="Aceptada" or ob_rs2("pagado")="si" then pag_ant=suma_anticipos end if
ob_rs2.movenext
loop
end if
ob_rs2.close
pagado=pag_ant+pagado%>
<td align="center"><%if suma_total<>"0"then%><%=FormatNumber(ccur(suma_total),2)%>&nbsp;<%if ob_rs("moneda")="eur"then%>&euro;<%end if%><%end if%> </td>
<%'VEMOS QUE HA PAGADO 'PAGADO DE FACTURAS ANEXAS
pag_factur=0
Sql2= "SELECT total,fac_ajuste,gen_ajuste FROM facturas WHERE id_programa="&ob_rs("id_programa")&" and estadoPago<>'Aceptada'"   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
if gen_ajuste="si" then pag_factur=pag_factur+ob_rs2("precio1") else pag_factur=pag_factur+ob_rs2("total") end if
ob_rs2.movenext
loop
else
factur="no"
end if
ob_rs2.close
falta_pagar=ob_rs("falta_pagar")+pag_factur
if ob_rs("id_item")=0 then pagado=suma_total end if%>
<td align="center"><span style="float:left;display:inline-block;width:45px;text-align:right;margin-right:0px;"><%=FormatNumber(ccur(pagado),2)%><%if ob_rs("moneda")="eur"then%>&nbsp;&euro;<%end if%></span><span style="font-size:0.8em;color:#bbb;float:right"><%=FormatNumber(ccur(falta_pagar),2)%>&nbsp;<%if ob_rs("moneda")="eur"then%>&euro;<%end if%></span></td>
<td align="center">
<%if ultimo_pago<>""then%><%=FormatNumber(ccur(ultimo_pago),2)%><%if ob_rs("moneda")="eur"then%>&nbsp;&euro;<%end if%><%else%>-<%end if%>
<%factur=""
pag_factur=""
suma_facturas=""%>
</td>
<td align="center"><%select case ultimo_metodo
case "pag_transferencia"
metodo="<i class=""fa fa-exchange inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por transferencia"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_tarjeta"
metodo="<i class=""fa fa-credit-card inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por tarjeta de crédito"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_paypal"
metodo="<i class=""fa fa-paypal inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por PayPal"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_oficina"
metodo="<i class=""fa fa-money inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago en metálico"" style=""cursor:pointer;color:#32C5D2""></i>"
end select%><%=metodo%></td>
<td align="center"><%=ob_rs("estadoPago")%></td>
<td align="center"><%=ob_rs("refPago")%></td>
<%end if
fecha_now=FormatDateTime(cdate(ob_rs("fecha_in")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%>
<td align="center" data-order="<%=fecha_now%>"><%=FormatDateTime(cdate(ob_rs("fecha_in")),2)%></td>
<%if vision="3" then%>
<td align="center" class="avisos_lst"><%if DateDiff("d",date,ob_rs("f_inicio"))<=28 and falta_pagar <>0 then%>&nbsp;<i class="fa fa-clock-o inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Pago incompleto - Fecha inicio próxima (<%=ob_rs("f_inicio")%>)" style="color:#F00;cursor:pointer"></i><%else%>&nbsp;<i class="fa fa-clock-o inp_n" aria-hidden="true" style="color:#ddd;"></i><%end if%>
<%if datos_familia_ob="si"then
Sql2= "SELECT a_p_nombre, a_p_apellidos, a_m_nombre, a_m_apellidos, a_p_email, a_p_movil, a_m_email, a_m_movil FROM alumnos WHERE id_alumno="&ob_rs("id_alumno")&" "   
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
if falla_dato2="si" then%>
<i class="fa fa-users inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Faltan datos familiares para este programa" style="color:#F00;cursor:pointer"></i>
<%else%>
<i class="fa fa-users" aria-hidden="true" style="color:#ddd"></i>
<%end if
falla_dato=""
falla_dato2=""
Sql2= "SELECT alumnos_archivos.id_archivo, alumnos_archivos.id_alumno, archivos.id_archivo, archivos.tipo FROM alumnos_archivos, archivos WHERE (alumnos_archivos.id_alumno="&ob_rs("id_alumno")&" AND alumnos_archivos.id_archivo=alumnos_archivos.id_archivo)   " 'OR  alumnos.id_alumno="&id_alumno_r&"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<i class="fa fa-files-o" aria-hidden="true" style="color:#ccc;"></i>
<%else%>
<i class="fa fa-files-o inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Faltan archivos (DNI o Pasaporte) escaneados" style="color:#F00;cursor:pointer"></i>
<%end if
ob_rs2.close
Sql2= "SELECT id_categoria, id_seccion, id_destino,id_item,id_alumno FROM programas WHERE id_programa="&cod_prog&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_destino=ob_rs2("id_destino")
id_categoria=ob_rs2("id_categoria")
id_seccion=ob_rs2("id_seccion")
id_item=ob_rs2("id_item")
id_alumno=ob_rs("id_alumno")
end if
ob_rs2.close
if id_item<>0 then
Sql2= "SELECT id_categoria FROM rel WHERE id_item="&id_item&" and id_categoria<>0"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_categoria=ob_rs2("id_categoria")
end if
ob_rs2.close
Sql2= "SELECT id_destino FROM rel WHERE id_item="&id_item&" and id_destino<>0 "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_destino=ob_rs2("id_destino")
end if
ob_rs2.close
Sql2= "SELECT id_seccion FROM rel WHERE id_item="&id_item&" and id_seccion<>0"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
id_seccion=ob_rs2("id_seccion")
end if
ob_rs2.close
Sql2= "SELECT catDocumentacion.id_catDocumentacion FROM catDocumentacion, catDocumentacion_rel WHERE (id_alumno="&ob_rs("id_alumno")&" OR id_item="&id_item&" OR id_usuario="&id_usuario&" OR id_categoria="&id_categoria&" OR id_destino="&id_destino&" OR id_seccion="&id_seccion&") AND catDocumentacion.id_catDocumentacion=catDocumentacion_rel.id_catDocumentacion "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
num_arch_in=0
do while not ob_rs2.eof
'VEMOS SI EL ALUMNO TIENE ESTA DOCUMENTACION SUBIDA
Sql3= "SELECT id_catDocumentacion, id_alumno,archivo FROM alumnosDocumentacion WHERE id_alumno="&id_alumno&" AND id_catDocumentacion="&ob_rs2("id_catDocumentacion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
num_arch_in=num_arch_in+1
end if
ob_rs2.movenext
loop
end if
ob_rs2.close
Sql2= "SELECT titulo_esp, texto_esp, email, catDocumentacion.id_catDocumentacion,id_catDocumentacion_rel,disponible FROM catDocumentacion, catDocumentacion_rel WHERE (id_alumno="&id_alumno&" OR id_item="&id_item&" OR id_usuario="&id_usuario&" OR id_categoria="&id_categoria&" OR id_destino="&id_destino&" OR id_seccion="&id_seccion&") AND catDocumentacion.id_catDocumentacion=catDocumentacion_rel.id_catDocumentacion and disponible='si' "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
doc=1
num_arch=ob_rs2.recordcount
num_arch_in=num_arch-num_arch_in
end if
ob_rs2.close%>
<%if num_arch_in<>"" then
if num_arch_in>0 then%><span style="font-size:0.0em;color:#fff">a</span><i class="fa fa-folder-open inp_n" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="Faltan <%=num_arch_in%> documento<%if num_arch_in>1 then%>s<%end if%> por subir" style="color:#F00;cursor:pointer"></i><%else%><i class="fa fa-folder-o" aria-hidden="true" style="color:#ccc;"></i><%end if%>
<%else%>
<i class="fa fa-folder-o" aria-hidden="true" style="color:#ccc;"></i>
<%end if%>
</td>
<%end if
num_arch_in=""
id_item=""
id_categoria=""
id_seccion=""
id_destino=""
id_alumno=""
num_arch=""
end if%>
<td><div class="coje_acc" >
<div class="btn-group" id="col_rel">
<a class="btn btn-xs green dropdown-toggle" href="javascript:;" data-toggle="dropdown" >Acciones<i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones" >
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa")))%>
<li><a href="gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_alumno")&"&ver="&ver&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa"))%>" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Gestión</a></li>
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=env_mail&ver="&ver&"&cod_cat="&cod_cat))%>
<li><a href="acciones.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=env_mail&ver="&ver&"&cod_cat="&cod_cat)%>&" ><i class="fa fa-envelope-o" aria-hidden="true"></i> Reenviar mail <i class="fa fa-share" aria-hidden="true"></i></a></li>
<li><a href="../<%=r%>web/pr_pdf_preins.asp?id_programa=<%=ob_rs("id_programa")%>&s=crm&cod_cat=<%=cod_cat%>" ><i class="fa fa-download" aria-hidden="true" ></i> Descargar Preinscripción</a></li>
<li class="divider"></li>
<li><a href="javascript:eliminarUna<%=i%>(<%=ob_rs("id_programa")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li>
</ul></div></div></td></tr><!--MODAL ELIMINAR UN SOLO REGISTRO-->
<div class="modal fade" id="confirmaEliminaUna<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el registro seleccionado?</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaUna_ok<%=i%>();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function eliminarUna<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('show');}
function confirmarEliminaUna_ok<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_programa")%>&accion=del&cod_cat=<%=cod_cat%>';}</script>
<!--FIN MODAL ELIMINAR UN SOLO REGISTRO-->
<%ob_rs.movenext
i=i+1
loop%></tbody></table>
<%else 'NO HAY NINGÚN REGISTRO%>
<div class="alert-danger sin_regstros"><i class="fa fa-check" aria-hidden="true"></i> No hay ningún registro actualmente! </div>
<%end if 'FIN BUCLE TABLA
ob_rs.close
ob_conn.close%></form></div></div></div></div></div><!--MODALES--><div class="modal fade" id="confirmaElimina" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content">
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
<%if vision="3" then%>
var iStartDateCol = 9;                              // INDICA COLUMNA PARA BUSCAR FECHA
var iEndDateCol = 9;                               // INDICA COLUMNA PARA BUSCAR FECHA
<%else%>
var iStartDateCol = 3;                              // INDICA COLUMNA PARA BUSCAR FECHA
var iEndDateCol = 3;                               // INDICA COLUMNA PARA BUSCAR FECHA
<%end if%>
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
{orderable: false, targets:   4},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
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
<%if vision="3" then%>
"order": [[9, 'des']],
<%else%>
"order": [[3, 'des']],
<%end if%>
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
}}}<%end if%>$(".inp_n").tooltip({html:true});</script><script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>