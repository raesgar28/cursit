<!--#include file="../comun/menu_sup.asp"--> 
<%ver=request("ver")
if ver ="" then ver = request_equerystring("ver")%>
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

if cod<>""then
Sql= "SELECT id_item, id_archivo from rel where id_item="&cod&" and id_archivo<>0" '[IMAGENES VIDEOS TOTALES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_img_tot=ob_rs.RecordCount 
end if
ob_rs.close
Sql= "SELECT rel.id_item, rel.id_archivo, archivos.id_archivo, archivos.campo from rel, archivos where rel.id_item="&cod&" and rel.id_archivo=archivos.id_archivo and (campo <> 'archivo_1' and campo <> 'archivo_2' and campo <> 'archivo_17' and campo <> 'archivo_18' and campo <> 'archivo_19' and campo <> 'archivo_20')" '[IMAGENES VIDEOS TOTALES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_img_tot_img=ob_rs.RecordCount 
end if
ob_rs.close
Sql= "SELECT * from items where id_item="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
titulo_of_esp=ob_rs("titulo_of_esp")
texto_esp=ob_rs("texto_esp")
url_esp=ob_rs("url_esp")
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
visible=ob_rs("visible")
disponible=ob_rs("disponible")
destacado=ob_rs("destacado")
fecha_in=ob_rs("fecha_in")
pr_actualizado=ob_rs("pr_actualizado")
titulo_esp=ob_rs("titulo_esp")
titulo_of_esp=ob_rs("titulo_of_esp")
resumen_esp=ob_rs("resumen_esp")
visible=ob_rs("visible")
disponible=ob_rs("disponible")
destacado=ob_rs("destacado")
privado=ob_rs("privado")
pr_actualizado=ob_rs("pr_actualizado")
anyo_actualizado=ob_rs("anyo_actualizado")
completo=ob_rs("completo")
oferta=ob_rs("oferta")
pr_reserva=ob_rs("pr_reserva")
if pr_reserva <> 0 then pr_reserva =FormatNumber(ccur(pr_reserva),2) 
pr_reserva_ob=ob_rs("pr_reserva_ob")
pr_medico=ob_rs("pr_medico")
if pr_medico <> 0 then pr_medico =FormatNumber(ccur(pr_medico),2) 
pr_medico_ob=ob_rs("pr_medico_ob")
pr_cancelacion=ob_rs("pr_cancelacion")
if pr_cancelacion <> 0 then pr_cancelacion =FormatNumber(ccur(pr_cancelacion),2) 
pr_cancelacion_ob=ob_rs("pr_cancelacion_ob")
tasas_aerop=ob_rs("tasas_aerop")
if tasas_aerop <> 0 then tasas_aerop =FormatNumber(ccur(tasas_aerop),2) 
tasas_aerop_ob=ob_rs("tasas_aerop_ob")
ed_desde=ob_rs("ed_desde")
ed_hasta=ob_rs("ed_hasta")
escuela_tam=ob_rs("escuela_tam")
moneda=ob_rs("moneda")
alo_fam=ob_rs("alo_fam")
alo_res=ob_rs("alo_res")
alo_apa=ob_rs("alo_apa")
wifi=ob_rs("wifi")
tel_24=ob_rs("tel_24")
vuelo=ob_rs("vuelo")
c_inten=ob_rs("c_inten")
c_semi=ob_rs("c_semi")
c_gene=ob_rs("c_gene")
monitor=ob_rs("monitor")
texto_esp=ob_rs("texto_esp")
tab_1_titulo_esp=ob_rs("tab_1_titulo_esp")
tab_1_act=ob_rs("tab_1_act")
tab_1_texto_esp=ob_rs("tab_1_texto_esp")
tab_2_titulo_esp=ob_rs("tab_2_titulo_esp")
tab_2_act=ob_rs("tab_2_act")
tab_2_texto_esp=ob_rs("tab_2_texto_esp")
tab_3_titulo_esp=ob_rs("tab_3_titulo_esp")
tab_3_act=ob_rs("tab_3_act")
tab_3_texto_esp=ob_rs("tab_3_texto_esp")
tab_4_titulo_esp=ob_rs("tab_4_titulo_esp")
tab_4_act=ob_rs("tab_4_act")
tab_4_texto_esp=ob_rs("tab_4_texto_esp")
tab_5_titulo_esp=ob_rs("tab_5_titulo_esp")
tab_5_act=ob_rs("tab_5_act")
tab_5_texto_esp=ob_rs("tab_5_texto_esp")
tab_6_titulo_esp=ob_rs("tab_6_titulo_esp")
tab_6_act=ob_rs("tab_6_act")
tab_6_texto_esp=ob_rs("tab_6_texto_esp")
url_esp=ob_rs("url_esp")
meta_title=ob_rs("meta_title")
meta_desc=ob_rs("meta_desc")
meta_key=ob_rs("meta_key")
quincena=ob_rs("quincena")
campamento=ob_rs("campamento")
gestion_aeropuertos=ob_rs("gestion_aeropuertos")
gestion_alojamientos=ob_rs("gestion_alojamientos")
f_prog_dia=ob_rs("f_prog_dia")
f_prog_salida=ob_rs("f_prog_salida")
f_prog_regreso=ob_rs("f_prog_regreso")
orden_prog=ob_rs("orden")
inc_cat=ob_rs("inc_cat")
inc_sec=ob_rs("inc_sec")
inc_sub=ob_rs("inc_sub")
inc_des=ob_rs("inc_des")
en_menu=ob_rs("en_menu")
ejecutivos=ob_rs("ejecutivos")
alo_hot=ob_rs("alo_hot")
datos_familia_ob=ob_rs("datos_familia_ob")
seg_medico=ob_rs("seg_medico")
material=ob_rs("material")
uniforme=ob_rs("uniforme")
show_cat=ob_rs("show_cat")
codPrivado=ob_rs("codPrivado")
act_inc=ob_rs("act_inc")
alo_hos=ob_rs("alo_hos")
sup_dest=ob_rs("sup_dest")
format_sem=ob_rs("format_sem")
pre_medida=ob_rs("pre_medida")
gen_mail=ob_rs("gen_mail")
edad_bot=ob_rs("edad_bot")
tipoCambio=ob_rs("tipoCambio")
'if tipoCambio_it="" then tipoCambio=tipoCambio else tipoCambio=tipoCambio_it end if
normas=ob_rs("normas")
normas_ob=ob_rs("normas_ob")
cerrado=ob_rs("cerrado")
end if
ob_rs.close
Sql= "SELECT id_item, id_archivo from rel where id_item="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
Dim archivo_(20),alt_(20),orden_img_(20)
do while not ob_rs.eof
id_archivo=ob_rs("id_archivo")
if id_archivo<>""then
Sql2= "SELECT id_archivo, nombre, alt, campo, orden from archivos where id_archivo="&id_archivo&" order by orden"
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("campo")="archivo_"&(i) then 
execute("archivo_"& i & "= ob_rs2(""nombre"")")
execute("alt_"& i & "= ob_rs2(""alt"")")
execute("orden_img_"& i & "= ob_rs2(""orden"")")
end if
next
end if
ob_rs2.close
end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close 'ob_conn.close
Sql= "SELECT multi from rel where id_item="&cod&" and multi='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
multi="si"
end if
ob_rs.close



