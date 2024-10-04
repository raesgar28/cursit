<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<%if cod<>""then
Sql= "SELECT * from descuentos where id_descuento="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
'seleccion=ob_rs("seleccion")
'seleccion = replace(seleccion, "jpk2", "'") 'jpk2 SON COMILLA SIMPLE
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
fecha_in=ob_rs("fecha_in")
fecha_mod=date
d_fijo=ob_rs("d_fijo")
if d_fijo<>0 then d_fijo= FormatNumber(ccur(d_fijo),2) else d_fijo="" end if
d_porcentaje=ob_rs("d_porcentaje")
if d_porcentaje<>0 then d_porcentaje= FormatNumber(ccur(d_porcentaje),2) else d_porcentaje="" end if
fecha_inicio=ob_rs("fecha_inicio")
if fecha_inicio<>"01/01/1000"then fecha_inicio=fecha_inicio else fecha_inicio="" end if
fecha_fin=ob_rs("fecha_fin")
if fecha_fin<>"01/01/1000"then fecha_fin=fecha_fin else fecha_fin="" end if
repetible=ob_rs("repetible")
id_agente_s=ob_rs("id_agente_s")
n_cupones=ob_rs("n_cupones")
if n_cupones<>0 then n_cupones= n_cupones else n_cupones="" end if
codigo=ob_rs("codigo")
activo=ob_rs("activo")
evento=ob_rs("evento")
end if
ob_rs.close
end if
pos=request("pos")
if pos ="" then pos = request_equerystring("pos")%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Descuentos </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>descuentos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado descuentos</a></li>
<li class="active">Gestión</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>descuentos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i>Descuentos</a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión descuentos</a></li>
</ul></nav></div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Descuento <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span> | <%if cod<>""then%>Modificar<%else%>Crear<%end if%></div>
</div>
<div class="portlet-body">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="del_gest"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> registros eliminados con éxito!!</div><%end if%>
<!--RESPUESTAS-->

<form action="guardar.asp" method="post" name="envio" class="form-horizontal" id="envio"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body ">
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El código ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="form-body">
<div class="row">
<div class="col-md-12">

<div class="col-md-6"><div class="form-group form-md-line-input" id="titulo_esp_a"><label class="col-md-2 control-label" for="titulo_esp" > Título.<span class="required">*</span></label><div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div><i class="fa fa-terminal" aria-hidden="true"></i><span class="help-block">lo más conciso y descriptivo posible</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="fecha_inicio" > Fecha inicio.</label><div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_inicio" id="fecha_inicio" value="<%=fecha_inicio%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-check-o" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<%Sql= "SELECT u_nombre, u_apellidos, id_usuario, u_empresa, u_agente FROM usuarios WHERE u_email<>'' AND u_email IS NOT NULL AND u_agente='si'  ORDER BY u_apellidos DESC"   '[ASOCIAMOS AGENTE]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_agente_s" >Agente.</label>
<div class="col-md-8"><div class="input-icon">
<select name="id_agente_s" id="id_agente_s" class="select-100" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_usuario")%>" <%if int(ob_rs("id_usuario"))=int(id_agente_s) then%> Selected<%end if%>><%=ob_rs("u_apellidos")%>, <%=ob_rs("u_nombre")%> <%if ob_rs("u_agente")="si" and ob_rs("u_empresa")<>""then%> - (<%=ob_rs("u_empresa")%>)<%end if%></option>
<%ob_rs.movenext%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-suitcase" aria-hidden="true"></i></div></div></div>
<%else%><div class="col-md-12" ><div class="col-md-2" ></div><div class="col-md-7" style="padding-left:0px;margin-bottom:25px"><div class="alert-info sin_registros" ><i class="icon-note"></i> No hay ningún agente creado.</div></div></div>
<%end if
ob_rs.close %>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="d_fijo" > Precio (€).</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="d_fijo" id="d_fijo" value="<%=d_fijo%>">
<div class="form-control-focus"> </div><i class="fa fa-eur" aria-hidden="true"></i><span class="help-block">numérico, por favor</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="d_porcentaje" > Precio (%).</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="d_porcentaje" id="d_porcentaje" value="<%=d_porcentaje%>"><div class="form-control-focus"> </div><i class="fa fa-percent" aria-hidden="true"></i><span class="help-block">numérico, por favor</span></div></div>
</div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input" id="codigo_a"><label class="col-md-2 control-label" for="codigo" > Código.<span class="required">*</span></label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="codigo" id="codigo" onKeyUp="resetea_error('codigo_a');" maxlength="160" value="<%=codigo%>"><div class="form-control-focus"> </div><i class="fa fa-code" aria-hidden="true"></i><span class="help-block">genera un código</span></div></div></div>
<div class="form-group form-md-line-input" ><label class="col-md-2 control-label" for="fecha_fin" > Fecha fin.</label><div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_fin" id="fecha_fin" value="<%=fecha_fin%>"><div class="form-control-focus"> </div><i class="fa fa-calendar-times-o" aria-hidden="true"></i><span class="help-block">dd/mm/aaaa</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="n_cupones" > Nº. cupones.</label><div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="n_cupones" id="n_cupones"  value="<%=n_cupones%>"><div class="form-control-focus"> </div><i class="fa fa-ticket" aria-hidden="true"></i><span class="help-block">dejar a cero para infinitos</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="evento" > Evento.</label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="evento" id="evento" value="<%=evento%>"><div class="form-control-focus"> </div><i class="fa fa-certificate" aria-hidden="true"></i><span class="help-block">evento relacionado</span></div></div></div>
</div>
<div class="col-md-6"><div class="form-group form-md-checkboxes"><label class="col-md-2 control-label" for="form_control_1"></label><div class="col-md-8"><div class="md-checkbox-inline"><div class="md-checkbox"><input name="activo" type="checkbox" class="md-check" id="activo"  value="si" <%if activo="si"then%>checked="checked"<%end if%> ><label for="activo"> Activo </label></div></div></div></div></div>
<div class="col-md-12" style="border-bottom:1px solid #ddd;margin-top:25px"></div>
<div class="col-md-12" >
<div class="note note-info magin-top-0" style="margin-bottom:30px;margin-top:30px">
  <h4 class="block">Sobre descuentos</h4>
