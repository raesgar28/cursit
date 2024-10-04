<!--#include file="../comun/menu_sup.asp"-->  <br>
<link href="<%=r%>lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css">
<%Sql= "SELECT titulo_crm_esp,id_categoria, pr_reserva,pr_medico,pr_cancelacion from categorias where id_categoria="&cod_cat&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tit_categoria=ob_rs("titulo_crm_esp")
pr_reserva_cat=ob_rs("pr_reserva")
pr_medico_cat=ob_rs("pr_medico")
pr_cancelacion_cat=ob_rs("pr_cancelacion")
if pr_reserva_cat <> 0 then pr_reserva =FormatNumber(ccur(pr_reserva_cat),2)
if pr_medico_cat <> 0 then pr_medico =FormatNumber(ccur(pr_medico_cat),2)
if pr_cancelacion_cat <> 0 then pr_cancelacion =FormatNumber(ccur(pr_cancelacion_cat),2)
end if
ob_rs.close
Sql= "SELECT * from items where id_item="&cod_prog&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
pr_reserva_ite=ob_rs("pr_reserva")
pr_medico_ite=ob_rs("pr_medico")
pr_cancelacion_ite=ob_rs("pr_cancelacion")
tasas_aerop_ite=ob_rs("tasas_aerop")
ed_desde_ite=ob_rs("ed_desde")
ed_hasta_ite=ob_rs("ed_hasta")
f_prog_salida_ite=ob_rs("f_prog_salida")
f_prog_regreso_ite=ob_rs("f_prog_regreso")
salida_dia_ite=ob_rs("f_prog_dia")
alo_fam=ob_rs("alo_fam")
alo_res=ob_rs("alo_res")
alo_apa=ob_rs("alo_apa")
vuelo=ob_rs("vuelo")
c_inten=ob_rs("c_inten")
c_semi=ob_rs("c_semi")
c_gene=ob_rs("c_gene")
wifi=ob_rs("wifi")
tel_24=ob_rs("tel_24")
monitor=ob_rs("monitor")
if pr_reserva_ite <> 0 then pr_reserva =FormatNumber(ccur(pr_reserva_ite),2)
if pr_medico_ite <> 0 then pr_medico =FormatNumber(ccur(pr_medico_ite),2)
if pr_cancelacion_ite <> 0 then pr_cancelacion =FormatNumber(ccur(pr_cancelacion_ite),2)
if tasas_aerop_ite <> 0 then tasas_aerop =FormatNumber(ccur(tasas_aerop_ite),2)
if ed_desde_ite<>0 then ed_desde=ed_desde_ite 
if ed_hasta_ite<>0 then ed_hasta=ed_hasta_ite 
if IsDate(f_prog_salida_ite)and f_prog_salida_ite<>"01/01/1000" then f_inicio= f_prog_salida_ite
if IsDate(f_prog_regreso_ite)and f_prog_regreso_ite<>"01/01/1000" then f_fin= f_prog_regreso_ite
if salida_dia_ite<>""then salida_dia=salida_dia_ite
if salida_dia<>"" and cod_prog <> "" and cod="" then salidas="salida_dias"
pr_reserva_ob=ob_rs("pr_reserva_ob")
pr_medico_ob=ob_rs("pr_medico_ob")
pr_cancelacion_ob=ob_rs("pr_cancelacion_ob")
tasas_aerop_ob=ob_rs("tasas_aerop_ob")
gestion_alojamientos=ob_rs("gestion_alojamientos")
gestion_aeropuertos=ob_rs("gestion_aeropuertos")
quincena=ob_rs("quincena")
campamento=ob_rs("campamento")
end if
ob_rs.close
if cod<>""then
Sql= "SELECT * from itemsSub where id_itemSub="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
visible=ob_rs("visible")
disponible=ob_rs("disponible")
fecha_in=ob_rs("fecha_in")
titulo_of_esp=ob_rs("titulo_of_esp")
codigo_curso=ob_rs("codigo_curso")
txt_aviso=ob_rs("txt_aviso")
n_lecciones=ob_rs("n_lecciones")
ed_desde=ob_rs("ed_desde")
ed_hasta=ob_rs("ed_hasta")
alo_fam=ob_rs("alo_fam")
alo_res=ob_rs("alo_res")
alo_apa=ob_rs("alo_apa")
vuelo=ob_rs("vuelo")
c_inten=ob_rs("c_inten")
c_semi=ob_rs("c_semi")
c_gene=ob_rs("c_gene")
wifi=ob_rs("wifi")
tel_24=ob_rs("tel_24")
monitor=ob_rs("monitor")
salidas=ob_rs("salidas")
salida_dia=ob_rs("salida_dia")
salida_mes=ob_rs("salida_mes")
salida_fecha=ob_rs("salida_fecha")
salida_quincena0=ob_rs("salida_quincena0")
salida_quincena1=ob_rs("salida_quincena1")
salida_quincena2=ob_rs("salida_quincena2")
salida_quincena3=ob_rs("salida_quincena3")
salida_quincena4=ob_rs("salida_quincena4")
f_inicio=ob_rs("f_inicio")
f_fin=ob_rs("f_fin")
pr_reserva=ob_rs("pr_reserva")
if pr_reserva<>"" and pr_reserva<>0 then pr_reserva=FormatNumber(ccur(pr_reserva),2)
pr_medico=ob_rs("pr_medico")
if pr_medico<>"" and pr_medico<>0 then pr_medico=FormatNumber(ccur(pr_medico),2)
pr_medico_ob=ob_rs("pr_medico_ob")
pr_cancelacion=ob_rs("pr_cancelacion")
if pr_cancelacion<>"" and pr_cancelacion<>0 then pr_cancelacion=FormatNumber(ccur(pr_cancelacion),2)
pr_cancelacion_ob=ob_rs("pr_cancelacion_ob")
tasas_aerop=ob_rs("tasas_aerop")
if tasas_aerop<>"" and tasas_aerop<>0 then tasas_aerop=FormatNumber(ccur(tasas_aerop),2)
tasas_aerop_ob=ob_rs("tasas_aerop_ob")
pr_examen=ob_rs("pr_examen")
if pr_examen<>"" and pr_examen<>0 then pr_examen=FormatNumber(ccur(pr_examen),2)
pr_examen_ob=ob_rs("pr_examen_ob")
con_examen=ob_rs("con_examen")
con_examen_act=ob_rs("con_examen_act")
url_esp=ob_rs("url_esp")
meta_title=ob_rs("meta_title")
meta_desc=ob_rs("meta_desc")
meta_key=ob_rs("meta_key")
h_lecciones=ob_rs("h_lecciones")
orden_curso=ob_rs("orden_curso")
pr_gestion_bill=ob_rs("pr_gestion_bill")
if pr_gestion_bill<>"" and pr_gestion_bill<>0 then pr_gestion_bill=FormatNumber(ccur(pr_gestion_bill),2)
pr_gestion_bill_ob=ob_rs("pr_gestion_bill_ob")
end if
n_alumnos=ob_rs("n_alumnos")
ob_rs.close
Dim opcion_esp_(20),opcion_orden_(20)
Dim semanas_(20),precio_(20),precio_coste_(20),duracion_(20)
Dim fecha_inicio_(20),fecha_fin_(20)
Dim id_aeropuerto_(20),plazas_(20),mes_(20),quincena_(20),orden_aer_(20),completo_(20), f_fin_aer_(20),f_salida_aer_(20)
Dim id_alojamiento_(20),titulo_esp_(20),texto_esp_(20),orden_(20),tasas_(20),tipo_alo_(20)
Sql= "SELECT id_itemSub, id_itemSubOp from rel where id_itemSub="&cod&" and id_itemSubOp<>0"    'OPCIONES////////////////////////////////////////////////////
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
id_itemSubOp=ob_rs("id_itemSubOp")
if id_itemSubOp<>""then
Sql2= "SELECT id_itemSubOp, opcion_esp, opcion_pre, opcion_ob, opcion_orden, transfer from itemsSubOp where id_itemSubOp="&id_itemSubOp&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("opcion_orden")=i then 
execute("opcion_esp_"& i & "= ob_rs2(""opcion_esp"")")
execute("opcion_pre_"& i & "= ob_rs2(""opcion_pre"")")
execute("transfer_"& i & "= ob_rs2(""transfer"")")
execute("opcion_ob_"& i & "= ob_rs2(""opcion_ob"")")
execute("opcion_orden_"& i & "= ob_rs2(""opcion_orden"")")
end if
next
end if
ob_rs2.close
end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close 'ob_conn.close    'FIN OPCIONES////////////////////////////////////////////////////
Sql= "SELECT id_itemSub, id_itemSubSemana from rel where id_itemSub="&cod&" and id_itemSubSemana<>0"    'SEMANAS////////////////////////////////////////////////////
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
id_itemSubSemana=ob_rs("id_itemSubSemana")
if id_itemSubSemana<>""then
Sql2= "SELECT id_itemSubSemana, semanas, precio, precio_coste, orden, duracion from itemsSubSemanas where id_itemSubSemana="&id_itemSubSemana&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("orden")=i then 
execute("semanas_"& i & "= ob_rs2(""semanas"")")
execute("precio_"& i & "= ob_rs2(""precio"")")
execute("precio_coste_"& i & "= ob_rs2(""precio_coste"")")
execute("duracion_"& i & "= ob_rs2(""duracion"")")
end if
next
end if
ob_rs2.close
end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close 'ob_conn.close    'FIN SEMANAS////////////////////////////////////////////////////
Sql= "SELECT id_itemSub, id_suplemento, id_alojamiento from rel where id_itemSub="&cod&" and id_suplemento<>0 and id_alojamiento=0"    'TEMPORADAS////////////////////////////////////////////////////
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
id_suplemento=ob_rs("id_suplemento")
if id_suplemento<>""then
Sql2= "SELECT id_suplemento, fecha_inicio,fecha_fin, precio, precio_coste,orden from preciosSuplementos where id_suplemento="&id_suplemento&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("orden")=i then 
execute("fecha_inicio_"& i & "= ob_rs2(""fecha_inicio"")")
execute("fecha_fin_"& i & "= ob_rs2(""fecha_fin"")")
execute("precio_tem_"& i & "= ob_rs2(""precio"")")
execute("precio_coste_tem_"& i & "= ob_rs2(""precio_coste"")")
end if
next
end if
ob_rs2.close
end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close 'ob_conn.close    'FIN TEMPORADAS////////////////////////////////////////////////////

