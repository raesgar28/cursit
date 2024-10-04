<!--#include file="../comun/menu_sup.asp"-->
<!--#include file="../../conex/conex_back.asp"-->  
<%if cod<>""then
Sql= "SELECT titulo_esp,texto_esp from packs where id_pack="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
end if
ob_rs.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]
Sql= "SELECT id_pack from packs where id_categoria ="&cod_cat&""     '[TOTAL PACKS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
num_pk=ob_rs.RecordCount
end if
ob_rs.close%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%Sql= "SELECT titulo_crm_esp,id_categoria from categorias where id_categoria="&cod_cat&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tit_categoria=ob_rs("titulo_crm_esp")
end if
ob_rs.close%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<div class="breadcrumbs">
<h1><%=tit_categoria%> | Gestión Packs</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncua&"&cod_cat="&cod_cat))%>
<a href="<%=r%>packs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>">Listado Packs</a></li>
<li class="active">Gestión Pack</li>
</ol>
</div>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>packs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>"><i class="icon-list"></i>Packs
<%if num_pk<>""then%><span class="baddge badge badge-default"> <%=num_pk%> </span><%else%><span class="baddge badge badge-danger"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión</a></li>
</ul>
</nav>
</div>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line"><div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Packs <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div></div>
<div class="portlet-body">




<form action="guardar.asp" method="post" enctype="multipart/form-data" name="envio" class="form-horizontal" id="envio"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%><input name="id_categoria_p" id="id_categoria_p" value="<%=cod_cat%>" type="hidden">
<div class="form-body ">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El nombre de Pack ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="form-body">
<div class="row">
<div class="col-md-12 documentos">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-2 control-label" for="titulo_esp" > Nombre descriptivo.<span class="required">*</span></label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-pencil" aria-hidden="true"></i><span class="help-block">lo más conciso y descriptivo posible</span></div></div></div>
<%i=1
if cod<>""then
Sql= "SELECT nombre, id_pack_rel_archivo from packs_rel_archivos where id_pack="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ofsetea="col-md-offset-2"
do while not ob_rs.eof and i<=4%>
<div class="col-md-5 col-sm-6 <%=ofsetea%>" style="margin-top:10px;margin-bottom:20px"><div class="col-md-12"><a href="../../up_docs/alu_packs/<%=ob_rs("nombre")%>" target="_blank"><%=ob_rs("nombre")%> <i class="fa fa-share" aria-hidden="true"></i></a></div>
<div class="md-checkbox col-md-12" style="margin-top:15px;margin-left:15px"><input type="checkbox" id="del_<%=i%>" class="c-check" value="<%=ob_rs("id_pack_rel_archivo")%>" name="del_<%=i%>" autocomplete="off" class="md-check"><label for="del_<%=i%>"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label></div></div>
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
<div class="col-md-12" style="border-bottom:1px solid #ddd;margin-top:25px"></div>
<div class="col-md-12" >
<div class="note note-info magin-top-0" style="margin-bottom:30px;margin-top:30px"><h4 class="block">Sobre packs</h4>
<p><i class="fa fa-info-circle" aria-hidden="true"></i> El pack se puede aplicar sobre SECCIÓN(es) y PROGRAMA(s) y DESTINO(s). <br>
<i class="fa fa-info-circle" aria-hidden="true"></i> Cada asociación SUMA.<br>
<i class="fa fa-info-circle" aria-hidden="true"></i> Si no se hace ninguna selección, se relacionan con la CATEGORIA completa.
</p></div>
</div>
<div class="col-md-12">
<input name="id_categoria" type="hidden" value="<%=cod_cat%>">
<%Sql= "SELECT id_seccion, titulo_esp from secciones order by titulo_esp"   '[ASOCIAMOS CON UNA SECCION]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sec="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_seccion" style="padding-right:25px">Sección.</label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_seccion" id="id_seccion" multiple="multiple" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_seccion=ob_rs("id_seccion")
tit_seccion=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_pack, id_seccion,id_categoria from packs_rel where id_pack = "&cod&" and id_seccion= "&id_seccion&" "   '[ASOCIAMOS CON UNA SEC]
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
id_categoria=ob_rs2("id_categoria")%>
(
<%Sql4= "SELECT id_categoria, titulo_crm_esp from categorias where id_categoria = "&id_categoria&" "   
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
ob_rs.close
                              '[FIN ASOCIAMOS CON UNA SECCION]%>
<%Sql= "SELECT id_subseccion, titulo_esp from subsecciones order by titulo_esp"   '[ASOCIAMOS CON UNA SUBSECCION]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sub="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_subseccion" style="padding-right:25px">subSección.</label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_subseccion" id="id_subseccion" multiple="multiple" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_subseccion=ob_rs("id_subseccion")
tit_seccion=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_subseccion, id_seccion,id_categoria from packs_rel where id_pack = "&cod&" and id_subseccion= "&id_subseccion&" "   '[ASOCIAMOS CON UNA SEC]
	Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
	ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if
Sql2= "SELECT id_subseccion, id_seccion,id_categoria from rel where id_subseccion= "&id_subseccion&""   '[ASOCIAMOS CON UNA SEC]
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
<div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona una subsección</span></div>
</div>
</div>
<%else
if cod=""then
end if
end if
ob_rs.close                              '[FIN ASOCIAMOS CON UNA SUBSECION]%>
<%Sql= "SELECT id_destino, titulo_esp from destinos order by titulo_esp"   '[ASOCIAMOS CON UNA PAIS]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_dest="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_destino" style="padding-right:25px">País.</label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_destino" id="id_destino" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_destino=ob_rs("id_destino")
tit_destino=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_destino, id_pack from packs_rel where id_pack = "&cod&" and id_destino= "&id_destino&""  
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
</div>
</div>
<%else%>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún destino creado.</div>
</div>
</div><%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN PAIS]%>

