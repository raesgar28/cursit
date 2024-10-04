<!--#include file="../comun/menu_sup.asp"--> 
<!--#include file="../../conex/conex_back.asp"-->
<%verp=request("verp")
if verp ="" then verp = request_equerystring("verp")%>
<link href="<%=r%>lib/css/plugins.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<%anyo_act2=request_equerystring("anyo_act2")
if anyo_act2="" then anyo_act2=year(date) end if%>
<div class="breadcrumbs">
<h1>Alumnos | Listado de pagos</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><a href="#">Listado <%=tit_categoria%></a></li>
</ol>
</div>
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit portlet-datatable bordered">
<div class="portlet-title">
<div class="caption"><i class="icon-settings font-green"></i><span class="caption-subject font-green sbold uppercase">Listado | Pagos <%if anyo_act2="1000" then%>(todos los años)<%else%>(solo <%=year(date)%>)<%end if%></span></div>
<div class="actions">
<div class="btn-group"><a class="btn sbold green" href="javascript:;" data-toggle="dropdown"><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;Acciones <i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right">
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=1000&cod_cat="&cod_cat&"&t="&t&"&verp="&verp))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=1000&cod_cat="&cod_cat&"&t="&t&"&verp="&verp)%>" ><i class="fa fa-calendar-minus-o" aria-hidden="true"></i> Ver años anteriores a <%=year(date)%></a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=&cod_cat="&cod_cat&"&t="&t&"&verp="&verp))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=&cod_cat="&cod_cat&"&t="&t&"&verp="&verp)%>" ><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Ver solo <%=year(date)%></a></li>

<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=1000&cod_cat="&cod_cat&"&t="&t&"&verp=arch"))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=&cod_cat="&cod_cat&"&t="&t&"&verp=arch")%>" ><i class="fa fa-archive" aria-hidden="true"></i> Ver archivados</a></li>

<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=1000&cod_cat="&cod_cat&"&t="&t&"&verp="))%>
<li><a href="listado.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&anyo_act2=&cod_cat="&cod_cat&"&t="&t&"&verp=")%>" ><i class="fa fa-archive" aria-hidden="true" style="color:#ccc"></i> Ver no archivados</a></li>