<p><i class="fa fa-info-circle" aria-hidden="true"></i> La selección se puede aplicar sobre CATEGORÍA(s)  y/o SECCIÓN(es)    y/o PROGRAMA(s) y/o DESTINO(s) y/o ALUMNO(s) y/o USUARIO(s). <br>  
<i class="fa fa-info-circle" aria-hidden="true"></i> Cada asociación es opcional y SUMA, NO FILTRA.
</p></div></div>
<div class="col-md-12">
<div class="col-md-6">
<%Sql= "SELECT id_categoria, titulo_esp from categorias order by titulo_esp"   '[ASOCIAMOS CON UNA CAT]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sec="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_categoria" style="padding-right:25px">Categoría.<span class="required"></span></label>
<div class="col-md-9"  style="padding-left:5px"><div class="input-icon">
<select name="id_categoria" id="id_categoria" class="select-100" multiple="multiple">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_categoria=ob_rs("id_categoria")
tit_categoria=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_categoria from descuentosRel where id_descuento = "&cod&" and id_categoria= "&id_categoria&""   '[ASOCIAMOS CON UNA CAT]
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_categoria%>" <%if sel="si" then%>Selected<%end if%>><%=tit_categoria%>	
<%Sql3_2= "SELECT id_categoria,id_web from rel where id_categoria = "&id_categoria&" "   
Set ob_rs3_2 = Server.CreateObject("ADODB.Recordset")
ob_rs3_2.Open Sql3_2, ob_conn,adOpenStatic, adCmdText
if not ob_rs3_2.eof then
b=1%>(<%do while not ob_rs3_2.eof
id_web=ob_rs3_2("id_web")
if id_web<>"" and id_web<> 0 then
Sql4= "SELECT titulo_esp from webs where id_web = "&id_web&" "   
Set ob_rs4 = Server.CreateObject("ADODB.Recordset")
ob_rs4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
if tit_web<>"" and b>1 then
tit_web=tit_web &" · " &ob_rs4("titulo_esp")&"&nbsp;"
else
tit_web= tit_web &ob_rs4("titulo_esp")&"&nbsp;"
end if
end if
ob_rs4.close
end if
ob_rs3_2.movenext
b=b+1
loop%>
<%=tit_web%>)
<%end if
ob_rs3_2.close
ob_rs.movenext
sel=""
tit_web=""
id_web=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona una categoría</span></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ninguna categoría creada</div>
</div>
</div>
<%end if
ob_rs.close '[FIN ASOCIAMOS CON UNA CAT]
Sql= "SELECT id_seccion, titulo_esp from secciones order by titulo_esp"   '[ASOCIAMOS CON UNA SECCION]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sec="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_seccion" style="padding-right:25px">Sección.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_seccion" id="id_seccion" multiple="multiple" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_seccion=ob_rs("id_seccion")
tit_seccion=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_seccion,id_categoria from descuentosRel where id_descuento = "&cod&" and id_seccion= "&id_seccion&" "   '[ASOCIAMOS CON UNA SEC]
	Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
	ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_seccion%>" <%if sel="si" then%>Selected<%end if%>><%=tit_seccion%>
