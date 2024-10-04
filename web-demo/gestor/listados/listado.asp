<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<%proc = request_equerystring("proc") 'INDICA PROCEDENCIA MENU SUP "alumnos"
t = request_equerystring("t")%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Listados </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li class="active">Listados</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Listado</span><%if pr_contabilidad_ad="si" and t="lst_fact" then%><span class="caption-subject font-green  "> *Selecciona grupos para obtener resultados</span><%end if%></div></div>
<div class="portlet-body">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ok_env_mail"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Mails enviados con éxito!!</div><%end if%>
<%if ms="del_gest"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> registros eliminados con éxito!!</div><%end if%>
<form action="listado2.asp" method="post" name="envio" class="form-horizontal" id="envio"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="t" type="hidden" value="<%=t%>">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-12">
<%if pr_contabilidad_ad="si" and t="cont" then%>
<div class="form-group form-md-line-input " style="margin-bottom:30px;padding-bottom:30px;border-bottom:3px solid #ddd">
<label class="col-md-2 control-label col-md-offset-2" for="pagos" style="padding-right:25px">Pagos.</label>
<div class="col-md-3"  style="padding-left:5px"><div class="input-icon"><select name="pagos" id="pagos" class="select-100">
<option value="pendientes" >Pendientes (*sin contabilizar facturas anexas)</option><option value="completados" >Completados (*sin contabilizar facturas anexas)</option></option></select><div class="form-control-focus"> </div><i class="fa fa-money" aria-hidden="true"></i><span class="help-block">selecciona un tipo de pago</span></div></div></div>
<%end if%>
<%if pr_contabilidad_ad="si" and t="fact" then%>
<%Sql= "SELECT  mid(n_factura,7,2) AS n_factura FROM programas UNION select  mid(n_factura,7,2) AS n_factura from facturas "
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then%>
<div style="width:100%;max-width:720px;margin:0 auto;"><div class="form-group form-md-line-input  col-md-9">
<label class="col-md-5 control-label " for="anyo_fact" style="padding-right:25px">Año factura principal.<span class="required"></span></label>
<div class="col-md-7"  style="padding-left:5px"><div class="input-icon">
<select name="anyo_fact" id="anyo_fact" class="select-100">
<option value="" >Ver todas las facturas</option>
<%do while not ob_rs.eof
factureta="20"&ob_rs("n_factura")
if int(len(factureta)=4) then %>
<option value="<%=factureta%>"><%=factureta%></option>
<%end if
ob_rs.movenext
loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">selecciona una categoría</span></div></div></div></div>
<%end if
ob_rs.close
end if%>