<%Sql= "SELECT items.id_item, items.titulo_of_esp,items.titulo_esp,  categorias.titulo_esp, rel.id_item FROM rel, items, categorias WHERE rel.id_item<>0 and rel.id_categoria<> 0 and items.id_item=rel.id_item AND rel.id_categoria=categorias.id_categoria GROUP BY rel.id_item, items.id_item, rel.id_categoria, items.titulo_of_esp, categorias.titulo_esp,items.titulo_esp ORDER BY categorias.titulo_esp, items.titulo_esp"  
 '[ASOCIAMOS CON UN PROGRAMA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_item" style="padding-right:25px">Programa.</label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_item" id="id_item" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_item=ob_rs("rel.id_item")
tit_item=ob_rs("items.titulo_esp")
cat=ob_rs("categorias.titulo_esp")
if cod<>""then
Sql2= "SELECT id_item, id_pack from packs_rel where id_pack = "&cod&" and id_item= "&id_item&""  
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_item%>" <%if sel="si" then%>Selected<%end if%>><%=ob_rs("items.titulo_esp")%> - (<%=cat%>)</option>
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
ob_rs.close                              '[FIN ASOCIAMOS CON UN PROGRAMA]%>
</div>
</div>
<div class="col-md-12">
<div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="texto_esp">Descripción.</label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->

<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_pack_prev();"  language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%>
<a href="<%=r%>packs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div><div class="col-md-3">


<div class="form-group form-md-checkboxes-inline">

<div class="col-md-2"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso" type="checkbox" class="md-check" id="mail_aviso" value="si"></div></div></div><label class="col-md-6 control-label" for="mail_aviso3"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>
Mail aviso.</label></div>

<div class="form-group form-md-checkboxes-inline">

<div class="col-md-2"><div class="md-checkbox-list"><div class="md-checkbox"><input name="mail_aviso_test" type="checkbox" class="md-check" id="mail_aviso_test" value="si"></div></div></div><label class="col-md-6 control-label" for="mail_aviso_test"><i class="fa fa-share" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i><i class="fa fa-envelope-o" aria-hidden="true" style="color:#ccc;margin-right:5px;"></i>
Mail TEST.</label></div>

