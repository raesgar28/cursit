<!--#include file="../comun/menu_sup.asp"-->  
<%if cod<>""then
if ndos="prof"then
Sql= "SELECT * from academia_profesores where id_profesor="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
else
Sql= "SELECT * from extra_monitores where id_profesor="&cod&""
end if
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre=ob_rs("nombre")
apellidos=ob_rs("apellidos")
if ndos="prof"then idioma=ob_rs("idioma") end if
mail=ob_rs("mail")
telefono=ob_rs("telefono")
direccion=ob_rs("direccion")
borrado=ob_rs("borrado")
observaciones=ob_rs("observaciones")
end if
ob_rs.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<div class="breadcrumbs">
<h1>Gestión <%if ndos="prof" then%>Profesor<%else%>Monitor<%end if%> | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaProfesores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado <%if ndos="prof" then%>Profesores<%else%>Monitores<%end if%></a></li>
<li class="active">Gestión <%if ndos="prof" then%>Profesores<%else%>Monitores<%end if%></li>
</ol>
</div>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaProfesores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado <%if ndos="prof" then%>Profesores<%else%>Monitores<%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión <%if ndos="prof" then%>Profesores<%else%>Monitores<%end if%></a></li>
</ul>
</nav>
</div>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión <%if ndos="prof" then%>Profesor<%else%>Monitor<%end if%> <%if nombre<>""then%> | <%=nombre%> <%=apellidos%><%end if%></span></div>
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
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El profesor ya se encuentra registrado.</div><%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div>
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input" id="nombre_a">
<label class="col-md-4 control-label" for="ciudad" >Nombre.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre" id="nombre" onKeyUp="resetea_error('nombre_a');" maxlength="160" value="<%=nombre%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="apellidos_a">
<label class="col-md-4 control-label" for="ciudad" >Apellidos.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="Apellidos" id="Apellidos" maxlength="160" value="<%=apellidos%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir los apellidos</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="ciudad" >Teléfono.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="telefono" id="telefono" maxlength="160" value="<%=telefono%>"><div class="form-control-focus"> </div>
<i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir el teléfono</span></div></div></div>
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="ciudad" >eMail.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="mail" id="mail" maxlength="160" value="<%=mail%>"><div class="form-control-focus"> </div>
<i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir el email</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="ciudad" >Dirección.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="direccion" id="direccion" maxlength="160" value="<%=direccion%>"><div class="form-control-focus"> </div>
<i class="fa fa-map" aria-hidden="true"></i><span class="help-block">debes introducir la dirección</span></div></div></div>
<%if ndos="prof"then%><div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="viajado_schola">Idioma.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="idioma" id="idioma" class="select-100" >
<option value="" >&nbsp;</option>
<%Sql2= "SELECT * from idiomas "   
Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<option value="<%=ob_rs2("idioma")%>" <%if ob_rs2("idioma")= idioma then%>selected<%end if%>><%=ob_rs2("idioma")%></option>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-flag" aria-hidden="true"></i><span class="help-block">idioma</span></div>
</div>
</div><%end if%>
</div><!--col-md-6-->
</div><!--col-md-12-->
<div class="col-md-12">
<div class="form-group form-md-line-input"><label class="col-md-1 control-label " for="texto_esp"></label>
<div class="col-md-9"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=observaciones%></textarea></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_profesores(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaProfesores/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
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
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Basica'});
var limita=function(){
var a=function(){
$("#ciudad").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
</script>