<%if pr_contabilidad_ad="si" and t="refPago" then%>
<div class="form-group form-md-line-input " style="margin-bottom:30px;padding-bottom:30px;border-bottom:3px solid #ddd">
<label class="col-md-2 control-label col-md-offset-2" for="refPago" style="padding-right:25px">Ref pago.</label>
<div class="col-md-3"  style="padding-left:5px"><div class="input-icon">
<input type="text" class="form-control" id="refPago" name="refPago" value="" placeholder="dejar en blanco para ver todos"><div class="form-control-focus"></div>
<div class="form-control-focus"> </div><i class="fa fa-search" aria-hidden="true"></i><span class="help-block">escribe una referencia</span></div></div></div>
<%end if%>
<%if t<>"fact" then%>
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
tit_categoria=ob_rs("titulo_esp")%>
<option value="<%=id_categoria%>"><%=tit_categoria%>&nbsp;
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
<div class="col-md-2" ></div>
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
tit_seccion=ob_rs("titulo_esp")%>
<option value="<%=id_seccion%>"><%=tit_seccion%>&nbsp;
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
<div class="col-md-12" ><div class="col-md-2" ></div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ninguna sección creada</div>
</div></div>
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
tit_destino=ob_rs("titulo_esp")%>
<option value="<%=id_destino%>"><%=tit_destino%>
<%ob_rs.movenext
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
Sql= "SELECT items.id_item, items.titulo_of_esp,items.titulo_esp,  categorias.titulo_esp, rel.id_item FROM rel, items, categorias WHERE rel.id_item<>0 and rel.id_categoria<> 0 and items.id_item=rel.id_item AND rel.id_categoria=categorias.id_categoria AND (eliminado <>'si' or eliminado IS NULL) GROUP BY rel.id_item, items.id_item, rel.id_categoria, items.titulo_of_esp, categorias.titulo_esp,items.titulo_esp ORDER BY categorias.titulo_esp, items.titulo_of_esp"  
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
cat=ob_rs("categorias.titulo_esp")%>
<option value="<%=id_item%>"><%=tit_item%> - <%=ob_rs("items.titulo_esp")%> - (<%=cat%>)</option>
<%ob_rs.movenext
tit_destino=""
id_destino=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un programa</span></div>
</div>
</div>
<%else%>
<div class="col-md-12" ><div class="col-md-2" ></div><div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún programa creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN PROGRAMA]
Sql= "SELECT u_nombre, u_apellidos, id_usuario, u_empresa, u_agente FROM usuarios WHERE u_email<>'' AND u_email IS NOT NULL AND u_agente IS NULL AND u_apellidos<>'' OR (u_agente IS NOT NULL AND u_agente<>'si') ORDER BY u_apellidos"   '[ASOCIAMOS CON UN USUARIOS]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_item" style="padding-right:25px">Usuarios.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_usuario" id="id_usuario" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_usuario")%>" <%if sel="si" then%>Selected<%end if%>><%=ob_rs("u_apellidos")%>, <%=ob_rs("u_nombre")%> <%if ob_rs("u_agente")="si" and ob_rs("u_empresa")<>""then%> - (<%=ob_rs("u_empresa")%>)<%end if%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-user-o" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" ><div class="col-md-2" ></div><div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún usuario creado.</div></div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN USUARIOS]
Sql= "SELECT a_nombre, a_apellidos, id_alumno FROM alumnos WHERE(a_email <>'' AND a_email IS NOT NULL ) or (a_p_email <>'' AND a_p_email IS NOT NULL) or (a_m_email <>'' AND a_m_email IS NOT NULL)ORDER BY a_apellidos"   '[ASOCIAMOS CON UN ALUMNOS]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_item" style="padding-right:25px">Alumnos.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_alumno" id="id_alumno" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_alumno")%>"><%=ob_rs("a_apellidos")%>, <%=ob_rs("a_nombre")%></option>
<%ob_rs.movenext%>
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
<%Sql= "SELECT a_provincia FROM alumnos WHERE a_provincia<>'0' GROUP BY a_provincia ORDER BY a_provincia"   '[ASOCIAMOS CON UN provincia]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="provincia" style="padding-right:25px">Provincia.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="provincia" id="provincia" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("a_provincia")%>"><%=ob_rs("a_provincia")%></option>
<%ob_rs.movenext
loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i></div>
</div></div>
<%else%>
<div class="col-md-12" ><div class="col-md-2" ></div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún alumno creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN provincia]
Sql= "SELECT a_ciudad FROM alumnos WHERE(a_email <>'' AND a_email IS NOT NULL ) or (a_p_email <>'' AND a_p_email IS NOT NULL) or (a_m_email <>'' AND a_m_email IS NOT NULL) GROUP BY a_ciudad ORDER BY a_ciudad"   '[ASOCIAMOS CON UN CIUDAD]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="ciudad" style="padding-right:25px">Ciudad.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="ciudad" id="ciudad" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("a_ciudad")%>"><%=ob_rs("a_ciudad")%></option>
<%ob_rs.movenext
loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-marker" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" ><div class="col-md-2" ></div><div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún alumno creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN CIUDAD]
Sql= "SELECT year(f_inicio) AS anyo FROM programas GROUP BY year(f_inicio) ORDER BY year(f_inicio)"   '[ASOCIAMOS CON AÑO CURSO]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="anyo" style="padding-right:25px">Año programa.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="anyo" id="anyo" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("anyo")%>"><%if ob_rs("anyo")="1000" then%>Sin especificar<%else%><%=ob_rs("anyo")%><%end if%></option>
<%ob_rs.movenext%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar-o" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON AÑO CURSO]
Sql= "SELECT month(f_inicio) AS mes FROM programas GROUP BY month(f_inicio) ORDER BY month(f_inicio)"   '[ASOCIAMOS CON MES CURSO]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="mes" style="padding-right:25px">Mes programa.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="mes" id="mes" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
mes_t=ob_rs("mes")
Select case mes_t
Case 1
mes_tt="Enero"
Case 2
mes_tt="Febrero"
Case 3
mes_tt="Marzo"
Case 4
mes_tt="Abril"
Case 5
mes_tt="Mayo"
Case 6
mes_tt="Junio"
Case 7
mes_tt="Julio"
Case 8
mes_tt="Agosto"
Case 9
mes_tt="Septiembre"
Case 10
mes_tt="Octubre"
Case 11
mes_tt="Noviembre"
Case 12
mes_tt="Diciembre"
end select%>
<option value="<%=ob_rs("mes")%>"><%=mes_tt%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i></div>
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
ob_rs.close                              '[FIN ASOCIAMOS CON MES CURSO]
Sql= "SELECT u_nombre, u_apellidos, id_usuario, u_empresa, u_agente FROM usuarios WHERE u_email<>'' AND u_email IS NOT NULL AND u_agente='si'  ORDER BY u_apellidos DESC"   '[ASOCIAMOS CON UN USUARIOS]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_agente" style="padding-right:25px">Agentes.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="id_agente" id="id_agente" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_usuario")%>"><%=ob_rs("u_apellidos")%>, <%=ob_rs("u_nombre")%> <%if ob_rs("u_agente")="si" and ob_rs("u_empresa")<>""then%> - (<%=ob_rs("u_empresa")%>)<%end if%></option>
<%ob_rs.movenext
loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-suitcase" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" ><div class="col-md-2" ></div><div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún agente creado.</div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN USUARIOS]

