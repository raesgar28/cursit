<div class="row">
<div class="col-md-12">
<div class="panel-group accordion scrollable" id="acordeon" style="margin-top:35px">
<div class="panel panel-default" style="border:none">
<div class="panel-heading">
<h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon" href="#acordeon_1"><i class="fa fa-image margin-right-8"></i> Galería de imágenes <%if ntres="hm"then%>medio<%end if%><%if num_img<>""then%><span class="badge badge_acordeon" style="background-color:#999;"> <%=num_img%> </span><%end if%></a></h4>
</div>
<div id="acordeon_1" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-md-12" style="margin-left:0px;padding-left:0px;padding-top:20px;margin-bottom:20px;"><button class="inserta_imagen btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Imagen</button></div>
<table class="table table-bordered table-hover">
<thead id="cabecera"<%if num_img_tot_img<1then%>class="hidden"<%end if%>>
<tr role="row" class="heading">
<th width="12%" style="text-align:center"> Imagen </th>
<th width="35%"> Título </th>
<th width="35%"> Acciones </th>
<th width="5%"> Orden </th>
<th width="7%"> Eliminar </th>
</tr>
</thead>
<tbody class="nueva_imagen">
<%i_img=3
img_ok=0
do while i_img<=16
execute("alt_v=alt_"&i_img)
execute("archivo_v=archivo_"&i_img)
execute("orden_img_v=orden_img_"&i_img)
if archivo_v<>"" then%>
<tr class="elimina_f_imagen">
<td style="text-align:center"><div class="row" id="div_imagen_<%=i_img%>"  style="text-align:center;margin:0 auto;">
<div id="imagen_<%=i_img%>" style="width:100%;text-align:center">
<a href="#/" id="pop" onClick="modal_img_<%=i_img%>();" class="img_lst" ><img src="<%=archivo_v%>" alt=""></a></div>
<div class="modal fade" id="imagemodal_<%=i_img%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;"><img src="<%=archivo_v%>" id="imagepreview_<%=i_img%>" style="width: 400px; margin:0 auto;" ></div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div>
</div>
</div>
</div></td>
<td><div class="form-group form-md-line-input" id="alt_<%=i_img%>">
<div class="col-md-12"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[<%=i_img%>]" id="alt_<%=i_img%>" maxlength="250" value="<%=alt_v%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div></td>
<td><div class="form-group form-md-line-input">
<div class="col-md-12"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_<%=i_img%>" class="<%=i_img%> form-control" type="field" name="archivo_[<%=i_img%>]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_<%=i_img%>" type="button" onclick="javascript:archivo('Imagen',<%=i_img%>);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div></td>
<td><div class="form-group form-md-line-input">
<div class="col-md-12"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="orden_img_[<%=i_img%>]" id="orden_img" maxlength="250" value="<%if orden_img_v<>"" then%><%=orden_img_v - 2%><%else%>1<%end if%>"><div class="form-control-focus"></div><i class="fa fa-sort-numeric-desc " aria-hidden="true"></i></div></div>
</div></td>
<td>
<span class="input-group-btn" id="anular_<%=i_img%>" style="margin-top:10px;display:block"><button class="btn default" id="anular" type="button" onclick="javascript:anular_<%=i_img%>();"><i class="fa fa-arrow-left fa-fw" /></i> Anular Imagen</button></span>
<div class="form-group form-md-line-input"  id="eliminar_<%=i_img%>">
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="del_img_<%=i_img%>" type="checkbox" class="md-check" id="del_img_<%=i_img%>" value="si" ></div></div></div>
</div>
</td>
</tr>
<script>
function anular_<%=i_img%>(){$('#archivo_<%=i_img%>').val('');$('#anular_<%=i_img%>').fadeOut("fast");$('#eliminar_<%=i_img%>').fadeIn("fast");$('#imagen_<%=i_img%> img').attr('src','<%=archivo_v%>');$('#imagepreview_<%=i_img%>').attr('src','<%=archivo_v%>');}
$('#anular_<%=i_img%>').hide();
$("[name='del_img_<%=i_img%>']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
</script>
<%img_ok=img_ok+1
end if
i_img=i_img+1
alt_v=""
archivo_v=""
loop
if img_ok=0 then
i_img=3%>
<tr class="elimina_f_imagen hidden">
<td style="text-align:center"><div class="row" id="div_imagen_<%=i_img%>"  style="text-align:center;margin:0 auto;">
<div id="imagen_<%=i_img%>" style="width:100%;text-align:center">
<a href="#/" id="pop" onClick="modal_img_<%=i_img%>();" class="img_lst" ><img src="" alt=""></a></div>
<div class="modal fade" id="imagemodal_<%=i_img%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;"><img src="<%=archivo_v%>" id="imagepreview_<%=i_img%>" style="width: 400px; margin:0 auto;" ></div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div>
</div>
</div>
</div></td>
<td><div class="form-group form-md-line-input" id="alt_<%=i_img%>">
<div class="col-md-12"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[<%=i_img%>]" id="alt_<%=i_img%>" maxlength="250" value=""><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div></td>
<td><div class="form-group form-md-line-input">
<div class="col-md-12"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_<%=i_img%>" class="<%=i_img%> form-control" type="field" name="archivo_[<%=i_img%>]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_<%=i_img%>" type="button" onclick="javascript:archivo('Imagen',<%=i_img%>);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div></td>
<td><div class="form-group form-md-line-input">
<div class="col-md-12"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="orden_img_[<%=i_img%>]" id="orden_img" maxlength="250" value="<%if orden_img_v<>"" then%><%=orden_img_v - 2%><%else%>1<%end if%>"><div class="form-control-focus"></div><i class="fa fa-sort-numeric-desc " aria-hidden="true"></i></div></div>
</div></td>
<td>
<button class="elimina_imagen btn red" style="margin-top:9px;"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button>
</td>
</tr>
<script>
function anular_<%=i_img%>(){$('#archivo_<%=i_img%>').val('');$('#anular_<%=i_img%>').fadeOut("fast");$('#eliminar_<%=i_img%>').fadeIn("fast");$('#imagen_<%=i_img%> img').attr('src','<%=archivo_v%>');$('#imagepreview_<%=i_img%>').attr('src','<%=archivo_v%>');}
$('#anular_<%=i_img%>').hide();
$("[name='del_img_<%=i_img%>']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
</script>
<%end if%>
</tbody>
</table>
<script type="text/javascript">
jQuery(document).ready(function($){
$('.inserta_imagen').one('click',function(){
$("#cabecera").hide();$("#cabecera").removeClass("hidden");$("#cabecera").fadeIn();
$(".elimina_f_imagen").hide();$(".elimina_f_imagen").removeClass("hidden");$(".elimina_f_imagen").fadeIn();
<%if img_ok=0then
img_ok=1%>
img=0;
<%else%>
img=1;
<%end if%>
}).click(function(){
img=img+1;	
var n = $('.elimina_f_imagen').length + 1;
if( 16 < n ) {$('#alerta_img').modal();return false;}
l=n+2;
var box_html = $('<tr class="elimina_f_imagen"><td style="text-align:center"><div class="row" id="div_imagen_'+l+'"  style="text-align:center;margin:0 auto;"><div id="imagen_'+l+'" style="width:100%;text-align:center"><a href="#/" id="pop" onClick="modal_img_'+l+'();" class="img_lst" ><img src="" alt=""></a></div><div class="modal fade" id="imagemodal_'+l+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button><h4 class="modal-title">Vista Previa</h4></div><div class="modal-body" style="text-align:center;"><img src="" id="imagepreview_'+l+'" style="width: 400px; margin:0 auto;" ></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div></div></div></div></div></td><td><div class="form-group form-md-line-input" id="alt_'+l+'"><div class="col-md-12"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_['+l+']" id="alt_'+l+'" maxlength="250" value=""><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div></div></td><td><div class="form-group form-md-line-input"><div class="col-md-12"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_'+l+'" class="form-control inputa" type="field" name="archivo_['+l+']" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn" ><button class="btn default" id="modal_'+l+'" type="button" style="display:inline-block;width:120px;padding-left:15px;padding-right:5px;text-align:left;" onclick="javascript:lanza_archivo('+l+');"><i class="fa fa-arrow-left fa-fw" /></i> <span style="font-family:Arial;">Seleccionar</span></button></span></div></div></div></td><td><div class="form-group form-md-line-input"><div class="col-md-12"><div class="input-icon"><input type="text" class="form-control orden_img" placeholder="" name="orden_img_['+l+']" id="orden_img" maxlength="250" value="'+n+'"><div class="form-control-focus"></div><i class="fa fa-sort-numeric-desc " aria-hidden="true"></i></div></div></div></td><td ><button class="elimina_imagen btn red" style="margin-top:9px;"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></td></tr>');
box_html.hide();
if(img>1){
$('.nueva_imagen tr.elimina_f_imagen:last').after(box_html);
box_html.fadeIn('slow');
}
return false;});
$('.nueva_imagen').on('click', '.elimina_imagen', function(){
if( $('.elimina_f_imagen').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {
$(this).closest('tr').remove();
$(".orden_img").each(function(index){
$(this).val( index + 1 + <%=img_ok%>);});
});
};return false;
});
});
function lanza_archivo(numero){archivo('Imagen',numero);}
<%x=1
do while x<=16%>
function modal_img_<%=x%>() { $('#imagemodal_<%=x%>').modal('show'); }; 
<%x=x+1
loop%>
</script>
</div>
</div>
</div>
<%if ntres<>"nt" and ntres<>"hm" then%>
<div class="panel panel-default" style="border:none">
<div class="panel-heading">
<h4 class="panel-title acordeon" ><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon" href="#acordeon_2" ><i class="fa fa-video-camera margin-right-8" aria-hidden="true" ></i> Galería de vídeos enlazados (*recomendado) <%if num_vid_enl<>""then%><span class="badge badge_acordeon" style="background-color:#999;"> <%=num_vid_enl%> </span><%end if%></a></h4>
</div>
<div id="acordeon_2" class="panel-collapse collapse">
<div class="panel-body" >
<div class="col-md-6">
<div class="form-group form-md-line-input" id="alt_19">
<label class="col-md-3 control-label" for="alt_19" >Título video.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[19]" id="alt_19" maxlength="250" value="<%=alt_19%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="archivo_19" >Enlace.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="archivo_[19]" id="archivo_19" maxlength="160" value="<%=archivo_19%>"><div class="form-control-focus"> </div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">debes introducir el enlace completo (http://...)</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="archivo_19" >Eliminar.</label>
<div class="col-md-8">
<div class="md-checkbox col-md-6" style="margin-top:6px;"><input name="del_img_19" type="checkbox" class="md-check" id="del_img_19" value="si" ></div>
</div></div><script>$("[name='del_img_19']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[19]" id="orden_img_19" maxlength="250" value="19">
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input" id="alt_19">
<label class="col-md-3 control-label" for="alt_[19]" >Título video.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[20]" id="alt_20" maxlength="250" value="<%=alt_20%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="archivo_20" >Enlace.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="archivo_[20]" id="archivo_[20]" maxlength="160" value="<%=archivo_20%>"><div class="form-control-focus"> </div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">debes introducir el enlace completo (http://...)</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="archivo_20" >Eliminar.</label>
<div class="col-md-8">
<div class="md-checkbox col-md-6" style="margin-top:6px;"><input name="del_img_20" type="checkbox" class="md-check" id="del_img_20" value="si" ></div>
</div></div><script>$("[name='del_img_20']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});</script>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[20]" id="orden_img_20" maxlength="250" value="20">
</div>
</div>
</div>
</div>
<div class="panel panel-default" style="border:none">
<div class="panel-heading">
<h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#acordeon" href="#acordeon_3"><i class="fa fa-video-camera margin-right-8" aria-hidden="true"></i> Galería de vídeos insertados <%if num_vid<>""then%><span class="badge badge_acordeon" style="background-color:#999;"> <%=num_vid%> </span><%end if%></a></h4>
</div>
<div id="acordeon_3" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-md-6"><!-- VIDEOS GALERIA-->
<%i=17
do while i<=17
execute("alt_v=alt_"&i)
execute("archivo_v=archivo_"&i)%>
<!--Video-->
<div class="form-group form-md-line-input" id="alt_<%=i%>">
<label class="col-md-3 control-label" for="alt_<%=i%>" >Título video 1.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[<%=i%>]" id="alt_<%=i%>" maxlength="250" value="<%=alt_v%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[<%=i%>]" id="orden_img_<%=i%>" maxlength="250" value="<%=i%>">
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label">Video 1.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-video-camera" aria-hidden="true"></i><input id="archivo_<%=i%>" class="form-control" type="field" name="archivo_[<%=i%>]" placeholder="video (MP4 máx 10 Mb.)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_<%=i%>" type="button" onclick="javascript:archivo('Archivos',<%=i%>);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<div class="row" id="div_imagen_<%=i%>"><!--SI SELECCIONAMOS-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="imagen_<%=i%>">
<label class="col-md-6 control-label">Video.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_<%=i%>();" class="thumbnail thumbs_p" <%if archivo_v=""then%>style="background:url(../images/play-button.png) no-repeat center center"<%end if%>><video style="width:100%;" ><source id="video_in<%=i%>" src="<%=archivo_v%>" type="video/mp4">Tu navegador no admite video en formato MP4.</video>
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
<div style="border-bottom:2px solid #efefef"></div>
<%i=i+1
alt_v=""
archivo_v=""
loop%>
</div><!-- FIN VIDEOS GALERIA-->
<div class="col-md-6"><!-- VIDEOS GALERIA-->
<%i=18
do while i<=18
execute("alt_v=alt_"&i)
execute("archivo_v=archivo_"&i)%>
<!--Video-->
<div class="form-group form-md-line-input" id="alt_<%=i%>">
<label class="col-md-3 control-label" for="alt_<%=i%>" >Título video 2.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_<%=i%>" id="alt_<%=i%>" maxlength="250" value="<%=alt_v%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[<%=i%>]" id="orden_img_<%=i%>" maxlength="250" value="<%=i%>">
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label">Video 2.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-video-camera" aria-hidden="true"></i><input id="archivo_<%=i%>" class="form-control" type="field" name="archivo_[<%=i%>]" placeholder="video (MP4 máx 10 Mb.)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_<%=i%>" type="button" onclick="javascript:archivo('Archivos',<%=i%>);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<div class="row" id="div_imagen_<%=i%>"><!--SI SELECCIONAMOS-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="imagen_<%=i%>">
<label class="col-md-6 control-label">Video.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_<%=i%>();" class="thumbnail thumbs_p"  <%if archivo_v=""then%>style="background:url(../images/play-button.png) no-repeat center center"<%end if%>><video style="width:100%;"><source src="<%=archivo_v%>" type="video/mp4">Tu navegador no admite video en formato MP4.</video>
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
function anular_<%=i%>(){$('#archivo_<%=i%>').val("");$('#anular_<%=i%>').fadeOut("fast");$('#eliminar_<%=i%>').fadeIn("fast");$('#imagen_<%=i%> img').attr('src','<%=archivo_v%>');$('#imagepreview_<%=i%>').attr('src','<%=archivo_v%>');}
<%end if%>
<%if archivo_v=""then%>
$('#div_imagen_<%=i%>').hide();$('#eliminar_<%=i%>').hide();<%else%>
$('#eliminar_<%=i%>').show();$("[name='del_img_<%=i%>']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#anular_<%=i%>').hide();   // FIN  MODAL IMAGEN 2
<%end if%>
</script>
</div><!--row-->
<!--FIN VIDEO-->
<div style="border-bottom:2px solid #efefef"></div>
<%i=i+1
alt_v=""
archivo_v=""
loop%>
</div><!-- FIN VIDEOS GALERIA-->
</div>
</div><!--FIN panel-group accordion scrollable-->
</div>
<%end if%>
</div>
</div><!--FIN col-md-12-->
</div><!--FIN row GALERIAS-->
<div class="modal fade" id="alerta_img" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  No se pueden añadir más imágenes</h4></div><div class="modal-body"> No se pueden añadir más imágenes. Si necesitas más, contacta con el administrador del sistema. </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>