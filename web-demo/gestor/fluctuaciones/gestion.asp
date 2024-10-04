<!--#include file="../comun/menu_sup.asp"-->  
<%if cod<>""then
Sql= "SELECT titulo_esp,texto_esp,curso,alojamiento, disponible, fluctuacion from fluctuaciones where id_fluctuacion="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
curso=ob_rs("curso")
alojamiento=ob_rs("alojamiento")
disponible=ob_rs("disponible")
fluctuacion=ob_rs("fluctuacion")
end if
ob_rs.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<div class="breadcrumbs">
<h1>Gestión Fluctuaciones | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>fluctuaciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Fluctuaciones</a></li>
<li class="active">Gestión Fluctuación</li>
</ol>
</div>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>fluctuaciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i>Fluctuaciones
<%if num_fl<>""then%><span class="baddge badge badge-default"> <%=num_fl%> </span><%else%><span class="baddge badge badge-danger"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión</a></li>
</ul>
</nav>
</div>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Fluctuaciones
    <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
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
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Esta fluctuación ya se encuentra registrada.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div>
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="titulo_esp_f">
<label class="col-md-2 control-label" for="titulo_esp" > Nombre descriptivo.<span class="required">*</span></label>
<div class="col-md-7">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_f');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-pencil" aria-hidden="true"></i><span class="help-block">lo más conciso y descriptivo posible</span></div></div></div>
<div class="col-md-4">
<div class="form-group form-md-line-input" id="fluctuacion_f">
<label class="col-md-6 control-label" for="fluctuacion" style="padding-right:23px"> Fluctuación.<span class="required">*</span></label>
<div class="col-md-6"  style="padding-left:5px">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fluctuacion" id="fluctuacion" onKeyUp="resetea_error('fluctuacion_f');" maxlength="160" value="<%=fluctuacion%>"><div class="form-control-focus"> </div>
<i class="fa fa-area-chart" aria-hidden="true"></i><span class="help-block">cantidad a multiplicar</span></div></div></div>
</div>
<div class="col-md-6 ">
<div class="md-checkbox-inline" style="margin-top:25px" >
<div class="md-checkbox"><input name="curso" type="checkbox" class="md-check" id="curso" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if curso="si"then%>checked="checked"<%end if%> ><label for="curso">Aplicar a cursos </label></div>
<div class="md-checkbox"><input name="alojamiento" type="checkbox" class="md-check" id="alojamiento" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if alojamiento="si"then%>checked="checked"<%end if%>><label for="alojamiento"> Aplicar a alojamientos </label></div>
<div class="md-checkbox"><input name="disponible" type="checkbox" class="md-check" id="disponible" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if disponible="si"then%>checked="checked"<%end if%>><label for="disponible"> Activa </label></div>
</div>
</div>
<div class="col-md-12" style="border-bottom:1px solid #ddd;margin-top:25px"></div>
<div class="col-md-offset-2 col-md-7" >
<div class="note note-info magin-top-0" style="margin-bottom:30px;margin-top:30px"><h4 class="block">Sobre fluctuaciones</h4>
<p><i class="fa fa-info-circle" aria-hidden="true"></i> La fluctuación se puede aplicar sobre CATEGORÍA(s)  y/o SECCIÓN(es)  y/o SUBSECCION(es)  y/o PROGRAMA(s) y/o DESTINO(s). <br><i class="fa fa-info-circle" aria-hidden="true"></i> Cada asociación es opcional (O).<br>
  <i class="fa fa-info-circle" aria-hidden="true"></i> Cada asociación SUMA, NO FILTRA.