Sql= "SELECT cod_descuento FROM programas GROUP BY cod_descuento ORDER BY cod_descuento"   '[ASOCIAMOS CON AÑO CURSO]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="anyo" style="padding-right:25px">Cód. descuento.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="cod_descuento" id="cod_descuento" class="select-100" multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("cod_descuento")%>"><%=ob_rs("cod_descuento")%></option>
<%ob_rs.movenext%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-tag" aria-hidden="true"></i></div>
</div>
</div>
<%end if
ob_rs.close                              '[FIN ASOCIAMOS CON AÑO CURSO]%>
</div>
<%end if%>
</div></div></div></div>
<%if t<>"fact" then%><div class="form-body">                                                 
<div class="form-actions"><div class="row"><div class="col-md-12"><div class="col-md-5"><a href="javascript:toggle_to();" class="btn green"><i class="fa fa-list" aria-hidden="true"></i> opciones a mostrar</a></div></div></div></div>
<div class="form-body" id="opciones"> <div class="form-actions"><div class="row"><div class="col-md-12" ><div class="col-md-7" style="padding-left:0px;margin-bottom:25px"><div class="campos_obliga form-md-checkboxes" style="color:#999">
<div class="md-checkbox form-md-checkboxes col-md-4" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="op_pagos" id="op_pagos" class="md-check" value="si" ><label for="op_pagos"><span></span><span class="check"></span><span class="box"></span> estado pagos. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_fech_ini" id="op_fech_ini" class="md-check" value="si" ><label for="op_fech_ini"><span></span><span class="check"></span><span class="box"></span> fecha inicio. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_fech_fin" id="op_fech_fin" class="md-check" value="si"><label for="op_fech_fin"><span></span><span class="check"></span><span class="box"></span> fecha fin. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_semanas" id="op_semanas" class="md-check" value="si"><label for="op_semanas"><span></span><span class="check"></span><span class="box"></span> semanas. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_aeropuertos" id="op_aeropuertos" class="md-check" value="si"><label for="op_aeropuertos"><span></span><span class="check"></span><span class="box"></span> aeropuertos. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_sexo" id="op_sexo" class="md-check" value="si"><label for="op_sexo"><span></span><span class="check"></span><span class="box"></span> sexo. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_enfermedades" id="op_enfermedades" class="md-check" value="si"><label for="op_enfermedades"><span></span><span class="check"></span><span class="box"></span> enfermedades. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_colegio" id="op_colegio" class="md-check" value="si"><label for="op_colegio"><span></span><span class="check"></span><span class="box"></span> colegio. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_transfer" id="op_transfer" class="md-check" value="si"><label for="op_transfer"><span></span><span class="check"></span><span class="box"></span> transfer. </label></div>

<div class="md-checkbox"><input type="checkbox" name="op_cad_pasaporte" id="op_cad_pasaporte" class="md-check" value="si"><label for="op_cad_pasaporte"><span></span><span class="check"></span><span class="box"></span> caducidad pasaporte. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_observaciones" id="op_observaciones" class="md-check" value="si"><label for="op_observaciones"><span></span><span class="check"></span><span class="box"></span> observaciones. </label></div>
<%if pr_observaciones="si" then%>
<div class="md-checkbox"><input type="checkbox" name="op_observaciones_int" id="op_observaciones_int" class="md-check" value="si"><label for="op_observaciones_int"><span></span><span class="check"></span><span class="box"></span> observaciones internas. </label></div>
<%end if%>

