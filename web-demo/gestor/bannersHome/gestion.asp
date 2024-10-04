<!--#include file="../comun/menu_sup.asp"--> 
<%if cod<>"" then
Sql= "SELECT * from rel where id_general="&cod&" and id_archivo<>0" '[IMAGENES VIDEOS TOTALES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_img_tot=ob_rs.RecordCount 
end if
ob_rs.close
Sql= "SELECT * from generales where id_general="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
tipo=ob_rs("tipo")
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
texto_esp2=ob_rs("texto_esp2")
visible=ob_rs("visible")
destacado=ob_rs("destacado")
orden_general=ob_rs("orden")
url_esp=ob_rs("url_esp")
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
fecha_in=ob_rs("fecha_in")
mas_texto=ob_rs("mas_texto")
end if
ob_rs.close
Sql= "SELECT * from rel where id_general="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
Dim archivo_(20),alt_(20),orden_img_(20)
do while not ob_rs.eof
id_archivo=ob_rs("id_archivo")
	if id_archivo<>""then
	Sql2= "SELECT * from archivos where id_archivo="&id_archivo&""
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
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Páginas | 
  <%if cod<>""then%>Modificar<%else%>Crear<%end if%> | Banners HOME</h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>bannersHome/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Banners</a></li>
<li class="active">Gestión Banner</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>bannersHome/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Banners
<%if num_pg<>""then%><span class="baddge badge badge-default"> <%=num_pg%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Banner</a></li>
</ul>
</nav>
</div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Banner</span></div>
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
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> La URL o el Destino ya se encuentran registrados.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
<div class="col-md-offset-2 col-md-7" >
<div class="note note-info magin-top-0" style="margin-bottom:30px;margin-top:30px"><h4 class="block">Sobre banners</h4>
<p><i class="fa fa-info-circle" aria-hidden="true"></i> &nbspDebes elegir entre seleccionar una imagen o un vídeo. Si subes los dos, siempre prevalecerá el vídeo.
</p></div>
</div>
</div><!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-4 control-label" for="titulo_esp" >Título banner.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-file-text-o" aria-hidden="true"></i><span class="help-block">debes introducir un título</span></div></div></div>
<!--IMAGEN-->
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label">Imagen banner.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_1" class="form-control" type="field" name="archivo_[1]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_1" type="button" onclick="javascript:archivo('Imagen',1);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[1]" id="orden_img_1" maxlength="250" value="1">
<div class="form-group form-md-line-input" id="alt_1">
<label class="col-md-4 control-label" for="alt_1" >Título imagen.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[1]" id="alt_1" maxlength="250" value="<%=alt_1%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
<div class="row" id="div_imagen_1">
<div class="col-md-7">
<div class="form-group form-md-line-input" id="imagen_1">
<label class="col-md-7 control-label">Imagen banner.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_1();" class="thumbnail thumbs_p"><img src="<%=archivo_1%>" alt="100%x180"></a></div></div>
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
</div><!--row-->
<div class="col-md-8 col-md-offset-4" style="border-bottom:2px dashed #ccc;margin-top:25px;margin-bottom:25px;"></div>
<!-- VIDEOS GALERIA-->
<%i=2
execute("alt_v=alt_"&i)
execute("archivo_v=archivo_"&i)%>
<!--Video-->
<div class="form-group form-md-line-input" id="alt_<%=i%>">
<label class="col-md-4 control-label" for="alt_<%=i%>" >Título video.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_<%=i%>" id="alt_<%=i%>" maxlength="250" value="<%=alt_v%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i><span class="help-block">título del vídeo</span></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[<%=i%>]" id="orden_img_<%=i%>" maxlength="250" value="<%=i%>">
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label">Video Banner.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-video-camera" aria-hidden="true"></i><input id="archivo_<%=i%>" class="form-control" type="field" name="archivo_[<%=i%>]" placeholder="video (MP4 máx 10 Mb.)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_<%=i%>" type="button" onclick="javascript:archivo('Archivos',<%=i%>);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<div class="row" id="div_imagen_<%=i%>"><!--SI SELECCIONAMOS-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="imagen_<%=i%>">
<label class="col-md-8 control-label">Video.</label>
<div class="col-sm-4 col-md-4"><a href="#/" id="pop" onClick="modal_img_<%=i%>();" class="thumbnail thumbs_p" <%if archivo_v=""then%>style="background:url(../images/play-button.png) no-repeat center center"<%end if%>><video style="width:100%;" ><source id="video_in<%=i%>" src="<%=archivo_v%>" type="video/mp4">Tu navegador no admite video en formato MP4.</video>
</a></div></div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<span class="input-group-btn" id="anular_<%=i%>"><button class="btn default" id="anular" type="button" onclick="javascript:anular_<%=i%>();"><i class="fa fa-arrow-left fa-fw" /></i> Anular Video</button></span>
<div class="form-group form-md-line-input"  id="eliminar_<%=i%>">
<label class="col-md-8 control-label" for="del_img_<%=i%>">Eliminar Video.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="del_img_<%=i%>" type="checkbox" class="md-check" id="del_img_<%=i%>" value="si" ></div></div></div>
</div>
</div>
</div>
<div class="modal fade" id="imagemodal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;">
<%if archivo_v=""then%><div style="background:url(../images/play-button.png) no-repeat center 60px;min-height:110px;padding-top:30px">No se puede previsualizar el video hasta no haber modificado los datos</div><%else%><video style="width:100%;" controls><source src="<%=archivo_v%>" type="video/mp4">Tu navegador no admite video en formato MP4.</video><%end if%>
</div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div>
</div>
</div>
<script>
function modal_img_<%=i%>() { $('#imagemodal_<%=i%>').modal('show'); };  //   MODAL IMAGEN i
<%if archivo_v=""then%>
function anular_<%=i%>(){$('#archivo_<%=i%>').val("");$('#div_imagen_<%=i%>').fadeOut("fast");}
<%else%>
function anular_<%=i%>(){$('#archivo_<%=i%>').val("");$('#anular_<%=i%>').fadeOut("fast");$('#eliminar_<%=i%>').fadeIn("fast");$('#imagen_<%=i%> video source').attr('src','<%=archivo_v%>');$('#imagepreview_<%=i%>').attr('src','<%=archivo_v%>');}
<%end if%>
<%if archivo_v=""then%>
$('#div_imagen_<%=i%>').hide();$('#eliminar_<%=i%>').hide();<%else%>
$('#eliminar_<%=i%>').show();$("[name='del_img_<%=i%>']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#anular_<%=i%>').hide();   // FIN  MODAL IMAGEN 2
<%end if%>
</script>
</div><!--row-->
<!--FIN IMAGEN-->
<%i=i+1
alt_v=""
archivo_v=""%>
<!--FIN IMAGEN-->
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="url_esp" >Enlace.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="url_esp" id="url_esp" maxlength="160" value="<%=url_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-link" aria-hidden="true"></i><span class="help-block">completo: http://www...</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="texto_esp2" >Texto enlace.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="texto_esp2" id="texto_esp2" maxlength="160" value="<%=texto_esp2%>"><div class="form-control-focus"> </div>
<i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">ej: ver más,...</span></div></div></div>
<%if ntres<>"hm"then%>
<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-7">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="visible" type="checkbox" class="md-check" id="visible" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if visible="si"then%>checked="checked"<%end if%>><label for="visible">Visible </label></div>
<div class="md-checkbox"><input name="destacado" type="checkbox" class="md-check" id="destacado"  value="si" <%if destacado="si"then%>checked="checked"<%end if%>><label for="destacado"> Nueva ventana </label></div>
</div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="orden_general" >Orden.</label>
<div class="col-md-4">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="orden_general" id="orden_general" maxlength="160" value="<%if orden_general<>0 and cod<>"" then%><%=orden_general%><%else%><%=num_pg+1%><%end if%>"><div class="form-control-focus"></div>
<i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block">orden apartado</span></div>
</div>
</div>
<%end if%>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="texto_esp" >Texto.</label>
<div class="col-md-8">
<div class="input-icon"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea><div class="form-control-focus"> </div>
<i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">no demasiado excesivo.</span></div></div></div>
</div></div></div></div></div></div>
<div class="form-body"><div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12"><button type="button" class="btn green" onclick="Enviar_banners(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>bannersHome/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%></div></div></div></div>
</form></div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<div style="visibility:hidden;height:1px;overflow:hide"><input name="pega" type="hidden" id="pega" value="" style="visibility:hidden"></div>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="/gestor/ckfinder/libs/sf.js"></script>
<script src="/gestor/ckfinder/libs/tree-a.js"></script>
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<script src="/gestor/ckfinder/ckfinder.js"></script>
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
CKEDITOR.replace('pega',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Basica'});
<%if mas_texto="si" then%><%else%>$("#mas_texto_c").hide();<%end if%>;})
$("[name='visible'],[name='destacado'],[name='contacto'],[name='mas_texto']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
function titulo_esp_x(form) {		////////////////////////////////////   COMÚN 
Ctrl = form.titulo_esp;	
if (Ctrl.value == "") {		
id_txt=	"#titulo_esp_a";	
validatePrompt (Ctrl, "Debes introducir un título.",id_txt);
return (false);	
} 
else		
return (true);
}
function Enviar_banners (form)  {	////////////////////////////////////   DESTINOS 
    if (!titulo_esp_x(form)) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.envio.submit(); }, 300);
	return;
}
</script>