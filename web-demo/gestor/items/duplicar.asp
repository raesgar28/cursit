<!--#include file="../comun/menu_sup.asp"-->  
<%Sql= "SELECT * from items where id_item="&cod_prog&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
end if
ob_rs.close
ob_conn.close%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Duplicar Programa | <%=titulo_esp%></span></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab"> General </a></li>
<li><a href="#tab_3" data-toggle="tab"> SEO</a></li>
</ul><!--NAV TABS-->
</div>
<div class="portlet-body">
<form action="guardar_duplicar.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="edi" type="hidden" value="<%=edi%>">
<input name="op" type="hidden" value="in">
<input name="cod_prog" type="hidden" value="<%=cod_prog%>">
<input name="cod_cat" type="hidden" value="<%=cod_cat%>">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> La URL amigable ya se encuentra registrada. Debes modificarla.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-4 control-label" for="titulo_esp" >Nombre programa.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');urlea_esp();" maxlength="160" value=""><div class="form-control-focus"> </div>
<i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="titulo_of_esp_a">
<label class="col-md-4 control-label" for="titulo_of_esp" >Nombre oficial.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_of_esp" id="titulo_of_esp" onKeyUp="resetea_error('titulo_of_esp_a');" maxlength="160" value=""><div class="form-control-focus"> </div>
<i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un nombre oficial</span></div></div></div>
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-7">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="dup_cursos" type="checkbox" class="md-check" id="dup_cursos" value="si" checked="checked"><label for="dup_cursos">Duplicar cursos </label></div>
<div class="md-checkbox"><input name="dup_aloja" type="checkbox" class="md-check" id="dup_aloja" value="si" checked="checked"><label for="dup_aloja">Duplicar alojamientos </label></div>
<div class="md-checkbox"><input name="dup_img" type="checkbox" class="md-check" id="dup_img"  value="si" checked="checked"><label for="dup_img"> Duplicar imágenes </label></div>
<div class="md-checkbox"><input name="visible" type="checkbox" class="md-check" id="visible"  value="si" checked="checked"><label for="visible"> Visible </label></div>
</div>
</div>
</div>
</div><!--col-md-6-->
</div><!--col-md-12-->
<div class="col-md-12">
<div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="texto_esp">Descripción General.</label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"></textarea></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_1-->
<div class="tab-pane" id="tab_3">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="url_esp_a">
<label class="col-md-2 control-label" for="url_esp">URL amigable.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="url_esp" id="url_esp" onkeyup="resetea_error('url_esp_a');urlea_esp_inf();" maxlength="250" value=""><div class="form-control-focus"></div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">URL "amigable" (para espacios pulsa "espacio" sin soltar).</span></div></div>
</div>
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-2 control-label" for="meta_title" >[meta] Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="meta_title" id="meta_title" maxlength="65" value=""><div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un título descriptivo de unos 65 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meta_desc">[meta] Descripción.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_desc" id="meta_desc" rows="2" maxlength="160"></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">debes introducir una descripción concisa de unos 160 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="f_texto_legal">[meta] Keywords.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_key" id="meta_key" rows="2"><%=meta_key%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">palabras clave separadas por comas</span></div></div>

</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_3-->
</div><!--tab-content-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_duplicar(this.form);" value="enviar datos" language="javascript"><i class="fa fa-files-o" aria-hidden="true"></i> duplicar programa</button>
<button type="reset" class="btn default"><i class="fa fa-eraser" aria-hidden="true"></i> resetear formulario</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>destinos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div><!--ACCIONES fin form-body-->
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
<script src="<%=r%>lib/js/url_amigable.js"></script>
<script>
CKFinder.setupCKEditor( CKEDITOR.replace('texto_esp',{toolbar : 'Basica'}));
$("[name='visible'],[name='dup_cursos'],[name='dup_img'],[name='dup_aloja']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
function urlea_esp(){document.getElementById("url_esp").value = document.getElementById("titulo_esp").value.slugify();}
function urlea_esp_inf(){document.getElementById("url_esp").value=document.getElementById("url_esp").value.slugify();}
var limita=function(){
var a=function(){
$("#titulo_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#url_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_title").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_desc").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
function recargar() {location.reload();}
</script>