</div>
<div class="md-checkbox form-md-checkboxes col-md-4" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="op_ciudad" id="op_ciudad" class="md-check" value="si"><label for="op_ciudad"><span></span><span class="check"></span><span class="box"></span> ciudad. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_pasaporte" id="op_pasaporte" class="md-check" value="si"><label for="op_pasaporte"><span></span><span class="check"></span><span class="box"></span> pasaporte. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_mov_padre" id="op_mov_padre" class="md-check" value="si"><label for="op_mov_padre"><span></span><span class="check"></span><span class="box"></span> movil padre. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_mov_madre" id="op_mov_madre" class="md-check" value="si"><label for="op_mov_madre"><span></span><span class="check"></span><span class="box"></span> movil madre. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_nif" id="op_nif" class="md-check" value="si"><label for="op_nif"><span></span><span class="check"></span><span class="box"></span> NIF. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_total" id="op_total" class="md-check" value="si"><label for="op_total"><span></span><span class="check"></span><span class="box"></span> importe total. </label></div>
<%if pr_contabilidad_ad="si" then%>
<div class="md-checkbox"><input type="checkbox" name="op_falta" id="op_falta" class="md-check" value="si"><label for="op_falta"><span></span><span class="check"></span><span class="box"></span> falta pagar. </label></div>
<%end if%>
<div class="md-checkbox"><input type="checkbox" name="op_agente" id="op_agente" class="md-check" value="si"><label for="op_agente"><span></span><span class="check"></span><span class="box"></span> agente. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_cumple" id="op_cumple" class="md-check" value="si"><label for="op_cumple"><span></span><span class="check"></span><span class="box"></span> cumpleaños. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_direccion" id="op_direccion" class="md-check" value="si"><label for="op_direccion"><span></span><span class="check"></span><span class="box"></span> dirección. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_opciones" id="op_opciones" class="md-check" value="si"><label for="op_opciones"><span></span><span class="check"></span><span class="box"></span> opciones escogidas. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_pagado" id="op_pagado" class="md-check" value="si"><label for="op_pagado"><span></span><span class="check"></span><span class="box"></span> total pagado. </label></div>
</div>
<div class="md-checkbox form-md-checkboxes col-md-4" style="color:#999">
<div class="md-checkbox"><input type="checkbox" name="op_movil" id="op_movil" class="md-check" value="si"><label for="op_movil"><span></span><span class="check"></span><span class="box"></span> móvil. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_movil_sms" id="op_movil_sms" class="md-check" value="si"><label for="op_movil_sms"><span></span><span class="check"></span><span class="box"></span> móvil sms. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_mail" id="op_mail" class="md-check" value="si"><label for="op_mail"><span></span><span class="check"></span><span class="box"></span> mail. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_mail_padre" id="op_mail_padre" class="md-check" value="si"><label for="op_mail_padre"><span></span><span class="check"></span><span class="box"></span> mail padre. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_mail_madre" id="op_mail_madre" class="md-check" value="si"><label for="op_mail_madre"><span></span><span class="check"></span><span class="box"></span> mail madre. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_seg_cancela" id="op_seg_cancela" class="md-check" value="si"><label for="op_seg_cancela"><span></span><span class="check"></span><span class="box"></span> seguro cancelación. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_seg_medico" id="op_seg_medico" class="md-check" value="si"><label for="op_seg_medico"><span></span><span class="check"></span><span class="box"></span> seguro médico. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_provincia" id="op_provincia" class="md-check" value="si"><label for="op_provincia"><span></span><span class="check"></span><span class="box"></span> provincia. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_n_padre" id="op_n_padre" class="md-check" value="si"><label for="op_n_padre"><span></span><span class="check"></span><span class="box"></span> nombre padre. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_n_madre" id="op_n_madre" class="md-check" value="si">
<label for="op_n_madre"><span></span><span class="check"></span><span class="box"></span> nombre madre. </label></div>
<div class="md-checkbox"><input type="checkbox" name="op_medicamentos" id="op_medicamentos" class="md-check" value="si"><label for="op_medicamentos"><span></span><span class="check"></span><span class="box"></span> medicamentos. </label></div>
</div></div></div></div></div></div></div></div><%end if%>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_listado1(this.form);"  language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> realizar la selección</button>
</div></div></div></div>
</div>
<!--ACCIONES fin form-body-->
</form>
</div></div></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
$('#opciones').hide();
function Enviar_listado1 (form)  {	////////////////////////////////////   WEBS 
$('#spinner_back').show();
$('#spinner').show();
setTimeout(function(){ document.envio.submit(); }, 300);
return;}
function toggle_to(){$("#opciones").slideToggle( "slow" );}
$(document).ready(function() {$('select').select2({minimumResultsForSearch: -1,language: "es"})})
</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>