<%Sql2= "SELECT id_seccion, id_categoria from rel where id_seccion= "&id_seccion&" and id_categoria<>0 and id_subseccion=0 group by id_categoria, id_seccion"   '[ASOCIAMOS CON UNA SEC]
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
do while not ob_rs2.eof
id_categoria=ob_rs2("id_categoria")%>(<%Sql4= "SELECT id_categoria, titulo_crm_esp from categorias where id_categoria = "&id_categoria&" "   
Set ob_rs4 = Server.CreateObject("ADODB.Recordset")
ob_rs4.Open Sql4, ob_conn,adOpenStatic, adCmdText
if not ob_rs4.eof then
tit_cat= tit_cat &ob_rs4("titulo_crm_esp")&"&nbsp;"
end if
ob_rs4.close%>
<%=tit_cat%>)
<%'end if
tit_cat=""
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
id_seccion=""
%></option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona una sección</span></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ninguna sección creada</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UNA SECCION]
Sql= "SELECT id_destino, titulo_esp from destinos order by titulo_esp"   '[ASOCIAMOS CON UNA PAIS]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_dest="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_destino" style="padding-right:25px">País.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_destino" id="id_destino" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_destino=ob_rs("id_destino")
tit_destino=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_destino from descuentosRel where id_descuento= "&cod&" and id_destino= "&id_destino&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
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
</div></div>
<%else%>
<div class="col-md-12" ><div class="col-md-2" ></div><div class="col-md-7" style="padding-left:0px;margin-bottom:25px"><div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún destino creado.</div></div>
</div><%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN PAIS]
Sql= "SELECT items.id_item, items.titulo_of_esp,items.titulo_esp,  categorias.titulo_esp, rel.id_item FROM rel, items, categorias WHERE rel.id_item<>0 and rel.id_categoria<> 0 and items.id_item=rel.id_item AND rel.id_categoria=categorias.id_categoria GROUP BY rel.id_item, items.id_item, rel.id_categoria, items.titulo_of_esp, categorias.titulo_esp,items.titulo_esp ORDER BY categorias.titulo_esp, items.titulo_of_esp"  
 '[ASOCIAMOS CON UN PROGRAMA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_item" style="padding-right:25px">Programa.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_item" id="id_item" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_item=ob_rs("rel.id_item")
