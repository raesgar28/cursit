<!--#include file="comun/menu_sup.asp"-->
<!--#include file="comun/z_check_user.asp"-->
<%id_alumno=request("id_alumno")'155'
id_programa=request("id_programa")'188'
ms=request("ms")%>
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<%if session("id_usuario")<>"" and id_programa<>"" then
Sql= "SELECT u_telefono,u_email,u_movil,u_direccion,u_ciudad, u_provincia, u_pais,u_empresa, u_agente from usuarios where id_usuario= "&session("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
u_telefono=ob_rs("u_telefono")
u_movil=ob_rs("u_movil")
u_direccion=ob_rs("u_direccion")
u_ciudad=ob_rs("u_ciudad")
u_provincia=ob_rs("u_provincia")
u_pais=ob_rs("u_pais")
u_empresa=ob_rs("u_empresa")
u_agente=ob_rs("u_agente")
end if
ob_rs.close
Sql= "SELECT  factura, u_f_nombre, u_f_direccion, u_f_nif, id_item, id_alumno, a_observaciones_curso, nom_curso,f_inicio, fecha_in, cancela, fecha_cancela from programas where id_programa= "&id_programa&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
factura=ob_rs("factura")
u_f_nombre=ob_rs("u_f_nombre")
u_f_direccion=ob_rs("u_f_direccion")
u_f_nif=ob_rs("u_f_nif")
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
a_observaciones_curso=ob_rs("a_observaciones_curso")
nom_curso=ob_rs("nom_curso")
f_inicio=ob_rs("f_inicio")
fecha_in=ob_rs("fecha_in")
cancela=ob_rs("cancela")
fecha_cancela=ob_rs("fecha_cancela")
end if
ob_rs.close
else
response.redirect(r&"zona-privada")
end if
Sql= "SELECT datos_familia_ob FROM items WHERE id_item="&id_item&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
datos_familia_ob=ob_rs("datos_familia_ob")
end if
ob_rs.close%>
<!--#include file="comun/moneda.asp"-->
<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both"><div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-sbold"><%=titulo_esp_web%></h3><h4 class=""><%=titulo_esp_div%></h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li>
<a href="<%=r%>zona-privada">Zona usuario</a></li><li>/</li><li class="c-state_active">Inscripciones</li></ul></div></div>
<div class="container reserva_check">
<!--#include file="comun/z_menu.asp"-->
<div class="c-layout-sidebar-content ">
<div class="c-content-title-1"><h3 class=""><%=nom_curso%> - <%if year(f_inicio)<>1111 and year(f_inicio)<>1000 and year(f_inicio)<>2003 then%><%=year(f_inicio)%><%else%><%=year(fecha_in)%><%end if%>  <%if cancela="si" then%><span class="label label-danger c-font-slim" style="margin-left:15px">cancelado [<%=fecha_cancela%>]</span> <%end if%> </h3><div class="c-line-left"></div><%if ms="ok"then%><div class="alert alert-success alert-dismissible" role="alert"> Modificación realizada con éxito.<button type="button" class="close" data-dismiss="alert" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button></div><%end if%>
<%if ms="ko"then%><div class="alert alert-danger alert-dismissible" role="alert"> Algo ha ido mal en la modificación. Revisa los datos por favor.<button type="button" class="close" data-dismiss="alert" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button></div><%end if%>
<%Sql3= "SELECT transferencia,datos_transferencia FROM metodosPago WHERE id_metodoPago IS NOT NULL"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
if ob_rs3("transferencia")="si" then cuenta_trans=ob_rs3("datos_transferencia") end if
end if
ob_rs3.close

Sql3= "SELECT total FROM facturas WHERE id_programa="&id_programa&" AND estadoPago<> 'Aceptada'"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
total=0
do while not ob_rs3.eof
total=ob_rs3("total")+total
ob_rs3.movenext
loop
if total<>"" then total=FormatNumber(ccur(total),2)%>
<div class="row">
<div class="col-md-11" style="border:1px solid #CCC;padding:10px;margin-bottom:35px"><span style="color:#F00">*</span>Tienes pendiente de abono: <span style="color:#F00"><%=total%>&nbsp;<%=mon%></span> en concepto de otras facturas asociadas a este programa. Por favor, realiza el pago de las mismas mediante transferencia bancaria a:<br><span style="color:#F00;width:100%;display:block;text-align:center"><%=cuenta_trans%></span></div>
</div>
<%end if
ob_rs3.close

if session("id_usuario")<>"" then
Sql= "SELECT * FROM programas WHERE id_programa="&id_programa&" AND id_alumno="&id_alumno&" AND (id_usuario="&session("id_usuario")&" or id_agente_cod="&session("id_usuario")&")"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="row">
<%if ob_rs("id_item")<>"" and ob_rs("id_item")<>0 then%>
<div class="col-md-6">
<h4 class="panel-title acord_bot"><a class="c-font-19" href="#/"><i class="fa fa-download" aria-hidden="true"></i>  Descargar packs informativos</a></h4>
<div class="acordeon"> 
<ul>
<%Set objFSO  = CreateObject("Scripting.FileSystemObject")'PRIMERO DE CARPETA
objStartFolder = Server.MapPath("../up_docs/alu_packs/"&id_programa)
If objFSO.FolderExists(objStartFolder) Then
Set objFolder = objFSO.GetFolder(Server.MapPath("../up_docs/alu_packs/"&id_programa))
Set colFiles = objFolder.Files
For Each objFile in colFiles%>
<li><i class="fa fa-file-text-o" aria-hidden="true"></i> <a href="<%=r%>up_docs/alu_packs/<%=id_programa%>/<%=objFile.Name%>" target="_blank"><%=objFile.Name%></a></li>
<%hay_carp="si"
Next
end if
Sql2= "SELECT id_destino, id_seccion, id_subseccion FROM rel WHERE id_item="&ob_rs("id_item")&" AND id_categoria="&ob_rs("id_categoria")&" and id_destino<>0 and id_seccion<>0"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof

if pack<>"si" then'PRIMERO CATEGORIA
Sql3= "SELECT id_pack FROM packs_rel WHERE id_categoria = "&ob_rs("id_categoria")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
	Sql5= "SELECT id_pack FROM packs_rel WHERE (id_item = "&ob_rs("id_item")&" and id_pack="&ob_rs3("id_pack")&") OR (id_seccion= "&ob_rs2("id_seccion")&" and id_pack="&ob_rs3("id_pack")&") OR (id_destino= "&ob_rs2("id_destino")&" and id_pack="&ob_rs3("id_pack")&")   "
	Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
	Ob_RS5.Open Sql5, ob_connb,adOpenStatic, adCmdText
	if not ob_rs5.eof then
		
		do while not ob_rs3.eof
		Sql4= "SELECT nombre, peso, extension FROM packs_rel_archivos WHERE id_pack="&ob_rs3("id_pack")&" "
		Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
		Ob_RS4.Open Sql4, ob_connb,adOpenStatic, adCmdText
		if not ob_rs4.eof then
		pack="si"
		do while not ob_rs4.eof%>
		<li><i class="fa fa-file-text-o" aria-hidden="true"></i> <a href="<%=r%>up_docs/alu_packs/<%=ob_rs4("nombre")%>" target="_blank"><%=ob_rs4("nombre")%></a></li>
		<%ob_rs4.movenext
		loop
		end if
		ob_rs4.close
		ob_rs3.movenext
		loop
	end if
	ob_rs5.close
end if
ob_rs3.close
end if

if pack<>"si" then'PSECCION
Sql3= "SELECT  id_pack FROM packs_rel WHERE id_seccion = "&ob_rs2("id_seccion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
Sql4= "SELECT nombre, peso, extension FROM packs_rel_archivos WHERE id_pack="&ob_rs3("id_pack")&" "
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_connb,adOpenStatic, adCmdText
if not ob_rs4.eof then
pack="si"
do while not ob_rs4.eof%>
<li><i class="fa fa-file-text-o" aria-hidden="true"></i> <a href="<%=r%>up_docs/alu_packs/<%=ob_rs4("nombre")%>" target="_blank"><%=ob_rs4("nombre")%>bb</a></li>
<%ob_rs4.movenext
loop
end if
ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close
end if
if pack<>"si" and ob_rs2("id_subseccion")<>0 then'SUB SECCION
Sql3= "SELECT  id_pack FROM packs_rel WHERE id_subseccion = "&ob_rs2("id_subseccion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
Sql4= "SELECT nombre, peso, extension FROM packs_rel_archivos WHERE id_pack="&ob_rs3("id_pack")&" "
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_connb,adOpenStatic, adCmdText
pack="si"%>
<li><i class="fa fa-file-text-o" aria-hidden="true"></i> <a href="<%=r%>up_docs/alu_packs/<%=ob_rs4("nombre")%>" target="_blank"><%=ob_rs4("nombre")%>hh</a></li>
<%ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close
end if
if pack<>"si" then'DESTINO
Sql3= "SELECT  id_pack FROM packs_rel WHERE id_destino = "&ob_rs2("id_destino")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
Sql4= "SELECT nombre, peso, extension FROM packs_rel_archivos WHERE id_pack="&ob_rs3("id_pack")&" "
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_connb,adOpenStatic, adCmdText
if not ob_rs4.eof then
pack="si"
do while not ob_rs4.eof%>
<li><i class="fa fa-file-text-o" aria-hidden="true"></i> <a href="<%=r%>up_docs/alu_packs/<%=ob_rs4("nombre")%>" target="_blank"><%=ob_rs4("nombre")%>yy</a></li>
<%ob_rs4.movenext
loop
end if
ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close
end if
if pack<>"si" then'ITEM
Sql3= "SELECT  id_pack FROM packs_rel WHERE id_item = "&ob_rs("id_item")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
Sql4= "SELECT nombre, peso, extension FROM packs_rel_archivos WHERE id_pack="&ob_rs3("id_pack")&" "
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_connb,adOpenStatic, adCmdText
if not ob_rs4.eof then
do while not ob_rs4.eof
pack="si"%>
<li><a href="<%=r%>up_docs/alu_packs/<%=ob_rs4("nombre")%>" target="_blank"><%=ob_rs4("nombre")%>uu</a></li>
<%ob_rs4.movenext
loop
end if
ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close
end if
ob_rs2.movenext
loop
end if
ob_rs2.close%>
</ul>
</div>
<h4 class="panel-title acord_bot"><a class="c-font-19" href="#/"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Realizar pagos</a></h4>
<div class="acordeon"> 
<%Sql2= "SELECT nom_item, nom_curso, falta_pagar, suma_total, fecha_in, fechaPago, precioReserva, estadoPago, ajuste, pr_ajuste, pr_cancelacion, pr_cancelacion_pr FROM programas WHERE id_programa="&id_programa&" AND id_alumno="&id_alumno&" AND (id_usuario="&session("id_usuario")&" or id_agente_cod="&session("id_usuario")&") "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
pagado1=ob_rs2("suma_total")-ob_rs2("falta_pagar")
falta_pagar=ob_rs2("falta_pagar")
pagado1=ob_rs2("precioReserva")+ob_rs2("pr_cancelacion_pr")%>
<span class="tab_tit">Precio del curso: <span class="res_tab_tit"><%=FormatNumber(ccur(ob_rs2("suma_total")),2)%>&nbsp;<%=mon%></span></span>
<table class="table-striped">
<thead><tr><th>Pagado</th><th>Fecha</th></tr></thead>
<tr><td><%=FormatNumber(ccur(pagado1),2)%>&nbsp;<%=mon%></td><td><%=ob_rs2("fecha_in")%></td></tr>
<%Sql3= "SELECT precio, fecha, pagado FROM programasAnticipos WHERE id_programa="&id_programa&" order by fecha asc "
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<tr><td><%=FormatNumber(ccur(ob_rs3("precio")),2)%>&nbsp;<%=mon%> <%if ob_rs3("pagado")="si" then%><%else%><i class="fa fa-times" aria-hidden="true" style="margin-left:5px;color:#F00"></i><%end if%></td><td><%=ob_rs3("fecha")%></td></tr>
<%ob_rs3.movenext
loop
end if
ob_rs3.close%>
</table>
<span class="tab_tit">Resta pagar: <span class="res_tab_tit"><%=FormatNumber(ccur(falta_pagar),2)%>&nbsp;<%=mon%></span></span>
<form action="<%=r%>inscripciones-pagos"  name="f_pagos" id="f_pagos" method="post">
<div class="col-md-12 metodosPagos" id="pro_pago_opt">
<span>Elige método de pago:</span>
<%Sql3= "SELECT * FROM metodosPago WHERE id_metodoPago IS NOT NULL"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_conn,adOpenStatic, adCmdText
if not ob_rs3.eof then
if ob_rs3("transferencia")="si" then cuenta_trans=ob_rs3("datos_transferencia") end if
if ob_rs3("tarjeta")="si" and ob_rs3("tar_comercio")<>"" and ob_rs3("tar_cod_comercio")<>"" and ob_rs3("tar_pass")<>"" then%>
<div class="metodoPago_in met_pago"><input name="metodoPago" type="radio" value="pag_tarjeta" id="matodoPago2" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Se redirigirá a la pasarela bancaria"><label for="matodoPago2" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Se redirigirá a la pasarela bancaria"><i class="fa fa-credit-card met_pago" aria-hidden="true"></i> Tarjeta de Crédito</label></div>
<%else%>
<input name="metodoPago" type="radio" value="pag_tarjeta" id="matodoPago2" style="visibility:hidden">
<%end if
if ob_rs3("paypal")="si" and ob_rs3("pay_mail")<>""then%>
<div class="metodoPago_in met_pago"><input name="metodoPago" type="radio" value="pag_paypal" id="matodoPago3" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Mediante redirección a pasarela PayPal"><label for="matodoPago3" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Mediante redirección a pasarela PayPal"><i class="fa fa-cc-paypal met_pago" aria-hidden="true"></i> PayPal</label></div>
<%else%>
<input name="metodoPago" type="radio" value="pag_paypal" id="matodoPago3" style="visibility:hidden">
<%end if
else%>
<div class="no_hay_pago"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Actualmente no hay ningún método de pago habilitado.</div>
<%end if
ob_rs3.close%>
</div>
<input name="id_programa_ok" type="hidden" value="<%=id_programa%>"><input name="id_alumno" type="hidden" value="<%=id_alumno%>"><input name="op" type="hidden" value="anticipo">
<div class="col-md-12 form-group" style="margin:0px;padding:0px;margin-bottom:11px" id="sexo" >
<i class="fa fa-money" style="margin-right:7px"></i><select name="pago" id="pago" style="width:100%;"><option value="" selected="selected" style="width:100%;">&nbsp;&nbsp;Cantidad a pagar</option><option value="<%=falta_pagar%>">&nbsp;&nbsp;100% del resto a pagar (<%=FormatNumber(ccur(falta_pagar),2)%>&nbsp;<%=mon%>)</option><option value="<%=falta_pagar*0.75%>">&nbsp;&nbsp;75% del resto a pagar (<%=FormatNumber(ccur(falta_pagar*0.75),2)%>&nbsp;<%=mon%>)</option><option value="<%=falta_pagar*0.50%>">&nbsp;&nbsp;50% del resto a pagar (<%=FormatNumber(ccur(falta_pagar*0.50),2)%>&nbsp;<%=mon%>)</option><option value="<%=falta_pagar*0.25%>">&nbsp;&nbsp;25% del resto a pagar (<%=FormatNumber(ccur(falta_pagar*0.25),2)%>&nbsp;<%=mon%>)</option>
</select>
</div><ul class="list-inline pull-right"><li><button type="button" onClick="Enviar_pago();" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i>Siguiente Paso <i class="fa fa-money" aria-hidden="true" style="margin-left:8px"></i>
</button>
</li></ul>
</form>
<%Sql3= "SELECT total FROM facturas WHERE id_programa="&id_programa&" AND estadoPago<> 'Aceptada'"
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
total=0
do while not ob_rs3.eof
total=ob_rs3("total")+total
ob_rs3.movenext
loop
if total<>"" then total=FormatNumber(ccur(total),2)%>
<div class="col-md-12"><span style="color:#F00">*</span>Pendiente de abono: <span style="color:#F00"><%=total%>&nbsp;<%=mon%></span> en concepto de otras facturas asociadas a este programa. Por favor, realiza el pago de las mismas mediante transferencia bancaria a:<br><span style="color:#F00"><%=cuenta_trans%></span></div>
<%end if
ob_rs3.close%>
<%end if
ob_rs2.close%>
</div>
<h4 class="panel-title acord_bot"><a class="c-font-19" href="#/"><i class="fa fa-upload" aria-hidden="true"></i>Subir / Modificar (NIF/Pasaporte)</a></h4>
<div class="acordeon">
<span class="tab_tit"><i class="fa fa-upload" aria-hidden="true" style="margin-right:8px"></i> Escanea y sube tu pasaporte y NIF actualizados</span>
<form action="<%=r%>web/z_inscripciones_det_save_docs.asp" method="post" enctype="multipart/form-data"  name="f_docs" id="f_docs">
<input name="cod" type="hidden" value="<%=id_programa%>">

<div class="col-md-12 form-group subidor" style="padding:0px;margin:0;margin-bottom:11px">
<%Sql2= "SELECT nombre, tipo FROM archivos, alumnos_archivos WHERE alumnos_archivos.id_alumno= "&id_alumno&" and alumnos_archivos.id_archivo=archivos.id_archivo and tipo='Pasaporte'"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div class="col-md-6 col-sm-6" style="margin-top:30px;margin-bottom:20px"><div class="row static-info"><div class="col-md-12 name"><%=ob_rs2("tipo")%>: <i class="fa fa-arrow-down" aria-hidden="true" style="color:#ccc"></i></div><div class="col-md-12 value">
<div class="col-md-12" style="margin-top:15px;text-align:right"><a href="<%=r%>up_docs/alu_docs/<%=ob_rs2("nombre")%>" target="_blank">ver pasaporte.</a> </div></div>
<div class="col-md-12  c-checkbox" style="margin-top:15px;margin-left:30px;font-size:1.2em">
<input type="checkbox" id="del_pass" class="c-check" value="si" name="del_pass" autocomplete="off"><label for="del_pass" class="check_txt"  autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label>
</div></div></div>
<%else%>
<div class="col-md-6" style="padding-left:0px;padding-bottom:0px;margin-top:30px">
<input type="file" name="archivo_pass" id="a_pass_adj" class="inputfile inputfile-1 inp" data-multiple-caption="{count} archivos seleccionados"/>
<label for="a_pass_adj" class="tolea" data-toggle="tooltip" data-placement="top" title="Máx 1 mb. (PDF, JPG, PNG)" id="pas_doc"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span class="spanea">Pasaporte </span></label><span class="desadjuntar desadjuntar_pas"><a href="javascript:desadjunta_pas();"><i class="fa fa-trash-o" aria-hidden="true"></i></a></span>
</div>
<%end if
ob_rs2.close
Sql2= "SELECT nombre, tipo FROM archivos, alumnos_archivos WHERE alumnos_archivos.id_alumno= "&id_alumno&" and alumnos_archivos.id_archivo=archivos.id_archivo and tipo='Nif'"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div class="col-md-6 col-sm-6" style="margin-top:30px;margin-bottom:20px"><div class="row static-info"><div class="col-md-12 name"><%=ob_rs2("tipo")%> scaneado: <i class="fa fa-arrow-down" aria-hidden="true" style="color:#ccc"></i></div><div class="col-md-12 value">
<div class="col-md-12" style="margin-top:15px;text-align:right"><a href="<%=r%>up_docs/alu_docs/<%=ob_rs2("nombre")%>" target="_blank">ver NIF.</a> </div></div>
<div class="col-md-12  c-checkbox" style="margin-top:15px;margin-left:30px;font-size:1.2em">
<input type="checkbox" id="del_nif" class="c-check" value="si" name="del_nif" autocomplete="off"><label for="del_nif" class="check_txt"  autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label>
</div>
</div></div>
<%else%>
<div class="col-md-6" style="padding:0;margin-top:30px">
<input type="file" name="archivo_nif" id="a_nif_adj" class="inputfile inputfile-1" data-multiple-caption="{count} archivos seleccionados"/>
<label for="a_nif_adj" class="tolea" data-toggle="tooltip" data-placement="top" title="Máx 1 mb. (PDF, JPG, PNG)" id="nif_doc"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span  class="spanea" id="nif_del">NIF </span></label><span class="desadjuntar desadjuntar_nif"><a href="javascript:desadjunta_nif();"><i class="fa fa-trash-o" aria-hidden="true"></i></a></span>
</div>
<%end if%>
</div>
<ul class="list-inline pull-right"><li>
<button type="submit" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  "><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i>Siguiente Paso <i class="fa fa-id-badge" aria-hidden="true" style="margin-left:8px"></i>
</button>
</li></ul>
</form>
</div>
</div>
<div class="col-md-6">
<h4 class="panel-title acord_bot"><a class="-font-19" data-toggle="collapse" data-parent="#accordion-2" href="#collapseOne-1" aria-expanded="false" aria-controls="collapseOne"><i class="fa fa-file-text-o" aria-hidden="true"></i> Ver Inscripción </a></h4>
<div class="acordeon"><a href="<%=r%>web/pr_pdf_preins.asp?id_programa=<%=id_programa%>&s=crm&cod_cat=<%=cod_cat%>&t=insc"><i class="fa fa-download" aria-hidden="true" style="margin-right:10px"></i>Descargar Inscripción </span></a></div>
<h4 class="panel-title acord_bot"><a class="c-font-19" href="#/"><i class="fa fa-tags" aria-hidden="true"></i> Descargar facturas </a></h4>
<div class="acordeon"> 
<ul>
<%Sql2= "SELECT  n_factura, suma_total, fechaEmision, ajuste FROM programas WHERE id_programa="&id_programa&" order by fechaEmision asc "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
i=1%>
<li><i class="fa fa-tags" aria-hidden="true" style="margin-right:7px"></i><a href="<%=r%>web/pr_pdf_factura.asp?id_programa=<%=id_programa%>&s=crm&cod_cat=<%=cod_cat%>&proc=gest&cod=<%=cod%>">Factura <%=i%></a></li>
<%end if
ob_rs2.close
Sql2= "SELECT id_factura, n_factura, total, fecha_emision, fac_ajuste FROM facturas WHERE id_programa="&id_programa&" order by fecha_emision asc "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
i=i+1%>
<%do while not ob_rs2.eof%>
<li><i class="fa fa-tags" aria-hidden="true" style="margin-right:7px"></i><a href="<%=r%>web/pr_pdf_factura_anex.asp?id_factura=<%=ob_rs2("id_factura")%>&s=crm&cod_cat=<%=cod_cat%>&proc=gest&cod=<%=cod%>">Factura <%=i%></a></li>
<%ob_rs2.movenext
i=i+1
loop
end if
ob_rs2.close%>
</ul>
</div>
<h4 class="panel-title acord_bot"><a class="c-font-19" href="#/"><i class="fa fa-id-card-o" aria-hidden="true"></i> Datos de facturación </a></h4>
<div class="acordeon"> 
<form action="<%=r%>web/z_inscripciones_det_save_docs.asp" method="post" enctype="multipart/form-data"  name="f_fact" id="f_fact">
<input name="cod" type="hidden" value="<%=id_programa%>"><input name="op" type="hidden" value="factura_dat">
<div class="c-checkbox-list" >
<div class="c-checkbox">
<input name="factura" type="checkbox" class="c-check" id="factura" autocomplete="off" value="si" <%if factura="si" then%>checked<%end if%>>
<label for="factura" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-file-text-o" aria-hidden="true" style="color:#999;margin-right:8px"></i>Facturar con otros datos</label>
</div></div>
<div class="form-group" id="datos_factura">
<div class="col-md-12">
<div class="form-group"><i class="fa fa-gavel" aria-hidden="true"></i><input type="text" placeholder="Nombre / Razón Social" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre / Razón Social'" class="form-control c-square c-theme input-lg inp" name="u_f_nombre" id="u_f_nombre" value="<%=u_f_nombre%>"></div>
</div>
<div class="col-md-12">
<div class="form-group"><i class="fa fa-id-card-o" aria-hidden="true"></i>
<input type="text" placeholder="NIF / CIF" onclick="this.placeholder = ''" onblur="this.placeholder = 'NIF / CIF'" class="form-control c-square c-theme input-lg inp" name="u_f_nif" id="u_f_nif" value="<%=u_f_nif%>"></div>
</div>
<div class="col-md-12">
<div class="form-group"><i class="fa fa-location-arrow" aria-hidden="true"></i>
<textarea rows="4" placeholder="Dirección, localidad, provincia, código postal, país,..." onclick="this.placeholder = ''" onblur="this.placeholder = 'Dirección, localidad, provincia, código postal, país,...'" class="form-control c-theme c-square input-lg inp" name="u_f_direccion" id="u_f_direccion"><%=u_f_direccion%></textarea></div>
</div></div>
<ul class="list-inline pull-right"><li>
<button type="submit" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  "><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i>Siguiente Paso <i class="fa fa-user" aria-hidden="true" style="margin-left:8px"></i>
</button>
</li></ul>
</form>
</div>
</div>
<%Sql2= "SELECT id_categoria FROM rel WHERE id_item="&id_item&" and id_categoria<>0"
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

Sql2= "SELECT catDocumentacion.id_catDocumentacion FROM catDocumentacion, catDocumentacion_rel WHERE (id_alumno="&id_alumno&" OR id_item="&id_item&" OR id_usuario="&session("id_usuario")&" OR id_categoria="&id_categoria&" OR id_destino="&id_destino&" OR id_seccion="&id_seccion&") AND catDocumentacion.id_catDocumentacion=catDocumentacion_rel.id_catDocumentacion "
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
Sql2= "SELECT titulo_esp, texto_esp, email, catDocumentacion.id_catDocumentacion,id_catDocumentacion_rel,disponible,disponible FROM catDocumentacion, catDocumentacion_rel WHERE (id_alumno="&id_alumno&" OR id_item="&id_item&" OR id_usuario="&session("id_usuario")&" OR id_categoria="&id_categoria&" OR id_destino="&id_destino&" OR id_seccion="&id_seccion&") AND catDocumentacion.id_catDocumentacion=catDocumentacion_rel.id_catDocumentacion"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
doc=1
num_arch=ob_rs2.recordcount
num_arch_in=num_arch-num_arch_in%>
<div class="col-md-12"><h4 class="panel-title acord_bot"><a class="c-font-19" data-toggle="collapse" data-parent="#accordion-2" href="#collapseOne-1" aria-expanded="false" aria-controls="collapseOne"><i class="fa fa-folder-open-o" aria-hidden="true"></i>Documentos del alumno (<%=num_arch%>) <%if num_arch_in<>0 then%><span style="font-size:0.9em;color:#999;float:right"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>Faltan <%=num_arch_in%> documento<%if num_arch_in>1 then%>s<%end if%> por subir<%end if%></a></h4>
<div class="acordeon"><span class="tab_tit2"><i class="fa fa-upload" aria-hidden="true" style="margin-right:8px"></i> Escanea y sube los documentos indicados (máx. 2 mb. por archivo. PNG, JPEG, GIF, DOC, DOCX, PDF)</span>
<form action="<%=r%>web/z_inscripciones_det_save_docs.asp" method="post" enctype="multipart/form-data" id="f_envia_docs" name="f_envia_docs">
<input name="op" type="hidden" value="docs">
<input name="cod" type="hidden" value="<%=id_programa%>">
<div class="col-md-12 form-group subidor" style="padding:0px;margin:0;margin-bottom:11px;">
<%do while not ob_rs2.eof
id_catDocumentacion_rel=ob_rs2("id_catDocumentacion_rel")
'VEMOS SI EL ALUMNO TIENE ESTA DOCUMENTACION SUBIDA
Sql3= "SELECT id_catDocumentacion, id_alumno,archivo,nombreCatDocumentacion FROM alumnosDocumentacion WHERE id_alumno="&id_alumno&" AND id_catDocumentacion="&ob_rs2("id_catDocumentacion")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<div class="col-md-12 col-sm-12" style="margin-top:10px;margin-bottom:10px;padding:0px;padding-top:6px;border:1px solid #ddd;margin-right:0px;background:#fff;width:98%">
<div class="col-md-10" style="text-align:left"><a href="<%=r%>/up_docs/alu_docs/<%=ob_rs3("archivo")%>" target="_blank"> <%=ob_rs3("nombreCatDocumentacion")%><i class="fa fa-external-link" aria-hidden="true" style="font-size:0.8em;margin-top:6px;margin-left:-5px"></i></a> </div><div class="col-md-2 c-checkbox"><input type="checkbox" id="del_<%=doc%>" class="c-check" value="<%=id_catDocumentacion_rel%>" name="del_<%=doc%>" autocomplete="off"><label for="del_<%=doc%>" class="check_txt" autocomplete="off" style="margin-left:-15px"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label></div></div>
<%else%>
<%if ob_rs2("disponible")="si"then%>
<div class="col-md-12 col-sm-12" style="padding-left:0px;padding-bottom:0px;margin-top:10px;">
<input type="file" name="doc_archivo<%=doc%>" id="doc_archivo<%=doc%>" class="col-md-12 col-sm-12 inputfile inputfile-1 inp" />
<label for="doc_archivo<%=doc%>" class="tolea" id="doc_<%=doc%>" style=""><i class="fa fa-upload" aria-hidden="true"></i>
<span class="spanea"><%=ob_rs2("titulo_esp")%> </span></label><span class="desadjuntar desadjuntar_doc<%=doc%>" style="position:absolute;font-size:0.8em;margin-top:0px;right:60px;"><a href="javascript:desadjunta_doc<%=doc%>();"><i class="fa fa-trash-o" aria-hidden="true"></i></a></span><%=ob_rs2("texto_esp")%></div><script>function desadjunta_doc<%=doc%>(){$('#doc_<%=doc%>').val("");$('#doc_<%=doc%>').html("");$('#doc_<%=doc%>').text("");document.getElementById("doc_<%=doc%>").value = "";
$("#doc_<%=doc%>").html("<i class='fa fa-upload' aria-hidden='true'></i> <span  class='spanea' id='doc_<%=doc%>'><%=ob_rs2("titulo_esp")%> </span>");
$(".desadjuntar_doc<%=doc%>").css( "visibility","hidden" );}</script><input name="id_catDocumentacion<%=doc%>" type="hidden" value="<%=ob_rs2("id_catDocumentacion")%>">
<%end if%>
<%end if
ob_rs3.close
id_catDocumentacion_rel=""
ob_rs2.movenext
doc=doc+1
loop
Sql3= "SELECT id_catDocumentacion, id_alumno,archivo,nombreCatDocumentacion FROM alumnosDocumentacion WHERE id_alumno="&id_alumno&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
id_catDocumentacion=ob_rs3("id_catDocumentacion")
Sql4= "SELECT id_catDocumentacion FROM catDocumentacion WHERE id_catDocumentacion="&id_catDocumentacion&""
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
else%>
<div class="col-md-12 col-sm-12" style="margin-top:10px;margin-bottom:10px;padding:0px;padding-top:6px;border:1px solid #ddd;margin-right:0px;background:#fff;width:98%">
<div class="col-md-10" style="text-align:left"><a href="<%=r%>/up_docs/alu_docs/<%=ob_rs3("archivo")%>" target="_blank"> <%=ob_rs3("nombreCatDocumentacion")%><i class="fa fa-external-link" aria-hidden="true" style="font-size:0.8em;margin-top:6px;margin-left:-5px"></i></a> </div><div class="col-md-2 c-checkbox"><input type="checkbox" id="del_o<%=doc%>" class="c-check" value="<%=id_catDocumentacion%>" name="del_o<%=doc%>" autocomplete="off"><label for="del_o<%=doc%>" class="check_txt" autocomplete="off" style="margin-left:-15px"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label></div></div>
<%end if
ob_rs4.close
ob_rs3.movenext
loop
end if
ob_rs3.close%>
</div>
<%Sql5= "SELECT titulo_esp, texto_esp, email, catDocumentacion.id_catDocumentacion,id_catDocumentacion_rel,disponible,disponible FROM catDocumentacion, catDocumentacion_rel WHERE (id_alumno="&id_alumno&" OR id_item="&id_item&" OR id_usuario="&session("id_usuario")&" OR id_categoria="&id_categoria&" OR id_destino="&id_destino&" OR id_seccion="&id_seccion&") AND catDocumentacion.id_catDocumentacion=catDocumentacion_rel.id_catDocumentacion"
Set Ob_RS5 = Server.CreateObject("ADODB.Recordset")
Ob_RS5.Open Sql5, ob_conn,adOpenStatic, adCmdText
if not ob_rs5.eof then%>
<span class="tab_tit"><i class="fa fa-download" aria-hidden="true" style="margin-right:8px"></i> Formularios a cumplimentar (debes descargarlos)</span>
<%do while not ob_rs5.eof
id_catDocumentacion=ob_rs5("id_catDocumentacion")
Sql4= "SELECT nombre FROM catDocumentacion_arch WHERE id_catDocumentacion="&id_catDocumentacion&""
Set Ob_RS4 = Server.CreateObject("ADODB.Recordset")
Ob_RS4.Open Sql4, ob_connb,adOpenStatic, adCmdText
if not ob_rs4.eof then%>
<div class="col-md-12 col-sm-12" style="margin-top:10px;margin-bottom:10px;padding:0px;padding-top:6px;border:1px solid #ddd;margin-right:0px;background:#fff;width:98%">
<div class="col-md-10" style="text-align:left"><a href="<%=r%>up_docs/alu_docs/<%=ob_rs4("nombre")%>" target="_blank"> <i class="fa fa-download" aria-hidden="true" style="font-size:0.8em;margin-top:6px;margin-left:-5px"></i>&nbsp;<%=ob_rs5("titulo_esp")%></a> </div></div>
<%end if
ob_rs4.close
ob_rs5.movenext
loop
end if
ob_rs5.close%>
<ul class="list-inline pull-right"><li><button type="button" id="envia_docs" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i>Siguiente Paso <i class="fa fa-id-badge" aria-hidden="true" style="margin-left:8px"></i></button></li></ul></form></div></div>
<!--</form>-->
<%end if
ob_rs2.close
end if%>
<div class="col-md-12">
<h4 class="panel-title acord_bot2"><a class="c-font-19"  href="#/" id="alumno_dats_bot"><i class="fa fa-id-card-o" aria-hidden="true"></i> Datos del alumno (*modificables solo algunos datos)</a></h4>
<div class="acordeon2">
<%Sql2= "SELECT * FROM alumnos WHERE id_alumno="&id_alumno&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<form action="<%=r%>web/z_inscripciones_det_save_docs.asp" method="post" enctype="multipart/form-data"  name="f_reserva" id="f_reserva">
<input name="cod" type="hidden" value="<%=id_programa%>"><input name="op" type="hidden" value="alumno_dat">
<div class="col-md-6">
<div class="form-group"><i class="fa fa-user-o" aria-hidden="true"></i><input name="a_nombre" type="text" class="form-control c-square c-theme input-lg inp" id="a_nombre" placeholder="Nombre*" title="Como figura en el NIF" onblur="this.placeholder = 'Nombre*'" onclick="this.placeholder = ''" value="<%=ob_rs2("a_nombre")%>" readonly data-toggle="tooltip" data-placement="top"></div>
<div class="form-group"><i class="fa fa-user-o" aria-hidden="true"></i><input name="a_apellidos" type="text" class="form-control c-square c-theme input-lg inp" id="a_apellidos" placeholder="Apellidos*" title="Como figura en el NIF" onblur="this.placeholder = 'Apellidos*'" onclick="this.placeholder = ''" value="<%=ob_rs2("a_apellidos")%>" readonly data-toggle="tooltip" data-placement="top"></div>
<div class="col-md-8 form-group" style="margin:0px;padding:0px;margin-bottom:11px" id="sexo" ><i class="fa fa-transgender"></i><select name="a_sexo" id="a_sexo" class="select-sexo inp" style="width:100%;"><option value="" selected="selected" style="width:100%;">Sexo<%if u_agente<>"si"then%>*<%end if%></option><option value="hombre" <%if ob_rs2("a_sexo")="hombre" or ob_rs2("a_sexo")="Hombre" then%>selected<%end if%>>Hombre</option><option value="mujer" <%if ob_rs2("a_sexo")="mujer" or ob_rs2("a_sexo")="Mujer" then%>selected<%end if%>>Mujer</option>
</select></div>
<div class="col-md-12 form-group" style="padding:0px;"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="NIF / NIE<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'NIF / NIE<%if u_agente<>"si"then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_nif" id="a_nif" data-toggle="tooltip" data-placement="top" title="8 dígitos y letra" value="<%=ob_rs2("a_nif")%>"></div>
<div class="col-md-12" style="padding:0"><div class="col-md-12 form-group" style="padding:0px;"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="Pasaporte<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Pasaporte*'" class="form-control c-square c-theme input-lg inp" name="a_pasaporte" id="a_pasaporte" value="<%=ob_rs2("a_pasaporte")%>"></div>
<div class="col-md-6 form-group" style="padding:0px;"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="Expedido" onclick="this.placeholder = ''" onblur="this.placeholder = 'Expedido'" class="form-control c-square c-theme input-lg inp" name="a_pas_exp" id="a_pas_exp" value="<%=ob_rs2("a_pas_exp")%>"></div>
<div class="col-md-6 form-group" style="padding:0px;padding-left:20px"><i class="fa fa-id-card-o" aria-hidden="true"></i><input type="text" placeholder="Caducidad<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Caducidad<%if u_agente<>"si"then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_pas_cad" id="a_pas_cad" data-toggle="tooltip" data-placement="top" title="Fecha de caducidad dd/mm/aaaa" value="<%=ob_rs2("a_pas_cad")%>"></div>
</div>
<div class="clearfix"></div>
<div class="form-group"><i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" placeholder="email<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'email<%if u_agente<>"si"then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_email" id="a_email" value="<%=ob_rs2("a_email")%>"></div>
<%if u_agente<>"si"then%><div class="form-group"><i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" placeholder="repetir email*" onclick="this.placeholder = ''" onblur="this.placeholder = 'repetir email*'" class="form-control c-square c-theme input-lg inp" name="a_email_r" id="a_email_r"></div><%end if%>
</div>
<div class="col-md-6">
<div class="col-md-12 f_nacimiento_txt" style="display:none"><i class="fa fa-calendar" aria-hidden="true"></i>Fecha Nacimiento <i class="fa fa-arrow-down" aria-hidden="true" style="margin-left:8px"></i></div>
<div style="width:100%;display:none">
<%a_cumple_dia=day(ob_rs2("a_cumple"))
a_cumple_mes=month(ob_rs2("a_cumple"))
a_cumple_anyo=year(ob_rs2("a_cumple"))%>
<div class="col-md-3 form-group div_f_nacimiento" >
<select name="a_cumple_dia" class="f_nacimiento" id="a_cumple_dia" style="width:100%;"><option value="" selected="selected">dia<%if u_agente<>"si"then%>*<%end if%></option>
<%for z=1 to 31%><option value="<%=z%>" <%if a_cumple_dia=z then%>selected<%end if%>><%=z%></option>
<%next%>
</select>
</div>
<div class="col-md-4 form-group div_f_nacimiento" >
<select name="a_cumple_mes" class="f_nacimiento" id="a_cumple_mes" style="width:100%;"><option value="" selected="selected">mes<%if u_agente<>"si"then%>*<%end if%></option><option value="1" <%if a_cumple_mes=1 then%>selected<%end if%>>Enero</option><option value="2" <%if a_cumple_mes=2 then%>selected<%end if%>>Febrero</option><option value="3" <%if a_cumple_mes=3 then%>selected<%end if%>>Marzo</option><option value="4" <%if a_cumple_mes=4 then%>selected<%end if%>>Abril</option><option value="5" <%if a_cumple_mes=5 then%>selected<%end if%>>Mayo</option><option value="6" <%if a_cumple_mes=6 then%>selected<%end if%>>Junio</option><option value="7" <%if a_cumple_mes=7 then%>selected<%end if%>>Julio</option><option value="8" <%if a_cumple_mes=8 then%>selected<%end if%>>Agosto</option><option value="9" <%if a_cumple_mes=9 then%>selected<%end if%>>Septiembre</option><option value="10" <%if a_cumple_mes=10 then%>selected<%end if%>>Octubre</option><option value="11" <%if a_cumple_mes=11 then%>selected<%end if%>>Noviembre</option><option value="12" <%if a_cumple_mes=12 then%>selected<%end if%>>Diciembre</option>
</select>
</div>
<div class="col-md-3 form-group div_f_nacimiento" >
<select name="a_cumple_ano" id="a_cumple_ano" class="f_nacimiento" style="width:100%;"><option value="" selected="selected">año<%if u_agente<>"si"then%>*<%end if%></option>
<%for i=1940 to int(year(date))%><option value="<%=i%>" <%if a_cumple_anyo=i then%>selected<%end if%>><%=i%></option>
<%next%>
</select>
</div>
</div>
<div class="form-group"><i class="fa fa-calendar" aria-hidden="true"></i><input name="foo" type="text" class="form-control c-square c-theme input-lg inp" id="foo" placeholder="" title="" o value="<%=ob_rs2("a_cumple")%>" readonly data-toggle="tooltip" data-placement="top"></div>
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono'" class="form-control c-square c-theme input-lg inp" name="a_telefono" id="a_telefono" value="<%=ob_rs2("a_telefono")%>"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Móvil<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Móvil<%if u_agente<>"si"then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_movil" id="a_movil" value="<%=ob_rs2("a_movil")%>"></div>
<div class="form-group"><i class="fa fa-commenting-o" aria-hidden="true"></i><input type="text" placeholder="Móvil SMS<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Móvil SMS<%if u_agente<>"si"then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_movil_sms" id="a_movil_sms" data-toggle="tooltip" data-placement="top" title="Móvil al que enviaremos notificaciones" value="<%=ob_rs2("a_movil_sms")%>"></div>
<div class="form-group"><i class="fa fa-street-view" aria-hidden="true"></i><input type="text" placeholder="Dirección<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Dirección<%if u_agente<>"si"then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_direccion" id="a_direccion" value="<%=ob_rs2("a_direccion")%>"></div>
<div class="form-group"><i class="fa fa-map-marker" aria-hidden="true"></i><input type="text" placeholder="Ciudad / Localidad<%if u_agente<>"si"then%>*<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Ciudad / Localidad<%if u_agente<>"si"then%>*<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_ciudad" id="a_ciudad" value="<%=ob_rs2("a_ciudad")%>"></div>
<div class="form-group"><i class="fa fa-envelope-o" aria-hidden="true"></i><input type="text" placeholder="Código Postal" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código Postal'" class="form-control c-square c-theme input-lg inp" name="a_c_postal" id="a_c_postal" value="<%=ob_rs2("a_c_postal")%>"></div>
<div class="col-md-5 form-group" style="margin:0px;padding:0;margin-bottom:11px;" id="prov" >
<i class="fa fa-map-pin"></i>
<select name="a_provincia" id="a_provincia" style="margin-right:16px;width:100%;" class="select-provincia inp"><option value="" selected="selected">Provincia<%if u_agente<>"si"then%>*<%end if%></option><option value="ALAVA"<%if ob_rs2("a_provincia") = "ALAVA" then%>Selected<%end if%>>ALAVA</option><option value="ALBACETE" <%if ob_rs2("a_provincia") = "ALBACETE" then%>Selected<%end if%>>ALBACETE</option><option value="ALICANTE" <%if ob_rs2("a_provincia") = "ALICANTE" then%>Selected<%end if%>>ALICANTE</option><option value="ALMERIA" <%if ob_rs2("a_provincia") = "ALMERIA" then%>Selected<%end if%>>ALMERIA</option><option value="ASTURIAS" <%if ob_rs2("a_provincia") = "ASTURIAS" then%>Selected<%end if%>>ASTURIAS</option><option value="AVILA" <%if ob_rs2("a_provincia") = "AVILA" then%>Selected<%end if%>>AVILA</option><option value="BADAJOZ" <%if ob_rs2("a_provincia") = "BADAJOZ" then%>Selected<%end if%>>BADAJOZ</option><option value="BARCELONA" <%if ob_rs2("a_provincia") = "BARCELONA" then%>Selected<%end if%>>BARCELONA</option><option value="BURGOS" <%if ob_rs2("a_provincia") = "BURGOS" then%>Selected<%end if%>>BURGOS</option><option value="CACERES" <%if ob_rs2("a_provincia") = "CACERES" then%>Selected<%end if%>>CACERES</option><option value="CADIZ" <%if ob_rs2("a_provincia") = "CADIZ" then%>Selected<%end if%>>CADIZ</option><option value="CANTABRIA" <%if ob_rs2("a_provincia") = "CANTABRIA" then%>Selected<%end if%>>CANTABRIA</option><option value="CASTELLON" <%if ob_rs2("a_provincia") = "CASTELLON" then%>Selected<%end if%>>CASTELLON</option><option value="CEUTA" <%if ob_rs2("a_provincia") = "CEUTA" then%>Selected<%end if%>>CEUTA</option><option value="CIUDAD REAL" <%if ob_rs2("a_provincia") = "CIUDAD REAL" then%>Selected<%end if%>>CIUDAD REAL</option><option value="CORDOBA" <%if ob_rs2("a_provincia") = "CORDOBA" then%>Selected<%end if%>>CORDOBA</option><option value="CORU&Ntilde;A, A" <%if ob_rs2("a_provincia") = "CORU&Ntilde;A, A" then%>Selected<%end if%>>CORU&Ntilde;A, A</option><option value="CUENCA" <%if ob_rs2("a_provincia") = "CUENCA" then%>Selected<%end if%>>CUENCA</option><option value="GIRONA" <%if ob_rs2("a_provincia") = "GIRONA" then%>Selected<%end if%>>GIRONA</option><option value="GRANADA" <%if ob_rs2("a_provincia") = "GRANADA" then%>Selected<%end if%>>GRANADA</option><option value="GUADALAJARA" <%if ob_rs2("a_provincia") = "GUADALAJARA" then%>Selected<%end if%>>GUADALAJARA</option><option value="GUIPUZCOA" <%if ob_rs2("a_provincia") = "GUIPUZCOA" then%>Selected<%end if%>>GUIPUZCOA</option><option value="HUELVA" <%if ob_rs2("a_provincia") = "HUELVA" then%>Selected<%end if%>>HUELVA</option><option value="HUESCA" <%if ob_rs2("a_provincia") = "HUESCA" then%>Selected<%end if%>>HUESCA</option><option value="ILLES BALEARS" <%if ob_rs2("a_provincia") = "ILLES BALEARS" then%>Selected<%end if%>>ILLES BALEARS</option><option value="JAEN" <%if ob_rs2("a_provincia") = "JAEN" then%>Selected<%end if%>>JAEN</option><option value="LEON" <%if ob_rs2("a_provincia") = "LEON" then%>Selected<%end if%>>LEON</option><option value="LLEIDA" <%if ob_rs2("a_provincia") = "LLEIDA" then%>Selected<%end if%>>LLEIDA</option><option value="LUGO" <%if ob_rs2("a_provincia") = "LUGO" then%>Selected<%end if%>>LUGO</option><option value="MADRID" <%if ob_rs2("a_provincia") = "MADRID" then%>Selected<%end if%>>MADRID</option><option value="MALAGA" <%if ob_rs2("a_provincia") = "MALAGA" then%>Selected<%end if%>>MALAGA</option><option value="MELILLA" <%if ob_rs2("a_provincia") = "MELILLA" then%>Selected<%end if%>>MELILLA</option><option value="MURCIA" <%if ob_rs2("a_provincia") = "MURCIA" then%>Selected<%end if%>>MURCIA</option><option value="NAVARRA" <%if ob_rs2("a_provincia") = "NAVARRA" then%>Selected<%end if%>>NAVARRA</option><option value="OURENSE" <%if ob_rs2("a_provincia") = "OURENSE" then%>Selected<%end if%>>OURENSE</option><option value="PALENCIA" <%if ob_rs2("a_provincia") = "PALENCIA" then%>Selected<%end if%>>PALENCIA</option><option value="PALMAS, LAS" <%if ob_rs2("a_provincia") = "PALMAS, LAS" then%>Selected<%end if%>>PALMAS, LAS</option><option value="PONTEVEDRA" <%if ob_rs2("a_provincia") = "PONTEVEDRA" then%>Selected<%end if%>>PONTEVEDRA</option><option value="RIOJA, LA" <%if ob_rs2("a_provincia") = "RIOJA, LA" then%>Selected<%end if%>>RIOJA, LA</option><option value="SALAMANCA" <%if ob_rs2("a_provincia") = "SALAMANCA" then%>Selected<%end if%>>SALAMANCA</option><option value="SANTA CRUZ DE TENERIFE" <%if ob_rs2("a_provincia") = "SANTA CRUZ DE TENERIFE" then%>Selected<%end if%>>SANTA CRUZ DE TENERIFE</option><option value="SEGOVIA" <%if ob_rs2("a_provincia") = "SEGOVIA" then%>Selected<%end if%>>SEGOVIA</option><option value="SEVILLA" <%if ob_rs2("a_provincia") = "SEVILLA" then%>Selected<%end if%>>SEVILLA</option><option value="SORIA" <%if ob_rs2("a_provincia") = "SORIA" then%>Selected<%end if%>>SORIA</option><option value="TARRAGONA" <%if ob_rs2("a_provincia") = "TARRAGONA" then%>Selected<%end if%>>TARRAGONA</option><option value="TERUEL" <%if ob_rs2("a_provincia") = "TERUEL" then%>Selected<%end if%>>TERUEL</option><option value="TOLEDO" <%if ob_rs2("a_provincia") = "TOLEDO" then%>Selected<%end if%>>TOLEDO</option><option value="VALENCIA" <%if ob_rs2("a_provincia") = "VALENCIA" then%>Selected<%end if%>>VALENCIA</option><option value="VALLADOLID" <%if ob_rs2("a_provincia") = "VALLADOLID" then%>Selected<%end if%>>VALLADOLID</option><option value="VIZCAYA" <%if ob_rs2("a_provincia") = "VIZCAYA" then%>Selected<%end if%>>VIZCAYA</option><option value="ZAMORA" <%if ob_rs2("a_provincia") = "ZAMORA" then%>Selected<%end if%>>ZAMORA</option><option value="ZARAGOZA" <%if ob_rs2("a_provincia") = "ZARAGOZA" then%>Selected<%end if%>>ZARAGOZA</option><option value="OTRAS" <%if ob_rs2("a_provincia") = "OTRAS" then%>Selected<%end if%>>OTRAS</option>
</select>
</div>
<div class="col-md-7 form-group select-pais" style="margin:0px;padding:0px;padding-left:25px;margin-bottom:11px" id="pais_sel">
<select name="a_pais" id="a_pais" class="selects" style="width:100%;"><option value='ad' <%if ob_rs2("a_pais") = "ad" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ad" data-title="Andorra">Andorra</option><option value='ae' <%if ob_rs2("a_pais") = "ae" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ae" data-title="United Arab Emirates">United Arab Emirates</option><option value='af' <%if ob_rs2("a_pais") = "af" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag af" data-title="Afghanistan">Afghanistan</option><option value='ag' <%if ob_rs2("a_pais") = "ag" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ag" data-title="Antigua and Barbuda">Antigua and Barbuda</option><option value='ai' <%if ob_rs2("a_pais") = "ai" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ai" data-title="Anguilla">Anguilla</option><option value='al' <%if ob_rs2("a_pais") = "al" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag al" data-title="Albania">Albania</option><option value='am' <%if ob_rs2("a_pais") = "am" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag am" data-title="Armenia">Armenia</option><option value='an' <%if ob_rs2("a_pais") = "an" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag an" data-title="Netherlands Antilles">Netherlands Antilles</option><option value='ao' <%if ob_rs2("a_pais") = "ao" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ao" data-title="Angola">Angola</option><option value='aq' <%if ob_rs2("a_pais") = "aq" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aq" data-title="Antarctica">Antarctica</option><option value='ar' <%if ob_rs2("a_pais") = "ar" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ar" data-title="Argentina">Argentina</option><option value='as' <%if ob_rs2("a_pais") = "as" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag as" data-title="American Samoa">American Samoa</option><option value='at' <%if ob_rs2("a_pais") = "at" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag at" data-title="Austria">Austria</option><option value='au' <%if ob_rs2("a_pais") = "au" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag au" data-title="Australia">Australia</option><option value='aw' <%if ob_rs2("a_pais") = "aw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag aw" data-title="Aruba">Aruba</option><option value='ax' <%if ob_rs2("a_pais") = "ax" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ax" data-title="Aland Islands">Aland Islands</option><option value='az' <%if ob_rs2("a_pais") = "az" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag az" data-title="Azerbaijan">Azerbaijan</option><option value='ba' <%if ob_rs2("a_pais") = "ba" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ba" data-title="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value='bb' <%if ob_rs2("a_pais") = "bb" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bb" data-title="Barbados">Barbados</option><option value='bd' <%if ob_rs2("a_pais") = "bd" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bd" data-title="Bangladesh">Bangladesh</option><option value='be' <%if ob_rs2("a_pais") = "be" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag be" data-title="Belgium">Belgium</option><option value='bf' <%if ob_rs2("a_pais") = "bf" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bf" data-title="Burkina Faso">Burkina Faso</option><option value='bg' <%if ob_rs2("a_pais") = "bg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bg" data-title="Bulgaria">Bulgaria</option><option value='bh' <%if ob_rs2("a_pais") = "bh" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bh" data-title="Bahrain">Bahrain</option><option value='bi' <%if ob_rs2("a_pais") = "bi" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bi" data-title="Burundi">Burundi</option><option value='bj' <%if ob_rs2("a_pais") = "bj" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bj" data-title="Benin">Benin</option><option value='bm' <%if ob_rs2("a_pais") = "bm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bm" data-title="Bermuda">Bermuda</option><option value='bn' <%if ob_rs2("a_pais") = "bn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bn" data-title="Brunei Darussalam">Brunei Darussalam</option><option value='bo' <%if ob_rs2("a_pais") = "bo" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bo" data-title="Bolivia">Bolivia</option><option value='br' <%if ob_rs2("a_pais") = "br" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag br" data-title="Brazil">Brazil</option><option value='bs' <%if ob_rs2("a_pais") = "bs" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bs" data-title="Bahamas">Bahamas</option><option value='bt' <%if ob_rs2("a_pais") = "bt" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bt" data-title="Bhutan">Bhutan</option><option value='bv' <%if ob_rs2("a_pais") = "bv" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bv" data-title="Bouvet Island">Bouvet Island</option><option value='bw' <%if ob_rs2("a_pais") = "bw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bw" data-title="Botswana">Botswana</option><option value='by' <%if ob_rs2("a_pais") = "by" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag by" data-title="Belarus">Belarus</option><option value='bz' <%if ob_rs2("a_pais") = "bz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag bz" data-title="Belize">Belize</option><option value='ca' <%if ob_rs2("a_pais") = "ca" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ca" data-title="Canada">Canada</option><option value='cc' <%if ob_rs2("a_pais") = "cc" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cc" data-title="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value='cd' <%if ob_rs2("a_pais") = "cd" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cd" data-title="Democratic Republic of the Congo">Democratic Republic of the Congo</option><option value='cf' <%if ob_rs2("a_pais") = "cf" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cf" data-title="Central African Republic">Central African Republic</option><option value='cg' <%if ob_rs2("a_pais") = "cg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cg" data-title="Congo">Congo</option><option value='ch' <%if ob_rs2("a_pais") = "ch" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ch" data-title="Switzerland">Switzerland</option><option value='ci' <%if ob_rs2("a_pais") = "ci" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ci" data-title="Cote D'Ivoire (Ivory Coast)">Cote D'Ivoire (Ivory Coast)</option><option value='ck' <%if ob_rs2("a_pais") = "ck" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ck" data-title="Cook Islands">Cook Islands</option><option value='cl' <%if ob_rs2("a_pais") = "cl" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cl" data-title="Chile">Chile</option><option value='cm' <%if ob_rs2("a_pais") = "cm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cm" data-title="Cameroon">Cameroon</option><option value='cn' <%if ob_rs2("a_pais") = "cn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cn" data-title="China">China</option><option value='co' <%if ob_rs2("a_pais") = "co" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag co" data-title="Colombia">Colombia</option><option value='cr' <%if ob_rs2("a_pais") = "cr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cr" data-title="Costa Rica">Costa Rica</option><option value='cs' <%if ob_rs2("a_pais") = "cs" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cs" data-title="Serbia and Montenegro">Serbia and Montenegro</option><option value='cu' <%if ob_rs2("a_pais") = "cu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cu" data-title="Cuba">Cuba</option><option value='cv' <%if ob_rs2("a_pais") = "cv" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cv" data-title="Cape Verde">Cape Verde</option><option value='cx' <%if ob_rs2("a_pais") = "cx" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cx" data-title="Christmas Island">Christmas Island</option><option value='cy' <%if ob_rs2("a_pais") = "cy" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cy" data-title="Cyprus">Cyprus</option><option value='cz' <%if ob_rs2("a_pais") = "cz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag cz" data-title="Czech Republic">Czech Republic</option><option value='de' <%if ob_rs2("a_pais") = "de" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag de" data-title="Germany">Germany</option><option value='dj' <%if ob_rs2("a_pais") = "dj" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dj" data-title="Djibouti">Djibouti</option><option value='dk' <%if ob_rs2("a_pais") = "dk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dk" data-title="Denmark">Denmark</option><option value='dm' <%if ob_rs2("a_pais") = "dm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dm" data-title="Dominica">Dominica</option><option value='do' <%if ob_rs2("a_pais") = "do" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag do" data-title="Dominican Republic">Dominican Republic</option><option value='dz' <%if ob_rs2("a_pais") = "dz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag dz" data-title="Algeria">Algeria</option><option value='ec' <%if ob_rs2("a_pais") = "ec" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ec" data-title="Ecuador">Ecuador</option><option value='ee' <%if ob_rs2("a_pais") = "ee" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ee" data-title="Estonia">Estonia</option><option value='eg' <%if ob_rs2("a_pais") = "eg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eg" data-title="Egypt">Egypt</option><option value='eh' <%if ob_rs2("a_pais") = "eh" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag eh" data-title="Western Sahara">Western Sahara</option><option value='er' <%if ob_rs2("a_pais") = "er" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag er" data-title="Eritrea">Eritrea</option><option value='es' <%if ob_rs2("a_pais") = "es" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag es" data-title="Spain" >España / Spain</option><option value='et' <%if ob_rs2("a_pais") = "et" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag et" data-title="Ethiopia">Ethiopia</option><option value='fi' <%if ob_rs2("a_pais") = "fi" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fi" data-title="Finland">Finland</option><option value='fj' <%if ob_rs2("a_pais") = "fj" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fj" data-title="Fiji">Fiji</option><option value='fk' <%if ob_rs2("a_pais") = "fk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fk" data-title="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option><option value='fm' <%if ob_rs2("a_pais") = "fm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fm" data-title="Federated States of Micronesia">Federated States of Micronesia</option><option value='fo' <%if ob_rs2("a_pais") = "fo" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fo" data-title="Faroe Islands">Faroe Islands</option><option value='fr' <%if ob_rs2("a_pais") = "fr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fr" data-title="France">France</option><option value='fx' <%if ob_rs2("a_pais") = "fx" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag fx" data-title="France, Metropolitan">France, Metropolitan</option><option value='ga' <%if ob_rs2("a_pais") = "ga" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ga" data-title="Gabon">Gabon</option><option value='gb' <%if ob_rs2("a_pais") = "gb" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gb" data-title="Great Britain (UK)">Great Britain (UK)</option><option value='gd' <%if ob_rs2("a_pais") = "gd" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gd" data-title="Grenada">Grenada</option><option value='ge' <%if ob_rs2("a_pais") = "ge" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ge" data-title="Georgia">Georgia</option><option value='gf' <%if ob_rs2("a_pais") = "gf" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gf" data-title="French Guiana">French Guiana</option><option value='gh' <%if ob_rs2("a_pais") = "gh" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gh" data-title="Ghana">Ghana</option><option value='gi' <%if ob_rs2("a_pais") = "gi" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gi" data-title="Gibraltar">Gibraltar</option><option value='gl' <%if ob_rs2("a_pais") = "gl" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gl" data-title="Greenland">Greenland</option><option value='gm' <%if ob_rs2("a_pais") = "gm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gm" data-title="Gambia">Gambia</option><option value='gn' <%if ob_rs2("a_pais") = "gn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gn" data-title="Guinea">Guinea</option><option value='gp' <%if ob_rs2("a_pais") = "gp" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gp" data-title="Guadeloupe">Guadeloupe</option><option value='gq' <%if ob_rs2("a_pais") = "gq" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gq" data-title="Equatorial Guinea">Equatorial Guinea</option><option value='gr' <%if ob_rs2("a_pais") = "gr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gr" data-title="Greece">Greece</option><option value='gs' <%if ob_rs2("a_pais") = "gs" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gs" data-title="S. Georgia and S. Sandwich Islands">S. Georgia and S. Sandwich Islands</option><option value='gt' <%if ob_rs2("a_pais") = "gt" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gt" data-title="Guatemala">Guatemala</option><option value='gu' <%if ob_rs2("a_pais") = "gu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gu" data-title="Guam">Guam</option><option value='gw' <%if ob_rs2("a_pais") = "gw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gw" data-title="Guinea-Bissau">Guinea-Bissau</option><option value='gy' <%if ob_rs2("a_pais") = "gy" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag gy" data-title="Guyana">Guyana</option><option value='hk' <%if ob_rs2("a_pais") = "hk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hk" data-title="Hong Kong">Hong Kong</option><option value='hm' <%if ob_rs2("a_pais") = "hm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hm" data-title="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value='hn' <%if ob_rs2("a_pais") = "hn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hn" data-title="Honduras">Honduras</option><option value='hr' <%if ob_rs2("a_pais") = "hr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hr" data-title="Croatia (Hrvatska)">Croatia (Hrvatska)</option><option value='ht' <%if ob_rs2("a_pais") = "ht" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ht" data-title="Haiti">Haiti</option><option value='hu' <%if ob_rs2("a_pais") = "hu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag hu" data-title="Hungary">Hungary</option><option value='id' <%if ob_rs2("a_pais") = "id" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag id" data-title="Indonesia">Indonesia</option><option value='ie' <%if ob_rs2("a_pais") = "ie" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ie" data-title="Ireland">Ireland</option><option value='il' <%if ob_rs2("a_pais") = "il" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag il" data-title="Israel">Israel</option><option value='in' <%if ob_rs2("a_pais") = "in" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag in" data-title="India" >India</option><option value='io' <%if ob_rs2("a_pais") = "io" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag io" data-title="British Indian Ocean Territory">British Indian Ocean Territory</option><option value='iq' <%if ob_rs2("a_pais") = "iq" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag iq" data-title="Iraq">Iraq</option><option value='ir' <%if ob_rs2("a_pais") = "ir" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ir" data-title="Iran">Iran</option><option value='is' <%if ob_rs2("a_pais") = "is" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag is" data-title="Iceland">Iceland</option><option value='it' <%if ob_rs2("a_pais") = "it" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag it" data-title="Italy">Italy</option><option value='jm' <%if ob_rs2("a_pais") = "jm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jm" data-title="Jamaica">Jamaica</option><option value='jo' <%if ob_rs2("a_pais") = "jo" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jo" data-title="Jordan">Jordan</option><option value='jp' <%if ob_rs2("a_pais") = "jp" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag jp" data-title="Japan">Japan</option><option value='ke' <%if ob_rs2("a_pais") = "ke" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ke" data-title="Kenya">Kenya</option><option value='kg' <%if ob_rs2("a_pais") = "kg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kg" data-title="Kyrgyzstan">Kyrgyzstan</option><option value='kh' <%if ob_rs2("a_pais") = "kh" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kh" data-title="Cambodia">Cambodia</option><option value='ki' <%if ob_rs2("a_pais") = "ki" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ki" data-title="Kiribati">Kiribati</option><option value='km' <%if ob_rs2("a_pais") = "km" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag km" data-title="Comoros">Comoros</option><option value='kn' <%if ob_rs2("a_pais") = "kn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kn" data-title="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value='kp' <%if ob_rs2("a_pais") = "kp" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kp" data-title="Korea (North)">Korea (North)</option><option value='kr' <%if ob_rs2("a_pais") = "kr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kr" data-title="Korea (South)">Korea (South)</option><option value='kw' <%if ob_rs2("a_pais") = "kw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kw" data-title="Kuwait">Kuwait</option><option value='ky' <%if ob_rs2("a_pais") = "ky" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ky" data-title="Cayman Islands">Cayman Islands</option><option value='kz' <%if ob_rs2("a_pais") = "kz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag kz" data-title="Kazakhstan">Kazakhstan</option><option value='la' <%if ob_rs2("a_pais") = "la" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag la" data-title="Laos">Laos</option><option value='lb' <%if ob_rs2("a_pais") = "lb" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lb" data-title="Lebanon">Lebanon</option><option value='lc' <%if ob_rs2("a_pais") = "lc" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lc" data-title="Saint Lucia">Saint Lucia</option><option value='li' <%if ob_rs2("a_pais") = "li" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag li" data-title="Liechtenstein">Liechtenstein</option><option value='lk' <%if ob_rs2("a_pais") = "lk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lk" data-title="Sri Lanka">Sri Lanka</option><option value='lr' <%if ob_rs2("a_pais") = "lr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lr" data-title="Liberia">Liberia</option><option value='ls' <%if ob_rs2("a_pais") = "ls" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ls" data-title="Lesotho">Lesotho</option><option value='lt' <%if ob_rs2("a_pais") = "lt" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lt" data-title="Lithuania">Lithuania</option><option value='lu' <%if ob_rs2("a_pais") = "lu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lu" data-title="Luxembourg">Luxembourg</option><option value='lv' <%if ob_rs2("a_pais") = "lv" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag lv" data-title="Latvia">Latvia</option><option value='ly' <%if ob_rs2("a_pais") = "ly" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ly" data-title="Libya">Libya</option><option value='ma' <%if ob_rs2("a_pais") = "ma" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ma" data-title="Morocco">Morocco</option><option value='mc' <%if ob_rs2("a_pais") = "mc" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mc" data-title="Monaco">Monaco</option><option value='md' <%if ob_rs2("a_pais") = "md" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag md" data-title="Moldova">Moldova</option><option value='mg' <%if ob_rs2("a_pais") = "mg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mg" data-title="Madagascar">Madagascar</option><option value='mh' <%if ob_rs2("a_pais") = "mh" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mh" data-title="Marshall Islands">Marshall Islands</option><option value='mk' <%if ob_rs2("a_pais") = "mk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mk" data-title="Macedonia">Macedonia</option><option value='ml' <%if ob_rs2("a_pais") = "ml" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ml" data-title="Mali">Mali</option><option value='mm' <%if ob_rs2("a_pais") = "mm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mm" data-title="Myanmar">Myanmar</option><option value='mn' <%if ob_rs2("a_pais") = "mn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mn" data-title="Mongolia">Mongolia</option><option value='mo' <%if ob_rs2("a_pais") = "mo" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mo" data-title="Macao">Macao</option><option value='mp' <%if ob_rs2("a_pais") = "mp" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mp" data-title="Northern Mariana Islands">Northern Mariana Islands</option><option value='mq' <%if ob_rs2("a_pais") = "mq" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mq" data-title="Martinique">Martinique</option><option value='mr' <%if ob_rs2("a_pais") = "mr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mr" data-title="Mauritania">Mauritania</option><option value='ms' <%if ob_rs2("a_pais") = "ms" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ms" data-title="Montserrat">Montserrat</option><option value='mt' <%if ob_rs2("a_pais") = "mt" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mt" data-title="Malta">Malta</option><option value='mu' <%if ob_rs2("a_pais") = "mu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mu" data-title="Mauritius">Mauritius</option><option value='mv' <%if ob_rs2("a_pais") = "mv" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mv" data-title="Maldives">Maldives</option><option value='mw' <%if ob_rs2("a_pais") = "mw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mw" data-title="Malawi">Malawi</option><option value='mx' <%if ob_rs2("a_pais") = "mx" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mx" data-title="Mexico">Mexico</option><option value='my' <%if ob_rs2("a_pais") = "my" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag my" data-title="Malaysia">Malaysia</option><option value='mz' <%if ob_rs2("a_pais") = "mz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag mz" data-title="Mozambique">Mozambique</option><option value='na' <%if ob_rs2("a_pais") = "na" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag na" data-title="Namibia">Namibia</option><option value='nc' <%if ob_rs2("a_pais") = "nc" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nc" data-title="New Caledonia">New Caledonia</option><option value='ne' <%if ob_rs2("a_pais") = "ne" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ne" data-title="Niger">Niger</option><option value='nf' <%if ob_rs2("a_pais") = "nf" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nf" data-title="Norfolk Island">Norfolk Island</option><option value='ng' <%if ob_rs2("a_pais") = "ng" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ng" data-title="Nigeria">Nigeria</option><option value='ni' <%if ob_rs2("a_pais") = "ni" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ni" data-title="Nicaragua">Nicaragua</option><option value='nl' <%if ob_rs2("a_pais") = "nl" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nl" data-title="Netherlands">Netherlands</option><option value='no' <%if ob_rs2("a_pais") = "no" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag no" data-title="Norway">Norway</option><option value='np' <%if ob_rs2("a_pais") = "np" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag np" data-title="Nepal">Nepal</option><option value='nr' <%if ob_rs2("a_pais") = "nr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nr" data-title="Nauru">Nauru</option><option value='nu' <%if ob_rs2("a_pais") = "nu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nu" data-title="Niue">Niue</option><option value='nz' <%if ob_rs2("a_pais") = "nz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag nz" data-title="New Zealand (Aotearoa)">New Zealand (Aotearoa)</option><option value='om' <%if ob_rs2("a_pais") = "om" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag om" data-title="Oman">Oman</option><option value='pa' <%if ob_rs2("a_pais") = "pa" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pa" data-title="Panama">Panama</option><option value='pe' <%if ob_rs2("a_pais") = "pe" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pe" data-title="Peru">Peru</option><option value='pf' <%if ob_rs2("a_pais") = "pf" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pf" data-title="French Polynesia">French Polynesia</option><option value='pg' <%if ob_rs2("a_pais") = "pg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pg" data-title="Papua New Guinea">Papua New Guinea</option><option value='ph' <%if ob_rs2("a_pais") = "ph" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ph" data-title="Philippines">Philippines</option><option value='pk' <%if ob_rs2("a_pais") = "pk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pk" data-title="Pakistan">Pakistan</option><option value='pl' <%if ob_rs2("a_pais") = "pl" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pl" data-title="Poland">Poland</option><option value='pm' <%if ob_rs2("a_pais") = "pm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pm" data-title="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value='pn' <%if ob_rs2("a_pais") = "pn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pn" data-title="Pitcairn">Pitcairn</option><option value='pr' <%if ob_rs2("a_pais") = "pr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pr" data-title="Puerto Rico">Puerto Rico</option><option value='ps' <%if ob_rs2("a_pais") = "ps" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ps" data-title="Palestinian Territory">Palestinian Territory</option><option value='pt' <%if ob_rs2("a_pais") = "pt" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pt" data-title="Portugal">Portugal</option><option value='pw' <%if ob_rs2("a_pais") = "pw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag pw" data-title="Palau">Palau</option><option value='py' <%if ob_rs2("a_pais") = "py" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag py" data-title="Paraguay">Paraguay</option><option value='qa' <%if ob_rs2("a_pais") = "qa" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag qa" data-title="Qatar">Qatar</option><option value='re' <%if ob_rs2("a_pais") = "re" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag re" data-title="Reunion">Reunion</option><option value='ro' <%if ob_rs2("a_pais") = "ro" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ro" data-title="Romania">Romania</option><option value='ru' <%if ob_rs2("a_pais") = "ru" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ru" data-title="Russian Federation">Russian Federation</option><option value='rw' <%if ob_rs2("a_pais") = "rw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag rw" data-title="Rwanda">Rwanda</option><option value='sa' <%if ob_rs2("a_pais") = "sa" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sa" data-title="Saudi Arabia">Saudi Arabia</option><option value='sb' <%if ob_rs2("a_pais") = "sb" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sb" data-title="Solomon Islands">Solomon Islands</option><option value='sc' <%if ob_rs2("a_pais") = "sc" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sc" data-title="Seychelles">Seychelles</option><option value='sd' <%if ob_rs2("a_pais") = "sd" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sd" data-title="Sudan">Sudan</option><option value='se' <%if ob_rs2("a_pais") = "se" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag se" data-title="Sweden">Sweden</option><option value='sg' <%if ob_rs2("a_pais") = "sg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sg" data-title="Singapore">Singapore</option><option value='sh' <%if ob_rs2("a_pais") = "sh" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sh" data-title="Saint Helena">Saint Helena</option><option value='si' <%if ob_rs2("a_pais") = "si" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag si" data-title="Slovenia">Slovenia</option><option value='sj' <%if ob_rs2("a_pais") = "sj" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sj" data-title="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option><option value='sk' <%if ob_rs2("a_pais") = "sk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sk" data-title="Slovakia">Slovakia</option><option value='sl' <%if ob_rs2("a_pais") = "sl" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sl" data-title="Sierra Leone">Sierra Leone</option><option value='sm' <%if ob_rs2("a_pais") = "sm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sm" data-title="San Marino">San Marino</option><option value='sn' <%if ob_rs2("a_pais") = "sn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sn" data-title="Senegal">Senegal</option><option value='so' <%if ob_rs2("a_pais") = "so" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag so" data-title="Somalia">Somalia</option><option value='sr' <%if ob_rs2("a_pais") = "sr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sr" data-title="Suriname">Suriname</option><option value='st' <%if ob_rs2("a_pais") = "st" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag st" data-title="Sao Tome and Principe">Sao Tome and Principe</option><option value='su' <%if ob_rs2("a_pais") = "su" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag su" data-title="USSR (former)">USSR (former)</option><option value='sv' <%if ob_rs2("a_pais") = "sv" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sv" data-title="El Salvador">El Salvador</option><option value='sy' <%if ob_rs2("a_pais") = "sy" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sy" data-title="Syria">Syria</option><option value='sz' <%if ob_rs2("a_pais") = "sz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag sz" data-title="Swaziland">Swaziland</option><option value='tc' <%if ob_rs2("a_pais") = "tc" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tc" data-title="Turks and Caicos Islands">Turks and Caicos Islands</option><option value='td' <%if ob_rs2("a_pais") = "td" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag td" data-title="Chad">Chad</option><option value='tf' <%if ob_rs2("a_pais") = "tf" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tf" data-title="French Southern Territories">French Southern Territories</option><option value='tg' <%if ob_rs2("a_pais") = "tg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tg" data-title="Togo">Togo</option><option value='th' <%if ob_rs2("a_pais") = "th" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag th" data-title="Thailand">Thailand</option><option value='tj' <%if ob_rs2("a_pais") = "tj" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tj" data-title="Tajikistan">Tajikistan</option><option value='tk' <%if ob_rs2("a_pais") = "tk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tk" data-title="Tokelau">Tokelau</option><option value='tl' <%if ob_rs2("a_pais") = "tl" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tl" data-title="Timor-Leste">Timor-Leste</option><option value='tm' <%if ob_rs2("a_pais") = "tm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tm" data-title="Turkmenistan">Turkmenistan</option><option value='tn' <%if ob_rs2("a_pais") = "tn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tn" data-title="Tunisia">Tunisia</option><option value='to' <%if ob_rs2("a_pais") = "to" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag to" data-title="Tonga">Tonga</option><option value='tp' <%if ob_rs2("a_pais") = "tp" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tp" data-title="East Timor">East Timor</option><option value='tr' <%if ob_rs2("a_pais") = "tr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tr" data-title="Turkey">Turkey</option><option value='tt' <%if ob_rs2("a_pais") = "tt" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tt" data-title="Trinidad and Tobago">Trinidad and Tobago</option><option value='tv' <%if ob_rs2("a_pais") = "tv" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tv" data-title="Tuvalu">Tuvalu</option><option value='tw' <%if ob_rs2("a_pais") = "tw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tw" data-title="Taiwan">Taiwan</option><option value='tz' <%if ob_rs2("a_pais") = "tz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag tz" data-title="Tanzania">Tanzania</option><option value='ua' <%if ob_rs2("a_pais") = "ua" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ua" data-title="Ukraine">Ukraine</option><option value='ug' <%if ob_rs2("a_pais") = "ug" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ug" data-title="Uganda">Uganda</option><option value='uk' <%if ob_rs2("a_pais") = "uk" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uk" data-title="United Kingdom">United Kingdom</option><option value='um' <%if ob_rs2("a_pais") = "um" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag um" data-title="United States Minor Outlying Islands">United States Minor Outlying Islands</option><option value='us' <%if ob_rs2("a_pais") = "us" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag us" data-title="United States">United States</option><option value='uy' <%if ob_rs2("a_pais") = "uy" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uy" data-title="Uruguay">Uruguay</option><option value='uz' <%if ob_rs2("a_pais") = "uz" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag uz" data-title="Uzbekistan">Uzbekistan</option><option value='va' <%if ob_rs2("a_pais") = "va" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag va" data-title="Vatican City State (Holy See)">Vatican City State (Holy See)</option><option value='vc' <%if ob_rs2("a_pais") = "vc" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vc" data-title="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value='ve' <%if ob_rs2("a_pais") = "ve" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ve" data-title="Venezuela">Venezuela</option><option value='vg' <%if ob_rs2("a_pais") = "vg" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vg" data-title="Virgin Islands (British)">Virgin Islands (British)</option><option value='vi' <%if ob_rs2("a_pais") = "vi" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vi" data-title="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option><option value='vn' <%if ob_rs2("a_pais") = "vn" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vn" data-title="Viet Nam">Viet Nam</option><option value='vu' <%if ob_rs2("a_pais") = "vu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag vu" data-title="Vanuatu">Vanuatu</option><option value='wf' <%if ob_rs2("a_pais") = "wf" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag wf" data-title="Wallis and Futuna">Wallis and Futuna</option><option value='ws' <%if ob_rs2("a_pais") = "ws" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ws" data-title="Samoa">Samoa</option><option value='ye' <%if ob_rs2("a_pais") = "ye" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag ye" data-title="Yemen">Yemen</option><option value='yt' <%if ob_rs2("a_pais") = "yt" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yt" data-title="Mayotte">Mayotte</option><option value='yu' <%if ob_rs2("a_pais") = "yu" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag yu" data-title="Yugoslavia (former)">Yugoslavia (former)</option><option value='za' <%if ob_rs2("a_pais") = "za" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag za" data-title="South Africa">South Africa</option><option value='zm' <%if ob_rs2("a_pais") = "zm" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zm" data-title="Zambia">Zambia</option><option value='zr' <%if ob_rs2("a_pais") = "zr" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zr" data-title="Zaire (former)">Zaire (former)</option><option value='zw' <%if ob_rs2("a_pais") = "zw" then%>Selected<%end if%> data-image="<%=r%>web/lib/img/msdropdown/icons/blank.gif" data-imagecss="flag zw" data-title="Zimbabwe">Zimbabwe</option></select>
</div>
</div>
<%if datos_familia_ob="si" then%>
<div class="col-md-12" style="margin-top:25px"><div class="panel panel-default" style="margin-bottom:25px"><div class="panel-heading"><h3 class="panel-title" style="padding:15px;font-size:1em"><i class="fa fa-users" aria-hidden="true"></i> Datos Familiares</h3></div></div></div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Nombre del padre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre del padre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_p_nombre" id="a_p_nombre"  value="<%=ob_rs2("a_p_nombre")%>"></div>
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Apellidos del padre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Apellidos del padre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_p_apellidos" id="a_p_apellidos"  value="<%=ob_rs2("a_p_apellidos")%>"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="Email del padre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Email del padre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp"  name="a_p_email" id="a_p_email" value="<%=ob_rs2("a_p_email")%>"></div>
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono del padre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono del padre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_p_telefono" id="a_p_telefono" value="<%=ob_rs2("a_p_telefono")%>"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Teléfono móvil del padre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono móvil del padre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_p_movil" id="a_p_movil" value="<%=ob_rs2("a_p_movil")%>"></div>
<div class="form-group"><i class="fa fa-building-o" aria-hidden="true"></i><input type="text" placeholder="Profesión del padre" onclick="this.placeholder = ''" onblur="this.placeholder = 'Profesión del padre'" class="form-control c-square c-theme input-lg inp" name="a_p_profesion" id="a_p_profesion" value="<%=ob_rs2("a_p_profesion")%>"></div>
</div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Nombre de la madre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Nombre de la madre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_m_nombre" id="a_m_nombre" value="<%=ob_rs2("a_m_nombre")%>"></div>
<div class="form-group"><i class="fa fa-user" aria-hidden="true"></i><input type="text" placeholder="Apellidos de la madre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Apellidos de la madre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_m_apellidos" id="a_m_apellidos" value="<%=ob_rs2("a_m_apellidos")%>"></div>
<div class="form-group"><i class="fa fa-envelope" aria-hidden="true"></i><input type="text" placeholder="Email de la madre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Email de la madre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp"  name="a_m_email" id="a_m_email" value="<%=ob_rs2("a_m_email")%>"></div>
<div class="form-group"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" placeholder="Teléfono de la madre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono de la madre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_m_telefono" id="a_m_telefono" value="<%=ob_rs2("a_m_telefono")%>"></div>
<div class="form-group"><i class="fa fa-mobile" aria-hidden="true"></i><input type="text" placeholder="Teléfono móvil de la madre <%if u_agente<>"si"then%>(*)<%end if%>" onclick="this.placeholder = ''" onblur="this.placeholder = 'Teléfono móvil de la madre <%if u_agente<>"si"then%>(*)<%end if%>'" class="form-control c-square c-theme input-lg inp" name="a_m_movil" id="a_m_movil" value="<%=ob_rs2("a_m_movil")%>"></div>
<div class="form-group"><i class="fa fa-building-o" aria-hidden="true"></i><input type="text" placeholder="Profesión de la madre" onclick="this.placeholder = ''" onblur="this.placeholder = 'Profesión de la madre'" class="form-control c-square c-theme input-lg inp" name="a_m_profesion" id="a_m_profesion" value="<%=ob_rs2("a_m_profesion")%>"></div>
</div>
<%end if%>
<div class="col-md-12" style="margin-top:25px">
<div class="panel panel-default" style="margin-bottom:25px"><div class="panel-heading"><h3 class="panel-title" style="padding:15px;font-size:1em"><i class="fa fa-medkit" aria-hidden="true"></i> Datos Médicos & Complementarios</h3></div></div></div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-heart-o" aria-hidden="true"></i><input name="a_enfermedades" type="text" class="form-control c-square c-theme input-lg inp" id="a_enfermedades" placeholder="Enfermedades reseñables incluidas alergias" title="Enfermedades a tener en cuenta durante el curso" onblur="this.placeholder = 'Listado de enfermedades reseñables'" onclick="this.placeholder = ''" value="<%=ob_rs2("a_enfermedades")%>" readonly  data-toggle="tooltip" data-placement="top"></div>
<div class="form-group"><i class="fa fa-eyedropper" aria-hidden="true"></i><input name="a_medicamentos" type="text" class="form-control c-square c-theme input-lg inp" id="a_medicamentos" placeholder="Medicamentos a tomar" onblur="this.placeholder = 'Medicamentos a tomar'" onclick="this.placeholder = ''" value="<%=ob_rs2("a_medicamentos")%>" readonly></div>
<span class="agrees">Estoy de acuerdo en autorizar a Cursit, la organización con la que colabora em el país de destino o a la familia en la que me hospede, a actuar por mi en caso de emergencia, accidente o enfermedad durante el periodo de tiempo que dure el programa que esté realizando.</span>
<div class="form-group form-c-radios"><div class="c-radio-inline"><div class="c-radio">
<input name="a_permiso_medico" type="radio" class="c-radio" id="permiso1" value="si" <%if ob_rs2("a_permiso_medico")="si"then%>checked<%end if%>>
<label for="permiso1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input type="radio" id="permiso2" class="c-radio" value="no" name="a_permiso_medico" <%if ob_rs2("a_permiso_medico")<>"si"then%>checked<%end if%>>
<label for="permiso2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div></div></div>
<div class="form-group form-c-radios"><label class=" control-label" style="padding:0;padding-top:6px;width:60%;float:left;max-width:130px"><i class="fa fa-apple" aria-hidden="true" style="margin-right:9px"></i>Vegetariano</label>
<div class=""  style="padding:0;padding-top:0px;width:60%;float:left;max-width:170px">
<div class="c-radio-inline">
<div class="c-radio">
<input name="a_vegetariano" type="radio" class="c-radio" id="vegetariano1" value="si" <%if ob_rs2("a_vegetariano")="si"then%>checked<%end if%>>
<label for="vegetariano1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input type="radio" id="vegetariano2" class="c-radio" checked name="a_vegetariano" value="no" <%if ob_rs2("a_vegetariano")="no"then%>checked<%end if%>>
<label for="vegetariano2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div></div></div>
<label class="control-label" style="padding:0;padding-top:6px;width:60%;float:left;max-width:97px"><i class="fa fa-fire" aria-hidden="true" style="margin-right:5px"></i>¿Fumas?</label>
<div class="" style="padding:0;padding-top:0px;width:60%;float:left;max-width:120px">
<div class="c-radio-inline">
<div class="c-radio">
<input name="a_fuma" type="radio" class="c-radio" id="fuma1" value="si" <%if ob_rs2("a_fuma")="si"then%>checked<%end if%>>
<label for="fuma1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input type="radio" id="fuma2" class="c-radio" checked name="a_fuma" value="no" <%if ob_rs2("a_fuma")="no"then%>checked<%end if%>>
<label for="fuma2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
</div>
<div class="col-md-6">
<div class="form-group"><i class="fa fa-university" aria-hidden="true"></i><input type="text" placeholder="¿A qué colegio o instituto vas?" onclick="this.placeholder = ''" onblur="this.placeholder = '¿A qué colegio o instituto vas?'" class="form-control c-square c-theme input-lg inp" name="a_colegio" id="a_colegio" value="<%=ob_rs2("a_colegio")%>"></div>
<div class="form-group form-c-radios">
<label class="col-md-8 control-label" style="padding-left:0px">¿Has hecho algún curso similar anteriormente?</label>
<div class="col-md-4">
<div class="c-radio-inline">
<div class="c-radio">
<input name="a_curso_ant" type="radio" class="c-radio" id="a_curso_ant1" value="si" <%if ob_rs2("a_curso_ant")="si"then%>checked<%end if%>>
<label for="a_curso_ant1"><span></span><span class="check"></span><span class="box"></span> Sí</label>
</div>
<div class="c-radio">
<input  name="a_curso_ant" type="radio" class="c-radio" id="a_curso_ant2" value="no" <%if ob_rs2("a_curso_ant")="no"then%>checked<%end if%>>
<label for="a_curso_ant2"><span></span><span class="check"></span><span class="box"></span> No</label>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
<div class="form-group"><i class="fa fa-building-o" aria-hidden="true"></i><input type="text" placeholder="¿Con qué organización?" onclick="this.placeholder = ''" onblur="this.placeholder = '¿Con qué organización?'" class="form-control c-square c-theme input-lg inp" name="a_curso_ant_org" id="a_curso_ant_org" value="<%=ob_rs2("a_curso_ant_org")%>"></div>
<div class="col-md-5 form-group" style="margin:0px;margin-right:25px;padding:0;margin-bottom:11px;display:none" id="prov" >
<i class="fa fa-expand"></i>
<select name="a_talla" id="a_talla" style="margin-right:16px;width:100%;" class="select-provincia inp" ><option value="" selected="selected">Talla de camiseta</option><option value="S">S</option><option value="M">M</option><option value="L">L</option><option value="XL">XL</option><option value="XXL">XXL</option></select></div>
<div class="col-md-10 form-group" style="margin:0px;padding:0;margin-bottom:11px;" id="prov" >
<i class="fa fa-search"></i>
<select name="a_conocido" id="a_conocido" style="margin-right:16px;width:100%;" class="select-provincia inp"><option value="" selected="selected">¿Cómo nos has conocido?</option><option value="Prensa" <%if ob_rs2("a_conocido")="Prensa"then%>selected<%end if%>>Prensa</option><option value="Buscador de Internet" <%if ob_rs2("a_conocido")="Buscador de Internet"then%>selected<%end if%>>Buscador de Internet</option><option value="Vallas Publicitarias" <%if ob_rs2("a_conocido")="Vallas Publicitarias"then%>selected<%end if%>>Vallas Publicitarias</option><option value="Colegio" <%if ob_rs2("a_conocido")="Colegio"then%>selected<%end if%>>Colegio</option><option value="Agente/Agencia" <%if ob_rs2("a_conocido")="Agente/Agencia"then%>selected<%end if%>>Agente/Agencia</option><option value="Amigo" <%if ob_rs2("a_conocido")="Amigo"then%>selected<%end if%>>Amigo</option>
</select>
</div>
<div class="clearfix"></div>
</div>
<div class="col-md-12" style="margin-top:35px">
<div class="form-group"><i class="fa fa-comments-o" aria-hidden="true"></i>
<textarea name="a_observaciones_curso" rows="4" readonly class="form-control c-theme c-square input-lg inp" id="a_observaciones_curso" placeholder="Observaciones para el curso" onblur="this.placeholder = 'Observaciones para el curso'" onclick="this.placeholder = ''"><%=a_observaciones_curso%></textarea></div>
</div>
<ul class="list-inline pull-right"><li><button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right" onClick="alumno_mod();"><i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:8px"></i>Modificar datos <i class="fa fa-user" aria-hidden="true" style="margin-left:8px"></i>
</button></li></ul>
</form>
<%end if
ob_rs2.close%>
</div></div>
</div>
<%else
response.redirect(r&"salir") 'MEDIDA DE SEGURIDAD
end if
ob_rs.close
else
response.redirect(r&"zona-privada")
end if%>
</div></div></div>
<div id="pagos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar proceso de pago</span></h4>
</div><div class="modal-body"><p><span>¿Comenzamos el proceso de pago?</span></p></div>
<div class="modal-footer"><input name="id_alumnor" id="id_alumnor" type="hidden" value="">
<button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="confirmar_pago();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div>
</div></div></div>
<div id="alumno_mod" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar modificación datos de alumno</span></h4>
</div><div class="modal-body"><p><span>¿Seguro que quieres confirmar la modificacion de los datos del alumno?</span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" onClick="alumno_mod_ok();" data-dismiss="modal">Aceptar</button><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Cancelar</button></div>
</div></div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<style>.acordeon{ display:none; }</style>
<link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/dd.css" />
<script src="<%=r%>web/lib/js/jquery.dd.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/flags.css" />
<script src="<%=r%>web/lib/js/custom.js"></script>
<script src="<%=r%>web/lib/js/reserva-steps.js"></script>
<script>
$(".inp_n").tooltip({html:true});
$(".inp").tooltip({html:true});
function desadjunta_nif(){
document.getElementById("a_nif_adj").value = "";
$("#nif_doc").html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='17' viewBox='0 0 20 17'><path d='M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z'/></svg> <span  class='spanea' id='nif_del'>NIF </span>");
$(".desadjuntar_nif").css( "visibility","hidden" );
$('#nif_doc').tooltip('destroy');}
function desadjunta_pas(){
document.getElementById("a_pass_adj").value = "";
$("#pas_doc").html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='17' viewBox='0 0 20 17'><path d='M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z'/></svg> <span  class='spanea' id='pas_del'>Pasaporte </span>");
$(".desadjuntar_pas").css( "visibility","hidden" );
$('#pas_doc').tooltip('destroy');}
$(document).ready(function(e) {$("body select").msDropDown();
$( "#alumno_dats" ).hide();$( ".acordeon2" ).hide();})

function metodosPago(){if (document.getElementById("matodoPago2").checked==true || document.getElementById("matodoPago3").checked==true ){return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes seleccionar un método de pago.');$('#alerta_tit').html('Método de pago.');$('#alerta').modal('show');return (false)}}
function cantidad_pagar() {Ctrl = f_pagos.pago;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona cantidad a pagar.');$('#alerta_tit').html('Debes seleccionar un acantidad a pagar.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}


function Enviar_pago(){
if (!metodosPago()) return;
if (!cantidad_pagar()) return;
$('#pagos').modal('show');
}
function confirmar_pago(){$('#spinner_back').fadeIn(100, function(){setTimeout(function(){ document.f_pagos.submit(); }, 0);});}
function a_nombre() {Ctrl = f_reserva.a_nombre;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el nombre del alumno.');$('#alerta_tit').html('Nombre de alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_apellidos() {Ctrl = f_reserva.a_apellidos;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce los apellidos del alumno.');$('#alerta_tit').html('Apellidos del alumno no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_sexo() {Ctrl = f_reserva.a_sexo;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el sexo del alumno.');$('#alerta_tit').html('Sexo del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_pasaporte() {Ctrl = f_reserva.a_pasaporte;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el Pasaporte del alumno.');$('#alerta_tit').html('Pasaporte del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_email() {Ctrl = f_reserva.a_email;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el eMail del alumno.');$('#alerta_tit').html('eMail del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_cumple_dia() {Ctrl = f_reserva.a_cumple_dia;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona el DIA de nacimiento del alumno.');$('#alerta_tit').html('DIA de nacimiento del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_cumple_mes() {Ctrl = f_reserva.a_cumple_mes;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona el MES de nacimiento del alumno.');$('#alerta_tit').html('MES de nacimiento del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_cumple_ano() {Ctrl = f_reserva.a_cumple_ano;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona el AÑO de nacimiento del alumno.');$('#alerta_tit').html('AÑO de nacimiento del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_movil() {Ctrl = f_reserva.a_movil;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil del alumno.');$('#alerta_tit').html('Móvil del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_movil_sms() {Ctrl = f_reserva.a_movil_sms;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil para envíos de SMS del alumno.');$('#alerta_tit').html('Móvil SMS del alumno no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_direccion() {Ctrl = f_reserva.a_direccion;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la dirección del alumno.');$('#alerta_tit').html('Dirección del alumno no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_ciudad() {Ctrl = f_reserva.a_ciudad;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la ciudad del alumno.');$('#alerta_tit').html('Ciudad del alumno no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_provincia() {Ctrl = f_reserva.a_provincia;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce la provincia del alumno.');$('#alerta_tit').html('Provincia del alumno no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_conocido() {Ctrl = f_reserva.a_conocido;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona cómo nos has conocido.');$('#alerta_tit').html('¿Cómo nos has conocido?.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function nombre_obliga() {Ctrl = f_reserva.a_p_nombre;Ctrl2 = f_reserva.a_m_nombre;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el nombre del padre o de la madre.');$('#alerta_tit').html('Nombre de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function apellidos_obliga() {Ctrl = f_reserva.a_p_apellidos;Ctrl2 = f_reserva.a_m_apellidos;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce los apellidos del padre o de la madre.');$('#alerta_tit').html('Apellidos de padre o madre no introducidos.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function email_obliga() {Ctrl = f_reserva.a_p_email;Ctrl2 = f_reserva.a_m_email;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el eMail del padre o de la madre.');$('#alerta_tit').html('Email de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function telefono_obliga() {Ctrl = f_reserva.a_p_telefono;Ctrl2 = f_reserva.a_m_telefono;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el teléfono del padre o de la madre.');$('#alerta_tit').html('Teléfono de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function movil_obliga() {Ctrl = f_reserva.a_p_movil;Ctrl2 = f_reserva.a_m_movil;if (Ctrl.value == "" && Ctrl2.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce el móvil del padre o de la madre.');$('#alerta_tit').html('Móvil de padre o madre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function a_email_ok(form){
var resultado
var str=document.f_reserva.a_email.value;
var Ctrl=document.f_reserva.a_email;
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(str))
resultado=true
else{
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del alumno no es correcto.');$('#alerta_tit').html('eMail del alumno incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
resultado=false
}
return (resultado)}
function compara(form){
var Ctrl=document.f_reserva.a_email_r;
if(document.f_reserva.a_email.value == document.f_reserva.a_email_r.value)
return true;
else
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail del alumno repetido no es correcto.');$('#alerta_tit').html('eMail del alumno incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})}
function nif_ok(form) {
<%Sql= "SELECT nifClave FROM datComunes where nifClave<>''" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
nifClave=ob_rs("nifClave")
end if
ob_rs.close%>
var numero, let, letra;
var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;
dni = document.f_reserva.a_nif.value.toUpperCase();
if(dni=="<%=nifClave%>" && dni!=''){
return true;
}else{
if(expresion_regular_dni.test(dni) === true){
numero = dni.substr(0,dni.length-1);
numero = numero.replace('X', 0);
numero = numero.replace('Y', 1);
numero = numero.replace('Z', 2);
let = dni.substr(dni.length-1, 1);
numero = numero % 23;
letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
letra = letra.substring(numero, numero+1);
if (letra != let) {
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del alumno no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del alumno incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.a_nif).css('border', '2px solid #FF0000');$(document.f_reserva.a_nif).click(function() {$(document.f_reserva.a_nif).css('border', '1px solid #D0D7DE');})
return false;}else{return true;}}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El NIF del alumno no es correcto. Además, debe constar de 8 dígitos seguidos por una letra o una letra seguida de 8 dígitos en caso NIE');$('#alerta_tit').html('NIF del alumno incorrecto.');$('#alerta').modal('show');
$(document.f_reserva.a_nif).css('border', '2px solid #FF0000');$(document.f_reserva.a_nif).click(function() {$(document.f_reserva.a_nif).css('border', '1px solid #D0D7DE');})
return false;
}}}
function a_pas_cad(){
Ctrl=document.f_reserva.a_pas_cad;
re2=/^[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9][0-9][0-9]$/
if(document.f_reserva.a_pas_cad.length==0 || !re2.exec(document.f_reserva.a_pas_cad.value))
{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El formato de caducidad del pasaporte no es correcto (dd/mm/aaaa).');$('#alerta_tit').html('Caduciad pasaporte del alumno incorrecta.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
return false;
}else
return true;}
function restarFechas(fechaInicial, fechaFinal) {
var f = new Date();
dia= f.getDate();
dia=("0" + dia).slice (-2);
mes= (f.getMonth() +1);
mes=("0" + mes).slice (-2);
var fech2 = dia + "/" + mes + "/" + f.getFullYear();
var fech1 = document.f_reserva.a_pas_cad.value;
if((Date.parse(fech1)) <= (Date.parse(fech2))){
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i>La fecha de caducidad del pasaporte no puede ser inferior al '+ fech2 +'.');$('#alerta_tit').html('Fecha de caducidad incorrecta.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
return false;
}else
return true;
}
function alumno_mod(){
if (!a_nombre()) return;
if (!a_apellidos()) return;
<%if u_agente<>"si"then%>
if (!a_sexo()) return;
if (!nif_ok()) return; //    DESACTIVAMOS EN PRODUCCION PARA NO CONFIRMAR NIF
if (!a_pasaporte()) return;
if (!a_pas_cad()) return;
if (!restarFechas()) return;
if (!a_email()) return;
if (!a_email_ok()) return;
if (!compara()) return;
if (!a_cumple_dia()) return;
if (!a_cumple_mes()) return;
if (!a_cumple_ano()) return;
if (!a_movil()) return;
if (!a_movil_sms()) return;
if (!a_direccion()) return;
if (!a_ciudad()) return;
if (!a_provincia()) return;
if (!a_conocido()) return;
<%if datos_familia_ob="si"then%>
if (!nombre_obliga()) return;
if (!apellidos_obliga()) return;
if (!email_obliga()) return;
if (!movil_obliga()) return;
if (!telefono_obliga()) return;
<%end if
end if%>
$('#alumno_mod').modal('show');}
function alumno_mod_ok(){$('#spinner_back').fadeIn(100, function(){setTimeout(function(){ document.f_reserva.submit(); }, 0);});}
$('.acord_bot').click(function() {
var panel = $(this).next()
$('.acordeon').not(panel).slideUp();
panel.slideToggle({direction: "up"}, 100);});
$('.acord_bot2').click(function() { $(".acordeon2").slideToggle( "slow" );});
$('#envia_docs').click(function() {$('#spinner_back').fadeIn(100, function(){setTimeout(function(){ document.f_envia_docs.submit(); }, 0);});});
</script>