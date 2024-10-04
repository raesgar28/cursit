<!--#include file="../comun/menu_sup.asp"-->  
<%show=request("show")
if show ="" then show = request_equerystring("show")%>
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"> 
<%if cod<>""then
Sql= "SELECT id_programa,fecha_in FROM programas_tmp "   '[TOTAL PREINSCRIPCIONES - RECUENTO]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_preinscripciones_out=0
tot_preinscripciones=ob_rs.RecordCount
do while not ob_rs.eof
if DateDiff("d",ob_rs("fecha_in"),date)>=3then
tot_preinscripciones_out=tot_preinscripciones_out+1
end if
ob_rs.movenext
loop
end if
ob_rs.close
Sql= "SELECT id_item, id_usuario,f_inicio,f_fin,precioReserva,pr_cancelacion_pr,ob_escuela,ob_interna,suma_total, nom_item, nom_curso, aero_ciudad, id_aeropuerto, id_curso, id_alumno, estadoPago, id_agente, f_inicio_esc, f_fin_esc, semanas, id_alojamiento, alo_concepto, alo_opcion, env_mail, id_itemSubAero,  id_quincena, nom_quincena,s_mes, gen_factura, cod_descuento, id_agente_cod,suma_total_p, mail_aviso, mail_aviso_final, fin_presupuesto, mail_presup, hab_pago, hab_descarga, duracion, tipo_cambio FROM programas_tmp where id_programa="&cod&""   '[ASOCIAMOS CON UNA ESCUELA]
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then
id_item=ob_rs("id_item")
id_usuario=ob_rs("id_usuario")
f_inicio=ob_rs("f_inicio")
f_inicio_esc=ob_rs("f_inicio_esc")
mail_aviso=ob_rs("mail_aviso")
mail_aviso_final=ob_rs("mail_aviso_final")
fin_presupuesto=ob_rs("fin_presupuesto")
mail_presup=ob_rs("mail_presup")
if IsDate(f_inicio_esc) then
dia_i=day(f_inicio_esc)
mes_i=month(f_inicio_esc)
if len(dia_i) =1 then dia_i= "0"&dia_i end if
if len(mes_i) =1 then mes_i= "0"&mes_i end if
f_inicio_esc=mes_i&"/"&dia_i&"/"&year(f_inicio_esc)
end if
f_fin=ob_rs("f_fin")
f_fin_esc=ob_rs("f_fin_esc")
if IsDate(f_fin_esc) then
dia_ff=day(f_fin_esc)
mes_ff=month(f_fin_esc)
if len(dia_ff) =1 then dia_ff= "0"&dia_ff end if
if len(mes_ff) =1 then mes_ff= "0"&mes_ff end if
f_fin_esc=mes_ff&"/"&dia_ff&"/"&year(f_fin_esc)
end if
nom_item=ob_rs("nom_item")
nom_curso=ob_rs("nom_curso")
aero_ciudad=ob_rs("aero_ciudad")
id_aeropuerto=ob_rs("id_aeropuerto")
id_curso=ob_rs("id_curso")
anyo_act=year(f_inicio)
id_alumno=ob_rs("id_alumno")
ob_escuela=ob_rs("ob_escuela")
ob_interna=ob_rs("ob_interna")
suma_total=ob_rs("suma_total")
suma_total2=ob_rs("suma_total")
if suma_total2 <> 0 then suma_total2 =FormatNumber(ccur(suma_total2),2)
id_agente=ob_rs("id_agente")
estadoPago=ob_rs("estadoPago")
semanas=ob_rs("semanas")
precioReserva=ob_rs("precioReserva")
alo_concepto=ob_rs("alo_concepto")
alo_opcion=ob_rs("alo_opcion")
gen_factura=ob_rs("gen_factura")
hab_pago=ob_rs("hab_pago")
hab_descarga=ob_rs("hab_descarga")
If IsNumeric(precioReserva) Then precioReserva=precioReserva else precioReserva=0 end if
if precioReserva <> 0 then precioReserva =FormatNumber(ccur(precioReserva),2)
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
if pr_cancelacion_pr <> 0 then pr_cancelacion_pr =FormatNumber(ccur(pr_cancelacion_pr),2)
if suma_total <> 0 then suma_total=FormatNumber(ccur(suma_total),2)
env_mail=ob_rs("env_mail")
if estadoPago="Aceptada" then
falta_pagar=suma_total-precioReserva
if pr_cancelacion_pr <> 0 then falta_pagar=suma_total-precioReserva-35 end if
falta_pagar=FormatNumber(ccur(falta_pagar),2)
tit_reser="Reserva ingresada"
else
falta_pagar=suma_total
falta_pagar=FormatNumber(ccur(falta_pagar),2)
tit_reser="Reserva a ingresar"
end if
id_itemSubAero=ob_rs("id_itemSubAero")
id_quincena=ob_rs("id_quincena")
nom_quincena=ob_rs("nom_quincena")
s_mes=ob_rs("s_mes")
cod_descuento=ob_rs("cod_descuento")
id_agente_cod=ob_rs("id_agente_cod")
suma_total_p=ob_rs("suma_total_p")
duracion=ob_rs("duracion")
tipo_cambio=ob_rs("tipo_cambio")
end if
ob_rs.close
'ob_conn.close
end if 
Sql= "SELECT a_nombre, a_apellidos, a_cumple FROM alumnos_tmp where id_alumno="&id_alumno&""   '[NOMBRE ALUMNO]
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then
a_nombre=ob_rs("a_nombre")
a_apellidos=ob_rs("a_apellidos")
a_cumple=ob_rs("a_cumple")
if IsDate(a_cumple) then
dia_i=day(a_cumple)
mes_i=month(a_cumple)
if len(dia_i) =1 then dia_i= "0"&dia_i end if
if len(mes_i) =1 then mes_i= "0"&mes_i end if
a_cumple_esc=mes_i&"/"&dia_i&"/"&year(a_cumple)
if a_cumple_esc="01/01/1000" then a_cumple_esc="" end if
end if
if a_cumple="01/01/1000" then a_cumple="" end if
end if
ob_rs.close
Sql= "SELECT titulo_of_esp, pre_medida FROM items where id_item="&id_item&""   '[CURSO]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
nom_curso_of=ob_rs("titulo_of_esp")
pre_medida=ob_rs("pre_medida")
end if
ob_rs.close%>
<!--#include file="../comun/facturas.asp"-->  
<%n_factura = "F"&ceros&factureta&"-"&ano_factura '[FIN SACAMOS FACTURA]
'[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Altas | Alta de alumno </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%><a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Preinscripciones</a></li>
<li class="active">Gestión Altas</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container"><div class="page-content-row"><div class="page-sidebar"><nav class="navbar" role="navigation"><ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%><a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="fa fa-clock-o" aria-hidden="true"></i>
 Preinscripciones<%if tot_preinscripciones<>""then%><span class="baddge badge badge-default"> <%=tot_preinscripciones%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ver=vencidas"))%>
<a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&ver=vencidas")%>"><i class="fa fa-ban" aria-hidden="true"></i> Fuera de plazo<%if tot_preinscripciones_out<>""then%><span class="baddge badge badge-default"> <%=tot_preinscripciones_out%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li><li class="active"><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Alta de alumno</a></li></ul></nav></div><!--MIGAS-->
<div class="page-content-col"><div class="portlet light portlet-fit portlet-form bordered"><div class="portlet-title tabbable-line"><div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Alta de alumno <i class="fa fa-arrow-right" aria-hidden="true" style="margin-right:12px"></i> <span style="color:#666"><%=a_apellidos%>,&nbsp;<%=a_nombre%></span></span></div><ul class="nav nav-tabs">
<li <%if show<>"presup" then%>class="active"<%end if%>><a href="#tab_1" data-toggle="tab"> Alta </a></li><li><a href="#tab_2" data-toggle="tab"> Datos del Alumno </a></li><li<%if show="presup" then%> class="active"<%end if%>><a href="#tab_3" data-toggle="tab" > Datos del Programa </a></li>
</ul><!--NAV TABS--></div>
<div class="portlet-body">
<%if ms="ok"then%><div class="form-body no_pad"><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Datos modificados con éxito !</div></div><%end if%>
<%if ms="ko"then%><div class="form-body no_pad"><div class="alert alert-danger"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error en proceso de alta. El alumno parece ya estar inscrito en este programa !</div></div><%end if%><!--RESPUESTAS-->
<div class="tab-content" >