<li class="divider"></li>
<li><a href="javascript:archivarTodas();" ><i class="fa fa-archive" aria-hidden="true"></i> Archivar</a></li>
<li><a href="javascript:desarchivarTodas();" ><i class="fa fa-archive" aria-hidden="true" style="color:#ccc"></i> Desarchivar</a></li>
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
<%if ms="arch"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros archivados con éxito!</div><%end if%>
<%if ms="desarch"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Registros desarchivados con éxito!</div><%end if%>
<div class="table-container">
<form name="formulario" action="acciones.asp" method="post" ><input name="t" type="hidden" value="<%=t%>"><input name="verp" type="hidden" value="<%=ver%>"><input name="anyo_act" type="hidden" value="<%=anyo_act%>">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="accion" type="hidden" value="" autocomplete="off"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off"><input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<div class="row"><!-- FILTRO FECHAS-->
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="ffin" name="ffin" placeholder="Hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
</div>
<div class="col-md-2 col-xs-6 pull-right"><div class="input-group date date-picker margin-bottom-5 " data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="fini" name="fini" placeholder="Desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></div>   
</div><!-- FIN FILTRO FECHAS-->
<%anyo_pas=year(date)-1
if anyo_act2=1000 then
if verp="arch"then
Sql= "SELECT id_alumno,id_item,refpago,n_factura,estadoPago,metodoPago,fechaPago,refPagoPay,pr_cancelacion_pr,precioreserva,completado,id_categoria,id_programa,nom_curso,falta_pagar,fecha_in, cancela from programas WHERE  year(fecha_In)>= "&anyo_act2&" and year(fecha_in)<= "&anyo_pas&" and precio_cur<>null and precio_cur IS NOT NULL and archivado='si'" 
else
Sql= "SELECT id_alumno,id_item,refpago,n_factura,estadoPago,metodoPago,fechaPago,refPagoPay,pr_cancelacion_pr,precioreserva,completado,id_categoria,id_programa,nom_curso,falta_pagar,fecha_in, cancela from programas WHERE  year(fecha_In)>= "&anyo_act2&" and year(fecha_in)<= "&anyo_pas&" and precio_cur<>null and precio_cur IS NOT NULL and (archivado='' or archivado IS NULL ) " 
end if
else
if verp="arch"then
Sql= "SELECT id_alumno,id_item,refpago,n_factura,estadoPago,metodoPago,fechaPago,refPagoPay,pr_cancelacion_pr,precioreserva,completado,id_categoria,id_programa,nom_curso,falta_pagar,fecha_in, cancela from programas WHERE  year(fecha_In)>= "&anyo_act2&" and precio_cur<>null and precio_cur IS NOT NULL and archivado='si'" 
else
Sql= "SELECT id_alumno,id_item,refpago,n_factura,estadoPago,metodoPago,fechaPago,refPagoPay,pr_cancelacion_pr,precioreserva,completado,id_categoria,id_programa,nom_curso,falta_pagar,fecha_in, cancela from programas WHERE  year(fecha_In)>= "&anyo_act2&" and precio_cur<>null and precio_cur IS NOT NULL and (archivado='' or archivado IS NULL ) " 
end if
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
<th> Total</th>
<th align="center" style="min-width:100px">Operación</th>
<th> Ref.Pago</th>
<th>Método</th>
<th>Concepto</th>
<th>Falta pagar</th>
<th>  Fecha Pago</th>
<th class="txt_centro" style="min-width:75px">&nbsp;</th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof
cod_prog=ob_rs("id_programa")
if t="lst_all" then
pasa="si"
else
if t="lst_ko" then'lst_ko
Sql2= "SELECT id_programa FROM programas WHERE id_programa="&ob_rs("id_programa")&" AND estadoPago<>'Aceptada'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
pasa="si"
else
pasa=""
end if
ob_rs2.close
if pasa<>"si" then
Sql2= "SELECT id_programa FROM programasAnticipos WHERE id_programa="&ob_rs("id_programa")&" AND estadoPago<>'Aceptada'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
pasa="si"
else
pasa=""
end if
ob_rs2.close
end if
if pasa<>"si" then
Sql2= "SELECT id_programa FROM facturas WHERE id_programa="&ob_rs("id_programa")&" AND estadoPago<>'Aceptada'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
pasa="si"
else
pasa=""
end if
ob_rs2.close
end if
end if 'lst_ko
if t="lst_ok" then'lst_OK
Sql2= "SELECT id_programa FROM programas WHERE id_programa="&ob_rs("id_programa")&" AND estadoPago='Aceptada'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
pasa="si"
else
pasa=""
end if
ob_rs2.close
if pasa<>"si" then
Sql2= "SELECT id_programa FROM programasAnticipos WHERE id_programa="&ob_rs("id_programa")&" AND estadoPago='Aceptada'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
pasa="si"
else
pasa=""
end if
ob_rs2.close
end if
if pasa<>"si" then
Sql2= "SELECT id_programa FROM facturas WHERE id_programa="&ob_rs("id_programa")&" AND estadoPago='Aceptada'" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
pasa="si"
else
pasa=""
end if
ob_rs2.close
end if
end if 'lst_OK
end if'else lst_all
if pasa="si" then%>
<tr>
<%Sql2= "SELECT a_nombre,a_apellidos FROM alumnos WHERE id_alumno="&ob_rs("id_alumno")&"" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
a_nombre=ob_rs2("a_nombre")
a_apellidos=ob_rs2("a_apellidos")
end if
ob_rs2.close%>
<td><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_programa")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check"  autocomplete="off"><span></span></label></td>
<td><%=a_apellidos%>, <%=a_nombre%> 

<%if ob_rs("cancela")="si" then%>
<span style="color:#F00;cursor:pointer;float:right;margin-left:7px"><i class="fa fa-ban inp_n" data-toggle="tooltip" data-placement="top" title="Programa cancelado"></i></span>
<%end if%>