Sql= "SELECT id_item, id_itemOp from rel where id_item="&cod&" and id_itemOp<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
Dim opcion_esp_(20),opcion_orden_(20)
do while not ob_rs.eof
id_itemOp=ob_rs("id_itemOp")
if id_itemOp<>""then
Sql2= "SELECT id_itemOp, opcion_esp, opcion_pre, opcion_ob, opcion_orden from itemsOp where id_itemOp="&id_itemOp&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
for i=0 to 20
if ob_rs2("opcion_orden")=i then 
execute("opcion_esp_"& i & "= ob_rs2(""opcion_esp"")")
execute("opcion_pre_"& i & "= ob_rs2(""opcion_pre"")")
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
ob_rs.close 'ob_conn.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<div class="breadcrumbs">
<h1>Gestión Programas | <%=tit_categoria%> | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&ver="&ver))%>
<a href="<%=r%>items/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&ver="&ver)%>">Listado Programas  <%=tit_categoria%></a></li>
<li class="active">Gestión Programas </li>
</ol>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar">
<span class="sr-only">Toggle navigation</span>
<span class="toggle-icon">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</span>
</button>
</div>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<%if cod<>""then%>
<h3>Opciones de Programa</h3>
<ul class="nav navbar-nav">
<li><a href="javascript:modal_cursos();"><i class="icon-note"></i> Gestionar Cursos <%if num_cc<>""then%><span class="baddge badge badge-default"> <%=num_cc%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<%if gestion_alojamientos="si"then%><li><a href="javascript:modal_aloja();"><i class="icon-note"></i> Alojamientos<%if num_ca<>""then%><span class="baddge badge badge-default"> <%=num_ca%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%><%end if%>
</a></li>
<li><a href="#"><i class="icon-doc"></i> Packs Programa</a></li>
</ul>
<h3>Otras Opciones</h3>
<%end if%>
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&ver="&ver))%><a href="<%=r%>items/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&ver="&ver)%>"><i class="icon-list"></i> Listado Programas<%if num_pp<>""then%><span class="baddge badge badge-default"> <%=num_pp%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Programa</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat="))%>
<a href="<%=r%>secciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=")%>"><i class="icon-note"></i> Secciones Programas 
<%if num_s<>""then%><span class="baddge badge badge-default"> <%=num_s%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat))%><a href="<%=r%>categorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat)%>"><i class="icon-note"></i> Gestión Categorías<%if num_c<>""then%><span class="baddge badge badge-default"> <%=num_c%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><a href="javascript:modal_programas();"><i class="icon-share-alt"></i> Listar Programas <%if num_it<>""then%><span class="baddge badge badge-default"> <%=num_it%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
</ul>
</nav>
</div><!--MIGAS-->
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Programa  <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab"> General </a></li>
<li><a href="#tab_2" data-toggle="tab"> Opciones / Precios</a></li>
<li><a href="#tab_3" data-toggle="tab"> Contenidos</a></li>
<li><a href="#tab_4" data-toggle="tab"> Galería  <%if num_img_tot<>""then%><span class="badge badge-success" style="margin-left:5px""> <%=num_img_tot%> </span><%end if%></a></li>
<li><a href="#tab_5" data-toggle="tab"> SEO</a></li>
<%if cod<>""then%>
<div class="actions btn-set pull-right" style="margin-left:15px">
<div class="btn-group">
<a class="btn green-haze btn-outline dropdown-toggle" style="padding-top:4px;padding-bottom:4px;margin-top:5px" href="javascript:;" data-toggle="dropdown">
<i class="fa fa-wrench" aria-hidden="true"></i> herramientas <i class="fa fa-angle-down"></i></a>
<div class="dropdown-menu pull-right">
<li><a href="javascript:modal_duplicar();"><i class="fa fa-files-o"></i> Duplicar programa</a></li>
<li><a href="javascript:modal_cambio_cat();"><i class="fa fa-exchange" aria-hidden="true"></i> Cambiar de categoría </a></li>
<li class="divider"></li>
<%if ver<>"eli"then%><li><a href="javascript:eliminarUna();"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a></li><%end if%>
<%if ver="eli"then%><li class="divider"></li>
<li><a href="javascript:recuperar();"><i class="fa fa-share-square-o" aria-hidden="true"></i> Recuperar programa</a></li>
<li><a href="javascript:eliminarDef();"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar Definitivamente <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
</a></li>
<%end if%>