</div></div>
</div>
</div>
</div><!--ACCIONES fin form-body-->


<div id="enviar_mail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span>Confirmar envío de mail</span></h4>
</div>

<div class="modal-body" id="enviar_mail_txt"> Alerta </div>

<div class="modal-footer">
<button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal" onClick="Enviar_packs(this.form);">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button></div>
</div>
</div>
</div>




</form>
</div><!--portlet-body-->
</div><!--portlet light portlet-fit portlet-form bordered-->
</div><!--page-content-col-->
</div><!--page-content-row-->
</div><!--page-content-container-->
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>

<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=r%>lib/js/bootstrap-filestyle.min.js"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/upload/vendor/jquery.ui.widget.js"></script><script src="<%=r%>lib/js/upload/jquery.iframe-transport.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-process.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-image.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-validate.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-ui.js"></script><!--[if (gte IE 8)&(lt IE 10)]><script src="<%=r%>lib/js/upload/cors/jquery.xdr-transport.js"></script><![endif]--><link rel="stylesheet" href="<%=r%>lib/css/upload/style.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload-ui.css"><!--<script src="<%'=r%>lib/js/upload/main.js">--></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$("[name='mail_aviso'],[name='mail_aviso_test']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"})
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("#archivo_1").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_1").filestyle('placeholder', 'Elegir archivo');
$("#archivo_2").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_2").filestyle('placeholder', 'Elegir archivo');
$("#archivo_3").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_3").filestyle('placeholder', 'Elegir archivo');
$("#archivo_4").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_4").filestyle('placeholder', 'Elegir archivo');
$("#limpia_archivo_1").click(function() {$("#archivo_1").filestyle('clear');});
$("#limpia_archivo_2").click(function() {$("#archivo_2").filestyle('clear');});
$("#limpia_archivo_3").click(function() {$("#archivo_3").filestyle('clear');});
$("#limpia_archivo_4").click(function() {$("#archivo_4").filestyle('clear');});


function Enviar_pack_prev(){
if (document.envio.mail_aviso.checked){
	
	var i;
	var text = "";
	var data = $('#id_seccion').select2('data');
	var s = $('#id_seccion');
	if(s.select2('data') && !!s.select2('data')[0]){text += "<b>Las siguientes secciones:</b><br>";}
	for (i = 0; i < 30; i++) {if(s.select2('data') && !!s.select2('data')[i]){text += data[i].text + "<br>";}} 
	if(s.select2('data') && !!s.select2('data')[0]){text += "<br>";}
	
	var i=0;
	var data = $('#id_destino').select2('data');
	var s = $('#id_destino');
	if(s.select2('data') && !!s.select2('data')[0]){text += "<b>Los siguientes destinos:</b><br>";}
	for (i = 0; i < 30; i++) {if(s.select2('data') && !!s.select2('data')[i]){text += data[i].text + "<br>";}} 
	if(s.select2('data') && !!s.select2('data')[0]){text += "<br>";}

	var i=0;
	var data = $('#id_item').select2('data');
	var s = $('#id_item');
	if(s.select2('data') && !!s.select2('data')[0]){text += "<b>Los siguientes programas:</b><br>";}
	for (i = 0; i < 30; i++) {if(s.select2('data') && !!s.select2('data')[i]){text += data[i].text + "<br>";}} 
	if(s.select2('data') && !!s.select2('data')[0]){text += "<br>";}
	if (text==''){text="<b>Atención enviarás a toda la categoría completa de <%=tit_categoria%></b><br>";}
	$('#enviar_mail_txt').html('<i class="fa fa-envelope-o" aria-hidden="true"></i> Enviarás mails a: <br /><br />'+text+'');$('#enviar_mail').modal('show');

	}else{
	Enviar_packs(document.envio);
	}
}
</script>