if campamento="si"then
Sql= "SELECT id_itemSub, id_itemSubAero from rel where id_itemSub="&cod&" and id_itemSubAero<>0 and grupo='si'"    'AEROPUERTTOS////////////////////////////////////////////////////
else
Sql= "SELECT id_itemSub, id_itemSubAero from rel where id_itemSub="&cod&" and id_itemSubAero<>0 and (grupo IS NULL or grupo='')"    'AEROPUERTTOS////////////////////////////////////////////////////
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
id_itemSubAero=ob_rs("id_itemSubAero")
if id_itemSubAero<>""then
Sql2= "SELECT id_itemSubAero, id_aeropuerto, plazas, mes, id_quincena,orden_aer, completo, f_salida, f_fin from itemsSubAero where id_itemSubAero="&id_itemSubAero&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("orden_aer")=i then 
execute("id_aeropuerto_"& i & "= ob_rs2(""id_aeropuerto"")")
execute("plazas_"& i & "= ob_rs2(""plazas"")")
execute("mes_"& i & "= ob_rs2(""mes"")")
execute("quincena_"& i & "= ob_rs2(""id_quincena"")")
execute("orden_aer_"& i & "= ob_rs2(""orden_aer"")")
execute("completo_"& i & "= ob_rs2(""completo"")")
execute("f_salida_aer_"& i & "= ob_rs2(""f_salida"")")
execute("f_fin_aer_"& i & "= ob_rs2(""f_fin"")")
end if
next
end if
ob_rs2.close
end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close 'ob_conn.close    'FIN AEROPUERTTOS////////////////////////////////////////////////////
'ALOJAMIENTOS////////////////////////////////////////////////////
Sql= "SELECT id_itemSub, id_alojamiento, id_alo_opcion, id_suplemento from rel where id_itemSub="&cod&" and id_alojamiento<>0 and id_alo_opcion=0 and id_suplemento=0"    
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
do while not ob_rs.eof
id_alojamiento=ob_rs("id_alojamiento")
if id_alojamiento<>""then
Sql2= "SELECT id_alojamiento, titulo_esp, texto_esp, orden, tasas, tipo_alo from alo_conceptos where id_alojamiento="&id_alojamiento&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("orden")=i then 
execute("id_alojamiento_"& i & "= ob_rs2(""id_alojamiento"")")
execute("titulo_esp_"& i & "= ob_rs2(""titulo_esp"")")
execute("texto_esp_"& i & "= ob_rs2(""texto_esp"")")
execute("orden_"& i & "= ob_rs2(""orden"")")
execute("tasas_"& i & "= ob_rs2(""tasas"")")
execute("tipo_alo_"& i & "= ob_rs2(""tipo_alo"")")
end if
next
end if
ob_rs2.close
end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close 'ob_conn.close    'FIN ALOJAMIENTOS////////////////////////////////////////////////////
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión  Cursos | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat))%>
<a href="<%=r%>itemsSub/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat)%>">Listado  Cursos</a></li>
<li class="active">Gestión  Cursos</li>
</ol>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar">
<span class="sr-only">Toggle navigation</span>
<span class="toggle-icon">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</span>
</button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat))%><a href="<%=r%>itemsSub/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat)%>"><i class="icon-list"></i> Listado Cursos<%if num_cc<>""then%><span class="baddge badge badge-default"> <%=num_cc%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Curso</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat="))%>
<a href="<%=r%>subSecciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=")%>"><i class="icon-note"></i> Subsecciones Cursos 
<%if num_ss<>""then%><span class="baddge badge badge-default"> <%=num_ss%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat))%><a href="<%=r%>categorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat)%>"><i class="icon-note"></i> Gestión Categorías<%if num_c<>""then%><span class="baddge badge badge-default"> <%=num_c%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat="))%>
<a href="<%=r%>webs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat=")%>"><i class="icon-note"></i> Gestión Webs <%if num_w<>""then%><span class="baddge badge badge-default"> <%=num_w%> </span><%else%><span class="baddge badge badge-danger"> 0 </span><%end if%></a></li>
</ul>
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod_prog&"&cod_cat="&cod_cat))%><a href="<%=r%>items/gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod_prog&"&cod_cat="&cod_cat)%>"><i class="fa fa-undo" aria-hidden="true"></i> Volver al Programa </a></li>
</ul>
</nav>
</div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión  Curso <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab"> General <%if gestion_aeropuertos<>"si" and campamento<>"si" then%>/ Fechas<%end if%></a></li>
<li><a href="#tab_2" data-toggle="tab"> Precios / Semanas </a></li>
<%if gestion_aeropuertos="si" or campamento="si" then%><li><a href="#tab_3" data-toggle="tab"><%if campamento="si" then%>Grupos<%else%>Aeropuertos<%end if%> / Plazas <%if num_img_tot<>""then%><span class="badge badge-success" style="margin-left:5px""> <%=num_img_tot%> </span><%end if%></a></li><%end if%>
<li><a href="#tab_5" data-toggle="tab"> SEO</a></li>
</ul><!--NAV TABS-->
</div>
<div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="edi" type="hidden" value="<%=edi%>">
<input name="cod_prog" type="hidden" value="<%=cod_prog%>">
<input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> La URL ya se encuentra registrada. Debes modificarla.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_cc">
<label class="col-md-4 control-label" for="titulo_esp_cc" >Nombre curso.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp_cc" onKeyUp="resetea_error('titulo_esp_cc');urlea_c_esp();" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="titulo_of_esp" >Nombre oficial.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_of_esp" id="titulo_of_esp" maxlength="160" value="<%=titulo_of_esp%>"><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
<div class="col-md-7">
<div class="form-group form-md-line-input">
<label class="col-md-7 control-label" for="codigo_curso" style="padding-right:20px">Código curso.</label>
<div class="col-md-5"  style="padding-left:5px">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="codigo_curso" id="codigo_curso" maxlength="160" value="<%=codigo_curso%>"><div class="form-control-focus"> </div><i class="fa fa-barcode" aria-hidden="true"></i><span class="help-block">código del programa</span></div></div></div>
</div>
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-5 control-label" for="n_alumnos" >Alumnos.</label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="n_alumnos" id="n_alumnos" maxlength="160" value="<%if n_alumnos<>0 then%><%=n_alumnos%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-users" aria-hidden="true"></i><span class="help-block">número de alumnos</span></div></div></div>
</div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="txt_aviso" >Texto de aviso.</label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="txt_aviso" id="txt_aviso" maxlength="160" value="<%=txt_aviso%>"><div class="form-control-focus"> </div><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><span class="help-block">texto corto de aviso</span></div>
</div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-6 control-label "  style="padding-right:20px" for="n_lecciones" >Lecciones.</label>
<div class="col-md-6"  style="padding-left:5px">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="n_lecciones" id="n_lecciones" maxlength="160" value="<%if n_lecciones<>0then%><%=n_lecciones%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-clock-o" aria-hidden="true"></i><span class="help-block">número lecciones</span></div></div></div>
</div>
<div class="form-group form-md-checkboxes" style="padding-top:10px;">
<div class="md-checkbox-list"><div class="col-md-3"><div class="md-checkbox"><input name="h_lecciones" type="checkbox" class="md-check" id="h_lecciones" value="si" <%if h_lecciones="si"then%>checked="checked"<%end if%>><label for="h_lecciones">Son horas </label></div></div></div></div>
<div class="col-md-12">
<div class="form-group form-md-line-input">
<link href="<%=r%>lib/app/nouislider/nouislider.min.css" rel="stylesheet" type="text/css" />
<label class="col-md-3 control-label">Edades.</label>
<div class="col-md-5" id="demo8" class="noUi-danger"></div>
<input name="ed_desde" id="ed_desde"  type="hidden" <%if ed_desde=""then%>value="12"<%else%>value="<%=ed_desde%>"<%end if%>>
<input name="ed_hasta" id="ed_hasta"  type="hidden" <%if ed_hasta=""then%>value="90"<%else%>value="<%=ed_hasta%>"<%end if%>>
<script src="<%=r%>lib/app/nouislider/wNumb.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/nouislider/nouislider.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/nouislider/components-nouisliders.min.js" type="text/javascript"></script>
</div></div></div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="txt_aviso" >Orden.</label>
<div class="col-md-3">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="orden_curso" id="orden_curso" maxlength="160" value="<%if orden_curso<>0 and cod<>"" then%><%=orden_curso%><%else%><%=num_cc+1%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block">orden del curso</span></div>
</div></div></div>
<div class="col-md-12" style="border-bottom:1px solid #ddd;margin-bottom:25px">
<div class="form-group form-md-checkboxes" style="border-bottom:1px solid #ddd;padding-bottom:25px;border-top:1px solid #ddd;padding-top:25px;margin-top:10px">
<div class="md-checkbox-list">
<div class="col-md-3 col-md-offset-2">
<div class="md-checkbox"><input name="alo_fam" type="checkbox" class="md-check" id="alo_fam" value="si" <%if alo_fam="si"then%>checked="checked"<%end if%>><label for="alo_fam">Aloj. Familia </label></div>
<div class="md-checkbox"><input name="alo_res" type="checkbox" class="md-check" id="alo_res" value="si" <%if alo_res="si"then%>checked="checked"<%end if%>><label for="alo_res">Aloj. Residencia </label></div>
<div class="md-checkbox"><input name="alo_apa" type="checkbox" class="md-check" id="alo_apa" value="si" <%if alo_apa="si"then%>checked="checked"<%end if%>><label for="alo_apa">Aloj. Apartamento </label></div>
<div class="md-checkbox"><input name="vuelo" type="checkbox" class="md-check" id="vuelo"  value="si" <%if vuelo="si"then%>checked="checked"<%end if%>><label for="vuelo"> Vuelo incluído </label></div>
</div>
<div class="col-md-3">
<div class="md-checkbox"><input name="c_inten" type="checkbox" class="md-check" id="c_inten"  value="si" <%if c_inten="si"then%>checked="checked"<%end if%>><label for="c_inten"> Curso intensivo </label></div>
<div class="md-checkbox"><input name="c_semi" type="checkbox" class="md-check" id="c_semi"  value="si" <%if c_semi="si"then%>checked="checked"<%end if%>><label for="c_semi"> Curso semi-intensivo </label></div>
<div class="md-checkbox"><input name="c_gene" type="checkbox" class="md-check" id="c_gene"  value="si" <%if c_gene="si"then%>checked="checked"<%end if%>><label for="c_gene"> Curso general </label></div>
<div class="md-checkbox"><input name="disponible" type="checkbox" class="md-check" id="disponible"  value="si" <%if cod ="" then%>checked="checked"<%end if%> <%if disponible="si" and cod<>""then%>checked="checked"<%end if%>><label for="disponible"> Disponible </label>
</div>
</div>
<div class="col-md-3">
<div class="md-checkbox"><input name="wifi" type="checkbox" class="md-check" id="wifi" value="si" <%if wifi="si"then%>checked="checked"<%end if%>><label for="wifi">Wi-Fi </label></div>
<div class="md-checkbox"><input name="tel_24" type="checkbox" class="md-check" id="tel_24"  value="si" <%if tel_24="si"then%>checked="checked"<%end if%>><label for="tel_24"> Teléfono 24 h. </label></div>
<div class="md-checkbox"><input name="monitor" type="checkbox" class="md-check" id="monitor"  value="si" <%if monitor="si"then%>checked="checked"<%end if%>><label for="monitor"> Monitor destino </label>
</div>
<div class="md-checkbox"><input name="visible" type="checkbox" class="md-check" id="visible"  value="si" <%if cod ="" then%>checked="checked"<%end if%> <%if visible="si" and cod<>""then%>checked="checked"<%end if%>><label for="visible"> Visible </label>
</div>
</div>
</div>
</div>
<%if gestion_aeropuertos<>"si" or campamento="si" then%>
<div class="form-group form-md-radios" style="border-bottom:1px solid #ddd;padding-bottom:20px">
<label class="col-md-2 control-label" >Fechas de salida.</label>
<div class="col-md-10">
<div class="md-radio-list">
<div class="col-md-6">
<div class="md-radio">
<input name="salidas" type="radio" class="acord_link_lab md-radiobtn" id="radio2" value="salida_dias" <%if (salidas="salida_dias" and cod<>"") or (cod_prog<>"" and salidas="salida_dias") then%>checked="CHECKED"<%end if%>>
<label for="radio2" >
<span></span>
<span class="check"></span>
<span class="box"></span>Días</label>
</div>
<div class="acord_txt sal_dias form-group form-md-line-input">
<label class="col-md-3 control-label" for="salida_dia" >Salida en.</label>
<div class="col-md-8"><div class="input-icon">
<select id="salida_dia" name="salida_dia" style="width:100%" multiple="multiple">
<option value="Lunes" <%if cod_prog=""then%>selected<%end if%> <%if instr(salida_dia,"Lunes") then%>selected<%end if%>>Lunes</option>
<option value="Martes" <%if instr(salida_dia,"Martes") then%>selected<%end if%>>Martes</option>
<option value="Miercoles" <%if instr(salida_dia,"Miercoles") then%>selected<%end if%>>Miércoles</option>
<option value="Jueves" <%if instr(salida_dia,"Jueves") then%>selected<%end if%>>Jueves</option>
<option value="Viernes" <%if instr(salida_dia,"Viernes") then%>selected<%end if%>>Viernes</option>
<option value="Sabado" <%if instr(salida_dia,"Sabado") then%>selected<%end if%>>Sábado</option>
<option value="Domingo" <%if instr(salida_dia,"Domingo") then%>selected<%end if%>>Domingo</option>
</select>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
<div class="md-radio" style="display:none">
<input name="salidas" type="radio" class="acord_link_lab md-radiobtn" id="radio3" value="salida_meses" <%if salidas="salida_meses" and cod<>""then%>checked="CHECKED"<%end if%>>
<label for="radio3" >
<span></span>
<span class="check"></span>
<span class="box"></span></label>
Mes concreto 
</div>
<div class="acord_txt sal_meses form-group form-md-line-input">
<label class="col-md-2 control-label" for="salida_meses">Salida en.</label>
<div class="col-md-8"><div class="input-icon">
<select id="salida_mes" name="salida_mes" style="width:100%">
<option value="" >&nbsp;</option>
<option value="Enero" <%if instr(salida_mes,"Enero") then%>selected<%end if%>>Enero</option>
<option value="Febrero" <%if instr(salida_mes,"Febrero") then%>selected<%end if%>>Febrero</option>
<option value="Marzo" <%if instr(salida_mes,"Marzo") then%>selected<%end if%>>Marzo</option>
<option value="Abril" <%if instr(salida_mes,"Abril") then%>selected<%end if%>>Abril</option>
<option value="Mayo" <%if instr(salida_mes,"Mayo") then%>selected<%end if%>>Mayo</option>
<option value="Junio" <%if instr(salida_mes,"Junio") then%>selected<%end if%>>Junio</option>
<option value="Julio" <%if instr(salida_mes,"Julio") then%>selected<%end if%>>Julio</option>
<option value="Agosto" <%if instr(salida_mes,"Agosto") then%>selected<%end if%>>Agosto</option>
<option value="Septiembre" <%if instr(salida_mes,"Septiembre") then%>selected<%end if%>>Septiembre</option>
<option value="Octubre" <%if instr(salida_mes,"Octubre") then%>selected<%end if%>>Octubre</option>
<option value="Noviembre" <%if instr(salida_mes,"Noviembre") then%>selected<%end if%>>Noviembre</option>
<option value="Diciembre" <%if instr(salida_mes,"Diciembre") then%>selected<%end if%>>Diciembre</option>
</select>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
<%if quincena="si"then%>
<div class="md-radio">
<input name="salidas" type="radio" class="acord_link_lab md-radiobtn" id="radio5" value="salida_quincenas" <%if salidas="salida_quincenas" and cod<>""then%>checked="CHECKED"<%end if%>>
<label for="radio5" >
<span></span>
<span class="check"></span>
<span class="box"></span>Quincena</label>
</div>
<div class="acord_txt sal_quincenas form-group form-md-line-input">
<label class="col-md-3 control-label" for="salida_quincena">Salida en.</label>
<div class="col-md-8"><div class="input-icon">
<%Sql= "SELECT id_quincena, titulo_esp from quincenas order by titulo_esp"   '[ASOCIAMOS CON UNA QUINCENA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_quincena="si"%>
<select name="salida_quincena" id="salida_quincena"  style="width:100%" multiple="multiple">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_quincena=ob_rs("id_quincena")
tit_quincena=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_itemSub, salida_quincena0, salida_quincena1,salida_quincena2,salida_quincena3,salida_quincena4 from itemsSub where id_itemSub = "&cod&" and (salida_quincena0= "&id_quincena&" or salida_quincena1= "&id_quincena&" or salida_quincena2= "&id_quincena&" or salida_quincena3= "&id_quincena&" or salida_quincena4= "&id_quincena&")" 
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_quincena%>" <%if sel="si" then%>Selected<%end if%>><%=tit_quincena%>
<%ob_rs.movenext
sel=""
tit_quincena=""
id_quincena=""%>
</option>
<%loop%>
</select>
<%end if
ob_rs.close%>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
<%end if%>
</div>
<div class="col-md-6">
<div class="md-radio">
<input name="salidas" type="radio" class="acord_link_lab md-radiobtn" id="radio4" value="salida_fecha" <%if salidas="salida_fecha" and cod<>""then%>checked="CHECKED"<%end if%>>
<label for="radio4" >
<span></span>
<span class="check"></span>
<span class="box"></span>Fecha concreta</label>
</div>
<div class="acord_txt sal_fecha form-group form-md-line-input">
<label class="col-md-3 control-label" for="salida_fecha">Salida en.</label>
<div class="col-md-5"><div class="input-icon">
<div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="salida_fecha" name="salida_fecha" placeholder="salida" <%if cod<>"" and salida_fecha<>"01/01/1000"then%>value="<%=salida_fecha%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
</div>
</div>
</div>
<%if gestion_aeropuertos<>"si" or campamento="si" then%>
<div class="col-md-11 col-md-offset-1" id="sal_quincenas_dias">
<div class="col-md-5 col-md-offset-1">
<div class="form-group form-md-line-input"  id="sel_f_concreta">
<label class="col-md-4 control-label" for="id_division">Día salida.</label>
<div class="col-md-7"><div class="input-icon">
<div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_inicio" name="f_inicio" placeholder="salida" <%if cod_prog<>"" and f_inicio<>"" and f_inicio<>"01/01/1000"then%>value="<%=f_inicio%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
</div>
<div class="col-md-5">
<div class="form-group form-md-line-input"  id="sel_f_concreta">
<label class="col-md-4 control-label" for="id_division">Día regreso.</label>
<div class="col-md-7"><div class="input-icon">
<div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin" name="f_fin" placeholder="regreso" <%if cod_prog<>"" and f_fin<>""  and f_fin<>"01/01/1000"then%>value="<%=f_fin%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
</div>
</div>
<%end if%>
</div>
<%end if%>
<div class="campos_opciones form-group form-md-line-input">
<div class="col-md-12" style="padding-top:20px;margin-bottom:20px;"><button class="inserta_campo btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Opción</button></div>
<%i_opciones=1
if cod<>"" then
Sql= "SELECT rel.id_itemSub, rel.id_itemSubOp, itemsSubOp.id_itemSubOp from rel, itemsSubOp where id_itemSub="&cod&" and rel.id_itemSubOp=itemsSubOp.id_itemSubOp and rel.id_itemSubOp<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_op=ob_rs.RecordCount 
end if
ob_rs.close
if tot_op=""then tot_op=1
do while i_opciones<=tot_op
execute("opcion_esp_b=opcion_esp_"&i_opciones)
execute("transfer_b=transfer_"&i_opciones)
execute("opcion_pre_b=opcion_pre_"&i_opciones)
execute("opcion_ob_b=opcion_ob_"&i_opciones)
execute("opcion_orden_b=opcion_orden_"&i_opciones)%>
<div class="col-md-12 opcion_lst">
<div class="col-md-5">
<div class="form-group form-md-line-input" >
<label class="col-md-5 control-label" for="opcion_esp_[<%=i_opciones%>]">Opción <span class="orden_op"><%=i_opciones%></span>.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" id="opcion_esp_[<%=i_opciones%>]" name="opcion_esp_[<%=i_opciones%>]" value="<%=opcion_esp_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div>
<input name="opcion_orden_[<%=i_opciones%>]" id="opcion_orden_[<%=i_opciones%>]" type="hidden" value="<%=i_opciones%>">
</div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="opcion_pre_[<%=i_opciones%>]">Precio.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="opcion_pre_[<%=i_opciones%>]" id="opcion_pre_[<%=i_opciones%>]" value="<%=opcion_pre_b%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
</div>
</div>
<div class="col-md-4">
<div class="form-group form-md-checkboxes">
<div class="md-checkbox-inline">
<div class="md-checkbox"><input type="checkbox" name="opcion_ob_[<%=i_opciones%>]" id="opcion_ob_[<%=i_opciones%>]" class="md-check" value="si" <%if opcion_ob_b="si"then%>checked="checked"<%end if%>><label for="opcion_ob_[<%=i_opciones%>]"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
<div class="md-checkbox"><input type="checkbox" name="transfer_[<%=i_opciones%>]" id="transfer_[<%=i_opciones%>]" class="md-check" value="si" <%if transfer_b="si"then%>checked="checked"<%end if%>><label for="transfer_[<%=i_opciones%>]"><span></span><span class="check"></span><span class="box"></span> Transfer. </label></div>
<%if cod<>""and opcion_esp_b<>""then%><div class="md-checkbox"><input type="checkbox" name="opcion_del_[<%=i_opciones%>]" id="opcion_del_[<%=i_opciones%>]" class="md-check" value="si"><label for="opcion_del_[<%=i_opciones%>]"><span></span><span class="check"></span><span class="box"></span> Eliminar. </label></div><%end if%>
</div>
</div>
</div>
</div>
<%i_opciones=i_opciones+1
loop
else
do while i_opciones<=1%>
<div class="col-md-12 opcion_lst">
<div class="col-md-5">
<div class="form-group form-md-line-input" >
<label class="col-md-5 control-label" for="opcion_esp_[<%=i_opciones%>]">Opción <span class="orden_op"><%=i_opciones%></span>.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" id="opcion_esp_[<%=i_opciones%>]" name="opcion_esp_[<%=i_opciones%>]" value="<%=opcion_esp_b%>"><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div>
<input name="opcion_orden_[<%=i_opciones%>]" id="opcion_orden_[<%=i_opciones%>]" type="hidden" value="<%=i_opciones%>">
</div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="opcion_pre_[<%=i_opciones%>]">Precio.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="opcion_pre_[<%=i_opciones%>]" id="opcion_pre_[<%=i_opciones%>]" value="<%=opcion_pre_b%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
</div>
</div>
<div class="col-md-4">
<div class="form-group form-md-checkboxes">
<div class="md-checkbox-inline">
<div class="md-checkbox"><input type="checkbox" name="transfer_[<%=i_opciones%>]" id="transfer_[<%=i_opciones%>]" class="md-check" value="si" <%if transfer_b="si"then%>checked="checked"<%end if%>><label for="transfer_[<%=i_opciones%>]"><span></span><span class="check"></span><span class="box"></span> Transfer. </label></div>
<div class="md-checkbox"><input type="checkbox" name="opcion_ob_[<%=i_opciones%>]" id="opcion_ob_[<%=i_opciones%>]" class="md-check" value="si" <%if opcion_ob_b="si"then%>checked="checked"<%end if%>><label for="opcion_ob_[<%=i_opciones%>]"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
<div class="md-checkbox"><input type="checkbox" name="opcion_del_[<%=i_opciones%>]" id="opcion_del_[<%=i_opciones%>]" class="md-check" value="si"><label for="opcion_del_[<%=i_opciones%>]"><span></span><span class="check"></span><span class="box"></span> Eliminar. </label></div>
</div>
</div>
</div>
</div>
<%i_opciones=i_opciones+1
loop
end if%>
</div>
<script>
$('.inserta_campo').one('click',function(){
}).click(function(){
var n = $('.opcion_lst').length + 1;
if( 16 < n ) {$('#alerta_opciones').modal();return false;}
x=n;
var box_htmlX = $('<div class="col-md-12 opcion_lst"><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-5 control-label" for="opcion_esp_['+x+']">Opción <span class="orden_op">'+x+'</span>.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" id="opcion_esp_['+x+']" name="opcion_esp_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="opcion_orden_['+x+']" id="opcion_orden_['+x+']" type="hidden" value="'+x+'"></div></div><div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="opcion_pre__['+x+']">Precio.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="opcion_pre_['+x+']" id="opcion_pre_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">indica el precio.</span></div></div></div></div><div class="col-md-3"><div class="form-group form-md-checkboxes"><div class="md-checkbox-inline"><div class="md-checkbox"><input type="checkbox" name="opcion_ob_['+x+']" id="opcion_ob_['+x+']" class="md-check" value="si"><label for="opcion_ob_['+x+']"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div><div class="md-checkbox" style="margin-left:4px"><input type="checkbox" name="transfer_['+x+']" id="transfer_['+x+']" class="md-check" value="si"><label for="transfer_['+x+']"><span></span><span class="check"></span><span class="box"></span> Transfer. </label></div><button class="elimina_campo btn red"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div></div></div></div>');
box_htmlX.hide();
$('.campos_opciones div.opcion_lst:last').after(box_htmlX);
box_htmlX.fadeIn('slow');
return false;});
$('.campos_opciones').on('click', '.elimina_campo', function(){
if( $('.opcion_lst').length >1){
$(this).closest('.opcion_lst').css( 'background-color', '#32C5D2' );
$(this).closest('.opcion_lst').fadeOut("slow", function() {
$(this).closest('.opcion_lst').remove();
$(".orden_op").each(function(index){
$(this).text( index + 1 );});
});
};return false;
});
</script>
</div>
</div><!--col-md-12-->
<div class="col-md-12">
<div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="texto_esp">Descripción.</label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_1-->
<div class="tab-pane" id="tab_2" >
<div class="form-body">
<div class="row">
<div class="col-md-12" >
<div class="col-md-5" >
<div class="form-group form-md-line-input" id="pr_reserva_a">
<label class="col-md-5 control-label" for="pr_reserva">Precio reserva.</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_reserva" id="pr_reserva" maxlength="250" value="<%if pr_reserva<>0then%><%=pr_reserva%><%end if%>" ><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-5 control-label" for="pr_medico">Seguro médico.</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_medico" id="pr_medico"  maxlength="250" value="<%if pr_medico<>0then%><%=pr_medico%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="pr_medico_ob" id="pr_medico_ob" class="md-check" value="si" <%if cod_prog<>"" and pr_medico_ob="si"then%>checked="checked"<%end if%>><label for="pr_medico_ob"><span></span><span class="check"></span><span class="box"></span> Obl.</label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-5 control-label" for="pr_cancelacion">Seguro cancelación.</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_cancelacion" id="pr_cancelacion"  maxlength="250" value="<%if pr_cancelacion<>0then%><%=pr_cancelacion%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="pr_cancelacion_ob" id="pr_cancelacion_ob" class="md-check" value="si" <%if cod_prog<>"" and pr_cancelacion_ob="si"then%>checked="checked"<%end if%>><label for="pr_cancelacion_ob" <%if cod<>"" and pr_cancelacion_ob="si"then%>checked="checked"<%end if%>><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input" >
<label class="col-md-5 control-label" for="pr_gestion_bill">Precio gestión billete.</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_gestion_bill" id="pr_gestion_bill" maxlength="250" value="<%if pr_gestion_bill<>0then%><%=pr_gestion_bill%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input name="pr_gestion_bill_ob" type="checkbox" class="md-check" id="pr_gestion_bill_ob" value="si" <%if cod<>"" and pr_gestion_bill_ob="si"then%>checked="checked"<%end if%>><label for="pr_gestion_bill_ob"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
</div>
<div class="col-md-6" >
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="tasas_aerop">Tasas aeropuerto.</label>
<div class="col-md-3"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_aerop" id="tasas_aerop"  maxlength="250" value="<%if tasas_aerop<>0then%><%=tasas_aerop%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="tasas_aerop_ob" id="tasas_aerop_ob" class="md-check" value="si" <%if cod_prog<>"" and tasas_aerop_ob="si"then%>checked="checked"<%end if%>><label for="tasas_aerop_ob"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="tasas_aerop">Examen.</label>
<div class="col-md-3"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_examen" id="pr_examen"  maxlength="250" value="<%if pr_examen<>0then%><%=pr_examen%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="pr_examen_ob" id="pr_examen_ob" class="md-check" value="si" <%if cod<>"" and pr_examen_ob="si"then%>checked="checked"<%end if%>><label for="pr_examen_ob"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="con_examen">Concepto examen.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="con_examen" id="con_examen"  maxlength="250" value="<%=con_examen%>"><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">introduce un concepto.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="con_examen_act" id="con_examen_act" class="md-check" value="si" <%if cod<>"" and con_examen_act="si"then%>checked="checked"<%end if%> ><label for="con_examen_act"><span></span><span class="check"></span><span class="box"></span> Activado. </label></div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-12" style="text-align:center;border-top:1px solid #ddd;padding-top:20px">
<div style="width:90%;margin:0 auto;overflow:auto">
<div class="form-group form-md-line-input" style="width:90%;">
<div class="col-md-12"><button class="in_semana btn green pull-left"><i class="fa fa-plus" style="margin-right:7px"></i>Añadir Semana &nbsp;<i class="fa fa-calendar-check-o" aria-hidden="true"></i></button></div>
</div>
<table class="table table-striped table-bordered table-hover" style="text-align:left;min-width:550px;" >
<thead>
<tr>
<th width="10%" style="text-align:center;">Nº semanas.</th>
<th width="10%" style="text-align:center;">Duración&nbsp;(op).</th>
<th width="30%">Precio venta público.</th>
<th width="30%"><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%>Coste real del curso.<%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%></div><%end if%></th>
<th width="10%" style="text-align:center;">Eliminar.</th>
</tr>
</thead>
<%i_semanas=1
if cod<>"" then
Sql= "SELECT rel.id_itemSub, rel.id_itemSubSemana, itemsSubSemanas.id_itemSubSemana, duracion from rel, itemsSubSemanas where id_itemSub="&cod&" and rel.id_itemSubSemana=itemsSubSemanas.id_itemSubSemana and rel.id_itemSubSemana<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_sem=ob_rs.RecordCount 
end if
ob_rs.close
if tot_sem=""then tot_sem=1
do while i_semanas<=tot_sem
execute("semanas_b=semanas_"&i_semanas)
execute("precio_b=precio_"&i_semanas)
execute("precio_coste_b=precio_coste_"&i_semanas)
execute("duracion_b=duracion_"&i_semanas)%>
<tbody class="cursos_sem_in">
<tr class="fila_sem">
<td style="text-align:center;"><select id="semanas_<%=i_semanas%>" name="semanas_[<%=i_semanas%>]" style="width:100%"><%for i=1 to 52%><option value="<%=i%>" <%if semanas_b=i then%>selected<%end if%>><%if i=12then%>Trimestre Esc.<%end if%><%if i=16then%>Cuatrimestre Esc.<%end if%><%if i=24 then%>Semestre Esc.<%end if%><%if i=52 then%>Año Esc.<%end if%><%if i<>24 and i<>12 and i<>16 and i<>52then%><%=i%><%end if%></option><%next%><option value="53" <%if semanas_b=53 then%>selected<%end if%>>Sem.&nbsp;extra</option></select></td>