</div>
</div>
</div>
<%end if%>
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
<%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<input name="ver" type="hidden" value="<%=ver%>">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> La URL amigable ya se encuentra registrada. Debes modificarla.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
<%if msd="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Programa duplicado con éxito! </div><%end if%>
<%if msc="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Categoría modificada con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-3 control-label" for="titulo_esp" >Nombre programa.<span class="required">*</span></label>
<div class="col-md-9">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');urlea_esp();" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
<div class="form-group form-md-line-input" id="titulo_of_esp_a">
<label class="col-md-3 control-label" for="titulo_esp_of" >Nombre oficial.<span class="required">*</span></label>
<div class="col-md-9">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_of_esp" id="titulo_of_esp" onKeyUp="resetea_error('titulo_of_esp_a');" maxlength="160" value="<%=titulo_of_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">nombre del programa en la escuela</span></div></div></div>
<%Sql= "SELECT secciones.id_seccion, rel.id_seccion, secciones.titulo_esp, rel.id_categoria, categorias.id_categoria from secciones, rel, categorias where rel.id_categoria = "&cod_cat&" and rel.id_categoria = categorias.id_categoria and rel.id_seccion=secciones.id_seccion and rel.id_categoria<> 0 group by rel.id_seccion, secciones.id_seccion, secciones.titulo_esp, rel.id_categoria, categorias.id_categoria order by secciones.titulo_esp "   '[ASOCIAMOS CON UNA SECCION]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sec="si"%>
<div class="form-group form-md-line-input" id="id_seccion_a">
<label class="col-md-3 control-label" for="id_web" >Sección.<span class="required">*</span></label>
<div class="col-md-9"><div class="input-icon">
<select name="id_seccion" id="id_seccion" multiple="multiple" class="select-100" onChange="resetea_error('id_seccion_a');">
<%do while not ob_rs.eof
id_seccion=ob_rs("secciones.id_seccion")
tit_seccion=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_item, id_seccion from rel where id_item = "&cod&" and id_seccion= "&id_seccion&" group by id_seccion, id_item"
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_seccion%>" <%if sel="si" then%>Selected<%end if%>><%=tit_seccion%>
<%Sql3_2= "SELECT id_categoria,id_seccion from rel where id_seccion = "&id_seccion&" group by id_categoria,id_seccion "   
Set ob_rs3_2 = Server.CreateObject("ADODB.Recordset")
ob_rs3_2.Open Sql3_2, ob_conn,adOpenStatic, adCmdText
if not ob_rs3_2.eof then%>
(
<%do while not ob_rs3_2.eof
id_categoria=ob_rs3_2("id_categoria")
if id_categoria<>"" and id_categoria<> 0 then
Sql4= "SELECT id_categoria, titulo_crm_esp from categorias where id_categoria = "&id_categoria&" "   
Set ob_rs4 = Server.CreateObject("ADODB.Recordset")
ob_rs4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
if tit_cat<>"" and b>1 then
tit_cat=tit_cat &" · " &ob_rs4("titulo_crm_esp")&"&nbsp;"
else
tit_cat= tit_cat &ob_rs4("titulo_crm_esp")&"&nbsp;"
end if
end if
ob_rs4.close
end if%>
<%ob_rs3_2.movenext
b=b+1
loop%>
<%=tit_cat%>)
<%end if
ob_rs3_2.close
ob_rs.movenext
sel=""
tit_cat=""
id_categoria=""
id_seccion=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona una sección</span></div>
</div>
</div>
<div class="md-checkbox col-md-offset-3" style="padding-left:5px"><input name="show_cat" type="checkbox" class="md-check" id="show_cat" value="si" <%if show_cat="si" and cod<>""then%>checked="checked"<%end if%><%if show_cat="" and cod=""then%>checked="checked"<%end if%>><label for="show_cat" style="color:#999"> Mostrar en todas las categoría asociadas <i class="fa fa-arrow-up" aria-hidden="true"></i></label></div>
<%else%>
<script>function notifica(){var UINotific8=function(){return{init:function(){jQuery(document).ready(function(i){var t={theme:'lime',sticky:'',horizontalEdge:'right',verticalEdge:'top'},n=$(this);""!=$.trim('No se puede crear ningún programa')&&(t.heading=$.trim('No se puede crear ningún programa')),t.sticky||(t.life='12000'),$.notific8("zindex",11500),$.notific8($.trim('Por favor, crea una Sección o subSección'),t),n.attr("disabled","disabled"),setTimeout(function(){n.removeAttr("disabled")},1e3)})}}}();UINotific8.init();}notifica();</script>
<div class="sin_regstros" style="width:100%;margin:0 auto;text-align:right"><a href="javascript:modal_secciones();" class="f_red"><i class="icon-note"></i> Debes crear una sección para poder continuar</a></div>
<div class="modal fade" id="secciones_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Sección</h4>
</div>
<div class="modal-body"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_secciones(){$("#secciones_mod iframe" ).attr('src','<%=r%>secciones/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#secciones_mod").modal();}</script>
<%end if
ob_rs.close                             '[FIN ASOCIAMOS CON UNA SECCION]

if subseccion_on="si"then
Sql= "SELECT id_subseccion, titulo_esp from subsecciones order by titulo_esp"   '[ASOCIAMOS CON UNA SUBSECCION]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sub="si"%>
<div class="form-group form-md-line-input" id="id_subseccion_a">
<label class="col-md-3 control-label" for="id_web">subSección.</label>
<div class="col-md-9" ><div class="input-icon">
<select name="id_subseccion" id="id_subseccion" multiple="multiple" class="select-100" onChange="resetea_error('id_subseccion_a');">
<%do while not ob_rs.eof
id_subseccion=ob_rs("id_subseccion")
tit_seccion=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_subseccion, id_seccion,id_categoria from rel where id_item = "&cod&" and id_subseccion= "&id_subseccion&" "   '[ASOCIAMOS CON UNA SEC]
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if
Sql2= "SELECT id_subseccion, id_seccion,id_categoria from rel where id_subseccion= "&id_subseccion&" and id_categoria="&cod_cat&" "   '[ASOCIAMOS CON UNA SEC]
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then%>
<option value="<%=id_subseccion%>" <%if sel="si" then%>Selected<%end if%>><%=tit_seccion%>
<%end if
ob_rs2.close
Sql2= "SELECT id_subseccion, id_categoria from rel where id_subseccion= "&id_subseccion&" and id_categoria<>0  group by id_categoria, id_subseccion"   '[ASOCIAMOS CON UNA SEC]
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
do while not ob_rs2.eof
id_categoria=ob_rs2("id_categoria")%> ( <%Sql4= "SELECT id_categoria, titulo_crm_esp from categorias where id_categoria = "&id_categoria&" "   
Set ob_rs4 = Server.CreateObject("ADODB.Recordset")
ob_rs4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
tit_cat= tit_cat &ob_rs4("titulo_crm_esp")&"&nbsp;"
end if
ob_rs4.close%>
<%=tit_cat%>)
<%tit_cat=""
id_categoria=""
id_seccion=""
ob_rs2.movenext
loop
end if
ob_rs2.close
b=b+1
ob_rs.movenext
sel=""
tit_cat=""
id_categoria=""
id_seccion=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"></div><i class="fa fa-globe" aria-hidden="true"></i><span class="help-block">selecciona una subsección</span></div>
</div>
</div>
<%else
if cod=""then%>
<script>function notifica2(){var UINotific8=function(){return{init:function(){jQuery(document).ready(function(i){var t={theme:'lime',sticky:'',horizontalEdge:'right',verticalEdge:'top'},n=$(this);""!=$.trim('No hay ninguna subSección creada (opcional)')&&(t.heading=$.trim('No hay ninguna subSección creada (opcional)')),t.sticky||(t.life='12000'),$.notific8("zindex",11500),$.notific8($.trim('Quizá te interese crear una subSección'),t),n.attr("disabled","disabled"),setTimeout(function(){n.removeAttr("disabled")},1e3)})}}}();UINotific8.init();}notifica2();</script>
<%end if%>
<div class="sin_regstros" style="width:100%;margin:0 auto;margin-top:1px;text-align:right">
<a href="javascript:modal_subseccion();" class="f_red"><i class="icon-note"></i> Puedes crear una subsección para  continuar (opcional)</a></div>
<div class="modal fade" id="subsecciones_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Subsección </h4>
</div>
<div class="modal-body" ><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_subseccion(){$("#subsecciones_mod iframe" ).attr('src','<%=r%>subSecciones/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#subsecciones_mod").modal();}</script>
<%end if
ob_rs.close
end if                              '[FIN ASOCIAMOS CON UNA SUBSECION]

Sql= "SELECT id_proveedor, titulo_esp from proveedores where tipo_pr='Escuela' order by titulo_esp"   '[ASOCIAMOS CON UN PROVEEDOR]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_proveedor="si"%>
<div class="form-group form-md-line-input" id="id_proveedor_a">
<label class="col-md-3 control-label" for="id_web" >Proveedor (Escuela).</label>
<div class="col-md-9" ><div class="input-icon"><select name="id_proveedor" id="id_proveedor"  class="select-100" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_proveedor=ob_rs("id_proveedor")
tit_proveedor=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_item, id_proveedor from rel where id_item = "&cod&" and id_proveedor= "&id_proveedor&"" 
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_proveedor%>" <%if sel="si" then%>Selected<%end if%>><%=tit_proveedor%>
<%ob_rs.movenext
sel=""
tit_proveedor=""
id_proveedor=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona una escuela</span></div>
</div>
</div>
<%else%>
<div class="sin_regstros" style="width:100%;margin:0 auto;text-align:right"><a href="javascript:modal_proveedor();" class="f_red"><i class="icon-note"></i> Puedes crear una escuela (opcional)</a> </div>
<div class="modal fade" id="proveedores_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Proveedor (Escuela)</h4>
</div>
<div class="modal-body" ><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_proveedor(){$("#proveedores_mod iframe" ).attr('src','<%=r%>proveedores/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=pr&ndos=es&ntres=&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#proveedores_mod").modal();}</script>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN PROVEEDOR]%>

<%Sql= "SELECT id_destino, titulo_esp from destinos order by titulo_esp"   '[ASOCIAMOS CON UNA PAIS]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_dest="si"%>
<div class="form-group form-md-line-input" id="id_destino_a">
<label class="col-md-3 control-label" for="id_web" >País.<span class="required">*</span></label>
<div class="col-md-9" ><div class="input-icon">
<select name="id_destino" id="id_destino" class="select-100" onChange="resetea_error('id_destino_a');">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_destino=ob_rs("id_destino")
tit_destino=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_destino, id_item from rel where id_item = "&cod&" and id_destino= "&id_destino&""  
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_destino%>" <%if sel="si" then%>Selected<%end if%>><%=tit_destino%>
<%ob_rs.movenext
sel=""
tit_destino=""
id_destino=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-globe" aria-hidden="true"></i><span class="help-block">selecciona un destino</span></div>
</div>
</div>
<%else%>
<script>function notifica3(){var UINotific8=function(){return{init:function(){jQuery(document).ready(function(i){var t={theme:'lime',sticky:'',horizontalEdge:'right',verticalEdge:'top'},n=$(this);""!=$.trim('No se puede crear ningún programa')&&(t.heading=$.trim('No se puede crear ningún programa')),t.sticky||(t.life='12000'),$.notific8("zindex",11500),$.notific8($.trim('Por favor, crea un Destino'),t),n.attr("disabled","disabled"),setTimeout(function(){n.removeAttr("disabled")},1e3)})}}}();UINotific8.init();}notifica3();</script>
<div class="sin_regstros" style="width:100%;max-width:450px;margin:0 auto;"><a href="javascript:modal_destinos();" class="f_red" ><i class="icon-note"></i> Debes crear un Destino para poder continuar</a></div>
<div class="modal fade" id="destinos_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear un Destino</h4>
</div>
<div class="modal-body"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=dt&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_destinos(){$("#destinos_mod iframe" ).attr('src','<%=r%>destinos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=dt&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#destinos_mod").modal();}</script>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN PAIS]%>

<%Sql= "SELECT id_ciudad, titulo_esp from ciudades order by titulo_esp"   '[ASOCIAMOS CON UNA CIUDAD]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then%>
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="id_web" >Ciudad.</label>
<div class="col-md-9"><div class="input-icon">
<select name="id_ciudad" id="id_ciudad" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_ciudad=ob_rs("id_ciudad")
tit_ciudad=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_ciudad, id_item from rel where id_item = "&cod&" and id_ciudad= "&id_ciudad&"" 
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_ciudad%>" <%if sel="si" then%>Selected<%end if%>><%=tit_ciudad%>
<%ob_rs.movenext
sel=""
id_ciudad=""
tit_ciudad=""
%></option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i><span class="help-block">selecciona una ciudad</span></div>
</div>
</div>
<%else%>
<div class="sin_regstros" style="width:100%;margin:0 auto;margin-top:1px;text-align:right">
<a href="javascript:modal_ciudad();" class="f_red"><i class="icon-note"></i> Puedes crear una ciudad para relacionarla (opcional)</a> </div>
<div class="modal fade" id="ciudades_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Ciudad</h4>
</div>
<div class="modal-body"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_ciudad(){$("#ciudades_mod iframe" ).attr('src','<%=r%>ciudades/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=ci&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#ciudades_mod").modal();}</script>
<%end if
ob_rs.close                             '[FIN ASOCIAMOS CON UNA CIUDAD]%>
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-checkboxes">
<div class="col-md-12">
<div class="md-checkbox-list">
<div class="col-md-1"></div>
<div class="col-md-5">
<div class="md-checkbox"><input name="visible" type="checkbox" class="md-check" id="visible" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if visible="si"then%>checked="checked"<%end if%> ><label for="visible">Visible </label></div>
<div class="md-checkbox"><input name="disponible" type="checkbox" class="md-check" id="disponible" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if disponible="si"then%>checked="checked"<%end if%>><label for="disponible"> Disponible </label></div>
<div class="md-checkbox"><input name="destacado" type="checkbox" class="md-check" id="destacado" value="si" <%if destacado="si"then%>checked="checked"<%end if%>><label for="destacado"> Destacado </label></div>
<div class="md-checkbox"><input name="privado" type="checkbox" class="md-check" id="privado" value="si" <%if privado="si"then%>checked="checked"<%end if%> onchange="javascript:toggle_to2();" autocomplete="off"><label for="privado">Privado</label></div>
<div class="form-group form-md-line-input" id="codPrivado_a">
<label class="col-md-2 control-label" for="codPrivado">Cód.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="Código" name="codPrivado" id="codPrivado"  maxlength="250" <%if codPrivado<>"" then%>value="<%=codPrivado%>"<%end if%>><div class="form-control-focus"></div><i class="fa fa-key" aria-hidden="true"></i></div></div>
</div>
<div class="md-checkbox"><input name="multi" type="checkbox" class="md-check" id="multi"  value="si" <%if multi="si"then%>checked="checked"<%end if%>><label for="multi">Multi categoría</label></div>
<div class="md-checkbox"><input name="gestion_alojamientos" type="checkbox" class="md-check" id="gestion_alojamientos" value="si" <%if gestion_alojamientos="si"then%>checked="checked"<%end if%>><label for="gestion_alojamientos">Alojamientos</label></div>
<div class="md-checkbox"><input name="ejecutivos" type="checkbox" class="md-check" id="ejecutivos" value="si" <%if ejecutivos="si"then%>checked="checked"<%end if%>><label for="ejecutivos">Para ejecutivos</label></div>
<div class="md-checkbox"><input name="format_sem" type="checkbox" class="md-check" id="format_sem" value="si" <%if format_sem="si"then%>checked="checked"<%end if%>><label for="format_sem">Semestre</label></div>
<div class="md-checkbox"><input name="cerrado" type="checkbox" class="md-check" id="cerrado" value="si" <%if cerrado="si"then%>checked="checked"<%end if%>><label for="cerrado">Cerrado</label></div>
<div class="md-checkbox"><input name="pre_medida" type="checkbox" class="md-check" id="pre_medida" value="si" <%if pre_medida="si"then%>checked="checked"<%end if%>><label for="pre_medida">A medida</label></div>
</div>
<div class="col-md-6">
<div class="md-checkbox"><input name="pr_actualizado" type="checkbox" class="md-check" id="pr_actualizado"  value="si" <%if pr_actualizado="si" and (anyo_actualizado<>0 or anyo_actualizado<>"") then%>checked="checked"<%end if%> onchange="javascript:toggle_to();" autocomplete="off"><label for="pr_actualizado" >Precio Actualiz.</label></div>
<div class="form-group form-md-line-input" id="anyo_actualizado_a">
<label class="col-md-2 control-label" for="anyo_actualizado">Año.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="anyo_actualizado" id="anyo_actualizado"  maxlength="250" <%if anyo_actualizado<>0 and anyo_actualizado<>""then%>value="<%=anyo_actualizado%>"<%end if%>><div class="form-control-focus"></div><i class="fa fa-calendar" aria-hidden="true"></i></div></div>
</div>
<div class="md-checkbox"><input name="completo" type="checkbox" class="md-check" id="completo"  value="si" <%if completo="si"then%>checked="checked"<%end if%>><label for="completo">Completo</label></div>
<div class="md-checkbox"><input name="oferta" type="checkbox" class="md-check" id="oferta"  value="si" <%if oferta="si"then%>checked="checked"<%end if%>><label for="oferta">Oferta</label></div>
<div class="md-checkbox"><input name="campamento" type="checkbox" class="md-check" id="campamento" value="si" <%if campamento="si"then%>checked="checked"<%end if%> ><label for="campamento">Campamento España </label></div>
<div class="md-checkbox"><input name="quincena" type="checkbox" class="md-check" id="quincena" value="si" <%if quincena="si"then%>checked="checked"<%end if%> ><label for="quincena">Formato quincena</label></div>
<div class="md-checkbox"><input name="gestion_aeropuertos" type="checkbox" class="md-check" id="gestion_aeropuertos" value="si" <%if gestion_aeropuertos="si"then%>checked="checked"<%end if%>><label for="gestion_aeropuertos">Gest. aeropuertos</label></div>
<div class="md-checkbox"><input name="datos_familia_ob" type="checkbox" class="md-check" id="datos_familia_ob" value="si" <%if datos_familia_ob="" and cod<>""then%><%else%>checked="checked"<%end if%>><label for="datos_familia_ob">Datos familiares</label></div>
<div class="md-checkbox"><input name="gen_mail" type="checkbox" class="md-check" id="gen_mail" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if gen_mail="si"then%>checked="checked"<%end if%> ><label for="gen_mail">Email preinscrip. </label></div>

</div>
</div>
</div>
</div>
<!--<div class="form-group form-md-line-input display-hide">
<label class="col-md-3 control-label" for="f_prog_dia" >Salida en.</label>
<div class="col-md-8"><div class="input-icon">
<select id="f_prog_dia" name="f_prog_dia" style="width:100%" multiple="multiple">
<option value="Lunes" <%'if cod=""then%>selected<%'end if%> <%'if instr(f_prog_dia,"Lunes") then%>selected<%'end if%>>Lunes</option>
<option value="Martes" <%'if instr(f_prog_dia,"Martes") then%>selected<%'end if%>>Martes</option>
<option value="Miercoles" <%'if instr(f_prog_dia,"Miercoles") then%>selected<%'end if%>>Miércoles</option>
<option value="Jueves" <%'if instr(f_prog_dia,"Jueves") then%>selected<%'end if%>>Jueves</option>
<option value="Viernes" <%'if instr(f_prog_dia,"Viernes") then%>selected<%'end if%>>Viernes</option>
<option value="Sabado" <%'if instr(f_prog_dia,"Sábado") then%>selected<%'end if%>>Sábado</option>
<option value="Domingo" <%'if instr(f_prog_dia,"Domingo") then%>selected<%'end if%>>Domingo</option>
</select>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
<div class="col-md-12 display-hide" >
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-5 control-label" for="f_prog_salida" style="padding-right:3px;">Salida.</label>
<div class="col-md-7" style="padding-left:25px;"><div class="input-icon">
<div class="input-group date date-picker" data-date-format="dd/mm/yyyy" ><input type="text" class="form-control form-filter input-sm" id="f_prog_salida" name="f_prog_salida" placeholder="salida" <%'if cod<>"" and f_prog_salida<>"01/01/1000"then%>value="<%'=f_prog_salida%>"<%'end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="f_prog_regreso">Regreso.</label>
<div class="col-md-7"><div class="input-icon">
<div class="input-group date date-picker" data-date-format="dd/mm/yyyy"><input type="text" class="form-control form-filter input-sm" id="f_prog_regreso" name="f_prog_regreso" placeholder="regreso" <%'if cod<>"" and f_prog_regreso<>"01/01/1000"then%>value="<%'=f_prog_regreso%>"<%'end if%>><span class="input-group-btn"><button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button></span></div>
<i class="fa fa-calendar-check-o" aria-hidden="true"></i></div>
</div>
</div>
</div>
</div>-->
<%Sql= "SELECT id_idioma, idioma from idiomas order by idioma"   '[ASOCIAMOS CON UN IDIOMA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_idi="si"%>
<div class="form-group form-md-line-input" id="id_idioma_a">
<label class="col-md-3 control-label" for="id_web" >Idioma.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon">
<select name="id_idioma" id="id_idioma" class="select-100" onChange="resetea_error('id_idioma_a');">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_idioma=ob_rs("id_idioma")
tit_idioma=ob_rs("idioma")
if cod<>""then
Sql2= "SELECT id_idioma, id_item from rel where id_item = "&cod&" and id_idioma= "&id_idioma&"" 
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_idioma%>" <%if sel="si" then%>Selected<%end if%>><%=tit_idioma%>
<%ob_rs.movenext
sel=""
tit_idioma=""
id_idioma=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-commenting-o" aria-hidden="true"></i><span class="help-block">selecciona un idioma</span></div>
</div>
</div>
<%else%>
<script>function notifica4(){var UINotific8=function(){return{init:function(){jQuery(document).ready(function(i){var t={theme:'lime',sticky:'',horizontalEdge:'right',verticalEdge:'top'},n=$(this);""!=$.trim('No se puede crear ningún programa')&&(t.heading=$.trim('No se puede crear ningún programa')),t.sticky||(t.life='12000'),$.notific8("zindex",11500),$.notific8($.trim('Por favor, crea un Idioma y relaciónalo.'),t),n.attr("disabled","disabled"),setTimeout(function(){n.removeAttr("disabled")},1e3)})}}}();UINotific8.init();}notifica4();</script>
<div class="sin_regstros" style="width:100%;max-width:450px;margin:0 auto;margin-top:0px">
<a href="javascript:modal_idiomas();" class="f_red"><i class="icon-note"></i> Debes crear un idioma para poder continuar</a> </div>
<div class="modal fade" id="idiomas_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Idioma</h4>
</div>
<div class="modal-body"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=id&ncuat=&edi=rap&cod_cat="&cod_cat))%><iframe src="<%=r%>idiomas/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=id&ncuat=&edi=rap&cod_cat="&cod_cat)%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_idiomas(){$("#idiomas_mod iframe" ).attr('src','<%=r%>idiomas/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=dc&ntres=dt&ncuat=&edi=rap&cod_cat="&cod_cat)%>');$("#idiomas_mod").modal();}</script>
<%end if
ob_rs.close                             '[FIN ASOCIAMOS CON UN IDIOMA]%>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="txt_aviso" >Orden.</label>
<div class="col-md-4">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="orden_prog" id="orden_prog" maxlength="160" value="<%if orden_prog<>0 and cod<>"" then%><%=orden_prog%><%else%><%=num_pp+1%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block">orden del curso</span></div>
</div>
<div class="md-checkbox"><input name="en_menu" type="checkbox" class="md-check" id="en_menu" value="si" <%if en_menu="si" and cod<>""then%>checked="checked"<%end if%><%if en_menu="" and cod=""then%>checked="checked"<%end if%>><label for="en_menu"> En menú </label></div>
</div>
</div><!--col-md-6-->
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_1-->
<div class="tab-pane" id="tab_2">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-4">
<div class="form-group form-md-line-input" id="pr_reserva_a">
<label class="col-md-4 control-label" for="pr_reserva">Precio reserva.<span class="required">*</span></label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_reserva" id="pr_reserva" maxlength="250" value="<%=pr_reserva%>" onKeyUp="resetea_error('pr_reserva_a');"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999;display:none">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input name="pr_reserva_ob" type="checkbox" class="md-check" id="pr_reserva_ob" value="si" <%if cod="" then%>checked="CHECKED"<%end if%> <%if cod<>"" and tasas_aerop_ob="si"then%>checked<%end if%>><label for="pr_reserva_ob"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="pr_medico">Seguro médico.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_medico" id="pr_medico"  maxlength="250" value="<%if pr_medico<>0 then%><%=pr_medico%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="pr_medico_ob" id="pr_medico_ob" class="md-check" value="si" <%if pr_medico_ob="si"then%>checked<%end if%>><label for="pr_medico_ob"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="pr_cancelacion">Seguro cancelación.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_cancelacion" id="pr_cancelacion"  maxlength="250" value="<%if pr_cancelacion<>0 then%><%=pr_cancelacion%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="pr_cancelacion_ob" id="pr_cancelacion_ob" class="md-check" value="si" <%if pr_cancelacion_ob="si"then%>checked="checked"<%end if%>><label for="pr_cancelacion_ob" ><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="tasas_aerop">Tasas aeropuerto.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tasas_aerop" id="tasas_aerop"  maxlength="250" value="<%if tasas_aerop<>0 then%><%=tasas_aerop%><%end if%>"><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">precio.</span></div></div>
<div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox-inline form-md-checkboxes" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="tasas_aerop_ob" id="tasas_aerop_ob" class="md-check" value="si" <%if tasas_aerop_ob="si"then%>checked<%end if%>><label for="tasas_aerop_ob"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input" id="pr_reserva_a">
<label class="col-md-4 control-label" for="tipoCambio">Tipo de Cambio.</label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tipoCambio" id="tipoCambio" maxlength="250" value="<%=tipoCambio%>" ><div class="form-control-focus"></div><i class="fa fa-exchange" aria-hidden="true"></i><span class="help-block">cualquier texto</span></div></div>
</div>
<div class="form-group form-md-line-input">
<link href="<%=r%>lib/app/nouislider/nouislider.min.css" rel="stylesheet" type="text/css" />
<label class="col-md-4 control-label">Edades.</label>
<div class="col-md-7" id="demo8" class="noUi-danger"></div>
<input name="ed_desde" id="ed_desde"  type="hidden" <%if ed_desde=""then%>value="12"<%else%>value="<%=ed_desde%>"<%end if%>>
<input name="ed_hasta" id="ed_hasta"  type="hidden" <%if ed_hasta=""then%>value="90"<%else%>value="<%=ed_hasta%>"<%end if%>>
<script src="<%=r%>lib/app/nouislider/wNumb.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/nouislider/nouislider.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/nouislider/components-nouisliders.min.js" type="text/javascript"></script>
</div>
<div class="col-md-4"></div>
<div class="md-checkbox-list col-md-7" style="margin-top:45px;">
<div class="md-checkbox"><input name="edad_bot" type="checkbox" class="md-check" id="edad_bot" value="si" <%if edad_bot="si"then%>checked="checked"<%end if%>><label for="edad_bot">Mostrar icono edad </label></div></div>
</div>
<div class="col-md-4">
<%if cod<>""then%>
<div class="form-group form-md-radios"><label class="col-md-5 control-label" for="form_control_1">Escuela.</label>
<div class="col-md-7"><div class="md-radio-list">
<div class="md-radio"><input name="escuela_tam" type="radio" class="md-radiobtn" id="radio1" value="p"  <%if escuela_tam ="p" then%>checked="checked"<%end if%>>
<label for="radio1"><span></span><span class="check"></span><span class="box"></span> Pequeña </label></div>
<div class="md-radio"><input name="escuela_tam" type="radio" class="md-radiobtn" id="radio2" value="m" <%if escuela_tam ="m" then%>checked="checked"<%end if%>>
<label for="radio2"><span></span><span class="check"></span><span class="box"></span> Mediana </label></div>
<div class="md-radio"><input name="escuela_tam" type="radio" class="md-radiobtn" id="radio3" value="g" <%if escuela_tam ="g" then%>checked="checked"<%end if%>><label for="radio3"><span></span><span class="check"></span><span class="box"></span> Grande </label></div>
<div class="md-radio"><input name="escuela_tam" type="radio" class="md-radiobtn" id="radio4" value="n" <%if escuela_tam ="n" then%>checked="checked"<%end if%>><label for="radio4"><span></span><span class="check"></span><span class="box"></span> Sin tamaño </label></div>
</div></div></div>
<%end if%>
<div class="form-group form-md-radios"><label class="col-md-5 control-label" for="form_control_1">Moneda.</label>
<div class="col-md-7"><div class="md-radio-list">
<div class="md-radio"><input name="moneda" type="radio" class="md-radiobtn" id="radio5" value="eur" <%if cod=""then%>checked <%end if%><%if moneda ="eur"then%>checked="checked"<%end if%>>
<label for="radio5"><span></span><span class="check"></span><span class="box"></span> € </label></div>
<div class="md-radio"><input name="moneda" type="radio" class="md-radiobtn" id="radio4" value="dol" <%if moneda ="dol"then%>checked="checked"<%end if%>>
<label for="radio4"><span></span><span class="check"></span><span class="box"></span> $ </label></div>
<div class="md-radio"><input name="moneda" type="radio" class="md-radiobtn" id="radio6" value="lib" <%if moneda ="lib"then%>checked="checked"<%end if%>>
<label for="radio6"><span></span><span class="check"></span><span class="box"></span> &pound; </label></div>
<div class="md-radio"><input name="moneda" type="radio" class="md-radiobtn" id="radio7" value="dolc" <%if moneda ="dolc"then%>checked="checked"<%end if%>><label for="radio7"><span></span><span class="check"></span><span class="box"></span> $ CAD. </label></div>
</div></div></div>

<div class="form-group form-md-checkboxes">
<div class="col-md-12 col-md-offset-4">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="seg_medico" type="checkbox" class="md-check" id="seg_medico" value="si" <%if seg_medico="si"then%>checked="checked"<%end if%>><label for="seg_medico">Seg. Médico </label></div>
<div class="md-checkbox"><input name="material" type="checkbox" class="md-check" id="material" value="si" <%if material="si"then%>checked="checked"<%end if%>><label for="material">Material académico </label></div>
<div class="md-checkbox"><input name="uniforme" type="checkbox" class="md-check" id="uniforme" value="si" <%if uniforme="si"then%>checked="checked"<%end if%>><label for="uniforme">Uniforme </label></div>
<div class="md-checkbox"><input name="sup_dest" type="checkbox" class="md-check" id="sup_dest"  value="si" <%if sup_dest="si"then%>checked="checked"<%end if%>>
<label for="sup_dest"> Supervisor en destino </label></div>
</div>
</div>
</div>

</div>
<div class="col-md-4">
<div class="form-group form-md-checkboxes">
<div class="col-md-12">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="alo_fam" type="checkbox" class="md-check" id="alo_fam" value="si" <%if alo_fam="si"then%>checked="checked"<%end if%>><label for="alo_fam">Aloj. Familia </label></div>
<div class="md-checkbox"><input name="alo_res" type="checkbox" class="md-check" id="alo_res" value="si" <%if alo_res="si"then%>checked="checked"<%end if%>><label for="alo_res">Aloj. Residencia </label></div>
<div class="md-checkbox"><input name="alo_apa" type="checkbox" class="md-check" id="alo_apa" value="si" <%if alo_apa="si"then%>checked="checked"<%end if%>><label for="alo_apa">Aloj. Apartamento </label></div>
<div class="md-checkbox"><input name="alo_hot" type="checkbox" class="md-check" id="alo_hot" value="si" <%if alo_hot="si"then%>checked="checked"<%end if%>><label for="alo_hot">Aloj. Hotel </label></div>
<div class="md-checkbox"><input name="alo_hos" type="checkbox" class="md-check" id="alo_hos" value="si" <%if alo_hos="si"then%>checked="checked"<%end if%>><label for="alo_hos">Aloj. Hostel </label></div>
<div class="md-checkbox"><input name="act_inc" type="checkbox" class="md-check" id="act_inc" value="si" <%if act_inc="si"then%>checked="checked"<%end if%>><label for="act_inc">Actividades inc. </label></div>
<div class="md-checkbox"><input name="wifi" type="checkbox" class="md-check" id="wifi" value="si" <%if wifi="si"then%>checked="checked"<%end if%>><label for="wifi">Wi-Fi </label></div>
<div class="md-checkbox"><input name="tel_24" type="checkbox" class="md-check" id="tel_24"  value="si" <%if tel_24="si"then%>checked="checked"<%end if%>><label for="tel_24"> Teléfono 24 h. </label></div>
<div class="md-checkbox"><input name="vuelo" type="checkbox" class="md-check" id="vuelo"  value="si" <%if vuelo="si"then%>checked="checked"<%end if%>><label for="vuelo"> Vuelo incluído </label></div>
<div class="md-checkbox"><input name="c_inten" type="checkbox" class="md-check" id="c_inten"  value="si" <%if c_inten="si"then%>checked="checked"<%end if%>><label for="c_inten"> Curso intensivo </label></div>
<div class="md-checkbox"><input name="c_semi" type="checkbox" class="md-check" id="c_semi"  value="si" <%if c_semi="si"then%>checked="checked"<%end if%>><label for="c_semi"> Curso semi-intensivo </label></div>
<div class="md-checkbox"><input name="c_gene" type="checkbox" class="md-check" id="c_gene"  value="si" <%if c_gene="si"then%>checked="checked"<%end if%>><label for="c_gene"> Curso general </label></div>
<div class="md-checkbox"><input name="monitor" type="checkbox" class="md-check" id="monitor"  value="si" <%if monitor="si"then%>checked="checked"<%end if%>>
<label for="monitor"> Monitor acompañante </label></div>
</div>
</div>
</div>
</div>
<div class="col-md-12">
<div class="campos_opciones form-group form-md-line-input">
<div class="col-md-12" style="border-top:2px solid #ddd;padding-top:20px;margin-bottom:20px;"><button class="inserta_campo btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Opción</button></div>
<%i_opciones=1
if cod<>"" then
Sql= "SELECT rel.id_item, rel.id_itemOp, itemsOp.id_itemOp from rel, itemsOp where id_item="&cod&" and rel.id_itemOp=itemsOp.id_itemOp and rel.id_itemOp<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tot_op=ob_rs.RecordCount 
end if
ob_rs.close
if tot_op=""then tot_op=1
do while i_opciones<=tot_op
execute("opcion_esp_b=opcion_esp_"&i_opciones)
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
<div class="md-checkbox"><input type="checkbox" name="opcion_del_[<%=i_opciones%>]" id="opcion_del_[<%=i_opciones%>]" class="md-check" value="si"><label for="opcion_del_[<%=i_opciones%>]"><span></span><span class="check"></span><span class="box"></span> Eliminar. </label></div>
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
</div>
<div class="col-md-12" style="border-top:2px solid #ddd;padding-top:20px;margin-bottom:20px;">
<%if cod<>""then
Sql= "SELECT rel.id_item, items.id_item,rel.id_categoria,items.titulo_of_esp FROM rel, items where rel.id_categoria="&cod_cat&" and rel.id_item=items.id_item and rel.id_item<>0 and rel.id_item<> "&cod&" group by rel.id_item, rel.id_categoria, items.id_item,items.titulo_of_esp"   '[ASOCIAMOS CON UNA PROGRAMA]
else
Sql= "SELECT rel.id_item, items.id_item,rel.id_categoria,items.titulo_of_esp FROM rel, items where rel.id_categoria="&cod_cat&" and rel.id_item=items.id_item and rel.id_item<>0  group by rel.id_item, rel.id_categoria, items.id_item,items.titulo_of_esp"   '[ASOCIAMOS CON UNA PROGRAMA]
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then%>
<div class="form-group form-md-line-input" >
<label class="col-md-2 control-label" for="id_item_rel" style="padding-right:0px">Programas relacionados.</label>
<div class="col-md-8"><div class="input-icon">
<select name="id_item_rel" id="id_item_rel" multiple="multiple" >
<%do while not ob_rs.eof
id_item_rel=ob_rs("items.id_item")
tit_item=ob_rs("titulo_of_esp")
if cod<>""then
Sql2= "SELECT rel.id_item, items.id_item,rel.id_item_rel,rel.id_categoria,items.titulo_of_esp FROM rel, items where rel.id_item="&cod&" and rel.id_item_rel="&id_item_rel&" "
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_item_rel%>" <%if sel="si" then%>Selected<%end if%>><%=tit_item%>
<%ob_rs.movenext
sel=""
id_item_rel=""
tit_item=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-signs" aria-hidden="true"></i><span class="help-block">selecciona una sección</span></div>
</div>
</div>
<%end if
ob_conn.close%>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_2-->
<div class="tab-pane" id="tab_3">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<!--IMAGEN-->
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" style="padding-right:0px">Imagen destacada.</label>
<div class="col-md-8"><div class="input-group" style="margin-left:8px"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_1" class="form-control" type="field" name="archivo_[1]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_1" type="button" onclick="javascript:archivo('Imagen',1);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[1]" id="orden_img_1" maxlength="250" value="1">
<div id="div_imagen_1">
<div class="col-md-7">
<div class="form-group form-md-line-input" id="imagen_1">
<label class="col-md-7 control-label">Imagen destacada.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_1();" class="thumbnail thumbs_p"><img src="<%=archivo_1%>" alt=""></a></div></div>
</div>
<div class="col-md-4">
<div class="form-group form-md-line-input" >
<span class="input-group-btn" id="anular_1"><button class="btn default" id="anular" type="button" onclick="javascript:anular_1();"><i class="fa fa-arrow-left fa-fw" /></i> Anular Imagen</button></span>
<div class="form-group form-md-line-input"  id="eliminar_1">
<label class="col-md-7 control-label" for="del_img_1">Eliminar Img.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="del_img_1" type="checkbox" class="md-check" id="del_img_1" value="si" ></div></div></div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input" id="alt_1">
<label class="col-md-4 control-label" for="alt_1" >Título imagen.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[1]" id="alt_1" maxlength="250" value="<%=alt_1%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
</div>
<div class="modal fade" id="imagemodal_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title" id="myModalLabel">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;"><img src="<%=archivo_1%>" id="imagepreview_1" style="width: 400px; margin:0 auto;" ></div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div>
</div>
</div>
<script>
function modal_img_1() { $('#imagemodal_1').modal('show'); }; //MODAL DE IMAGEN
<%if archivo_1=""then%>
function anular_1(){$('#archivo_1').val("");$('#div_imagen_1').fadeOut("fast");}
<%else%>
function anular_1(){
$('#archivo_1').val("");$('#anular_1').fadeOut("fast");$('#eliminar_1').fadeIn("fast");
$("[name='del_img_1']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#imagen_1 img').attr('src','<%=archivo_1%>');$('#imagepreview_1').attr('src','<%=archivo_1%>');
}
<%end if%>
<%if archivo_1=""then%>
$('#div_imagen_1').hide();$('#eliminar_1').hide();
<%else%>
$('#eliminar_1').show();$("[name='del_img_1']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#anular_1').hide();  //FIN MODAL DE IMAGEN
<%end if%>
</script>
</div>
</div>
<!--FIN IMAGEN-->
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="resumen_esp" style="margin-left:10px;padding-right:0px">Resumen.</label>
<div class="col-md-8" style="margin-left:8px"><div class="input-icon"><textarea class="form-control" name="resumen_esp" id="resumen_esp" rows="2"><%=resumen_esp%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">resumen para usar en destacados</span></div></div>
</div>
<div class="panel-group accordion scrollable" id="acordeon_c" style="margin-top:35px">
<div class="panel panel-default" style="border:none">
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_c_0"><i class="fa fa-quote-right margin-right-8"></i> Descripción General </a></h4></div>
<div id="acordeon_c_0" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-md-12">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="texto_esp">Descripción general.</label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea></div>
</div>
</div>
</div>
</div>
</div>
<%a=1
do while a<=6
execute("tab_titulo_esp=tab_"&a&"_titulo_esp")
execute("tab_act=tab_"&a&"_act")
execute("tab_texto_esp=tab_"&a&"_texto_esp")%>
<div class="panel panel-default" style="border:none">
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_c_<%=a%>"><i class="fa fa-folder-o margin-right-8"></i> <%if cod="" then%>Tab <%=a%> <%else%><%if tab_titulo_esp<>""then%><%=tab_titulo_esp%><%else%>Tab <%=a%> <%end if%><%end if%> </a></h4></div>
<div id="acordeon_c_<%=a%>" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="tab_<%=a%>_titulo_esp" >Título Tab <%=a%>.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="tab_<%=a%>_titulo_esp" id="tab_<%=a%>_titulo_esp" maxlength="160" value="<%=tab_titulo_esp%>"><div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input"  >
<label class="col-md-4 control-label" for="tab_<%=a%>_act">Activar Tab <%=a%>.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="tab_<%=a%>_act" type="checkbox" class="md-check" id="tab_<%=a%>_act" value="si" <%if tab_act="si"then%>checked="checked"<%end if%>></div></div></div>
<script>$("[name='tab_<%=a%>_act']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script>
</div>
</div>
<div class="col-md-12">
<div class="form-group form-md-line-input"><label class="col-md-2 control-label " for="tab_<%=a%>_texto_esp">Descripción.</label>
<div class="col-md-8"><textarea class="form-control" name="tab_<%=a%>_texto_esp" id="tab_<%=a%>_texto_esp" rows="3"><%=tab_texto_esp%></textarea></div>
</div>
</div>
</div>
</div>
</div>
<%a=a+1
loop%>
<div class="panel panel-default" style="border:none">
<div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_c_7"><i class="fa fa-gavel margin-right-8"></i> Normas del programa </a></h4></div>
<div id="acordeon_c_7" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-md-12">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="normas">Normas del programa.</label>
<div class="col-md-8"><textarea class="form-control" name="normas" id="normas" rows="3"><%=normas%></textarea></div>
</div>
<div class="form-group form-md-line-input"  >
<label class="col-md-2 control-label" for="normas_ob">Obligar check normas.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="normas_ob" type="checkbox" class="md-check" id="normas_ob" value="si" <%if normas_ob="si"then%>checked="checked"<%end if%>></div></div></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_3-->
<div class="tab-pane" id="tab_4" >
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<!--IMAGEN-->
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label">Banner.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_2" class="form-control" type="field" name="archivo_[2]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_2" type="button" onclick="javascript:archivo('Imagen',2);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[2]" id="orden_img_2" maxlength="250" value="2">
<div class="row" id="div_imagen_2"><!--SI SELECCIONAMOS-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="imagen_2">
<label class="col-md-6 control-label">Banner.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_2();" class="thumbnail thumbs_p"><img src="<%=archivo_2%>" alt="100%x180"></a></div></div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<span class="input-group-btn" id="anular_2"><button class="btn default" id="anular" type="button" onclick="javascript:anular_2();"><i class="fa fa-arrow-left fa-fw" /></i> Anular Imagen</button></span>
<div class="form-group form-md-line-input"  id="eliminar_2">
<label class="col-md-8 control-label" for="del_img_2">Eliminar Img.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="del_img_2" type="checkbox" class="md-check" id="del_img_2" value="si" ></div></div></div>
</div>
</div>
</div>
<div class="modal fade" id="imagemodal_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;"><img src="<%=archivo_2%>" id="imagepreview_2" style="width: 400px; margin:0 auto;" ></div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div>
</div>
</div>
<script>
function modal_img_2() { $('#imagemodal_2').modal('show'); };  //   MODAL IMAGEN 2
<%if archivo_2=""then%>
function anular_2(){$('#archivo_2').val("");$('#div_imagen_2').fadeOut("fast");}
<%else%>
function anular_2(){$('#archivo_2').val("");$('#anular_2').fadeOut("fast");$('#eliminar_2').fadeIn("fast");$('#imagen_2 img').attr('src','<%=archivo_2%>');$('#imagepreview_2').attr('src','<%=archivo_2%>');}
<%end if%>
<%if archivo_2=""then%>
$('#div_imagen_2').hide();$('#eliminar_2').hide();<%else%>
$('#eliminar_2').show();$("[name='del_img_2']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#anular_2').hide();   // FIN  MODAL IMAGEN 2
<%end if%>
</script>
</div><!--row-->
<!--FIN IMAGEN-->
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="alt_2">
<label class="col-md-3 control-label" for="alt_2" >Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[2]" id="alt_2" maxlength="250" value="<%=alt_2%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
</div><!--col-md-5-->
<!--col-md-5-->
<!--#include file="../comun/gest_galerias.asp"--><!--FIN row GALERIAS-->
</div>
</div>
</div><!--form-body-->
</div><!--tab_4-->
<div class="tab-pane" id="tab_5">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="url_esp_a">
<label class="col-md-2 control-label" for="url_esp">URL amigable.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="url_esp" id="url_esp" onkeyup="resetea_error('url_esp_a');urlea_esp_inf();" maxlength="250" value="<%=url_esp%>"><div class="form-control-focus"></div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">URL "amigable" (para espacios pulsa "espacio" sin soltar).</span></div>
<div class="md-checkbox-inline" style="margin-top:25px" >
<div class="md-checkbox"><input name="inc_cat" type="checkbox" class="md-check" id="inc_cat" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if inc_cat="si"then%>checked="checked"<%end if%> ><label for="inc_cat">Incluir Categoría </label></div>
<div class="md-checkbox"><input name="inc_sec" type="checkbox" class="md-check" id="inc_sec" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if inc_sec="si"then%>checked="checked"<%end if%>><label for="inc_sec"> Incluir Sección </label></div>
<div class="md-checkbox"><input name="inc_sub" type="checkbox" class="md-check" id="inc_sub" value="si" <%if inc_sub="si"then%>checked="checked"<%end if%>><label for="inc_sub"> Incluir Subsección </label></div>
<div class="md-checkbox"><input name="inc_des" type="checkbox" class="md-check" id="inc_des" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if inc_des="si"then%>checked="checked"<%end if%>><label for="inc_des"> Incluir Destino </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meta_title" >[meta] Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="meta_title" id="meta_title" maxlength="65" value="<%=meta_title%>"><div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un título descriptivo de unos 65 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meta_desc">[meta] Descripción.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_desc" id="meta_desc" rows="2" maxlength="160"><%=meta_desc%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">debes introducir una descripción concisa de unos 160 caracteres</span></div></div>
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
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green " <%if sel_sec<>"si" or sel_dest<>"si" or sel_idi<>"si" then%>disabled<%end if%> onclick="Enviar_items(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&ver="&ver))%>
<a href="<%=r%>items/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&ver="&ver)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div></div></div></div></form></div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div class="modal fade" id="programas_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Listado de Programas actuales</h4>
</div>
<div class="modal-body"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat=&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<!--<button type="button" class="btn blue btn-outline" onClick="recargar();">Cerrar</button>-->
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div></div></div></div>
<div class="modal fade" id="alerta_opciones" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No se pueden añadir más opciones</h4></div><div class="modal-body"> No se pueden añadir más opciones. Si necesitas más, contacta con el administrador del sistema. </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<script>function modal_programas(){$("#programas_mod iframe" ).attr('src','<%=r%>items/listado_iframe.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat=&cod_cat="&cod_cat)%>');$("#programas_mod").modal();}</script>
<%if cod<>""then%>
<div class="modal fade" id="duplicar_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Duplicar Programa </h4>
</div>
<div class="modal-body" ><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=&edi=rap&cod_cat="&cod_cat&"&cod_prog="&cod))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="modal_cambio_cat" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Cambiar Categoría </h4>
</div>
<div class="modal-body" ><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=&edi=rap&cod_cat="&cod_cat&"&cod_prog="&cod))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto" id="cat_cam"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_duplicar(){$("#duplicar_mod iframe" ).attr('src','<%=r%>items/duplicar.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&edi=rap&cod_cat="&cod_cat&"&cod_prog="&cod)%>');$("#duplicar_mod").modal();}</script>
<script>function modal_cambio_cat(){$("#modal_cambio_cat iframe" ).attr('src','<%=r%>items/cambiar_cat.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=&edi=rap&cod_cat="&cod_cat&"&cod_prog="&cod)%>');$("#modal_cambio_cat").modal();}</script>
<script>function eliminarUna(){$('#confirmaEliminaUna').modal('show');}
function confirmarEliminaUna_ok(){$('#confirmaEliminaUna').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=cod%>&cod_cat=<%=cod_cat%>&accion=del&ver=<%=ver%>';}
function recuperar(){$('#recuperar').modal('show');}
function recuperar_ok(){$('#recuperar').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=cod%>&cod_cat=<%=cod_cat%>&accion=rec&ver=<%=ver%>';}
function eliminarDef(){$('#confirmaEliminaDef').modal('show');}
function confirmarEliminaDef_ok(){$('#confirmaEliminaDef').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='acciones.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=cod%>&cod_cat=<%=cod_cat%>&accion=del_def&ver=<%=ver%>';}
</script>
<div class="modal fade" id="confirmaEliminaUna" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el registro seleccionado?</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaUna_ok();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<div class="modal fade" id="confirmaEliminaDef" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> 
<p>¿Seguro que deseas eliminar el registro seleccionado DEFINITIVAMENTE?<br><br>Ten en cuenta que:    </p>
<ul>
<li>Se eliminarán los cursos relacionados</li>
<li>Se eliminarán las relaciones con los archivos del programa y cursos</li>
<li>Se eliminarán las relaciones con los programas vendidos</li>
</ul>
</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaDef_ok();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<div class="modal fade" id="recuperar" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas recuperar el registro seleccionado?</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="recuperar_ok();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<div class="modal fade" id="cursos_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Listado de Cursos actuales para <%=titulo_esp%></h4>
</div>
<div class="modal-body"><iframe src="" id="gest_cursos" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<!--<button type="button" class="btn blue btn-outline" onClick="recargar();">Cerrar</button>-->
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod_prog="&cod))%>
<a href="<%=r%>itemsSub/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod_prog="&cod)%>" class="btn green-haze btn-outline pull-left"><i class="fa fa-arrows-alt" aria-hidden="true"></i> ampliar</a>
<a href="javascript:gest_cursos();" class="btn green-haze btn hidden" id="sav_gest_cursos"><i class="fa fa-floppy-o" aria-hidden="true" ></i> Guardar</a>
<script>function sav_gest_cursos_on (){$( "#sav_gest_cursos" ).removeClass( "hidden" );$( "#sav_gest_cursos" ).hide();$( "#sav_gest_cursos" ).fadeIn();}
function sav_gest_cursos_off (){$( "#sav_gest_cursos" ).addClass( "hidden" );}
function gest_cursos(){document.getElementById("gest_cursos").contentWindow.Enviar_cursos();}</script>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod_prog="&cod&"&edi=rap"))%>
<script>function modal_cursos(){$("#cursos_mod iframe" ).attr('src','<%=r%>itemsSub/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod_prog="&cod&"&edi=rap")%>');$("#cursos_mod").modal();}</script>
<div class="modal fade" id="aloja_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Listado de Alojamientos actuales para <%=titulo_esp%></h4>
</div>
<div class="modal-body"><iframe src="" id="gest_aloja" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<!--<button type="button" class="btn blue btn-outline" onClick="recargar();">Cerrar</button>-->
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod="&cod))%>
<a href="<%=r%>itemsAlo/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod="&cod)%>" class="btn green-haze btn-outline pull-left"><i class="fa fa-arrows-alt" aria-hidden="true"></i> ampliar</a>
<a href="javascript:gest_aloja();" class="btn green-haze btn hidden" id="sav_gest_aloja"><i class="fa fa-floppy-o" aria-hidden="true" ></i> Guardar</a>
<script>function sav_gest_aloja_on (){$( "#sav_gest_aloja" ).removeClass( "hidden" );$( "#sav_gest_aloja" ).hide();$( "#sav_gest_aloja" ).fadeIn();}
function sav_gest_cursos_off (){$( "#sav_gest_aloja" ).addClass( "hidden" );}
function gest_aloja(){document.getElementById("gest_aloja").contentWindow.Enviar_alojamientos();}</script>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod="&cod&"&edi=rap"))%>
<script>function modal_aloja(){$("#aloja_mod iframe" ).attr('src','<%=r%>itemsAlo/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos="&ndos&"&ntres=gs"&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat&"&cod="&cod&"&edi=rap")%>');$("#aloja_mod").modal();}</script>
<%end if%>
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
<%if pr_actualizado<>"si" then%>$("#anyo_actualizado_a").hide();<%end if%>
<%if privado<>"si" then%>$("#codPrivado_a").hide();<%end if%>
function toggle_to(){$("#anyo_actualizado_a").slideToggle( "slow" );};
function toggle_to2(){$("#codPrivado_a").slideToggle( "slow" );};
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('tab_1_texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('tab_2_texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('tab_3_texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('tab_4_texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('tab_5_texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('tab_6_texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('normas',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
$("[name='visible'],[name='destacado'],[name='disponible'],[name='privado'],[name='multi'],[name='oferta'],[name='completo'],[name='pr_actualizado'],[name='alo_fam'],[name='alo_res'],[name='alo_apa'],[name='wifi'],[name='tel_24'],[name='vuelo'],[name='c_inten'],[name='c_semi'],[name='c_gene'],[name='monitor'],[name='campamento'],[name='quincena'],[name='gestion_aeropuertos'],[name='gestion_alojamientos'],[name='ini_lunes'],[name='inc_cat'],[name='inc_sec'],[name='inc_sub'],[name='en_menu'],[name='inc_des'],[name='alo_hot'],[name='datos_familia_ob'],[name='ejecutivos'],[name='seg_medico'],[name='material'],[name='uniforme'],[name='show_cat'],[name='alo_hos'],[name='act_inc'],[name='sup_dest'],[name='format_sem'],[name='pre_medida'],[name='gen_mail'],[name='edad_bot'],[name='cerrado']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
$("[name='normas_ob']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
function urlea_esp(){document.getElementById("url_esp").value = document.getElementById("titulo_esp").value.slugify();}
function urlea_esp_inf(){document.getElementById("url_esp").value=document.getElementById("url_esp").value.slugify();}
var limita=function(){
var a=function(){
$("#titulo_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#titulo_esp_of").maxlength({limitReachedClass:"label label-danger"}),
$("#url_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_title").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_desc").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
function recargar() {location.reload();}
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});
$('.inserta_campo').one('click',function(){
}).click(function(){
var n = $('.opcion_lst').length + 1;
if( 16 < n ) {$('#alerta_opciones').modal();return false;}
x=n;
var box_htmle = $('<div class="col-md-12 opcion_lst"><div class="col-md-5"><div class="form-group form-md-line-input" ><label class="col-md-5 control-label" for="opcion_esp_['+x+']">Opción <span class="orden_op">'+x+'</span>.</label><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" id="opcion_esp_['+x+']" name="opcion_esp_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-check-square-o" aria-hidden="true"></i><span class="help-block">indica el concepto.</span></div></div><input name="opcion_orden_['+x+']" id="opcion_orden_['+x+']" type="hidden" value="'+x+'"></div></div><div class="col-md-3"><div class="form-group form-md-line-input" ><label class="col-md-3 control-label" for="opcion_pre__['+x+']">Precio.</label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder=""  name="opcion_pre_['+x+']" id="opcion_pre_['+x+']" value=""><div class="form-control-focus"></div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">indica el precio en euros.</span></div></div></div></div><div class="col-md-3"><div class="form-group form-md-checkboxes"><div class="md-checkbox-inline"><div class="md-checkbox"><input type="checkbox" name="opcion_ob_['+x+']" id="opcion_ob_['+x+']" class="md-check" value="si"><label for="opcion_ob_['+x+']"><span></span><span class="check"></span><span class="box"></span> Obl. </label></div><button class="elimina_campo btn red"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div></div></div></div>');
box_htmle.hide();
$('.campos_opciones div.opcion_lst:last').after(box_htmle);
box_htmle.fadeIn('slow');
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
$('.date-picker').datepicker({language: 'es'});
});//FIN READY FUNCTION
</script>