tit_item=ob_rs("titulo_of_esp")
cat=ob_rs("categorias.titulo_esp")
if cod<>""then
Sql2= "SELECT id_item from descuentosRel where id_descuento = "&cod&" and id_item= "&id_item&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_item%>" <%if sel="si" then%>Selected<%end if%>><%=tit_item%> - <%=ob_rs("items.titulo_esp")%> - (<%=cat%>)</option>
<%ob_rs.movenext
sel=""
tit_destino=""
id_destino=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un programa</span></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún programa creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN PROGRAMA]
Sql= "SELECT u_nombre, u_apellidos, id_usuario, u_empresa, u_agente FROM usuarios WHERE u_email<>'' AND u_email IS NOT NULL AND u_agente IS NULL  OR (u_agente IS NOT NULL AND u_agente<>'si') ORDER BY u_apellidos DESC"   '[ASOCIAMOS CON UN USUARIOS]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_item" style="padding-right:25px">Usuarios.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_usuario" id="id_usuario" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
if cod<>"" and ob_rs("id_usuario")<>"" then
Sql2= "SELECT id_usuario from descuentosRel where id_descuento = "&cod&" and id_usuario= "&ob_rs("id_usuario")&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=ob_rs("id_usuario")%>" <%if sel="si" then%>Selected<%end if%>><%=ob_rs("u_apellidos")%>, <%=ob_rs("u_nombre")%> <%if ob_rs("u_agente")="si" and ob_rs("u_empresa")<>""then%> - (<%=ob_rs("u_empresa")%>)<%end if%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-user-o" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún usuario creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN USUARIOS]
Sql= "SELECT a_nombre, a_apellidos, id_alumno FROM alumnos WHERE(a_email <>'' AND a_email IS NOT NULL ) or (a_p_email <>'' AND a_p_email IS NOT NULL) or (a_m_email <>'' AND a_m_email IS NOT NULL)ORDER BY a_apellidos DESC"   '[ASOCIAMOS CON UN ALUMNOS]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_item" style="padding-right:25px">Alumnos.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_alumno" id="id_alumno" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
if cod<>"" and ob_rs("id_alumno")<>"" then
Sql2= "SELECT id_alumno from descuentosRel where id_descuento = "&cod&" and id_alumno= "&ob_rs("id_alumno")&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=ob_rs("id_alumno")%>" <%if sel="si" then%>Selected<%end if%>><%=ob_rs("a_apellidos")%>, <%=ob_rs("a_nombre")%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún alumno creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN ALUMNOS]%>
</div>
<div class="col-md-6">
<%if cod<>"" then
Sql= "SELECT provincia FROM descuentosRel WHERE id_descuento="&cod&" and provincia<>'' AND provincia IS NOT NULL"   '[ASOCIAMOS CON UN provincia]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_provincia=ob_rs("provincia")
end if
ob_rs.close
end if
%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="provincia" style="padding-right:25px">Provincia.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="provincia" id="provincia" style="margin-right:16px;width:100%;" class="select-provincia inp"><option value="" selected="selected">Provincia</option><option value="ALAVA"<%if u_provincia = "ALAVA" then%>Selected<%end if%>>ALAVA</option><option value="ALBACETE" <%if u_provincia = "ALBACETE" then%>Selected<%end if%>>ALBACETE</option><option value="ALICANTE" <%if u_provincia = "ALICANTE" then%>Selected<%end if%>>ALICANTE</option><option value="ALMERIA" <%if u_provincia = "ALMERIA" then%>Selected<%end if%>>ALMERIA</option><option value="ASTURIAS" <%if u_provincia = "ASTURIAS" then%>Selected<%end if%>>ASTURIAS</option><option value="AVILA" <%if u_provincia = "AVILA" then%>Selected<%end if%>>AVILA</option><option value="BADAJOZ" <%if u_provincia = "BADAJOZ" then%>Selected<%end if%>>BADAJOZ</option><option value="BARCELONA" <%if u_provincia = "BARCELONA" then%>Selected<%end if%>>BARCELONA</option><option value="BURGOS" <%if u_provincia = "BURGOS" then%>Selected<%end if%>>BURGOS</option><option value="CACERES" <%if u_provincia = "CACERES" then%>Selected<%end if%>>CACERES</option><option value="CADIZ" <%if u_provincia = "CADIZ" then%>Selected<%end if%>>CADIZ</option><option value="CANTABRIA" <%if u_provincia = "CANTABRIA" then%>Selected<%end if%>>CANTABRIA</option><option value="CASTELLON" <%if u_provincia = "CASTELLON" then%>Selected<%end if%>>CASTELLON</option><option value="CEUTA" <%if u_provincia = "CEUTA" then%>Selected<%end if%>>CEUTA</option><option value="CIUDAD REAL" <%if u_provincia = "CIUDAD REAL" then%>Selected<%end if%>>CIUDAD REAL</option><option value="CORDOBA" <%if u_provincia = "CORDOBA" then%>Selected<%end if%>>CORDOBA</option><option value="CORU&Ntilde;A, A" <%if u_provincia = "CORU&Ntilde;A, A" then%>Selected<%end if%>>CORU&Ntilde;A, A</option><option value="CUENCA" <%if u_provincia = "CUENCA" then%>Selected<%end if%>>CUENCA</option><option value="GIRONA" <%if u_provincia = "GIRONA" then%>Selected<%end if%>>GIRONA</option><option value="GRANADA" <%if u_provincia = "GRANADA" then%>Selected<%end if%>>GRANADA</option><option value="GUADALAJARA" <%if u_provincia = "GUADALAJARA" then%>Selected<%end if%>>GUADALAJARA</option><option value="GUIPUZCOA" <%if u_provincia = "GUIPUZCOA" then%>Selected<%end if%>>GUIPUZCOA</option><option value="HUELVA" <%if u_provincia = "HUELVA" then%>Selected<%end if%>>HUELVA</option><option value="HUESCA" <%if u_provincia = "HUESCA" then%>Selected<%end if%>>HUESCA</option><option value="ILLES BALEARS" <%if u_provincia = "ILLES BALEARS" then%>Selected<%end if%>>ILLES BALEARS</option><option value="JAEN" <%if u_provincia = "JAEN" then%>Selected<%end if%>>JAEN</option><option value="LEON" <%if u_provincia = "LEON" then%>Selected<%end if%>>LEON</option><option value="LLEIDA" <%if u_provincia = "LLEIDA" then%>Selected<%end if%>>LLEIDA</option><option value="LUGO" <%if u_provincia = "LUGO" then%>Selected<%end if%>>LUGO</option><option value="MADRID" <%if u_provincia = "MADRID" then%>Selected<%end if%>>MADRID</option><option value="MALAGA" <%if u_provincia = "MALAGA" then%>Selected<%end if%>>MALAGA</option><option value="MELILLA" <%if u_provincia = "MELILLA" then%>Selected<%end if%>>MELILLA</option><option value="MURCIA" <%if u_provincia = "MURCIA" then%>Selected<%end if%>>MURCIA</option><option value="NAVARRA" <%if u_provincia = "NAVARRA" then%>Selected<%end if%>>NAVARRA</option><option value="OURENSE" <%if u_provincia = "OURENSE" then%>Selected<%end if%>>OURENSE</option><option value="PALENCIA" <%if u_provincia = "PALENCIA" then%>Selected<%end if%>>PALENCIA</option><option value="PALMAS, LAS" <%if u_provincia = "PALMAS, LAS" then%>Selected<%end if%>>PALMAS, LAS</option><option value="PONTEVEDRA" <%if u_provincia = "PONTEVEDRA" then%>Selected<%end if%>>PONTEVEDRA</option><option value="RIOJA, LA" <%if u_provincia = "RIOJA, LA" then%>Selected<%end if%>>RIOJA, LA</option><option value="SALAMANCA" <%if u_provincia = "SALAMANCA" then%>Selected<%end if%>>SALAMANCA</option><option value="SANTA CRUZ DE TENERIFE" <%if u_provincia = "SANTA CRUZ DE TENERIFE" then%>Selected<%end if%>>SANTA CRUZ DE TENERIFE</option><option value="SEGOVIA" <%if u_provincia = "SEGOVIA" then%>Selected<%end if%>>SEGOVIA</option><option value="SEVILLA" <%if u_provincia = "SEVILLA" then%>Selected<%end if%>>SEVILLA</option><option value="SORIA" <%if u_provincia = "SORIA" then%>Selected<%end if%>>SORIA</option><option value="TARRAGONA" <%if u_provincia = "TARRAGONA" then%>Selected<%end if%>>TARRAGONA</option><option value="TERUEL" <%if u_provincia = "TERUEL" then%>Selected<%end if%>>TERUEL</option><option value="TOLEDO" <%if u_provincia = "TOLEDO" then%>Selected<%end if%>>TOLEDO</option><option value="VALENCIA" <%if u_provincia = "VALENCIA" then%>Selected<%end if%>>VALENCIA</option><option value="VALLADOLID" <%if u_provincia = "VALLADOLID" then%>Selected<%end if%>>VALLADOLID</option><option value="VIZCAYA" <%if u_provincia = "VIZCAYA" then%>Selected<%end if%>>VIZCAYA</option><option value="ZAMORA" <%if u_provincia = "ZAMORA" then%>Selected<%end if%>>ZAMORA</option><option value="ZARAGOZA" <%if u_provincia = "ZARAGOZA" then%>Selected<%end if%>>ZARAGOZA</option><option value="OTRAS" <%if u_provincia = "OTRAS" then%>Selected<%end if%>>OTRAS</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i></div>
</div>
</div>
<% '[FIN ASOCIAMOS CON UN provincia]
Sql= "SELECT a_ciudad FROM alumnos GROUP BY a_ciudad ORDER BY a_ciudad"   '[ASOCIAMOS CON UN CIUDAD]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="ciudad" style="padding-right:25px">Ciudad.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="ciudad" id="ciudad" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
if cod<>""then
Sql2= "SELECT ciudad from descuentosRel where id_descuento = "&cod&" and ciudad= '"&ob_rs("a_ciudad")&"'"  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=ob_rs("a_ciudad")%>" <%if sel="si" then%>Selected<%end if%>><%=ob_rs("a_ciudad")%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-marker" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún alumno creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN CIUDAD]%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="anyo" style="padding-right:25px">Año programa.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="anyo" id="anyo" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%if cod<>""then
Sql2= "SELECT anyo from descuentosRel where id_descuento = "&cod&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
if ob_rs2("anyo")=year(date) then anyo_con1="si" end if
if ob_rs2("anyo")=year(date)+1 then anyo_con2="si" end if
if ob_rs2("anyo")=year(date)+2 then anyo_con3="si" end if
ob_rs2.movenext
loop
end if
ob_rs2.close
end if%>
<option value="<%=year(date)%>" <%if anyo_con1="si" then%>Selected<%end if%>><%=year(date)%></option>
<option value="<%=year(date)+1%>" <%if anyo_con2="si" then%>Selected<%end if%>><%=year(date)+1%></option>
<option value="<%=year(date)+2%>" <%if anyo_con3="si" then%>Selected<%end if%>><%=year(date)+2%></option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar-o" aria-hidden="true"></i></div>
</div>
</div>