</p></div>
</div>
<div class="col-md-12">
<%Sql= "SELECT id_categoria, titulo_esp from categorias order by titulo_esp"   '[ASOCIAMOS CON UNA CAT]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sec="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_categoria" style="padding-right:25px">Categoría.<span class="required">(O)</span></label>
<div class="col-md-7"  style="padding-left:5px"><div class="input-icon">
<select name="id_categoria" id="id_categoria" multiple="multiple" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_categoria=ob_rs("id_categoria")
tit_categoria=ob_rs("titulo_esp")
	if cod<>""then
	Sql2= "SELECT id_fluctuacion, id_categoria from fluctuaciones_rel where id_fluctuacion = "&cod&" and id_categoria= "&id_categoria&""   '[ASOCIAMOS CON UNA CAT]
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
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
b=1%>
(
<%do while not ob_rs3_2.eof
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
	end if%>
<%ob_rs3_2.movenext
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
ob_rs.close
                              '[FIN ASOCIAMOS CON UNA CAT]%>
<%Sql= "SELECT id_seccion, titulo_esp from secciones order by titulo_esp"   '[ASOCIAMOS CON UNA SECCION]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sec="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_seccion" style="padding-right:25px">Sección.<span class="required">(O)</span></label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_seccion" id="id_seccion" multiple="multiple" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_seccion=ob_rs("id_seccion")
tit_seccion=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_fluctuacion, id_seccion,id_categoria from fluctuaciones_rel where id_fluctuacion = "&cod&" and id_seccion= "&id_seccion&" "   '[ASOCIAMOS CON UNA SEC]
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
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
<label class="col-md-2 control-label" for="id_subseccion" style="padding-right:25px">subSección.<span class="required">(O)</span></label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_subseccion" id="id_subseccion" multiple="multiple" class="select-100">
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_subseccion=ob_rs("id_subseccion")
tit_seccion=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_subseccion, id_seccion,id_categoria from fluctuaciones_rel where id_fluctuacion = "&cod&" and id_subseccion= "&id_subseccion&" "   '[ASOCIAMOS CON UNA SEC]
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
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
<label class="col-md-2 control-label" for="id_destino" style="padding-right:25px">País.<span class="required">(O)</span></label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_destino" id="id_destino" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_destino=ob_rs("id_destino")
tit_destino=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_destino, id_fluctuacion from fluctuaciones_rel where id_fluctuacion = "&cod&" and id_destino= "&id_destino&""  
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
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-7" style="padding-left:0px;margin-bottom:25px">
<div class="alert-info sin_regstros" ><i class="icon-note"></i> No hay ningún destino creado.</div>
</div>
</div><%end if
ob_rs.close                              '[FIN ASOCIAMOS CON UN PAIS]%>



<%Sql= "SELECT items.id_item, items.titulo_of_esp,items.titulo_esp,  categorias.titulo_esp, rel.id_item FROM rel, items, categorias WHERE rel.id_item<>0 and rel.id_categoria<> 0 and items.id_item=rel.id_item AND rel.id_categoria=categorias.id_categoria GROUP BY rel.id_item, items.id_item, rel.id_categoria, items.titulo_of_esp, categorias.titulo_esp,items.titulo_esp ORDER BY categorias.titulo_esp, items.titulo_of_esp"  
 '[ASOCIAMOS CON UN PROGRAMA]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_ite="si"%>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="id_item" style="padding-right:25px">Programa.<span class="required">(O)</span></label>
<div class="col-md-7" style="padding-left:5px"><div class="input-icon">
<select name="id_item" id="id_item" class="select-100"  multiple="multiple" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_item=ob_rs("rel.id_item")
tit_item=ob_rs("titulo_of_esp")
cat=ob_rs("categorias.titulo_esp")
if cod<>""then
Sql2= "SELECT id_item, id_fluctuacion from fluctuaciones_rel where id_fluctuacion = "&cod&" and id_item= "&id_item&""  
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
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
ob_rs.close                              '[FIN ASOCIAMOS CON UN PROGRAMA]%>
</div>
</div><!--col-md-12-->
<div class="col-md-12" style="border-top:1px solid #ddd;margin-top:35px;padding-top:25px">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="texto_esp">Descripción de la fluctuación.</label>
<div class="col-md-7"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-3 col-md-12">
<button type="button" class="btn green" onclick="Enviar_fluctuaciones(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<button type="reset" class="btn default"><i class="fa fa-eraser" aria-hidden="true"></i> resetear formulario</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>fluctuaciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
</div>
</div>
</div><!--form-body-->
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
<script src="/gestor/ckfinder/libs/sf.js"></script>
<script src="/gestor/ckfinder/libs/tree-a.js"></script>
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<script src="/gestor/ckfinder/ckfinder.js"></script>
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
$("[name='curso'],[name='alojamiento'],[name='disponible']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
$('select').select2({minimumResultsForSearch: -1,language: "es"})
})
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Basica'});
$("[name='nacional']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
var limita=function(){
var a=function(){
$("#ciudad").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
</script>