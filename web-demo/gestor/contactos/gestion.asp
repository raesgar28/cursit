<!--#include file="../comun/menu_sup.asp"-->  
<%if cod<>""then
Sql= "SELECT * from contactos where id_contacto="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre=ob_rs("nombre")
apellidos=ob_rs("apellidos")
telefono=ob_rs("telefono")
eMail=ob_rs("eMail")
comentario=ob_rs("comentario")
obs_internas=ob_rs("obs_internas")
n_letter=ob_rs("n_letter")
id_categoria=ob_rs("id_categoria")
id_item=ob_rs("id_item")
fecha_in=ob_rs("fecha_in")
fecha_nxt=ob_rs("fecha_nxt")
id_contactoCategoria=ob_rs("id_contactoCategoria")
estado=ob_rs("estado")
id_admin=ob_rs("id_admin")
end if
ob_rs.close

end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Contactos | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>contactos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Contactos</a></li>
<li class="active">Gestión Contactos</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>contactos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Contactos</a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Contacto</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=cntcat&ntres=s&ncuat="))%>
<a href="<%=r%>contactosCategorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=cntcat&ntres=s&ncuat=")%>"><i class="icon-note"></i> Categorías</a></li>
</ul>
</nav>
</div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Contacto 
    <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
<!--NAV TABS-->
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
<%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Este contacto ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="nombre_a">
<label class="col-md-4 control-label" for="nombre" >Nombre.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre" id="nombre" onKeyUp="resetea_error('nombre_a');" maxlength="160" value="<%=nombre%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="apellidos_a">
<label class="col-md-4 control-label" for="titulo_esp" >Apellidos.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="apellidos" id="apellidos" onKeyUp="resetea_error('apellidos_a');" maxlength="160" value="<%=apellidos%>"><div class="form-control-focus"> </div>
<i class="fa fa-user-o" aria-hidden="true"></i><span class="help-block">debes introducir los apellidos</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="titulo_esp" >Teléfonos.</label>
<div class="col-md-6">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="telefono" id="telefono"  maxlength="160" value="<%=telefono%>"><div class="form-control-focus"> </div>
<i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>
<div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="titulo_esp" >eMail.</label>
<div class="col-md-6">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="email" id="email" maxlength="160" value="<%=email%>"><div class="form-control-focus"> </div>
<i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un eMail</span></div></div></div>
<div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="id_web" >Tipo contacto.</label>
<div class="col-md-6" ><div class="input-icon">
<select name="id_contactoCategoria" id="id_contactoCategoria" class="select-100" >
<option value="" >&nbsp;</option>
<%Sql= "SELECT titulo_esp, id_contactoCategoria from contactosCategoria order by titulo_esp"     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="<%=ob_rs("id_contactoCategoria")%>" <%if id_contactoCategoria=ob_rs("id_contactoCategoria") then%>Selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
<i class="fa fa-list" aria-hidden="true"></i></div>
</div></div>


<div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="id_admin" >Agente encargado.</label>
<div class="col-md-6" ><div class="input-icon">
<select name="id_admin" id="id_admin" class="select-100" >
<option value="" >&nbsp;</option>
<%Sql= "SELECT nombre, apellidos, id_admin from admins order by apellidos"     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="<%=ob_rs("id_admin")%>" <%if id_admin=ob_rs("id_admin") then%>Selected<%end if%>><%=ob_rs("apellidos")%>,&nbsp;<%=ob_rs("nombre")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
<i class="fa fa-user-o" aria-hidden="true"></i></div>
</div></div>

</div>
<div class="col-md-6">
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="id_categoria" >Tipo alumno.</label>
<div class="col-md-8" ><div class="input-icon">
<select name="id_categoria" id="id_categoria" class="select-100" >
<option value="" >&nbsp;</option>
<%Sql= "SELECT titulo_esp, id_categoria from categorias order by titulo_esp"     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="<%=ob_rs("id_categoria")%>" <%if id_categoria=ob_rs("id_categoria") then%>Selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
<i class="fa fa-graduation-cap" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="id_web" >Interesado en.</label>
<div class="col-md-8" ><div class="input-icon">
<select name="id_item" id="id_item" class="select-100">
<option value="" >&nbsp;</option>
<%Sql= "SELECT titulo_esp, id_item from items order by titulo_esp"     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="<%=ob_rs("id_item")%>" <%if id_item=ob_rs("id_item") then%>Selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
<i class="fa fa-globe" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="fecha_in" >Fecha contacto.</label>
<div class="col-md-5">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_in" id="fecha_in" maxlength="160" value="<%if fecha_in<>"01/01/1000" then%><%=fecha_in%><%end if%>"><div class="form-control-focus"> </div>
<i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">fecha primer contacto</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="fecha_nxt" >Fecha seguimiento.</label>
<div class="col-md-5">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_nxt" id="fecha_nxt"  maxlength="160" value="<%if fecha_nxt<>"01/01/1000" then%><%=fecha_nxt%><%end if%>"><div class="form-control-focus"> </div>
<i class="fa fa-calendar-o" aria-hidden="true"></i><span class="help-block">fecha próximo contacto</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="estado" >Estado.</label>
<div class="col-md-6" ><div class="input-icon">
<select name="estado" id="estado" class="select-100">
<option value="" >&nbsp;</option>
<option value="seguimiento" <%if estado="seguimiento" then%>Selected<%end if%>>En seguimiento</option>
<option value="formulario" <%if estado="formulario" then%>Selected<%end if%>>Contacto de formulario</option>
<option value="proceso" <%if estado="proceso" then%>Selected<%end if%>>En proceso venta</option>
<option value="finalizado" <%if estado="finalizado" then%>Selected<%end if%>>Seguimiento finalizado</option>
<option value="cliente" <%if estado="cliente" then%>Selected<%end if%>>Conversión a cliente</option>
</select>
<i class="fa fa-battery-three-quarters" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="form_control_1">Newsletter.</label>
<div class="col-md-7">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="n_letter" type="checkbox" class="md-check" id="n_letter" value="si" <%if n_letter="si"then%>checked="checked"<%end if%>>
<label for="visible"></label></div>
</div></div></div></div>
</div>
<div class="col-md-12">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label margin-left-12" for="comentario" >Comentario.</label>
<div class="col-md-8">
<div class="input-icon"><textarea class="form-control" name="comentario" id="comentario" rows="3"><%=comentario%></textarea><div class="form-control-focus"> </div>
<i class="fa fa-pencil" aria-hidden="true"></i><span class="help-block">comentarios del contacto</span></div></div></div>
</div>
<div class="col-md-12">
<div class="form-group form-md-line-input">
  <label class="col-md-2 control-label margin-left-12" for="obs_internas">Observaciones internas.</label>
<div class="col-md-8"><textarea class="form-control" name="obs_internas" id="obs_internas" rows="3"><%=obs_internas%></textarea></div>
</div>
</div>
</div>
</div>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-12">
<button type="button" class="btn green" onclick="Enviar_contactos(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>contactos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
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
<script>
CKEDITOR.replace('obs_internas',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='n_letter']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});

</script>