<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="mes" style="padding-right:25px">Mes programa.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="mes" id="mes" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%if cod<>""then
Sql2= "SELECT mes from descuentosRel where id_descuento = "&cod&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof
if ob_rs2("mes")="Enero" then mes_1="si" end if
if ob_rs2("mes")="Febrero" then mes_2="si" end if
if ob_rs2("mes")="Marzo" then mes_3="si" end if
if ob_rs2("mes")="Abril" then mes_4="si" end if
if ob_rs2("mes")="Mayo" then mes_5="si" end if
if ob_rs2("mes")="Junio" then mes_6="si" end if
if ob_rs2("mes")="Julio" then mes_7="si" end if
if ob_rs2("mes")="Agosto" then mes_8="si" end if
if ob_rs2("mes")="Septiembre" then mes_9="si" end if
if ob_rs2("mes")="Octubre" then mes_10="si" end if
if ob_rs2("mes")="Noviembre" then mes_11="si" end if
if ob_rs2("mes")="Diciembre" then mes_12="si" end if
ob_rs2.movenext
loop
end if
ob_rs2.close
end if%>
<option value="Enero" <%if mes_1="si" then%>Selected<%end if%>>Enero <%=mes_t%> </option>
<option value="Febrero" <%if mes_2="si" then%>Selected<%end if%>>Febrero</option>
<option value="Marzo" <%if mes_3="si" then%>Selected<%end if%>>Marzo</option>
<option value="Abril" <%if mes_4="si" then%>Selected<%end if%>>Abril</option>
<option value="Mayo" <%if mes_5="si" then%>Selected<%end if%>>Mayo</option>
<option value="Junio" <%if mes_6="si" then%>Selected<%end if%>>Junio</option>
<option value="Julio" <%if mes_7="si" then%>Selected<%end if%>>Julio</option>
<option value="Agosto" <%if mes_8="si" then%>Selected<%end if%>>Agosto</option>
<option value="Septiembre" <%if mes_9="si" then%>Selected<%end if%>>Septiembre</option>
<option value="Octubre" <%if mes_10="si" then%>Selected<%end if%>>Octubre</option>
<option value="Noviembre" <%if mes_11="si" then%>Selected<%end if%>>Noviembre</option>
<option value="Diciembre" <%if mes_12="si" then%>Selected<%end if%>>Diciembre</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i></div>
</div>
</div>
<%Sql= "SELECT u_nombre, u_apellidos, id_usuario, u_empresa, u_agente FROM usuarios WHERE u_agente='si' ORDER BY u_apellidos DESC"   '[ASOCIAMOS CON UN USUARIOS]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_agente" style="padding-right:25px">Agentes.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_agente" id="id_agente" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
if cod<>""then
Sql2= "SELECT id_usuario from descuentosRel where id_descuento = "&cod&" and id_agente= "&ob_rs("id_usuario")&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=ob_rs("id_usuario")%>" <%if sel="si" then%>Selected<%end if%>><%=ob_rs("u_apellidos")%>, <%=ob_rs("u_nombre")%> <%if ob_rs("u_agente")="si" and ob_rs("u_empresa")<>""then%> - (<%=ob_rs("u_empresa")%>)<%end if%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-suitcase" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún agente creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN USUARIOS]%>
</div></div></div>
<div class="col-md-12"><div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="texto_esp">Descripción.</label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea></div></div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-3 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_descuentos(this.form);"  language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar / crear descuento</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>descuentos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div></div></div></div>
</div><!--ACCIONES fin form-body-->
</form></div></div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL--><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/js/validador.js" type="text/javascript"></script><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>$(document).ready(function() {$('select').select2({minimumResultsForSearch: -1,language: "es"})
$("[name='repetible'],[name='activo']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});})</script><