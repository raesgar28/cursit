<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<%if cod<>""then
Sql= "SELECT * from mailGrupo where id_mail_grupo="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
seleccion=ob_rs("seleccion")
seleccion = replace(seleccion, "jpk2", "'") 'jpk2 SON COMILLA SIMPLE
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
fecha_in=ob_rs("fecha_in")
fecha_mod=ob_rs("fecha_mod")
end if
ob_rs.close
end if
pos=request("pos")
if pos ="" then pos = request_equerystring("pos")
if cod<>""then
Sql= "SELECT * from mail where id_mail_grupo="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
estado_tit=ob_rs("estado")
else
estado_tit="Mail no creado"
ob_rs.close
end if
else
estado_tit="Grupo no creado"
end if%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Comunicados </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>circulares/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado comunicados</a></li>
<li class="active">Gestión</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>circulares/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i>Comunicados</a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión comunicado</a></li>
</ul></nav></div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Comunicado <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span> | <%=estado_tit%></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab"> Grupo </a></li>
<%if cod<>""then%><li><a href="#tab_2" data-toggle="tab"> eMail </a></li><%end if%>
<%if cod<>""then%><li><a href="#tab_3" data-toggle="tab"> Listado </a></li><%end if%>
<div class="actions btn-set pull-right" style="margin-left:15px">
<div class="btn-group">
<a class="btn green-haze btn-outline dropdown-toggle" style="padding-top:4px;padding-bottom:4px;margin-top:5px" href="javascript:;" data-toggle="dropdown">
<i class="fa fa-wrench" aria-hidden="true"></i> herramientas <i class="fa fa-angle-down"></i></a>
<div class="dropdown-menu pull-right"><!--NAV TABS & BREADS-->
<%if cod<>"" then
Sql= "SELECT * from mailGrupo_tmp where id_mail_grupo="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
hay="si"%>
<li><a href="javascript:enviarComunicado();"><i class="fa fa-envelope-o"></i> Enviar / Reenviar comunicado</a></li>
<li class="divider"></li>
<%end if
ob_rs.close
end if%>
<li><a href="javascript:eliminarComunicado();"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar comunicado</a></li>
</div>
</div>
</div>
</ul><!--NAV TABS-->
</div>
<div class="portlet-body">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ok_env_mail"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Mails enviados con éxito!!</div><%end if%>
<%if ms="del_gest"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> registros eliminados con éxito!!</div><%end if%>
<!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<form action="guardar_grupo.asp" method="post" name="envio" class="form-horizontal" id="envio"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body ">
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El nombre de Grupo ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-2 control-label" for="titulo_esp" > Nombre descriptivo.<span class="required">*</span></label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-pencil" aria-hidden="true"></i><span class="help-block">lo más conciso y descriptivo posible</span></div></div></div>
<div class="col-md-12" style="border-bottom:1px solid #ddd;margin-top:25px"></div>
<div class="col-md-12" >
<div class="note note-info magin-top-0" style="margin-bottom:30px;margin-top:30px"><h4 class="block">Sobre grupos</h4>
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
Sql2= "SELECT id_categoria from mailRel where id_mail_grupo = "&cod&" and id_categoria= "&id_categoria&""   '[ASOCIAMOS CON UNA CAT]
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
Sql2= "SELECT id_seccion,id_categoria from mailRel where id_mail_grupo = "&cod&" and id_seccion= "&id_seccion&" "   '[ASOCIAMOS CON UNA SEC]
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
Sql2= "SELECT id_destino from mailRel where id_mail_grupo= "&cod&" and id_destino= "&id_destino&""  
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
tit_item=ob_rs("items.titulo_esp")
cat=ob_rs("categorias.titulo_esp")
if cod<>""then
Sql2= "SELECT id_item from mailRel where id_mail_grupo = "&cod&" and id_item= "&id_item&""  
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
Sql= "SELECT u_nombre, u_apellidos, id_usuario, u_empresa, u_agente FROM usuarios WHERE u_email<>'' AND u_email IS NOT NULL AND u_agente IS NULL  OR (u_agente IS NOT NULL AND u_agente<>'si') ORDER BY u_apellidos"   '[ASOCIAMOS CON UN USUARIOS]
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
Sql2= "SELECT id_usuario from mailRel where id_mail_grupo = "&cod&" and id_usuario= "&ob_rs("id_usuario")&""  
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
<%do while not ob_rs.eof
if cod<>"" and ob_rs("id_alumno")<>"" then
Sql2= "SELECT id_alumno from mailRel where id_mail_grupo = "&cod&" and id_alumno= "&ob_rs("id_alumno")&""  
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
<%Sql= "SELECT a_provincia FROM alumnos WHERE(a_email <>'' AND a_email IS NOT NULL ) or (a_p_email <>'' AND a_p_email IS NOT NULL) or (a_m_email <>'' AND a_m_email IS NOT NULL) GROUP BY a_provincia ORDER BY a_provincia"   '[ASOCIAMOS CON UN provincia]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="provincia" style="padding-right:25px">Provincia.<span class="required"></span></label>
<div class="col-md-9" style="padding-left:5px"><div class="input-icon">
<select name="provincia" id="provincia" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
if cod<>""then
Sql2= "SELECT provincia from mailRel where id_mail_grupo = "&cod&" and provincia= '"&ob_rs("a_provincia")&"'"  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=ob_rs("a_provincia")%>" <%if sel="si" then%>Selected<%end if%>><%=ob_rs("a_provincia")%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-map-pin" aria-hidden="true"></i></div>
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
<%do while not ob_rs.eof
if cod<>""then
Sql2= "SELECT ciudad from mailRel where id_mail_grupo = "&cod&" and ciudad= '"&ob_rs("a_ciudad")&"'"  
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
<%do while not ob_rs.eof
if cod<>""then
Sql2= "SELECT anyo from mailRel where id_mail_grupo = "&cod&" and anyo= "&ob_rs("anyo")&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=ob_rs("anyo")%>" <%if sel="si" then%>Selected<%end if%>><%if ob_rs("anyo")="1000" then%>Sin específicar<%else%><%=ob_rs("anyo")%><%end if%></option>
<%ob_rs.movenext
sel=""%>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar-o" aria-hidden="true"></i></div>
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" ></div><div class="col-md-7" style="padding-left:0px;margin-bottom:25px"><div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún alumno creado.</div></div></div>
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
if cod<>""then
Sql2= "SELECT mes from mailRel where id_mail_grupo = "&cod&" and mes= "&ob_rs("mes")&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if
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
<option value="<%=ob_rs("mes")%>" <%if sel="si" then%>Selected<%end if%>><%=mes_tt%></option>
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
<%do while not ob_rs.eof
if cod<>""then
Sql2= "SELECT id_usuario from mailRel where id_mail_grupo = "&cod&" and id_agente= "&ob_rs("id_usuario")&""  
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
<div class="col-md-offset-4 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_circular_grupo(this.form);"  language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar / crear grupo</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>circulares/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div></div></div></div>
</div><!--ACCIONES fin form-body-->
</form>
</div><!--tab_1-->
<%if cod<>""then
Sql= "SELECT * from mail where id_mail_grupo="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
cod_mail=ob_rs("id_mail")
asunto_mail=ob_rs("asunto_mail")
texto_mail=ob_rs("texto_mail")
estado=ob_rs("estado")
n_letter=ob_rs("n_letter")
prueba=ob_rs("prueba")
fecha_envio=ob_rs("fecha_envio")
id_mail=ob_rs("id_mail")
end if
ob_rs.close%>
<div class="tab-pane documentos" id="tab_2" >
<form action="guardar_mail.asp" method="post" enctype="multipart/form-data" name="envio2" class="form-horizontal" id="envio2"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="id_mail_grupo" type="hidden" value="<%=cod%>"><%if cod_mail<>""then%><input name="cod" type="hidden" value="<%=cod_mail%>"><input name="op" type="hidden" value="up"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body ">
<div class="form-group form-md-line-input" id="asunto_mail_a"><label class="col-md-2 control-label" for="asunto_mail" > Asunto del email.<span class="required">*</span></label><div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="asunto_mail" id="asunto_mail" onKeyUp="resetea_error('asunto_mail_a');" maxlength="160" value="<%=asunto_mail%>"><div class="form-control-focus"> </div><i class="fa fa-pencil" aria-hidden="true"></i><span class="help-block">lo más conciso y descriptivo posible</span></div></div></div>
<div class="form-group form-md-line-input"><label class="col-md-2 control-label" for="texto_mail">Texto.</label><div class="col-md-8"><textarea class="form-control" name="texto_mail" id="texto_mail" rows="3"><%=texto_mail%></textarea></div></div>
<div class="row">
<%i=1
if id_mail<>""then
Sql= "SELECT * from mailArchivos where id_mail="&id_mail&" order by Id_mail_archivo"
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ofsetea="col-md-offset-2"
do while not ob_rs.eof and i<=4%>
<div class="col-md-5 col-sm-6 <%=ofsetea%>" style="margin-top:10px;margin-bottom:20px"><div class="col-md-12"><a href="../../up_docs/circulares/<%=ob_rs("nombre")%>" target="_blank"><%=ob_rs("nombre")%> <i class="fa fa-share" aria-hidden="true"></i></a></div>
<div class="md-checkbox col-md-12" style="margin-top:15px;margin-left:15px"><input type="checkbox" id="del_<%=i%>" class="c-check" value="<%=ob_rs("Id_mail_archivo")%>" name="del_<%=i%>" autocomplete="off" class="md-check"><label for="del_<%=i%>"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label></div></div>
<%i=i+1
if ofsetea="col-md-offset-2" then 
ofsetea=""
else
if ofsetea="" then 
ofsetea="col-md-offset-2"
end if
end if
ob_rs.movenext
loop
end if
ob_rs.close
end if
if i<4 then
if i=1 then ofsetea="col-md-offset-2" end if
do while i<=4%>
<div class="col-md-5 col-sm-6 <%=ofsetea%>" style="margin-top:10px;margin-bottom:20px">
<div class="col-md-10" style="padding:0"><input type="file" class="filestyle" id="archivo_<%=i%>" name="archivo_<%=i%>" data-buttonName="btn-primary" ></div>
<button type="button" class="btn default" id="limpia_archivo_<%=i%>" language="javascript"><i class="fa fa-trash" aria-hidden="true"></i></button>
</div>
<%i=i+1
if ofsetea="col-md-offset-2" then 
ofsetea=""
else
if ofsetea="" then 
ofsetea="col-md-offset-2"
end if
end if
loop
end if%>
</div>
<div class="form-group form-md-checkboxes"><label class="col-md-2 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-8"><div class="md-checkbox-inline"><div class="md-checkbox"><input name="prueba" type="checkbox" class="md-check" id="prueba"  value="si" <%if prueba="si"then%>checked="checked"<%end if%> ><label for="prueba"> Prueba </label></div><div class="md-checkbox"><input name="n_letter" type="checkbox" class="md-check" id="n_letter"  value="si" <%if n_letter="si"then%>checked="checked"<%end if%> ><label for="n_letter"> Newsletter </label></div></div></div></div>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_circular_mail(this.form);"  language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar eMail</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>circulares/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div></div>
</div>
</div>
</div>
</div>
</form>
</div><!--tab_2-->
<%end if%>
<%if cod<>""then%>
<div class="tab-pane" id="tab_3" >
<div class="portlet light">
<div class="portlet-title"><div class="caption font-green-sharp"><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="caption-subject bold uppercase"> Alumnos en el grupo</span>
</div>