<div class="tab-pane <%if show<>"presup" then%>active<%end if%>" id="tab_1"><div class="form-body">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><%if cod<>""then%><!--<input name="op" type="hidden" value="up">--><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>

<div class="row">
<div class="col-md-6">
<div class="form-group form-md-line-input" style="display:none">
<label class="col-md-3 control-label" for="id_agente" >Agente.</label>
<div class="col-md-7"><div class="input-icon">
<%Sql= "SELECT u_nombre, id_usuario, u_agente from usuarios where u_nombre<>'' and u_agente='si' order by u_nombre"   '[ASOCIAMOS CON UNA ESCUELA]
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then%>
<select name="id_agente" id="id_agente" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_usuario_n=ob_rs("id_usuario")
'if id_usuario=0 then id_usuario=ob_rs("id_usuario") end if
if int(ob_rs("id_usuario"))=int(id_usuario_n) then sel_usuario="si" end if%>
<option value="<%=ob_rs("id_usuario")%>" <%if sel_usuario="si"then%>selected<%end if%>><%=ob_rs("u_nombre")%></option>
<%ob_rs.movenext
sel_usuario=""
loop%>
</select>
<%end if
ob_rs.close%>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i><span class="help-block">selecciona un agente</span></div>
</div></div>
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="id_usuario" >Usuario / Agente.</label>
<div class="col-md-7"><div class="input-icon">
<%Sql= "SELECT u_nombre, u_apellidos, id_usuario, id_usuario, u_agente, u_empresa from usuarios where u_nombre<>'' order by u_apellidos, u_nombre"   '[ASOCIAMOS CON UNA ESCUELA]
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then%>
<select name="id_usuario" id="id_usuario" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
if ob_rs("id_usuario")=id_usuario then sel_usuario="si" end if%>
<option value="<%=ob_rs("id_usuario")%>" <%if sel_usuario="si"then%>selected<%end if%>><%=ob_rs("u_apellidos")%>&nbsp;<%=ob_rs("u_nombre")%> <%if ob_rs("u_agente")="si"then%>&nbsp;(<%if ob_rs("u_empresa") <>""then%><%=ob_rs("u_empresa")%><%else%>agente<%end if%>*)<%end if%></option>
<%ob_rs.movenext
sel_usuario=""
loop%>
</select>
<%end if
ob_rs.close%>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i><span class="help-block">selecciona un agente</span></div>
</div></div>
<%Sql= "SELECT titulo_esp, id_proveedor from proveedores where tipo_pr='Escuela'"   '[ASOCIAMOS CON UNA ESCUELA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then%>
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="id_web" >Escuela.</label>
<div class="col-md-7"><div class="input-icon">
<select name="id_escuela" id="id_escuela" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_escuela=ob_rs("id_proveedor")
tit_escuela=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_item from rel where id_item = "&id_item&" and id_proveedor="&id_escuela&" " 
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_escuela%>" <%if sel="si" then%>Selected<%end if%>><%=tit_escuela%></option>
<%ob_rs.movenext
sel=""
id_escuela=""
tit_escuela=""
%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i><span class="help-block">selecciona una escuela</span></div>
</div>
</div>
<div class="md-checkbox col-md-offset-3" style="padding-left:5px"><input name="env_mail" type="checkbox" class="md-check" id="env_mail" value="si" <%if env_mail="si"then%>checked<%end if%> ><label for="env_mail" style="color:#999"> Enviar mail a la escuela (en alta) <i class="fa fa-share" aria-hidden="true" style="margin-right:6px;margin-left:5px"></i><i class="fa fa-envelope-o" aria-hidden="true"></i></label></div>
<%else%>
<div class="sin_regstros" style="width:100%;margin:0 auto;text-align:right"><a href="javascript:modal_proveedor();" class="f_red"><i class="icon-note"></i> Puedes crear una escuela (opcional)</a> </div><div class="modal fade" id="proveedores_mod" tabindex="-1" role="dialog" aria-hidden="true" ><div class="modal-dialog modal-full"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Proveedor (Escuela)</h4></div>
<div class="modal-body" ><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer"><button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button><button type="button" class="btn green" data-dismiss="modal">Cerrar</button></div></div></div></div>
<script>function modal_proveedor(){$("#proveedores_mod iframe" ).attr('src','<%=r%>proveedores/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#proveedores_mod").modal();}</script>
<%end if
ob_rs.close                             '[FIN ASOCIAMOS CON UNA ESCUELA]%>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="pr_reserva" >Nombre curso (oficial).</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="nom_curso_of" id="nom_curso_of" <%if nom_curso_of<>"" then%>value="<%=nom_curso_of%>"<%end if%>><div class="form-control-focus"> </div><i class="fa fa-cap" aria-hidden="true"></i><span class="help-block">nombre oficial del curso</span></div></div></div>
<div class="col-md-6 col-md-offset-1"><div class="form-group form-md-line-input"><label class="col-md-4 control-label" style="padding-right:21px" for="f_inicio" >F. inicio.</label>
<div class="col-md-8"><div class="input-icon"><div class="input-group date date-picker" data-date-format="mm/dd/yyyy" ><input type="text" class="form-control form-filter input-sm" id="f_inicio" name="f_inicio" <%if cod<>"" and f_inicio_esc<>"01/01/1000"then%>value="<%=f_inicio_esc%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div><div class="form-control-focus"></div><i class="fa fa-calendar-check-o" aria-hidden="true"></i></div></div></div></div>
<div class="col-md-5"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="f_fin" >F.fin.</label>
<div class="col-md-9"><div class="input-icon"><div class="input-group date date-picker" data-date-format="mm/dd/yyyy" ><input type="text" class="form-control form-filter input-sm" id="f_fin" name="f_fin" <%if cod<>"" and f_fin_esc<>"01/01/1000"then%>value="<%=f_fin_esc%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div><div class="form-control-focus"> </div><i class="fa fa-calendar-times-o" aria-hidden="true"></i></div></div></div></div>

<%if pre_medida="si" then%>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="tipo_cambio" >Tipo cambio.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tipo_cambio" id="tipo_cambio" <%if tipo_cambio<>"" then%>value="<%=tipo_cambio%>"<%end if%>><div class="form-control-focus"> </div><i class="fa fa-exchange" aria-hidden="true"></i><span class="help-block">tipo cambio aplicado</span></div></div></div>
<%end if%>


<%if cod_descuento<>"" then%>
<div class="col-md-6 col-md-offset-1"><div class="form-group form-md-line-input"><label class="col-md-4 control-label" style="padding-right:21px" for="cod_descuento" >Código desc.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="cod_descuento" id="cod_descuento" value="<%=cod_descuento%>" readonly><div class="form-control-focus"> </div><i class="fa fa-tag" aria-hidden="true"></i></div></div></div></div>
<%if suma_total_p<>"" or suma_total_p<>0 then%>
<div class="col-md-5"><div class="form-group form-md-line-input"><label class="col-md-4 control-label" for="sum_total_p" readonly>€ original.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="sum_total_p" id="sum_total_p" value="<%=FormatNumber(ccur(suma_total_p),2)%>" readonly><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i></div></div></div></div>
<%end if%>
<%if id_agente_cod<>0 and id_agente_cod<>"" then
Sql= "SELECT u_nombre, u_apellidos,u_empresa from usuarios where id_usuario="&id_agente_cod&""   '[ASOCIAMOS CON UNA ESCUELA]
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then
nom_agen_cob=ob_rs("u_nombre")&"&nbsp;"&ob_rs("u_apellidos")&" - "&ob_rs("u_empresa")
end if
ob_rs.close%>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="id_agente_cod" >Agente descuento.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="id_agente_cod" id="id_agente_cod" value="<%=nom_agen_cob%>" readonly><div class="form-control-focus"> </div><i class="fa fa-suitcase" aria-hidden="true"></i></div></div></div>
<%end if
end if%>
</div>
<div class="col-md-6"><div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="precioReserva" ><%=tit_reser%>.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="precioReserva" id="precioReserva" <%if precioReserva<>0 then%>value="<%=precioReserva%>"<%end if%> onKeyUp="suma()"><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">*usar comas (,) para decimales</span></div></div></div>
<div class="md-checkbox-inline col-md-offset-3 form-md-checkboxes" style="color:#999">
<div class="md-checkbox col-md-offset-3"><input type="checkbox" name="pagado" id="pagado" class="md-check" value="si" <%if estadoPago="Aceptada" then%>checked<%end if%> onclick="suma();"><label for="pagado" onclick="suma();"><span></span><span class="check"></span><span class="box"></span> Pagado .<i class="fa fa-arrow-up" aria-hidden="true" style="margin-right:5px"></i><i class="fa fa-check" aria-hidden="true"></i> </label></div>
</div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="pr_cancelacion_pr" >Seguro cancelación.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_cancelacion_pr" id="pr_cancelacion_pr" <%if pr_cancelacion_pr<>0 then%>value="<%=pr_cancelacion_pr%>"<%end if%> disabled><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">ingresado con la reserva</span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="suma_total" id="suma_total" <%if suma_total<>0 then%>value="<%=suma_total%>"<%end if%>>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="falta_pagar" >Falta pagar.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="falta_pagar" id="falta_pagar" <%if falta_pagar<>0 then%>value="<%=falta_pagar%>"<%end if%>><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">total de <%=suma_total%> €</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-3 control-label" for="pr_reserva" >Generar Factura.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="n_factura" id="n_factura" <%if n_factura<>"" then%>value="<%=n_factura%>"<%end if%> onKeyUp="despeja();"><div class="form-control-focus"> </div><i class="fa fa-bookmark" aria-hidden="true"></i></div></div></div>
<div class="md-checkbox col-md-offset-3" style="padding-left:5px"><input name="gen_factura" type="checkbox" class="md-check" id="gen_factura" value="si" <%if gen_factura="si" then%>checked<%end if%>><label for="gen_factura" style="color:#999"> Generar factura (al dar alta). <i class="fa fa-arrow-up" aria-hidden="true" style="margin-right:5px"></i><i class="fa fa-bookmark-o" aria-hidden="true"></i></label></div>
</div><!--col-md-6-->
<div class="col-md-12" style="margin-top:25px;border-top:1px solid #ddd;padding-top:30px"><div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="ob_escuela">Observaciones para escuela (datos vuelo,...).</label><div class="col-md-8"><textarea class="form-control" name="ob_escuela" id="ob_escuela" rows="3">
<%if ob_escuela<>""then%>
<%=ob_escuela%>
<%else%>
I write you to check the <strong>availability for a new student</strong>.<br><br>
Here you have the profile data.<br><br>
Name: <strong><%=a_nombre%></strong><br>
Surnames: <strong><%=a_apellidos%></strong><br>
DOB (dd/mm/yyyy): <strong><%=a_cumple%></strong><br>
Date of start (dd/mm/yyyy): <strong><%if f_inicio_esc<>"01/01/1000"then%><%=f_inicio_esc%><%end if%></strong><br>
Length: <strong><%=semanas%> weeks</strong><br>
Course: <strong><%=nom_curso_of%></strong><br>
<%if id_alojamiento<>0 then%>Accommodation: <strong><%=alo_concepto%> - <%=alo_opcion%></strong><br><%end if%>
<br>Flight Details: <strong> Flight details¿? </strong><br><br>
Thanks a mil and I look forward your news<br><br>
Best<%end if%>
</textarea></div></div></div>
<div class="col-md-12" style="margin-top:25px;border-top:1px solid #ddd;padding-top:30px"><div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="ob_interna">Observaciones uso interno.</label><div class="col-md-8"><textarea class="form-control" name="ob_interna" id="ob_interna" rows="3"><%=ob_interna%></textarea></div></div></div>
<%if id_aeropuerto<>0 then
Sql= "SELECT mes, plazas,f_salida FROM rel, itemsSubAero WHERE rel.id_itemSub="&id_curso&" AND rel.id_itemSUbAero=itemsSUbAero.id_itemSUbAero  AND year(f_salida) = '"&anyo_act&"'"   '[PLAZAS TOTALES]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
plazas_totales=ob_rs("plazas")
mes=ob_rs("mes")
f_salida=ob_rs("f_salida")
end if
ob_rs.close
Sql= "SELECT id_programa FROM programas_tmp WHERE id_curso="&id_curso&" AND bloqueada='si' AND year(f_inicio) = '"&anyo_act&"'"   '[PLAZAS BLOQUEADAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
plazas_bloqueadas=ob_rs.RecordCount
else
plazas_bloqueadas=0
end if
ob_rs.close
Sql= "SELECT id_programa FROM programas WHERE id_curso="&id_curso&" AND year(f_inicio) = '"&anyo_act&"'"   '[PLAZAS VENDIDAS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
plazas_vendidas=ob_rs.RecordCount
else
plazas_vendidas=0
end if
ob_rs.close
plazas_libres=plazas_totales-plazas_bloqueadas-plazas_vendidas
if f_inicio="01/01/1000" then f_inicio = "" end if
if nom_quincena<>"" then f_inicio_sup= nom_quincena end if
if s_mes<>"" and nom_quincena="" then f_inicio_sup =s_mes end if%>
<div class="col-md-12" style="margin-top:25px;border-top:1px solid #ddd;padding-top:30px">
<div class="portlet "><div class="portlet-title">
<div class="caption"><i class="fa fa-users" aria-hidden="true" style="margin-top:2px;"></i>Recuento de plazas</div></div>
<div class="portlet-body">
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Programa: </div><div class="col-md-7 value"><%=nom_item%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Curso: </div><div class="col-md-7 value"> <%=nom_curso%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Aeropuerto: </div><div class="col-md-7 value"><%=aero_ciudad%> </div></div></div>
<%if f_inicio_sup<>""then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Fecha de inicio: </div><div class="col-md-7 value"><%=f_inicio_sup%></div></div></div><%end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Fecha Salida: </div><div class="col-md-7 value"><%=f_inicio_sup%> - <%=f_salida%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas totales: </div><div class="col-md-7 value"> <%=plazas_totales%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas bloqueadas: </div><div class="col-md-7 value"> <%=plazas_bloqueadas%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas vendidas: </div><div class="col-md-7 value"> <%=plazas_vendidas%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Plazas libres: </div><div class="col-md-7 value"> <%=plazas_libres%></div></div></div>
</div>
</div>
<%if plazas_libres<=3 then%>
<div class="col-md-12"><div class="alert-danger" id="form_errors" style="padding:20px;margin-top:25px"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:7px"></i> Atención, quedan <%=plazas_libres%> plazas (incluyendo este alta). Vigila la opción de poner el curso como "COMPLETO".</div></div>
<%end if%>
</div>
<%end if%>
</div><!--row-->



<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn red" onclick="Confirma_alta();" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> dar alta de alumno</button>
<button type="button" class="btn green" onclick="Enviar_alta_g(this.form);" value="enviar datos" language="javascript"><i class="fa fa-floppy-o" aria-hidden="true" style="margin-right:4px"></i> guardar datos</button>

<script>
function despeja(){Ctrl=document.envio.n_factura;$(Ctrl).css('border', 'none');$(Ctrl).css('border-bottom', '1px solid #ccc');}
function fact_ok(form) {
if (document.envio.n_factura.value!=''){
var check_factura = /((F)[0-9][0-9][0-9][0-9](-)[0-9][0-9])/g;
factu = document.envio.n_factura.value.toUpperCase();
Ctrl=document.envio.n_factura;
if(check_factura.test(factu) === true){return true;}else{$("#alerta").modal();$("#alerta_txt").text("El formato de factura introducido es incorrecto. Debe ser Fnnnn-aa. F, seguida de 4 dígitos, un guión y el año en formato 2 dígitos. Ej: F1234-18.");$(Ctrl).css('border', '2px solid #FF0000');return false;}
}else{return true;}}

function Enviar_alta_g (form)  {	////////////////////////////////////   GUARDAR ALTAS 
if (!fact_ok()) return;
	$('#spinner_back').show();
	$('#spinner').show();
	$('#envio').attr('action', 'guardar.asp');
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
</script>

<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div><!--ACCIONES fin form-body-->
<div class="modal fade" id="confirmaAlta" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención | Alta de Alumno</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que quieres confirmar el ALTA del alumno? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="Enviar_alta(this.form);">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>
</form>
</div><!--form-body-->
</div><!--tab_1-->

<div class="tab-pane" id="tab_2" >
<div class="form-body">
<div class="row">
<div class="col-md-12">
<%Sql= "SELECT u_nombre,u_apellidos, u_email, u_telefono, u_movil FROM programas_tmp, usuarios WHERE programas_tmp.id_programa="&cod&" AND programas_tmp.id_usuario=usuarios.id_usuario"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="col-md-12 col-sm-12" style="margin-bottom:35px"><div class="portlet "><div class="portlet-title">
<div class="caption"><i class="fa fa-user-circle" aria-hidden="true" style="margin-top:2px;"></i>Usuario / Agente</div></div>
<div class="portlet-body">
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Nombre: </div><div class="col-md-7 value"> <%=ob_rs("u_nombre")%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Apellidos: </div><div class="col-md-7 value"><%=ob_rs("u_apellidos")%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Email: </div><div class="col-md-7 value"> <%=ob_rs("u_email")%> </div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> Teléfono: </div><div class="col-md-7 value"> <%=ob_rs("u_telefono")%> / <%=ob_rs("u_movil")%></div></div></div>
</div>
</div>
</div>
<%end if
ob_rs.close
Sql= "SELECT a_nombre,a_apellidos, a_email, a_telefono, a_movil, a_sexo, a_nif, a_pasaporte, a_pas_exp, a_pas_cad, a_cumple, a_movil_sms, a_direccion, a_ciudad, a_c_postal, a_provincia, a_pais, a_p_nombre, a_p_apellidos, a_p_email, a_p_telefono,a_p_movil, a_p_profesion, a_m_nombre, a_m_apellidos, a_m_email, a_m_telefono,a_m_movil, a_m_profesion, a_permiso_medico, a_vegetariano, a_fuma, a_curso_ant, a_curso_ant_org, a_colegio, a_conocido, programas_tmp.fecha_in, a_enfermedades, a_medicamentos, programas_tmp.id_alumno  FROM programas_tmp, alumnos_tmp WHERE programas_tmp.id_programa="&cod&" AND programas_tmp.id_alumno=alumnos_tmp.id_alumno"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="col-md-12 col-sm-12"><div class="portlet "><div class="portlet-title">
<div class="caption"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-top:2px;"></i>Alumno </div></div>
<div class="portlet-body">
<div class="col-md-6 col-sm-6">
<div class="row static-info"><div class="col-md-5 name"> Nombre: </div><div class="col-md-7 value"> <%=ob_rs("a_nombre")%>&nbsp;<%=ob_rs("a_apellidos")%> </div></div>
<div class="row static-info"><div class="col-md-5 name"> Email: </div><div class="col-md-7 value"> <%=ob_rs("a_email")%> </div></div>
<div class="row static-info"><div class="col-md-5 name"> Teléfono: </div><div class="col-md-7 value"> <%=ob_rs("a_telefono")%> / <%=ob_rs("a_movil")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Sexo: </div><div class="col-md-7 value"> <%=ob_rs("a_sexo")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> NIF: </div><div class="col-md-7 value"> <%=ob_rs("a_nif")%> </div></div>
<div class="row static-info"><div class="col-md-5 name"> Pasaporte: </div><div class="col-md-7 value"> <%=ob_rs("a_pasaporte")%> / <%=ob_rs("a_pas_exp")%> / <%=ob_rs("a_pas_cad")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Fecha nacimiento: </div><div class="col-md-7 value"> <%=ob_rs("a_cumple")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Móvil SMS: </div><div class="col-md-7 value"> <%=ob_rs("a_movil_sms")%> </div></div>
<div class="row static-info"><div class="col-md-5 name"> Dirección: </div><div class="col-md-7 value"> <%=ob_rs("a_direccion")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Dirección: </div><div class="col-md-7 value"> <%=ob_rs("a_ciudad")%> / <%=ob_rs("a_c_postal")%> / <%=ob_rs("a_provincia")%> / <%=a_pais%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Permiso médico: </div><div class="col-md-7 value"> <%=ob_rs("a_permiso_medico")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Vegetariano: </div><div class="col-md-7 value"> <%=ob_rs("a_vegetariano")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Fuma: </div><div class="col-md-7 value"> <%=ob_rs("a_fuma")%></div></div>
</div>
<div class="col-md-6 col-sm-6">
<div class="row static-info"><div class="col-md-5 name"> Nombre padre: </div><div class="col-md-7 value"> <%=ob_rs("a_p_nombre")%>&nbsp; <%=ob_rs("a_p_apellidos")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Email padre: </div><div class="col-md-7 value"> <%=ob_rs("a_p_email")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Teléfonos padre: </div><div class="col-md-7 value"> <%=ob_rs("a_p_telefono")%> / <%=ob_rs("a_p_movil")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Profesión padre: </div><div class="col-md-7 value"> <%=ob_rs("a_p_profesion")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Nombre madre: </div><div class="col-md-7 value"> <%=ob_rs("a_m_nombre")%>&nbsp; <%=ob_rs("a_p_apellidos")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Email madre: </div><div class="col-md-7 value"> <%=ob_rs("a_m_email")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Teléfonos madre: </div><div class="col-md-7 value"> <%=ob_rs("a_m_telefono")%> / <%=ob_rs("a_p_movil")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Profesión madre: </div><div class="col-md-7 value"> <%=ob_rs("a_m_profesion")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Colegio: </div><div class="col-md-7 value"> <%=ob_rs("a_colegio")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Cómo nos conoce: </div><div class="col-md-7 value"> <%=ob_rs("a_conocido")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Enfermedades reseñables: </div><div class="col-md-7 value"> <%=ob_rs("a_enfermedades")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Medicamentos a tomar: </div><div class="col-md-7 value"> <%=ob_rs("a_medicamentos")%></div></div>
<div class="row static-info"><div class="col-md-5 name"> Curso anterior: </div><div class="col-md-7 value"> <%=ob_rs("a_curso_ant")%> / <%=ob_rs("a_curso_ant_org")%></div>
</div>
</div>
<%Sql3= "SELECT id_archivo FROM alumnos_archivos_tmp WHERE id_alumno= "&ob_rs("id_alumno")&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof
Sql2= "SELECT nombre, tipo FROM archivos_tmp, alumnos_archivos_tmp WHERE alumnos_archivos_tmp.id_alumno= "&ob_rs("id_alumno")&" and alumnos_archivos_tmp.id_archivo= "&ob_rs3("id_archivo")&" and alumnos_archivos_tmp.id_archivo=archivos_tmp.id_archivo and (tipo='Pasaporte' or tipo='NIF')"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
doc="si"%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> <%=ob_rs2("tipo")%> escaneado: </div><div class="col-md-7 value"><a href="../../up_docs/alu_docs/<%=ob_rs2("nombre")%>" target="_blank"> <%=ob_rs2("nombre")%></a></div></div></div>
<%end if
ob_rs2.close
if doc<>"si" then
Sql2= "SELECT nombre, tipo FROM archivos, alumnos_archivos WHERE alumnos_archivos.id_alumno= "&ob_rs("id_alumno")&" and alumnos_archivos.id_archivo= "&ob_rs3("id_archivo")&" and alumnos_archivos.id_archivo=archivos.id_archivo and (tipo='Pasaporte' or tipo='NIF')"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
doc_pas="si"%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"> <%=ob_rs2("tipo")%> escaneado: </div><div class="col-md-7 value"><a href="../../up_docs/alu_docs/<%=ob_rs2("nombre")%>" target="_blank"> <%=ob_rs2("nombre")%></a></div></div></div>
<%end if
ob_rs2.close
end if
ob_rs3.movenext
loop
end if
ob_rs3.close%>
</div>
</div>
</div>
<%end if
ob_rs.close%>
</div>
</div>
</div><!--form-body-->
</div><!--tab_2-->



<div class="tab-pane <%if show="presup" then%>active<%end if%>" id="tab_3" >
<div class="form-body">

<%if pre_medida="si" then%>
<form action="guardar_presupuesto.asp" class="form-horizontal" id="envio_presup" name="envio_presup" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><%if cod<>""then%><!--<input name="op" type="hidden" value="up">--><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<%end if%>


<div class="row">
<div class="col-md-12">
<%Sql= "SELECT id_item, id_curso, semanas, f_inicio, f_fin, pr_medico, pr_cancelacion, con_examen, aero_ciudad, nom_item, nom_curso, id_alumno, refPresupuesto, aero_ciudad, precio_cur, precio_sup, id_alojamiento, pr_medico_pr, pr_cancelacion_pr, tasas_aerop_pr, pr_examen_pr, pr_gestion_bill_pr, suma_total, metodoPago, tasas_concepto, alo_concepto, precio_alo,tasas_opciones, alo_opcion, precio_sup_alo,id_programa, estadoPago, fecha_in, factura, u_f_nombre,u_f_nif,u_f_direccion,a_observaciones_curso FROM programas_tmp WHERE id_programa="&cod&"" 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
id_programa=ob_rs("id_programa")
id_item=ob_rs("id_item")
id_alumno=ob_rs("id_alumno")
nom_item=ob_rs("nom_item")
nom_curso=ob_rs("nom_curso")
pr_cancelacion=ob_rs("pr_cancelacion")
if pr_cancelacion="si" then pr_cancelacion="S&iacute;" else pr_cancelacion="No" end if
if pr_cancelacion="No" and pre_medida="si"  then pr_cancelacion="" end if
con_examen=ob_rs("con_examen")
pr_medico=ob_rs("pr_medico")
if pr_medico="si" then pr_medico="S&iacute;" else pr_medico="No" end if
if pr_medico="No" and pre_medida="si"  then pr_medico="" end if
f_inicio=ob_rs("f_inicio")
f_fin=ob_rs("f_fin")
fecha_in=ob_rs("fecha_in")
semanas=ob_rs("semanas")
refPresupuesto=ob_rs("refPresupuesto")
aero_ciudad=ob_rs("aero_ciudad")
precio_cur=ob_rs("precio_cur")
precio_sup=ob_rs("precio_sup")
estadoPago=ob_rs("estadoPago")
factura=ob_rs("factura")
u_f_nombre=ob_rs("u_f_nombre")
u_f_nif=ob_rs("u_f_nif")
u_f_direccion=ob_rs("u_f_direccion")
a_observaciones_curso=ob_rs("a_observaciones_curso")
precio_cur_a=precio_cur-precio_sup%>
<!--#include file="../../web/comun/moneda.asp"-->

<%if pre_medida="si" then 

if precio_cur<>"" and precio_cur<>0 then 
precio_cur_a =FormatNumber(ccur(precio_cur),2) 
end if

else

precio_cur_a=precio_cur_a

end if

if pre_medida<>"si" then
if precio_cur<>"" and precio_cur<>0 then precio_cur =FormatNumber(ccur(precio_cur),2) & "&nbsp;"&mon_pdf&"" else precio_cur= "0,00" & "&nbsp;"&mon_pdf&"" end if
if precio_cur_a<>"" and precio_cur_a<>0 then precio_cur_a =FormatNumber(ccur(precio_cur_a),2) & "&nbsp;"&mon_pdf&"" else precio_cur_a= "0,00" & "&nbsp;"&mon_pdf&"" end if
end if


if pre_medida="si" then 
if precio_sup<>"" and precio_sup<>0 and precio_sup<>"0,00" then precio_sup =FormatNumber(ccur(precio_sup),2) end if
end if

if pre_medida<>"si" then
if precio_sup<>"" and precio_sup<>0 then precio_sup =FormatNumber(ccur(precio_sup),2) & "&nbsp;"&mon_pdf&"" else precio_sup= "No incluido*"  end if
end if

id_alojamiento=ob_rs("id_alojamiento")


pr_medico_pr=ob_rs("pr_medico_pr")
if pre_medida="si" then 
if pr_medico_pr<>"" and pr_medico_pr<>0 and pr_medico_pr<>"0,00" then pr_medico_pr =FormatNumber(ccur(pr_medico_pr),2) end if
end if
if pre_medida<>"si" then
if pr_medico_pr<>"" and pr_medico_pr<>0 then pr_medico_pr =FormatNumber(ccur(pr_medico_pr),2) & "&nbsp;"&mon_pdf&"" else pr_medico_pr= "No incluido*"  end if
end if

pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
if pre_medida="si" then 
if pr_cancelacion_pr<>"" and pr_cancelacion_pr<>0 and pr_cancelacion_pr<>"0,00" then pr_cancelacion_pr =FormatNumber(ccur(pr_cancelacion_pr),2) end if
if pr_cancelacion_pr<>"" and pr_cancelacion_pr<>0 and pr_cancelacion_pr<>"0,00" then pr_cancelacion_pr2 =FormatNumber(ccur(pr_cancelacion_pr),2) end if
end if
if pre_medida<>"si" then
if pr_cancelacion_pr<>"" and pr_cancelacion_pr<>0 then pr_cancelacion_pr =FormatNumber(ccur(pr_cancelacion_pr),2) & "&nbsp;"&mon_pdf&"" else pr_cancelacion_pr= "No incluido*"  end if
end if

tasas_aerop_pr=ob_rs("tasas_aerop_pr")
if pre_medida="si" then 
if tasas_aerop_pr<>"" and tasas_aerop_pr<>0 and tasas_aerop_pr<>"0,00" then tasas_aerop_pr =FormatNumber(ccur(tasas_aerop_pr),2) end if
end if
if pre_medida<>"si" then
if tasas_aerop_pr<>"" and tasas_aerop_pr<>0 then tasas_aerop_pr =FormatNumber(ccur(tasas_aerop_pr),2) & "&nbsp;"&mon_pdf&"" else tasas_aerop_pr= "0,00" & "&nbsp;"&mon_pdf&"" end if
end if


pr_examen_pr=ob_rs("pr_examen_pr")
if pre_medida="si" then 
if pr_examen_pr<>"" and pr_examen_pr<>0 and pr_examen_pr<>"0,00" then pr_examen_pr =FormatNumber(ccur(pr_examen_pr),2) end if
end if
if pre_medida<>"si" then
if pr_examen_pr<>"" and pr_examen_pr<>0 then pr_examen_pr =FormatNumber(ccur(pr_examen_pr),2) & "&nbsp;"&mon_pdf&"" else pr_examen_pr= "No incluido*"  end if
end if


pr_gestion_bill_pr=ob_rs("pr_gestion_bill_pr")
if pre_medida="si" then 
if pr_gestion_bill_pr<>"" and pr_gestion_bill_pr<>0 and pr_gestion_bill_pr<>"0,00" then pr_gestion_bill_pr =FormatNumber(ccur(pr_gestion_bill_pr),2) end if
end if
if pre_medida<>"si" then
if pr_gestion_bill_pr<>"" and pr_gestion_bill_pr<>0 then pr_gestion_bill_pr =FormatNumber(ccur(pr_gestion_bill_pr),2) & "&nbsp;"&mon_pdf&"" else pr_gestion_bill_pr= "No incluido*"  end if
end if




suma_total=ob_rs("suma_total")
if suma_total<>"" and suma_total<>0 then suma_total =FormatNumber(ccur(suma_total),2) & "&nbsp;"&mon_pdf&"" else suma_total= "0,00" & "&nbsp;"&mon_pdf&""  end if
metodoPago=ob_rs("metodoPago")
Select case (metodoPago)
case "pag_transferencia"
metodoPago="Transferencia bancaria"
case "pag_tarjeta"
metodoPago="Tarjeta de cr&eacute;dito"
case "pag_paypal"
metodoPago="PayPal"
case "pag_oficina"
metodoPago="Pago en oficina"
end select
id_alojamiento=ob_rs("id_alojamiento")
tasas_concepto=ob_rs("tasas_concepto")
alo_concepto=ob_rs("alo_concepto")
precio_alo=ob_rs("precio_alo")
tasas_opciones=ob_rs("tasas_opciones")
alo_opcion=ob_rs("alo_opcion")
precio_sup_alo=ob_rs("precio_sup_alo")
precio_alo_a=precio_alo-precio_sup_alo-tasas_concepto-tasas_opciones
if precio_alo_a<>"" and precio_alo_a<>0 then precio_alo_a =FormatNumber(ccur(precio_alo_a),2) & "&nbsp;"&mon_pdf&"" else precio_alo_a= "0,00" & "&nbsp;"&mon_pdf&"" end if
if precio_alo<>"" and precio_alo<>0 then precio_alo =FormatNumber(ccur(precio_alo),2) & "&nbsp;"&mon_pdf&"" else precio_alo= "0,00"  end if
if precio_sup_alo<>"" and precio_sup_alo<>0 then precio_sup_alo =FormatNumber(ccur(precio_sup_alo),2) & "&nbsp;"&mon_pdf&"" else precio_sup_alo= "0,00" & "&nbsp;"&mon_pdf&"" end if
if tasas_concepto<>"" and tasas_concepto<>0 then tasas_concepto =FormatNumber(ccur(tasas_concepto),2) & "&nbsp;"&mon_pdf&"" else tasas_concepto= "0,00" & "&nbsp;"&mon_pdf&"" end if
if tasas_opciones<>"" and tasas_opciones<>0 then tasas_opciones =FormatNumber(ccur(tasas_opciones),2) & "&nbsp;"&mon_pdf&"" else tasas_opciones= "0,00" & "&nbsp;"&mon_pdf&"" end if
end if
ob_rs.close
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp_tmp WHERE id_programa="&cod&" and transfer='si' " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
opcion_transfer=ob_rs("nom_opcion_curso")
opcion_pre_curso=ob_rs("opcion_pre_curso")
if opcion_pre_curso<>"" and opcion_pre_curso<>0 then opcion_transfer_pr =FormatNumber(ccur(opcion_pre_curso),2) & "&nbsp;"&mon_pdf&"" else opcion_transfer_pr= "0,00" & "&nbsp;"&mon_pdf&""  end if
end if
ob_rs.close
Sql= "SELECT rel.id_categoria, categorias.id_categoria, rel.id_destino, titulo_esp FROM rel, categorias WHERE rel.id_item="&id_item&" and rel.id_categoria<>0 and rel.id_categoria=categorias.id_categoria and rel.id_destino<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tit_categoria=ob_rs("titulo_esp")
id_destino=ob_rs("id_destino")
end if
ob_rs.close
Sql= "SELECT titulo_esp FROM destinos WHERE id_destino="&id_destino&"" '////////////////ITEM
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
destino=ob_rs("titulo_esp")
end if
ob_rs.close

if f_inicio="01/01/1000" then f_inicio = "" end if
if nom_quincena<>"" then f_inicio_sup= nom_quincena end if
if s_mes<>"" and nom_quincena="" then f_inicio_sup =s_mes end if%>





<div class="col-md-12 col-sm-12" style="margin-bottom:35px"><div class="portlet "><div class="portlet-title">
<div class="caption"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-top:2px;"></i>Programa </div>
<%if pre_medida="si" then%>
<div class="col-md-12 col-sm-12 modo_edicion" style="text-align:center"><span><i class="fa fa-info-circle" aria-hidden="true"></i> Estás en modo edición de presupuesto</span>
<span style="display:block">*Por favor no uses puntos en las cifras. Usa comas para decimales. Usa formato fecha dd/mm/aaaa.</span></div><%end if%>
</div>
<div class="portlet-body">
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Categoría: </div><div class="col-md-7 value"><%=tit_categoria%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Programa: </div><div class="col-md-7 value"><%=nom_item%> - <%=duracion%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Curso: </div><div class="col-md-7 value"><%=nom_curso%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Aeropuerto: </div><div class="col-md-7 value"><%=aero_ciudad%></div></div></div>
<%if opcion_transfer<>""then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Traslados aeropuerto: </div><div class="col-md-7 value"><%=opcion_transfer%></div></div></div><%end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Destino: </div><div class="col-md-7 value"><%=destino%></div></div></div>
<%if con_examen<>"" or pre_medida="si" then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Examen: </div><div class="col-md-7 value" <%if pre_medida="si" then%>id="con_examen" onclick="turnTextIntoInputField('con_examen');"<%end if%>><%=con_examen%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div><%end if%>

<%if pr_medico<>"" or pre_medida="si" then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Seguro m&eacute;dico <%if pre_medida="si" then%>(si/no)<%end if%>: </div><div class="col-md-7 value" <%if pre_medida="si" then%>id="pr_medico" onclick="turnTextIntoInputField('pr_medico');"<%end if%>><%=pr_medico%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div><%end if%>
<%if f_inicio_sup<>""then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Fecha de inicio: </div><div class="col-md-7 value"><%=f_inicio_sup%></div></div></div><%end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Fecha de salida: </div><div class="col-md-7 value" <%if pre_medida="si" then%>id="f_inicio2" onclick="turnTextIntoInputField('f_inicio2');"<%end if%>><%=f_inicio%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>

<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Seguro de cancelaci&oacute;n<%if pre_medida="si" then%>(si/no)<%end if%>: </div><div class="col-md-7 value" <%if pre_medida="si" then%>id="pr_cancelacion" onclick="turnTextIntoInputField('pr_cancelacion');"<%end if%>><%=pr_cancelacion%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>
<%if semanas=0 and pre_medida="si" then semanas="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Semanas: </div><div class="col-md-7 value" <%if pre_medida="si" then%>id="semanas" onclick="turnTextIntoInputField('semanas');"<%end if%>><%=semanas%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>

<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Fecha de regreso: </div><div class="col-md-7 value" <%if pre_medida="si" then%>id="f_fin2" onclick="turnTextIntoInputField('f_fin2');"<%end if%>><%if f_fin<>"01/01/1000"then%><%=f_fin%><%else%> Sin especificar<%end if%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>

<%if id_alojamiento<>0then%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">&nbsp;</div><div class="col-md-7 value">&nbsp;</div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Alojamiento: </div><div class="col-md-7 value"><%=alo_concepto%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Modalidad alojamiento: </div><div class="col-md-7 value"><%=alo_opcion%></div></div></div>
<%end if%>
<div class="col-md-12 col-sm-12" style="border-top:1px solid #ddd;padding-top:25px;margin-top:25px"></div>

<%if precio_cur_a="0" and pre_medida="si" then precio_cur_a="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Precio curso: </div><div class="col-md-7 value"<%if pre_medida="si" then%>id="precio_cur_a" onclick="turnTextIntoInputField('precio_cur_a');"<%end if%>><%=precio_cur_a%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>

<%if precio_sup="0" and pre_medida="si" then precio_sup="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Suplemento temporada (curso): </div><div class="col-md-7 value"<%if pre_medida="si" then%>id="precio_sup" onclick="turnTextIntoInputField('precio_sup');"<%end if%>><%=precio_sup%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>


<%if pr_medico_pr="0" and pre_medida="si" then pr_medico_pr="" end if%>
<%if pr_medico_pr<>"No incluido*"then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Seguro m&eacute;dico: </div><div class="col-md-7 value"<%if pre_medida="si" then%>id="pr_medico_pr" onclick="turnTextIntoInputField('pr_medico_pr');"<%end if%>><%=pr_medico_pr%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div><%end if%>


<%if pr_cancelacion_pr2="0" and pre_medida="si" then pr_cancelacion_pr2="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Seguro cancelaci&oacute;n: </div><div class="col-md-7 value"<%if pre_medida="si" then%>id="pr_cancelacion_pr2" onclick="turnTextIntoInputField('pr_cancelacion_pr2');"<%end if%>><%=pr_cancelacion_pr2%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>

<%if pr_examen_pr="0" and pre_medida="si" then pr_examen_pr="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Examen: </div><div class="col-md-7 value"<%if pre_medida="si" then%>id="pr_examen_pr" onclick="turnTextIntoInputField('pr_examen_pr');"<%end if%>><%=pr_examen_pr%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>




<%if opcion_transfer_pr<>"" then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Traslados aeropuerto: </div><div class="col-md-7 value"><%=opcion_transfer_pr%></div></div></div><%end if%>

<%if tasas_aerop_pr="0" and pre_medida="si" then tasas_aerop_pr="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Tasas aeropuerto: </div><div class="col-md-7 value"<%if pre_medida="si" then%>id="tasas_aerop_pr" onclick="turnTextIntoInputField('tasas_aerop_pr');"<%end if%>><%=tasas_aerop_pr%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>

<%if pr_gestion_bill_pr<>"No incluido*" or pre_medida="si" then%>
<%if pr_gestion_bill_pr="0" and pre_medida="si" then pr_gestion_bill_pr="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Gesti&oacute;n billete: </div><div class="col-md-7 value"<%if pre_medida="si" then%>id="pr_gestion_bill_pr" onclick="turnTextIntoInputField('pr_gestion_bill_pr');"<%end if%>><%=pr_gestion_bill_pr%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div><%end if%>

<%if precio_alo_a<>"0,00&nbsp;&euro;"then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Precio alojamiento: </div><div class="col-md-7 value"><%=precio_alo_a%></div></div></div><%end if%>
<%if precio_sup_alo<>"0,00&nbsp;&euro;"then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Suplemento temporada: </div><div class="col-md-7 value"><%=precio_sup_alo%></div></div></div><%end if%>
<%if tasas_concepto<>"0,00&nbsp;&euro;"then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Tasas <%=alo_concepto%>: </div><div class="col-md-7 value"><%=tasas_concepto%></div></div></div><%end if%>
<%if tasas_opciones<>"0,00&nbsp;&euro;"then%><div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Tasas <%=alo_opcion%>: </div><div class="col-md-7 value"><%=tasas_opciones%></div></div></div><%end if%>
<%Sql= "SELECT nom_opcion_prog, opcion_pre_prog FROM programasOp_tmp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_prog<>'' " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
opcion_pre_prog=ob_rs("opcion_pre_prog")
if opcion_pre_prog<>"" and opcion_pre_prog<>0 then opcion_pre_prog =FormatNumber(ccur(opcion_pre_prog),2) & "&nbsp;"&mon_pdf&""else opcion_pre_prog= "0,00" & "&nbsp;"&mon_pdf&""  end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"><%=ob_rs("nom_opcion_prog")%>:</div><div class="col-md-7 value"><%=opcion_pre_prog%></div></div></div>
<%ob_rs.movenext
loop
end if
ob_rs.close
Sql= "SELECT nom_opcion_curso, opcion_pre_curso FROM programasOp_tmp WHERE id_programa="&id_programa&" AND (transfer IS NULL or transfer='') AND nom_opcion_curso<>'' " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
str = str& "<td colspan=""2"" valign=""top"">"
str = str& "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"" style=""font-family:arial;color:#32C5D2;font-size:1em;"">"
do while not ob_rs.eof
opcion_pre_curso=ob_rs("opcion_pre_curso")
if opcion_pre_curso<>"" and opcion_pre_curso<>0 then opcion_pre_curso =FormatNumber(ccur(opcion_pre_curso),2) & "&nbsp;"&mon_pdf&"" else opcion_pre_curso= "0,00" & "&nbsp;"&mon_pdf&""  end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name"><%=ob_rs("nom_opcion_curso")%>: </div><div class="col-md-7 value"><%=opcion_pre_curso%></div></div></div>
<%ob_rs.movenext
loop
str = str& "</table>"
str = str& "</td>"
end if
ob_rs.close%>

<%'if suma_total=0 and pre_medida="si" then suma_total="" end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Suma Total: </div>

<div class="col-md-7 value"<%if pre_medida="si" then%>id="suma_total2" onclick="turnTextIntoInputField('suma_total2');"<%end if%>><%if pre_medida="si" then%><%=suma_total2%><%else%><%=suma_total%><%end if%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div>
</div></div>

<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Método pago: </div><div class="col-md-7 value"><%=metodoPago%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Estado pago: </div><div class="col-md-7 value"><%=estadoPago%></div></div></div>
<%if factura="si"then%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Nombre para facturación: </div><div class="col-md-7 value"><%=u_f_nombre%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">NIF/CIF facturación </div><div class="col-md-7 value"><%=u_f_nif%></div></div></div>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Dirección: </div><div class="col-md-7 value"><%=u_f_direccion%></div></div></div>
<%end if%>
<div class="col-md-6 col-sm-6"><div class="row static-info"><div class="col-md-5 name">Observaciones para el curso: </div><div class="col-md-7 value" id="a_observaciones_curso" <%if pre_medida="si" then%>onclick="turnTextIntoInputField('a_observaciones_curso');"<%end if%>><%=a_observaciones_curso%><%if pre_medida="si" then%><i class="fa fa-cog" aria-hidden="true" style="color:#999;font-size:1.3em;cursor:pointer;margin-left:3px;"></i><%end if%></div></div></div>
</div>
</div>
</div>

<%if pre_medida="si" then%>
<div class="col-md-12" style="margin-left:10px;">
<div class="md-checkbox" style="padding-left:5px"><input name="fin_presupuesto" type="checkbox" class="md-check" id="fin_presupuesto" value="si" <%if fin_presupuesto="si" then%>checked<%end if%>><label for="fin_presupuesto" style="color:#999"> Cerrar presupuesto (finalizar) <i class="fa fa-check" aria-hidden="true" style="margin-right:6px;margin-left:5px"></i></label></div>
<div class="md-checkbox" style="padding-left:5px"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso" value="si"><label for="mail_aviso" style="color:#999"> Enviar mail aviso modificación (<%=mail_aviso%>) <i class="fa fa-share" aria-hidden="true" style="margin-right:6px;margin-left:5px"></i><i class="fa fa-envelope-o" aria-hidden="true"></i></label></div>
<div class="md-checkbox" style="padding-left:5px"><input name="mail_aviso_final" type="checkbox" class="md-check" id="mail_aviso_final" value="si"><label for="mail_aviso_final" style="color:#999"> Enviar mail aviso completado (<%=mail_aviso_final%>) <i class="fa fa-share" aria-hidden="true" style="margin-right:6px;margin-left:5px"></i><i class="fa fa-envelope-o" aria-hidden="true"></i></label></div>
<div class="md-checkbox" style="padding-left:5px"><input name="mail_presup" type="checkbox" class="md-check" id="mail_presup" value="si"><label for="mail_presup" style="color:#999"> Enviar presupuesto adjunto (<%=mail_presup%>) <i class="fa fa-share" aria-hidden="true" style="margin-right:6px;margin-left:5px"></i><i class="fa fa-envelope-o" aria-hidden="true"></i></label></div>

<div class="md-checkbox" style="padding-left:5px"><input name="hab_descarga" type="checkbox" class="md-check" id="hab_descarga" value="si" <%if hab_descarga="si" then%>checked<%end if%>><label for="hab_descarga" style="color:#999"> Habilitar descarga presupuesto zona usuario <i class="fa fa-download" aria-hidden="true"></i></label></div>

<div class="md-checkbox" style="padding-left:5px"><input name="hab_pago" type="checkbox" class="md-check" id="hab_pago" value="si" <%if hab_pago="si" then%>checked<%end if%>><label for="hab_pago" style="color:#999"> Habilitar pago zona usuario <i class="fa fa-money" aria-hidden="true" style="margin-right:6px;margin-left:5px"></i></label></div>


</div>
<div class="col-md-12" style="height:35px;"></div>

<script>
function resizable (el, factor) {
  var int = Number(factor) || 7.7;
  function resize() {el.style.width = ((el.value.length+1) * int) + 'px'}
  var e = 'keyup,keypress,focus,blur,change'.split(',');
  for (var i in e) el.addEventListener(e[i],resize,false);
  resize();}

function turnTextIntoInputField(inputId) {var inputIdWithHash = "#" + inputId;var elementValue = $(inputIdWithHash).text();
elementValue = elementValue.replace(".", "");
$(inputIdWithHash).replaceWith('<div class="col-md-7 value" style="padding:0"><span style="float:left;max-height:20px;max-width:250px;overflow:hidden"><input name="' + inputId + '" id="' + inputId + '" type="text" value="' + elementValue + '" class="input_nuevo"></span></div>'); 
$( "#confirma" ).fadeIn( "slow" );$(document).on('click.' + inputId, function (event) {if (!$(event.target).closest(inputIdWithHash).length) {$(document).off('click.' + inputId);var value = $(inputIdWithHash).val();$(inputIdWithHash).replaceWith('<input name="' + inputId + '" id="' + inputId + '" type="text" value="' + value + '" class="input_nuevo_out" input placeholder="&#xf013;" >');}});
resizable(document.getElementById(inputId),7);}
</script>
<style>.input_nuevo {border:none;border-bottom: 1px solid #666;padding: 0px;background:#efefef;margin: 0 0 10px 0;margin-left:15px}
 .input_nuevo_out {border:none;padding: 0px;background:#fff;margin: 0 0 10px 0;margin-left:15px;color:#F00;} 
#confirma{display:none;margin-bottom:45px} #confirma span{width:100%;max-width:350px;padding:35px;display:inline-block;border:1px solid #F00;color:#F00}.modo_edicion{margin-left:-45px;width:100%;text-align:center;padding:15px;margin-bottom:15px;display:block;color:#666;margin-bottom:45px}.modo_edicion i{font-size:20px;margin-right:8px;color:#CCC}
#tab_3 input { font-family: 'FontAwesome', "Open Sans",sans-serif; min-width:40px!important;  max-width:350px!important;  transition: width 0.25s; text-align:left;}</style>
 
<div class="col-md-12 col-sm-12" style="text-align:center" id="confirma"><span><i class="fa fa-info-circle" aria-hidden="true"></i> Cambios realizados pendientes de confirmación</span></div>

<%a=1%>

<div class="col-md-12"><!--<%'if gen_fac="si" then%> disabled<%'end if%>-->
<div class="campos_conceptos_<%=a%> form-group form-md-line-input campos_conceptos"><div class="col-md-12" style="border-top:2px solid #ddd;padding-top:20px;margin-bottom:20px;"><button class="inserta_concepto_<%=a%> btn green" type="button" ><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Concepto</button></div>

<%i_conceptos=1
a=1
if id_item<>"" then
Sql= "SELECT * FROM programasOpAdd_tmp WHERE id_programa="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_con=ob_rs.RecordCount 
if tot_con=""then tot_con=1
do while not ob_rs.eof
concepto_b=ob_rs("concepto")
concepto_pre_b=ob_rs("precio")
if concepto_pre_b <>"" and concepto_pre_b<>"0" then concepto_pre_b=FormatNumber(ccur(concepto_pre_b),2) else concepto_pre_b=""  end if
concepto_orden_b=ob_rs("orden")%>
<div class="col-md-12 concepto_lst_<%=a%>">
<div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_[<%=i_conceptos%>]">Concepto <span class="orden_con"><%=i_conceptos%></span>*.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" id="concepto_[<%=i_conceptos%>]" name="concepto_[<%=i_conceptos%>]" value="<%=concepto_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div>
<input name="concepto_orden_[<%=i_conceptos%>]" id="concepto_orden_[<%=i_conceptos%>]" type="hidden" value="<%=i_conceptos%>"></div></div>
<div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_pre_<%=i_conceptos%>">Precio.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="concepto_pre_[<%=i_conceptos%>]" id="concepto_pre_<%=i_conceptos%>" value="<%=concepto_pre_b%>" onKeyUp="suma();"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div>
<div class="col-md-2"><div class="form-group form-md-checkboxes"><div class="md-checkbox-inline"><div class="md-checkbox"><input type="checkbox" name="concepto_del_[<%=i_conceptos%>]" id="concepto_del_[<%=i_conceptos%>]" class="md-check" value="si" onClick="javascript:document.all.concepto_pre_<%=i_conceptos%>.value=0;suma();"><label for="concepto_del_[<%=i_conceptos%>]"><span></span><span class="check"></span><span class="box"></span> Eliminar.<%=i_conceptos%> </label></div></div></div></div></div>
<%i_conceptos=i_conceptos+1
ob_rs.movenext
loop
else
i_conceptos=0%>
<div class="col-md-12 concepto_lst_<%=a%>"></div>
<%end if
ob_rs.close
end if%>
</div></div>


<script>//CONCEPTO
$('.inserta_concepto_<%=a%>').one('click',function(){}).click(function(){<%if i_conceptos=0then%>var n = $('.concepto_lst_<%=a%>').length;<%else%>var n = $('.concepto_lst_<%=a%>').length+1;<%end if%>
if( 25 < n ) {$('#alerta_conceptos').modal();return false;}
x=n;

var ale=$('.conceto:last').val();
if (ale != null) {x=parseInt(ale)+1} 

var box_htmle = $('<div class="col-md-12 concepto_lst_<%=a%>"><div class="col-md-7"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_['+x+']">Concepto <span class="orden_con_<%=a%>">'+x+'</span>*.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" id="concepto_['+x+']" name="concepto_['+x+']" value="" class="concepto_nom"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="concepto_orden_['+x+']" id="concepto_orden_['+x+']" class="conceto" type="hidden" value="'+x+'"></div></div><div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="concepto_pre_['+x+']">Precio.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="concepto_pre_['+x+']" id="concepto_pre_'+x+'" value="" onKeyUp="suma();"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div></div></div><div class="col-md-2"><button class="elimina_campo btn red"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div></div>');
box_htmle.hide();
$('.campos_conceptos_<%=a%> div.concepto_lst_<%=a%>:last').after(box_htmle);
box_htmle.fadeIn('slow');
return false;});
$('.campos_conceptos_<%=a%>').on('click', '.elimina_campo', function(){
if( $('.concepto_lst_<%=a%>').length >1){
$(this).closest('.concepto_lst_<%=a%>').css( 'background-color', '#32C5D2' );
$(this).closest('.concepto_lst_<%=a%>').fadeOut("slow", function() {
$(this).closest('.concepto_lst_<%=a%>').remove();

$(".orden_con_<%=a%>").each(function(index){$(this).text( index + <%=i_conceptos%>);});

});
};return false;
});</script>



<%end if%>



</div>
</div>


<%if pre_medida="si" then%>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_presup(this.form);" value="enviar datos" language="javascript"><i class="fa fa-floppy-o" aria-hidden="true" style="margin-right:4px"></i> modificar presupuesto</button>
<a href="../<%=r%>web/pr_pdf_preins.asp?id_programa=<%=cod%>&tipo=pre_medida" class="btn default white"><i class="fa fa-download" aria-hidden="true"></i> descargar presupuesto</a>
<script>
function Enviar_presup (form)  {	////////////////////////////////////   GUARDAR ALTAS 
	$('#spinner_back').show();
	$('#spinner').show();
	$('#envio_presup').attr('action', 'guardar_presupuesto.asp');
	setTimeout(function(){ document.envio_presup.submit(); }, 300);
	return;
}
</script>

<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>preinscripciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div><!--ACCIONES fin form-body-->
<div class="modal fade" id="confirmaAlta" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención | Alta de Alumno</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que quieres confirmar el ALTA del alumno? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="Enviar_alta(this.form);">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>
</form>
<%end if%>


</div><!--form-body-->
</div><!--tab_3-->











</div><!--tab-content-->

</div><!--portlet-body-->
</div><!--portlet light portlet-fit portlet-form bordered-->
</div><!--page-content-col-->
</div><!--page-content-row-->
</div><!--page-content-container-->
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> El formato de factura introducido es incorrecto. Debe ser Fnnnn-aa. F, seguida de 4 dígitos, un guión y el año en formato 2 dígitos. Ej: F1234-18. </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div><style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok&edi="&edi)) 
encripta=EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ko&edi="&edi)%>
<script>
function formatea (num) {return num.toFixed(2).replace(".", ",").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")}
function Confirma_alta(){if (!fact_ok()) return;$("#confirmaAlta").modal();}
if (document.all.pagado.checked == 1){suma();}
function suma(){ 
var vtemp=0 ;
vresult=0; 
vtemp=parseFloat(document.all.precioReserva.value.replace('.','').replace(',','.') );
vtemp2=parseFloat(document.all.suma_total.value.replace('.','').replace(',','.'));
if (document.all.pagado.checked == 1){
vresult =vtemp2 - vtemp;   
<%if pr_cancelacion_pr<>"No incluido*" then %>
vresult =vtemp2 - vtemp - <%=replace(pr_cancelacion_pr,"&nbsp;&euro;","")%>; 
<%end if%> 
}else{vresult =vtemp2;}
document.all.falta_pagar.value=formatea(vresult);
} 
CKEDITOR.replace('ob_escuela',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Basica'});
$(document).ready(function() {$('select').select2({minimumResultsForSearch: -1,language: "es"});
$('#id_usuario').select2({minimumResultsForSearch: 3,language: "es"});
$("[name='gen_factura'],[name='env_mail'],[name='pagado']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});

<%if pre_medida="si" then%>
$("[name='mail_aviso'],[name='mail_aviso_final'],[name='fin_presupuesto'],[name='mail_presup'],[name='hab_pago'],[name='hab_descarga']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
<%end if%>

$('.date-picker').datepicker({language: 'es',autoclose: true});})
function recargar() {location.reload();}
function Enviar_alta (form)  {	////////////////////////////////////   GUARDAR ALTAS 
$('#confirmaAlta').modal('hide');
$('#spinner_back').show();
$('#spinner').show();
$('#envio').attr('action', 'alta.jpk2?enc=<%=encripta%>');
setTimeout(function(){ document.envio.submit(); }, 300);
return;
}
</script>