</td>
<td><%=ob_rs("nom_curso")%></td>
<td align="center">
<%pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
if pr_cancelacion_pr="" or ISNULL(pr_cancelacion_pr) then pr_cancelacion_pr=0 end if%>
<%=FormatNumber(ccur(pr_cancelacion_pr+ob_rs("precioreserva")),2)%> €
<%pr_cancelacion_pr=""%>
</td>
<td align="center" <%if ob_rs("estadoPago")<>"Aceptada"then%>style="color:#F00"<%end if%>><%=ob_rs("estadoPago")%></td>
<td align="center"><%if (ob_rs("refpago")<>"" or NOT ISNULL(ob_rs("refpago"))) or (ob_rs("refpago")<>"" or NOT ISNULL(ob_rs("refpago"))) then%> <%if ob_rs("refpago")="" or ISNULL(ob_rs("refpago")) then%><%=ob_rs("refPagoPay")%><%else%><%=ob_rs("refpago")%><%end if%><%else%>-<%end if%></td>
<td align="center">
<%Select case ob_rs("metodoPago")
case "pag_transferencia":
icono="<i class=""fa fa-exchange inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por transferencia"" style=""cursor:pointer;color:#32C5D2""></i>" 
case "pag_tarjeta":
icono="<i class=""fa fa-credit-card inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por tarjeta de crédito"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_oficina":
icono="<i class=""fa fa-money inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago en metálico"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_paypal":
icono="<i class=""fa fa-paypal inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por PayPal"" style=""cursor:pointer;color:#32C5D2""></i>"
end select%>
<%=icono%>
<%icono=""%>
</td>
<td align="center">Reserva</td>
<td align="center"><span <%if ob_rs("falta_pagar") >0 then%>style="color:#FF0000"<%end if%>><%=FormatNumber(ccur(ob_rs("falta_pagar")),2)%> €</span></td>
<td align="center"><%fecha_now=FormatDateTime(cdate(ob_rs("fecha_in")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%><span class="hidden"><%=fecha_now%></span><%if ob_rs("fechaPago")<> "01/01/1000"then%><%=ob_rs("fechaPago")%><%else%><%=ob_rs("fecha_in")%><%end if%></td>
<td><div class="coje_acc" >
<div class="btn-group" id="col_rel">
<a class="btn btn-xs green dropdown-toggle" href="javascript:;" data-toggle="dropdown" >Acciones<i class="fa fa-angle-down"></i></a>
<ul class="dropdown-menu pull-right" id="acciones" >
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_alumno")&"&verp="&vepr&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa")))%>
<li><a href="../alumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&ob_rs("id_alumno")&"&verp="&p&"&cod_cat="&cod_cat&"&cod_prog="&ob_rs("id_programa"))%>" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Ver datos</a></li>
<li class="divider"></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=arch&verp="&verp&"&cod_cat="&cod_cat&"&t="&t))%>
<li><a href="javascript:archivarUna<%=i%>(<%=ob_rs("id_programa")%>);"><i class="fa fa-archive" aria-hidden="true"></i> Archivar</a></li>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&check="&ob_rs("id_programa")&"&accion=desarch&verp="&vepr&"&cod_cat="&cod_cat&"&t="&t))%>
<li><a href="javascript:archivarUna<%=i%>(<%=ob_rs("id_programa")%>);"><i class="fa fa-archive" aria-hidden="true" style="color:#ccc"></i> Desarchivar</a></li>
</ul></div></div></td>
</tr>
<%Sql2= "SELECT precio,fecha,estadoPago,metodoPago,refPago,refPagoPay,pagado FROM programasAnticipos WHERE id_programa="&ob_rs("id_programa")&"" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<tr style="color:#999">
<td style="text-align:center"><i class="fa fa-level-down" style="color:#999;margin:0 auto"></i></td>
<td><%=a_apellidos%>, <%=a_nombre%></td>
<td><%=ob_rs("nom_curso")%></td>
<td align="center"><%=FormatNumber(ccur(ob_rs2("precio")),2)%> €</td>
<td align="center" <%if ob_rs2("estadoPago")<>"Aceptada"then%>style="color:#F00"<%end if%>><%=ob_rs2("estadoPago")%></td>
<td align="center"><%if (ob_rs2("refpago")<>"" or NOT ISNULL(ob_rs2("refpago"))) or (ob_rs2("refpago")<>"" or NOT ISNULL(ob_rs2("refpago"))) then%> <%if ob_rs2("refpago")="" or ISNULL(ob_rs2("refpago")) then%><%=ob_rs2("refPagoPay")%><%else%><%=ob_rs2("refpago")%><%end if%><%else%>-<%end if%></td>
<td align="center">
<%Select case ob_rs2("metodoPago")
case "pag_transferencia":
icono="<i class=""fa fa-exchange inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por transferencia"" style=""cursor:pointer;color:#32C5D2""></i>" 
case "pag_tarjeta":
icono="<i class=""fa fa-credit-card inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por tarjeta de crédito"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_oficina":
icono="<i class=""fa fa-money inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago en metálico"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_paypal":
icono="<i class=""fa fa-paypal inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por PayPal"" style=""cursor:pointer;color:#32C5D2""></i>"
end select%>
<%=icono%>
<%icono=""%>
</td>
<td align="center">Anticipo</td>
<td align="center"><%if ob_rs2("pagado")<>"si" then%><span style="color:#F00"><%=FormatNumber(ccur(ob_rs2("precio")),2)%> €<%else%>0,00 €<%end if%></span></td>
<td align="center"><%fecha_now=FormatDateTime(cdate(ob_rs("fecha_in")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%><span class="hidden"><%=fecha_now%></span></td>
<td style="font-size:0.8em"><%=ob_rs2("fecha")%></td>
</tr>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
<%Sql2= "SELECT total,fecha_creacion,estadoPago,metodoPago,total FROM facturas WHERE id_programa="&ob_rs("id_programa")&"" 
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<tr style="color:#999">
<td style="text-align:center"><i class="fa fa-level-down" style="color:#999;margin:0 auto"></i></td>
<td><%=a_apellidos%>, <%=a_nombre%></td>
<td><%=ob_rs("nom_curso")%></td>
<td align="center"><%=FormatNumber(ccur(ob_rs2("total")),2)%> €</td>
<td align="center" <%if ob_rs2("estadoPago")<>"Aceptada"then%>style="color:#F00"<%end if%>><%=ob_rs2("estadoPago")%></td>
<td align="center">-</td>
<td align="center">
<%Select case ob_rs("metodoPago")
case "pag_transferencia":
icono="<i class=""fa fa-exchange inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por transferencia"" style=""cursor:pointer;color:#32C5D2""></i>" 
case "pag_tarjeta":
icono="<i class=""fa fa-credit-card inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por tarjeta de crédito"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_oficina":
icono="i class=""fa fa-money inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago en metálico"" style=""cursor:pointer;color:#32C5D2""></i>"
case "pag_paypal":
icono="<i class=""fa fa-paypal inp_n"" aria-hidden=""true"" data-toggle=""tooltip"" data-placement=""top"" title=""Pago por PayPal"" style=""cursor:pointer;color:#32C5D2""></i>"
end select%>
<%=icono%>
<%icono=""%>
</td>
<td align="center">Factura anexa</td>
<td align="center"><%if ob_rs2("estadoPago")<>"Aceptada" then%><span style="color:#F00"><%=FormatNumber(ccur(ob_rs2("total")),2)%> €<%else%>0,00 €<%end if%></span></td>
<td align="center"><%fecha_now=FormatDateTime(cdate(ob_rs("fecha_in")),2)
fecha_now=year(fecha_now)&"/"&completa0(month(fecha_now))&"/"&completa0(day(fecha_now))%><span class="hidden"><%=fecha_now%></span></td>
<td style="font-size:0.8em"><%=ob_rs2("fecha_creacion")%></td>
</tr>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>

<!--MODAL ELIMINAR UN SOLO REGISTRO-->
<div class="modal fade" id="confirmaArchivaUna<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas archivar/desarchivar el registro seleccionado?</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarArchivaUna_ok<%=i%>();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function archivarUna<%=i%>(){$('#confirmaArchivaUna<%=i%>').modal('show');}
function confirmarArchivaUna_ok<%=i%>(){$('#confirmaArchivaUna<%=i%>').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_programa")%>&t=<%=t%>&anyo_act=<%=anyo_act%>&accion=arch&cod_cat=<%=cod_cat%>';}</script>
<!--FIN MODAL ELIMINAR UN SOLO REGISTRO-->
<%pasa=""
end if 'pasa=si
ob_rs.movenext
i=i+1
loop%>
</tbody></table>
<%else 'NO HAY NINGÚN REGISTRO%>
<div class="alert-danger sin_regstros"><i class="fa fa-check" aria-hidden="true"></i> No hay ningún registro actualmente! </div>
<%end if 'FIN BUCLE TABLA
ob_rs.close
ob_conn.close%></form></div></div></div></div></div><!--MODALES--><div class="modal fade" id="confirmaArchiva" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas archivar el/los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarArchiva_ok();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="confirmaDesArchiva" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas desarchivar el/los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarDesArchiva_ok();">Confirmar</button>
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
var iStartDateCol = 9;                              // INDICA COLUMNA PARA BUSCAR FECHA
var iEndDateCol = 9;                               // INDICA COLUMNA PARA BUSCAR FECHA
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
{ extend: 'colvis', className: 'esconde',  columns: (':not(.no_exp)')}],
"order": [[9, 'des']],
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
}}}<%end if%>$(".inp_n").tooltip({html:true});
function archivarTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaArchiva').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarArchiva_ok(){
	document.formulario.accion.value="arch";
	$('#confirmaArchiva').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function desarchivarTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaDesArchiva').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarDesArchiva_ok(){
	document.formulario.accion.value="desarch";
	$('#confirmaDesArchiva').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
$(".inp_n").tooltip({html:true});
</script><script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>