<%if hay="si" then%>
<button type="button" class="btn red pull-right" value="enviar datos" onclick="javascript:eliminarTodas();"  language="javascript"><i class="fa fa-trash" aria-hidden="true"></i> eliminar seleccionados</button></div><div class="portlet-body">
<%end if%>


<div class="table-container">
<form name="formulario" action="envio.asp" method="post" >
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="check_on" id="check_on" type="hidden" value="0" autocomplete="off"><input name="check_on_sup" id="check_on_sup" type="hidden" value="0" autocomplete="off"><input name="cod" id="cod" type="hidden" value="<%=cod%>" autocomplete="off"><input name="accion" id="accion" type="hidden" value="del_gest" autocomplete="off">
<%Sql= "SELECT * from mailGrupo_tmp where id_mail_grupo="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
i=0%>
<table class="table table-striped table-bordered table-hover sample_1" id="listado" style="border:none" >
<thead>
<tr>
<th class="no_exp" style="text-align:center;max-width:20px">
<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
<input type="checkbox" class="group-checkable" onClick="checkUncheckAll(this);if (this.checked) marca_sup(1); else marca_sup('-1');" autocomplete="off" name="checkall" id="checkall" ><span></span>
</label>
</th>
<th>Apellidos, Nombre</th>
<th>Usuario / Agente</th>
<th style="min-width:200px"> Programa </th>
<th> email </th>
<th class="txt_centro" style="text-align:center;max-width:60px"> acc. </th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<td style="text-align:center;max-width:20px"><label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="checkboxes" value="<%=ob_rs("id_mail_grupo_tmp")%>" onClick="if (this.checked) marca(1); else marca('-1');" name="check" autocomplete="off" ><span></span></label></td>
<%Sql2= "SELECT a_nombre, a_apellidos, a_email from alumnos where id_alumno="&ob_rs("id_alumno")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
a_nombre=ob_rs2("a_nombre")
a_apellidos=ob_rs2("a_apellidos")
a_email=ob_rs2("a_email")
end if
ob_rs2.close
Sql2= "SELECT u_nombre, u_apellidos, u_agente, u_empresa from usuarios where id_usuario="&ob_rs("id_usuario")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
u_nombre=ob_rs2("u_nombre")
u_apellidos=ob_rs2("u_apellidos")
u_agente=ob_rs2("u_agente")
u_empresa=ob_rs2("u_empresa")
end if
ob_rs2.close
Sql2= "SELECT nom_item, nom_curso, f_inicio, fecha_in from programas where id_programa="&ob_rs("id_programa")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
nom_item=ob_rs2("nom_item")
nom_curso=ob_rs2("nom_curso")
f_inicio=ob_rs2("f_inicio")
fecha_in=ob_rs2("fecha_in")
end if
ob_rs2.close%>
<td><%=a_apellidos%>, <%=a_nombre%></td>
<td><%=u_apellidos%>, <%=u_nombre%> <%if u_agente="si" and u_empresa<>""then%>&nbsp;(<%=u_empresa%>)<%end if%></td>
<td><%=nom_item%> - <%=nom_curso%> (<%=year(f_inicio)%>)</td>
<td><%=a_email%></td>
<td style="text-align:center;max-width:60px"><a href="javascript:eliminarUna<%=i%>(<%=ob_rs("id_mail_grupo_tmp")%>);" style="color:#666"><i class="fa fa-trash" aria-hidden="true" ></i></a></td>
<div class="modal fade" id="confirmaEliminaUna<%=i%>" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el registro seleccionado?</div>
<div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEliminaUna_ok<%=i%>();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<script>function eliminarUna<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('show');}
function confirmarEliminaUna_ok<%=i%>(){$('#confirmaEliminaUna<%=i%>').modal('hide');$('#spinner_back').show();$('#spinner').show();//CAMBIAR ID WEB POR LA ID CORRESPONDIENTE
location.href='envio.jpk2?r=<%=r%>&rd=<%=rd%>&n=<%=n%>&ndos=<%=n2%>&ntres=<%=n3%>&ncuat=<%=n4%>&check=<%=ob_rs("id_mail_grupo_tmp")%>&accion=del_gest&cod=<%=cod%>&cod_cat=<%=cod_cat%>';}</script>
</tr>
<%ob_rs.movenext
i=i+1
loop%>
</tbody>
</table>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-3 col-md-12">
<div class="col-md-12">
<%if hay="si"then%>
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_circular_grupo2();"   language="javascript"><i class="fa fa-repeat" aria-hidden="true"></i> seleccionar de nuevo</button>
<%end if%>
<%if hay="si"then%>
<button type="button" class="btn green" value="enviar datos" onclick="enviarSeleccionados(this.form);"  language="javascript"><i class="fa fa-share-square-o" aria-hidden="true"></i> enviar a seleccionados</button>
<%end if%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>circulares/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div></div>
</div>
</div>
</div>
<%else%>
<div class="col-md-12" style="margin-top:45px;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> No existen alumnos con esos criterios de filtrado.</div>
<%end if
ob_rs.close%>
</form>
</div>
</div>
</div>
 