<td> 
<input type="text" class="form-control" placeholder="" name="duracion_[<%=i_semanas%>]" id="duracion_<%=i_semanas%>" value="<%=duracion_b%>" style="width:100%;max-width:150px;float:left;margin-right:15px">
</td>

<td><input type="text" class="form-control" placeholder="" name="precio_[<%=i_semanas%>]" id="precio_<%=i_semanas%>" value="<%=precio_b%>" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="precio_<%=i_semanas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i>&nbsp;precio</label></td>
<td><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%><input type="text" class="form-control" placeholder="" name="precio_coste_[<%=i_semanas%>]" id="precio_coste_<%=i_semanas%>" value="<%=precio_coste_b%>" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="precio_coste_<%=i_semanas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%></div><%end if%></td>
<td style="padding-top:15px;text-align:center;"><%if cod<>""and precio_b<>""then%><div class="md-checkbox"><input type="checkbox" name="sem_del_[<%=i_semanas%>]" id="sem_del_<%=i_semanas%>" class="md-check" value="si"><label for="sem_del_<%=i_semanas%>"><span></span><span class="check"></span><span class="box"></span></label></div><%end if%></td>
</tr>
</tbody>
<script>$("[name='sem_del_[<%=i_semanas%>]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script>
<%i_semanas=i_semanas+1
loop
else
do while i_semanas<=1%>
<tbody class="cursos_sem_in">
<tr class="fila_sem">
<td style="text-align:center;"><select id="semanas_<%=i_semanas%>" name="semanas_[<%=i_semanas%>]" style="width:100%"><%for i=1 to 52%><option value="<%=i%>" ><%=i%></option><%next%><option value="53" <%if semanas_b=53 then%>selected<%end if%>>Sem.&nbsp;extra</option></select></td>
<td><input type="text" class="form-control" placeholder="" name="precio_[<%=i_semanas%>]" id="precio_<%=i_semanas%>" value="<%=precio_1%>" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="precio_<%=i_semanas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i>precio</label></td>
<td><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%><input type="text" class="form-control" placeholder="" name="precio_coste_[<%=i_semanas%>]" id="precio_coste_<%=i_semanas%>" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="precio_coste_<%=i_semanas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i></label><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%></div><%end if%></td>
<td style="padding-top:15px;text-align:center;"></td>
</tr>
</tbody>
<%i_semanas=i_semanas+1
loop
end if%>
</table>
</div>
</div>
<script>
$("[name='sem_del_[1]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
$('.in_semana').one('click',function(){
$('select').select2({minimumResultsForSearch: -1,language: "es"});}).click(function(){
var n = $('.fila_sem').length + 1;
if( 16 < n ) {$('#alerta_sem').modal();return false;}
x=n;
var box_htmlA = $('<tr class="fila_sem">\
<td style="text-align:center;"><select id="semanas_'+x+'" name="semanas_['+x+']" style="width:100%"><%for i=1 to 52%><option value="<%=i%>"><%if i=12then%>Trimestre Esc.<%end if%><%if i=24 then%>Semestre Esc.<%end if%><%if i=52 then%>Año Esc.<%end if%><%if i<>24 and i<>12 and i<>52then%><%=i%><%end if%></option><%next%><option value="53">Sem.&nbsp;extra</option></select></td><td><input type="text" class="form-control" placeholder="" name="duracion_['+x+']" id="duracion_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"></td><td><input type="text" class="form-control" placeholder="" name="precio_['+x+']" id="precio_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="precio_'+x+'" style="margin-top:7px" ><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%><input type="text" class="form-control" placeholder="" name="precio_coste_['+x+']" id="precio_coste_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="precio_coste_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%></div><%end if%></td>\
<td style="text-align:center;"><button class="sem_del btn red" ><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>');
box_htmlA.hide();
$('.cursos_sem_in tr.fila_sem:last').after(box_htmlA);
box_htmlA.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
return false;});
$('.cursos_sem_in').on('click', '.sem_del', function(){
if( $('.fila_sem').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {$(this).closest('tr').remove();;});
};return false;
});
</script>
<div class="modal fade" id="alerta_sem" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No se pueden añadir más semanas</h4></div><div class="modal-body"> No se pueden añadir más semanas. Si necesitas más, contacta con el administrador del sistema. </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div class="col-md-12 cursos_temp" style="text-align:center;">
<div style="margin:0 auto;width:90%;overflow:auto">
<div class="form-group form-md-line-input" style="width:90%;">
<div class="col-md-12"><button class="in_temp btn green pull-left"><i class="fa fa-plus" style="margin-right:7px"></i>Añadir suplemento por temporada <i class="fa fa-calendar-plus-o" aria-hidden="true" style="margin-left:4px"></i></button></div></div>
<table class="table table-striped table-bordered table-hover" style="text-align:left;min-width:750px;">
<thead>
<tr>
<th width="15%">Fecha inicio.</th>
<th width="15%">Fecha final.</th>
<th width="30%">Suplemento (semana).</th>
<th width="30%"><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%>Suplemento real (semana).<%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%></div><%end if%></th>
<th width="10%" style="text-align:center;">Eliminar.</th>
</tr>
</thead>
<%i_temporadas=1
if cod<>"" then
precio_b=""
precio_coste_b=""
Sql= "SELECT rel.id_itemSub, rel.id_suplemento, preciosSuplementos.id_suplemento,rel.id_alojamiento from rel, preciosSuplementos where rel.id_itemSub="&cod&" and rel.id_suplemento=preciosSuplementos.id_suplemento and rel.id_suplemento<>0 and rel.id_alojamiento=0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_tem=ob_rs.RecordCount 
end if
ob_rs.close
if tot_tem=""then tot_tem=1
do while i_temporadas<=tot_tem
execute("fecha_inicio_b=fecha_inicio_"&i_temporadas)
execute("fecha_fin_b=fecha_fin_"&i_temporadas)
execute("precio_b=precio_tem_"&i_temporadas)
execute("precio_coste_b=precio_coste_tem_"&i_temporadas)%>
<tbody class="cursos_temp_in">
<tr class="fila_temp">
<td>
<div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="tem_f_inicio_<%=i_temporadas%>" name="tem_f_inicio_[<%=i_temporadas%>]" placeholder="desde" value="<%=fecha_inicio_b%>"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="tem_f_fin_<%=i_temporadas%>" name="tem_f_fin_[<%=i_temporadas%>]" placeholder="hasta" value="<%=fecha_fin_b%>"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_[<%=i_temporadas%>]" id="suplemento_<%=i_temporadas%>" value="<%=precio_b%>" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_<%=i_temporadas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%><input type="text" class="form-control" placeholder="" name="suplemento_r_[<%=i_temporadas%>]" id="suplemento_r_<%=i_temporadas%>" value="<%=precio_coste_b%>" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_<%=i_temporadas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label><%if pr_precio_real_ad<>"si"then%></div><%end if%></td>
<td style="padding-top:15px;text-align:center;"><%if cod<>""and fecha_inicio_b<>""then%><div class="md-checkbox"><input type="checkbox" name="tem_del_[<%=i_temporadas%>]" id="tem_del_<%=i_temporadas%>" class="md-check" value="si"><label for="tem_del_<%=i_temporadas%>"><span></span><span class="check"></span><span class="box"></span></label></div><%end if%></td>
</tr>
</tbody>
<script>$("[name='tem_del_[<%=i_temporadas%>]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script>
<%i_temporadas=i_temporadas+1
loop
else
do while i_temporadas<=1%>
<tbody class="cursos_temp_in">
<tr class="fila_temp">
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="tem_f_inicio_<%=i_temporadas%>" name="tem_f_inicio_[<%=i_temporadas%>]" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="tem_f_fin_<%=i_temporadas%>" name="tem_f_fin_[<%=i_temporadas%>]" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td><input type="text" class="form-control" placeholder="" name="suplemento_[<%=i_temporadas%>]" id="suplemento_1" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_<%=i_temporadas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>
<td><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%><input type="text" class="form-control" placeholder="" name="suplemento_r_[<%=i_temporadas%>]" id="suplemento_r_<%=i_temporadas%>" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_<%=i_temporadas%>" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%></div>><%end if%></td>
<td style="padding-top:15px;text-align:center;"></td>
</tr>
</tbody>
<%i_temporadas=i_temporadas+1
loop
end if%>
</table>
</div>
</div>
<script>
$("[name='tem_del_[1]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
$('.in_temp').one('click',function(){
$('select').select2({minimumResultsForSearch: -1,language: "es"});}).click(function(){
var n = $('.fila_temp').length + 1;
if( 16 < n ) {$('#alerta_tem').modal();return false;}
x=n;
var box_htmlB = $('<tr class="fila_temp">\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="tem_f_inicio_'+x+'" name="tem_f_inicio_['+x+']" placeholder="desde"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="tem_f_fin_'+x+'" name="tem_f_fin_['+x+']" placeholder="hasta"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>\
<td><input type="text" class="form-control" placeholder="" name="suplemento_['+x+']" id="suplemento_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_'+x+'" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label></td>\
<td><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%><div style="visibility:hidden"><%end if%><input type="text" class="form-control" placeholder="" name="suplemento_r_['+x+']" id="suplemento_r_'+x+'" value="" style="width:100%;max-width:150px;float:left;margin-right:15px"><label for="suplemento_r_1" style="margin-top:7px"><i class="fa fa-eur" aria-hidden="true"></i> precio</label><%if pr_precio_real_ad="" or ISNULL (pr_precio_real_ad)then%></div><%end if%></td>\
<td style="text-align:center;"><button class="tem_del btn red" ><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>');
box_htmlB.hide();
$('.cursos_temp_in tr.fila_temp:last').after(box_htmlB);
box_htmlB.fadeIn('slow');
$('.date-picker').datepicker({language: 'es',autoclose: 'true'});
return false;});
$('.cursos_temp_in').on('click', '.tem_del', function(){
if( $('.fila_temp').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {$(this).closest('tr').remove();	;});
};return false;
});
</script>
<div class="modal fade" id="alerta_tem" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No se pueden añadir más suplementos</h4></div><div class="modal-body"> No se pueden añadir más suplementos. Si necesitas más, contacta con el administrador del sistema. </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
</div></div>
</div><!--tab_2-->
<%if gestion_aeropuertos="si" or campamento="si" then%>
<div class="tab-pane" id="tab_3" >
<div class="form-body">
<div class="row">
<div class="col-md-12 cursos_aerop" style="text-align:center">
<div style="width:90%;overflow:auto;margin:0 auto">
<div class="form-group form-md-line-input"  style="width:90%;">
<div class="col-md-12"><button class="in_aerop btn green pull-left"><i class="fa fa-plus" ></i>&nbsp;Añadir <%if campamento="si"then%> Grupo &nbsp;<i class="fa fa-users" aria-hidden="true"></i>
<%else%> Aeropuerto &nbsp;<i class="fa fa-plane" aria-hidden="true"></i><%end if%></button></div></div>
<table class="table table-striped table-bordered table-hover" style="min-width:750px;text-align:left">
<thead>
<tr>
<%if campamento<>"si"then%><th width="15%">Aeropuerto.</th><%end if%>
<th width="5%">Plazas.</th>
<th width="5%">Mes (es).</th>
<%if quincena="si"then%><th width="15%">Quincena (s).</th><%end if%>
<th width="8%" style="text-align:center;">F. salida.</th>
<th width="8%" style="text-align:center;">F. fin.</th>
<th width="5%" style="text-align:center;">Orden.</th>
<th width="5%" style="text-align:center;">Completo.</th>
<th width="5%" style="text-align:center;">Eliminar.</th>
</tr>
</thead>
<%i_aeros=1
if cod<>"" then
if campamento="si"then
Sql= "SELECT rel.id_itemsubAero, rel.id_itemSub, itemsSubAero.id_aeropuerto, itemsSubAero.id_itemsubAero from rel,itemsSubAero where rel.id_itemSub="&cod&" and rel.id_itemsubAero= itemsSubAero.id_itemsubAero and rel.grupo='si'"
else
Sql= "SELECT rel.id_itemsubAero, rel.id_itemSub, itemsSubAero.id_aeropuerto, itemsSubAero.id_itemsubAero from rel,itemsSubAero where rel.id_itemSub="&cod&" and rel.id_itemsubAero= itemsSubAero.id_itemsubAero and rel.id_itemsubAero<>0 and (grupo IS NULL or grupo='')"
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_aer=ob_rs.RecordCount
end if
ob_rs.close
if tot_aer=""then tot_aer=1
do while i_aeros<=tot_aer
execute("id_aeropuerto_b=id_aeropuerto_"&i_aeros)
execute("plazas_b=plazas_"&i_aeros)
execute("mes_b=mes_"&i_aeros)
execute("quincena_b=quincena_"&i_aeros)
execute("orden_aer_b=orden_aer_"&i_aeros)
execute("completo_b=completo_"&i_aeros)
execute("f_salida_aer_b=f_salida_aer_"&i_aeros)
execute("f_fin_aer_b=f_fin_aer_"&i_aeros)%>
<tbody class="cursos_aerop_in">
<tr class="fila_aerop">
<%if campamento<>"si"then%><td>
<select id="id_aeropuerto_<%=i_aeros%>" name="id_aeropuerto_[<%=i_aeros%>]" style="width:100%">
<option value="" >&nbsp;</option>
<%Sql= "SELECT id_aeropuerto, ciudad, pais, nacional from aeropuertos"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_aeropuerto=ob_rs("id_aeropuerto")%>
<option value="<%=id_aeropuerto%>" <%if id_aeropuerto=id_aeropuerto_b then%>selected<%end if%>><%=ob_rs("ciudad")%> <%if ob_rs("nacional")<>"si" then%>&nbsp;·&nbsp;<%=ob_rs("pais")%><%end if%></option>
<%ob_rs.movenext
aero=""
loop
end if
ob_rs.close%>
</select></td><%end if%>
<td><input type="text" class="form-control" placeholder="" name="plazas_[<%=i_aeros%>]" id="plazas_<%=i_aeros%>" value="<%=plazas_b%>"></td>
<td><select id="mes_<%=i_aeros%>" name="mes_[<%=i_aeros%>]" style="width:100%" >
<option value="" >&nbsp;</option>
<option value="Enero" <%if instr(mes_b,"Enero") then%>selected<%end if%>>Enero</option>
<option value="Febrero" <%if instr(mes_b,"Febrero") then%>selected<%end if%>>Febrero</option>
<option value="Marzo" <%if instr(mes_b,"Marzo") then%>selected<%end if%>>Marzo</option>
<option value="Abril" <%if instr(mes_b,"Abril") then%>selected<%end if%>>Abril</option>
<option value="Mayo" <%if instr(mes_b,"Mayo") then%>selected<%end if%>>Mayo</option>
<option value="Junio" <%if instr(mes_b,"Junio") then%>selected<%end if%>>Junio</option>
<option value="Julio" <%if instr(mes_b,"Julio") then%>selected<%end if%>>Julio</option>
<option value="Agosto" <%if instr(mes_b,"Agosto") then%>selected<%end if%>>Agosto</option>
<option value="Septiembre" <%if instr(mes_b,"Septiembre") then%>selected<%end if%>>Septiembre</option>
<option value="Octubre" <%if instr(mes_b,"Octubre") then%>selected<%end if%>>Octubre</option>
<option value="Noviembre" <%if instr(mes_b,"Noviembre") then%>selected<%end if%>>Noviembre</option>
<option value="Diciembre" <%if instr(mes_b,"Diciembre") then%>selected<%end if%>>Diciembre</option>
</select></td>
<%if quincena="si"then%><td><select id="id_quincena_<%=i_aeros%>" name="id_quincena_[<%=i_aeros%>]" style="width:100%">
<option value="" >&nbsp;</option>
<%Sql= "SELECT id_quincena, titulo_esp from quincenas"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
id_quincena=ob_rs("id_quincena")%>
<option value="<%=id_quincena%>" <%if quincena_b=id_quincena then%>selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
quince=""
loop
end if
ob_rs.close%>
</select></td>
<%end if%>

<td style="text-align:center;"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_salida_aer" name="f_salida_aer_[<%=i_aeros%>]" placeholder="salida" <%if cod<>"" and f_salida_aer_b<>"01/01/1000"then%>value="<%=f_salida_aer_b%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td style="text-align:center;"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_aer" name="f_fin_aer_[<%=i_aeros%>]" placeholder="regreso" <%if cod<>"" and f_fin_aer_b<>"01/01/1000"then%>value="<%=f_fin_aer_b%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td style="text-align:center;"><input type="text" class="form-control orden_aer" placeholder="" name="orden_aer_[<%=i_aeros%>]" id="orden_aer_<%=i_aeros%>" value="<%if orden_aer_b<>""then%><%=orden_aer_b%><%else%>1<%end if%>" style="width:50px;margin:0 auto"></td>
<td style="text-align:center;"><div class="campos_obliga form-md-checkboxes" ><div class="md-checkbox" style="width:25px;margin:0 auto;"><input name="compl_[<%=i_aeros%>]" type="checkbox" class="md-check" id="compl_<%=i_aeros%>" value="si" <%if completo_b="si" then%>checked="checked"<%end if%>><label for="compl_<%=i_aeros%>"><span></span><span class="check"></span><span class="box"></span> &nbsp; </label></div></div></td>
<td style="padding-top:15px;text-align:center;"><%if cod<>"" and plazas_b<>"" then%><div class="md-checkbox"><input type="checkbox" name="aer_del_[<%=i_aeros%>]" id="aer_del_<%=i_aeros%>" class="md-check" value="si"><label for="aer_del_<%=i_aeros%>"><span></span><span class="check"></span><span class="box"></span></label></div><%end if%></td>
</tr>
</tbody>
<script>$("[name='aer_del_[<%=i_aeros%>]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script>
<%i_aeros=i_aeros+1
loop
else
do while i_aeros<=1%>
<tbody class="cursos_aerop_in">
<tr class="fila_aerop">
<%if campamento<>"si"then%><td><select id="id_aeropuerto_<%=i_aeros%>" name="id_aeropuerto_[<%=i_aeros%>]" style="width:100%">
<%if cod<>"" then
Sql= "SELECT rel.id_aeropuerto, rel.id_itemSub, itemsSub.id_itemSub, aeropuertos.id_aeropuerto from rel, itemsSub, aeropuertos where rel.id_itemSub="&cod&" and itemsSub.id_itemSub=rel.id_itemSub and rel.id_aeropuerto=aeropuertos.id_aeropuerto"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_op=ob_rs.RecordCount 
end if
ob_rs.close
else
Sql= "SELECT id_aeropuerto, ciudad, pais, nacional from aeropuertos "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_aeropuerto")%>" ><%=ob_rs("ciudad")%> <%if ob_rs("nacional")<>"si" then%>&nbsp;·&nbsp;<%=ob_rs("pais")%><%end if%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close
end if%></select></td><%end if%>
<td><input type="text" class="form-control" placeholder="" name="plazas_[<%=i_aeros%>]" id="plazas_<%=i_aeros%>" value=""></td>
<td><select id="mes_<%=i_aeros%>" name="mes_[<%=i_aeros%>]" style="width:100%" >
<option value="" >&nbsp;</option>
<option value="Enero" >Enero</option>
<option value="Febrero" >Febrero</option>
<option value="Marzo" >Marzo</option>
<option value="Abril" >Abril</option>
<option value="Mayo" >Mayo</option>
<option value="Junio" >Junio</option>
<option value="Julio" >Julio</option>
<option value="Agosto" >Agosto</option>
<option value="Septiembre" >Septiembre</option>
<option value="Octubre" >Octubre</option>
<option value="Noviembre" >Noviembre</option>
<option value="Diciembre" >Diciembre</option>
</select></td>
<%if quincena="si"then%><td><select id="id_quincena_<%=i_aeros%>" name="id_quincena_[<%=i_aeros%>]" style="width:100%">
<%if cod<>"" then
Sql= "SELECT rel.id_quincena, rel.id_itemSub, itemsSub.id_itemSub, quincenas.id_quincena from rel, itemsSub, quincenas where rel.id_itemSub="&cod&" and itemsSub.id_itemSub=rel.id_itemSub and rel.id_quincena=quincenas.id_quincena"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_op=ob_rs.RecordCount 
end if
ob_rs.close
else
Sql= "SELECT id_quincena, titulo_esp from quincenas order by titulo_esp"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_quincena")%>" ><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close
end if%></select></td><%end if%>
<td style="text-align:center;"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_salida_aer" name="f_salida_aer_[<%=i_aeros%>]" placeholder="salida" <%if cod<>"" and f_salida_aer_b<>"01/01/1000"then%>value="<%=f_salida_aer_b%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td style="text-align:center;"><div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_aer" name="f_fin_aer_[<%=i_aeros%>]" placeholder="regreso" <%if cod<>"" and f_fin_aer_b<>"01/01/1000"then%>value="<%=f_fin_aer_b%>"<%end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td>
<td style="text-align:center;"><input type="text" class="form-control orden_aer" placeholder="" name="orden_aer_[<%=i_aeros%>]" id="orden_aer_<%=i_aeros%>" value="1" style="width:50px;margin:0 auto"></td>
<td style="text-align:center;"><div class="campos_obliga form-md-checkboxes" ><div class="md-checkbox" style="width:25px;margin:0 auto;"><input name="compl_[<%=i_aeros%>]" type="checkbox" class="md-check" id="compl_<%=i_aeros%>" value="si" ><label for="compl_<%=i_aeros%>"><span></span><span class="check"></span><span class="box"></span> &nbsp; </label></div></div></td>
<td style="padding-top:15px;text-align:center;"></td>
</tr>
</tbody>
<%i_aeros=i_aeros+1
loop
end if%>
</table>
</div>
</div>
<script>
$("[name='aer_del_[1]']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
$('.in_aerop').one('click',function(){
$('select').select2({minimumResultsForSearch: -1,language: "es"});}).click(function(){
var n = $('.fila_aerop').length + 1;
if( 16 < n ) {$('#alerta_aerop').modal();return false;}
x=n;
var box_htmle = $('<tr class="fila_aerop">\
<%if campamento<>"si"then%><td><select id="id_aeropuerto_1" name="id_aeropuerto_['+x+']" style="width:100%">\
<%Sql= "SELECT id_aeropuerto, ciudad, pais, nacional from aeropuertos "%>\
<%Set Ob_RS = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs.eof then%><option value="" >&nbsp;</option>\
<%do while not ob_rs.eof%>\
<option value="<%=ob_rs("id_aeropuerto")%>" ><%=ob_rs("ciudad")%> <%if ob_rs("nacional")<>"si" then%>&nbsp;·&nbsp;<%=ob_rs("pais")%><%end if%></option>\
<%ob_rs.movenext%>\
<%loop%>\
<%end if%>\
<%ob_rs.close%></select></td><%end if%>\
<td><input type="text" class="form-control" placeholder="" name="plazas_['+x+']" id="plazas_'+x+'" value=""></td>\
<td><select id="mes_'+x+'" name="mes_['+x+']" style="width:100%">\
<option value="" >&nbsp;</option>\
<option value="Enero" >Enero</option>\
<option value="Febrero" >Febrero</option>\
<option value="Marzo" >Marzo</option>\
<option value="Abril" >Abril</option>\
<option value="Mayo" >Mayo</option>\
<option value="Junio" >Junio</option>\
<option value="Julio" >Julio</option>\
<option value="Agosto" >Agosto</option>\
<option value="Septiembre" >Septiembre</option>\
<option value="Octubre" >Octubre</option>\
<option value="Noviembre" >Noviembre</option>\
<option value="Diciembre" >Diciembre</option>\
</select></td>\
<%if quincena="si"then%><td><select id="id_quincena_'+x+'" name="id_quincena_['+x+']" style="width:100%">\
<%Sql= "SELECT id_quincena, titulo_esp from quincenas order by titulo_esp"%>\
<%Set Ob_RS = Server.CreateObject("ADODB.Recordset")%>\
<%Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText%>\
<%if not ob_rs.eof then%><option value="" >&nbsp;</option>\
<%do while not ob_rs.eof%>\
<option value="<%=ob_rs("id_quincena")%>" ><%=ob_rs("titulo_esp")%></option>\
<%ob_rs.movenext%>\
<%loop%>\
<%end if%>\
<%ob_rs.close%></select></td><%end if%>\
<td style="text-align:center;"><div class="input-group date date-picker2" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_salida_aer['+x+']" name="f_salida_aer_['+x+']" placeholder="salida"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td><td style="text-align:center;"><div class="input-group date date-picker2" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_fin_aer" name="f_fin_aer_['+x+']" placeholder="regreso"><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div></td><td style="text-align:center;"><input type="text" class="form-control orden_aer" placeholder="" name="orden_aer_['+x+']" id="orden_aer_['+x+']" value="'+x+'" style="width:50px;margin:0 auto"></td>\
<td style="text-align:center;"><div class="campos_obliga form-md-checkboxes" ><div class="md-checkbox" style="width:25px;margin:0 auto;"><input name="compl_['+x+']" type="checkbox" class="md-check" id="compl_'+x+'" value="si" ><label for="compl_'+x+'"><span></span><span class="check"></span><span class="box"></span> &nbsp; </label></div></div></td>\
<td style="text-align:center;"><button class="del_aer btn red" ><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td>\
</tr>');
box_htmle.hide();
$('.cursos_aerop tr.fila_aerop:last').after(box_htmle);
box_htmle.fadeIn('slow');
$('.date-picker2').datepicker({language: 'es',autoclose: 'true'});
$('select').select2({minimumResultsForSearch: -1,language: "es"});
return false;});
$('.cursos_aerop_in').on('click', '.del_aer', function(){
if( $('.fila_aerop').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {
$(this).closest('tr').remove();
$(".orden_aer").each(function(index){$(this).val( index + 1);})
;});
};return false;
});
</script>
<div class="modal fade" id="alerta_aerop" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No se pueden añadir más aeropuertos</h4></div><div class="modal-body"> No se pueden añadir más aeropuertos. Si necesitas más, contacta con el administrador del sistema. </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
</div><!--row-->
</div><!--form-body-->
</div><%end if%><!--tab_3-->
<div class="tab-pane" id="tab_5">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="url_esp_cc">
<label class="col-md-2 control-label" for="url_esp_cc">URL amigable.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="url_esp" id="url_esp_cc" onkeyup="resetea_error('url_esp_cc');urlea_c_esp_inf();" maxlength="250" value="<%=url_esp%>"><div class="form-control-focus"></div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">URL "amigable" (para espacios pulsa "espacio" sin soltar).</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meta_title" >[meta] Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="meta_title" id="meta_title" maxlength="65" value="<%=meta_title%>"><div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un título descriptivo de unos 65 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meta_desc">[meta] Descripción.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_desc" id="meta_desc" rows="2" maxlength="160"> <%=meta_desc%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">debes introducir una descripción concisa de unos 160 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="f_texto_legal">[meta] Keywords.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_key" id="meta_key" rows="2"><%=meta_key%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">palabras clave separadas por comas</span></div></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_5-->
</div><!--tab-content-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-10">
<%if edi="" then%><button type="button" class="btn green" onclick="Enviar_cursos(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button><%end if%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat))%>
<%if edi="" then%><a href="<%=r%>itemsSub/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%else%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat&"&edi=rap"))%>
<a href="<%=r%>itemsSub/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_prog="&cod_prog&"&cod_cat="&cod_cat&"&edi=rap")%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
<%end if%></div></div></div>
</div></form></div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="/gestor/ckfinder/libs/sf.js"></script>
<script src="/gestor/ckfinder/libs/tree-a.js"></script>
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<script src="/gestor/ckfinder/ckfinder.js"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/url_amigable.js"></script>
<link href="<%=r%>lib/app/jquery-notific8/jquery.notific8.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/app/jquery-notific8/jquery.notific8.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
<script>
$( ".acord_txt" ).hide();
$( "#sal_quincenas_dias" ).hide();
<%if (salidas="salida_dias" and cod<>"") or (salidas="salida_dias" and cod_prog<>"") then%>$( ".sal_dias" ).show();<%end if%>
<%if salidas="salida_meses" and cod<>""then%>$( ".sal_meses" ).show();<%end if%>
<%if salidas="salida_fecha" and cod<>""then%>$( ".sal_fecha" ).show();<%end if%>
<%if salidas="salida_quincenas" and cod<>""then%>$( ".sal_quincenas" ).show();$( "#sal_quincenas_dias" ).show();<%end if%>
$(".acord_link_lab").click(function() {	var panel = $(this).parent().next('div');$(".acord_txt" ).not(panel).slideUp();panel.slideToggle({direction: "up"}, 100);sal_quincena_dias();});
function sal_quincena_dias(){
if ($('#sal_quincenas_dias').is(':visible')) { 
if (document.getElementById("radio5").checked!=true){$( "#sal_quincenas_dias" ).slideToggle( "slow" );} 
}else{if (document.getElementById("radio5").checked==true){$( "#sal_quincenas_dias" ).slideToggle( "slow" );} }
}
$('.date-picker').datepicker({language: 'es', autoclose:'true'});
CKFinder.setupCKEditor( CKEDITOR.replace('texto_esp',{toolbar : 'Basica'}));
$(document).ready(function() {
<%if edi="rap"then%>parent.sav_gest_cursos_on();//BOTON GUARDAR DESDE MODALalert();<%end if%>
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='visible'],[name='destacado'],[name='disponible'],[name='privado'],[name='pre_medida'],[name='oferta'],[name='completo'],[name='pr_actualizado'],[name='alo_fam'],[name='alo_res'],[name='alo_apa'],[name='wifi'],[name='tel_24'],[name='vuelo'],[name='c_inten'],[name='ini_lunes'],[name='c_semi'],[name='c_gene'],[name='monitor'],[name='campamento'],[name='quincena'],[name='visible'],[name='disponible'],[name='h_lecciones']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
function urlea_c_esp(){document.envio.url_esp_cc.value = document.envio.titulo_esp_cc.value.slugify();}
function urlea_c_esp_inf(){document.envio.url_esp_cc.value=document.envio.url_esp_cc.value.slugify();}
var limita=function(){
var a=function(){
$("#titulo_esp_c").maxlength({limitReachedClass:"label label-danger"}),
$("#url_esp_c").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_title").maxlength({limitReachedClass:"label label-danger"}),
$("#datos_complementarios").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_desc").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
function recargar() {location.reload();}
</script>
<%ob_conn.close%>