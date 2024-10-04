<!--#include file="../comun/menu_sup.asp"-->  
<%Sql= "SELECT * from redes"     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
rd_facebook=ob_rs("rd_facebook")
rd_twitter=ob_rs("rd_twitter")
rd_youtube=ob_rs("rd_youtube")
rd_pinterest=ob_rs("rd_pinterest")
rd_blog=ob_rs("rd_blog")
rd_linkedin=ob_rs("rd_linkedin")
rd_instagram=ob_rs("rd_instagram")
rd_tumblr=ob_rs("rd_tumblr")
rd_flickr=ob_rs("rd_flickr")
rd_reddit=ob_rs("rd_reddit")
rd_google_plus=ob_rs("rd_google_plus")
end if
ob_rs.close

Sql= "SELECT rd_mailchimp_api,rd_mailchimp_id from webs"     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
rd_mailchimp_api=ob_rs("rd_mailchimp_api")
rd_mailchimp_id=ob_rs("rd_mailchimp_id")
end if
ob_rs.close


'[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<div class="breadcrumbs">
<h1>Gestión  Redes Sociales</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li class="active">Gestión Redes Sociales</li>
</ol>
</div>
<div class="page-content-container">
<div class="page-content-row">

<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Redes Sociales</span></div>
</div>
<div class="portlet-body">
<form action="redes_mod.asp" class="form-horizontal" id="envio" name="envio" method="post">
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
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El tipo de alojamiento ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div>
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_facebook">Facebook.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_facebook" id="rd_facebook" maxlength="255" value="<%=rd_facebook%>"><div class="form-control-focus"></div><i class="fa fa-facebook-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_twitter">Twitter.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_twitter" id="rd_twitter" maxlength="255" value="<%=rd_twitter%>"><div class="form-control-focus"></div><i class="fa fa-twitter-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_youtube">Youtube.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_youtube" id="rd_youtube" maxlength="255" value="<%=rd_youtube%>"><div class="form-control-focus"></div><i class="fa fa-youtube-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_pinterest">Pinterest.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_pinterest" id="rd_pinterest" maxlength="255" value="<%=rd_pinterest%>"><div class="form-control-focus"></div><i class="fa fa-pinterest-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_blog">Blog.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_blog" id="rd_blog" maxlength="255" value="<%=rd_blog%>"><div class="form-control-focus"></div><i class="fa fa-wordpress" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_linkedin">Linkedin.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_linkedin" id="rd_linkedin" maxlength="255" value="<%=rd_linkedin%>"><div class="form-control-focus"></div><i class="fa fa-linkedin-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_instagram">Instagram.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_instagram" id="rd_instagram" maxlength="255" value="<%=rd_instagram%>"><div class="form-control-focus"></div><i class="fa fa-instagram" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_tumblr">Tumblr.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_tumblr" id="rd_tumblr" maxlength="255" value="<%=rd_tumblr%>"><div class="form-control-focus"></div><i class="fa fa-tumblr-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_flickr">Flickr.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_flickr" id="rd_flickr" maxlength="255" value="<%=rd_flickr%>"><div class="form-control-focus"></div><i class="fa fa-flickr" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_reddit">Reedit.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_reddit" id="rd_reddit" maxlength="255" value="<%=rd_reddit%>"><div class="form-control-focus"></div><i class="fa fa-reddit-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_google_plus">Google Plus.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_google_plus" id="rd_google_plus" maxlength="255" value="<%=rd_google_plus%>"><div class="form-control-focus"></div><i class="fa fa-google-plus-square" aria-hidden="true"></i><span class="help-block">debes introducir la url completa (http://...)</span></div></div>
</div>

<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_mailchimp_api">MailChimp API.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_mailchimp_api" id="rd_mailchimp_api" maxlength="255" value="<%=rd_mailchimp_api%>"><div class="form-control-focus"></div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir la clave API de MailChimp</span></div></div>
</div>

<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="rd_mailchimp_id">MailChimp List Id.</label>
<div class="col-md-5"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="rd_mailchimp_id" id="rd_mailchimp_id" maxlength="255" value="<%=rd_mailchimp_id%>"><div class="form-control-focus"></div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir la id de lista</span></div></div>
</div>

</div>
</div><!--row-->
</div><!--form-body-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_redes(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<button type="reset" class="btn default"><i class="fa fa-eraser" aria-hidden="true"></i> resetear formulario</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
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
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script>
var limita=function(){
var a=function(){
$("#ciudad").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
</script>