</div>
<%end if%>
</div><!--tab-content-->
</div></div></div></div></div></div>

<div class="modal fade" id="confirmaElimina" tabindex="-1" role="basic" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#666" aria-hidden="true"></i>  Atención</h4>
</div><div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el/los registros seleccionados? </div><div class="modal-footer"><button type="button" class="btn red " onClick="confirmarElimina_ok_gest();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<div class="modal fade" id="enviarSeleccionados" tabindex="-1" role="basic" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#666" aria-hidden="true"></i>  Atención</h4>
</div><div class="modal-body" id="alerta_txt"> ¿Seguro que deseas enviar el mail a los registros seleccionados? </div><div class="modal-footer"><button type="button" class="btn red " onClick="confirmarEnviar_ok();">Confirmar</button><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<div class="modal fade" id="sinSeleccion" tabindex="-1" role="basic" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No has seleccionado ningún registro</h4></div><div class="modal-body" id="alerta_txt"> Debes seleccionar al menos un registro para poder realizar alguna acción. </div><div class="modal-footer"><button type="button" class="btn green btn-green" data-dismiss="modal">Ok</button></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL--><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<div class="modal fade" id="confirmaEliminarComunicado" tabindex="-1" role="basic" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div><div class="modal-body"> ¿Seguro que deseas eliminar este comunicado?</div><div class="modal-footer"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&accion=del_comunicado"))%><a href="envio.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&accion=del_comunicado")%>" class="btn red " >Confirmar</a><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<div class="modal fade" id="enviarComunicado" tabindex="-1" role="basic" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle gris_666" aria-hidden="true"></i>  Atención</h4></div><div class="modal-body"> ¿Seguro que deseas enviar/reenviar este comunicado?</div><div class="modal-footer"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&accion=env_mail&proc=gest&cod="&cod))%><a href="envio.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod="&cod&"&accion=env_mail&proc=gest&cod="&cod)%>" class="btn red " >Confirmar</a><button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div></div></div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/js/validador.js" type="text/javascript"></script><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script><script src="/gestor/ckfinder/libs/sf.js"></script><script src="/gestor/ckfinder/libs/tree-a.js"></script><script src="<%=r%>ckeditor/ckeditor.js"></script><script src="/gestor/ckfinder/ckfinder.js"></script><script type="text/javascript" src="<%=r%>lib/js/bootstrap-filestyle.min.js"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script><script src="<%=r%>lib/js/upload/vendor/jquery.ui.widget.js"></script><script src="<%=r%>lib/js/upload/jquery.iframe-transport.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-process.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-image.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-validate.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-ui.js"></script><!--[if (gte IE 8)&(lt IE 10)]><script src="<%=r%>lib/js/upload/cors/jquery.xdr-transport.js"></script><![endif]--><link rel="stylesheet" href="<%=r%>lib/css/upload/style.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload-ui.css"><!--<script src="<%'=r%>lib/js/upload/main.js">--></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$("[name='prueba'],[name='n_letter']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});})
<%if cod<>""then%>
CKEDITOR.replace('texto_mail',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
<%end if%>
$("#archivo_1").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_1").filestyle('placeholder', 'Elegir archivo (1mb. max)');
$("#archivo_2").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_2").filestyle('placeholder', 'Elegir archivo (1mb. max)');
$("#archivo_3").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_3").filestyle('placeholder', 'Elegir archivo (1mb. max)');
$("#archivo_4").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_4").filestyle('placeholder', 'Elegir archivo (1mb. max)');
$("#limpia_archivo_1").click(function() {$("#archivo_1").filestyle('clear');});
$("#limpia_archivo_2").click(function() {$("#archivo_2").filestyle('clear');});
$("#limpia_archivo_3").click(function() {$("#archivo_3").filestyle('clear');});
$("#limpia_archivo_4").click(function() {$("#archivo_4").filestyle('clear');});
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
{orderable: false, targets:   5},//ULTIMA -> ACCIONES NO SE PUEDE ORDENAR
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
"pageLength": 20,
"dom": "<'row' <'col-md-12'B>><'table-scrollable't><'row' <'col-md-12'>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", 
});
$('#acciones > li > a.tool-action').on('click', function() {var action = $(this).attr('data-action');oTable.DataTable().button(action).trigger();});
$('#columnas').on('click', function() {var action = $(this).attr('data-action');oTable.DataTable().button(action).trigger();});
}
initTable3();
$('select').select2({minimumResultsForSearch: -1});
});
<%if cod<>""then%>
function marca_sup(parametro){
document.formulario.check_on_sup.value= (parseInt(document.formulario.check_on_sup.value)+parseInt(parametro));
if (document.getElementById('checkall').checked && document.formulario.check_on.value==0 )
{document.formulario.check_on.value=parseInt(document.formulario.check_on.value)+<%=i%>;}
else{
if (document.formulario.check_on.value!=0 && document.formulario.check_on_sup.value==0 ){
document.formulario.check_on.value=0;
}}}
<%end if%>
function titulo_esp(form) {Ctrl = form.titulo_esp;if (Ctrl.value == "") {id_txt="#titulo_esp_a";validatePrompt (Ctrl, "Debes introducir un título.",id_txt);return (false);	} 
else		
return (true);}
function Enviar_circular_grupo (form) { if (!titulo_esp(form)) return;$('#spinner_back').show();$('#spinner').show();setTimeout(function(){ document.envio.submit(); }, 300);return;}
function Enviar_circular_grupo2 () {$('#spinner_back').show();$('#spinner').show();setTimeout(function(){ document.envio.submit(); }, 300);return;}
function asunto_mail(form) {Ctrl = form.asunto_mail;if (Ctrl.value == "") {	id_txt=	"#asunto_mail_a";validatePrompt (Ctrl, "Debes introducir un asunto para el mail.",id_txt);return (false);
} else		
return (true);}
function Enviar_circular_mail (form)  {if (!asunto_mail(form)) return;$('#spinner_back').show();$('#spinner').show();setTimeout(function(){ document.envio2.submit(); }, 300);return;}

function confirmarElimina_ok_gest(){document.formulario.accion.value="del_gest";$('#confirmaElimina').modal('hide');$('#spinner_back').show();$('#spinner').show();setTimeout(function(){ document.formulario.submit(); }, 300);}

function enviarSeleccionados(){if (document.formulario.check_on.value>0 ) {$('#enviarSeleccionados').modal('show');}else{$('#sinSeleccion').modal('show');}}
function confirmarEnviar_ok(){document.formulario.accion.value="env";$('#enviarSeleccionados').modal('hide');$('#spinner_back').show();$('#spinner').show();setTimeout(function(){ document.formulario.submit(); }, 300);}
function eliminarComunicado(){$('#confirmaEliminarComunicado').modal('show');}
function enviarComunicado(){$('#enviarComunicado').modal('show');}
</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>