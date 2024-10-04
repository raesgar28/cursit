<!--#include file="../comun/menu_sup.asp"-->  
<%if cod="" and ntres<>"" then
Sql= "SELECT id_general from generales where tipo='"&ntres&"' " '[IMAGENES VIDEOS TOTALES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
cod=ob_rs("id_general")
end if
ob_rs.close
end if
if cod<>"" then
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
pr_team=ob_rs("pr_team")
id_formulario=ob_rs("id_formulario")
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
  <%if cod<>""then%>Modificar<%else%>Crear<%end if%> <%if ntres="nt" and cod=""then%> | Noticias<%end if%><%if ntres="ct" and cod=""then%> | Contacto<%end if%><%if ntres="al" and cod=""then%> | Aviso Legal<%end if%><%if ntres="hm" and cod=""then%> | HOME<%end if%><%if ntres="ck" and cod=""then%> | Cookies<%end if%></h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>generales/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Páginas</a></li>
<li class="active">Gestión Página</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>generales/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Páginas
<%if num_pg<>""then%><span class="baddge badge badge-default"> <%=num_pg%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Página</a></li>
</ul>
</nav>
</div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Página <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab"> General </a></li>
<li><a href="#tab_2" data-toggle="tab"> Ajustes / Galería<%if num_img_tot<>""then%><span class="badge badge-success" style="margin-left:5px""> <%=num_img_tot%> </span><%end if%></a></li>
<li><a href="#tab_3" data-toggle="tab"> SEO</a></li>
</ul><!--NAV TABS-->
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
</div><!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-4 control-label" for="titulo_esp" >Título <%if ntres="hm"then%>medio<%else%>página<%end if%>.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');urlea_esp();" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-file-text-o" aria-hidden="true"></i><span class="help-block">debes introducir un título</span></div></div></div>
<%if ntres<>"hm" and ntres<>"ck" then
if cod<>""then
Sql= "SELECT id_general, titulo_esp from generales where id_general<>"&cod&" order by titulo_esp"   '[ASOCIAMOS CON PÄGINA]
else
Sql= "SELECT id_general, titulo_esp from generales order by titulo_esp"   '[ASOCIAMOS CON PÄGINA]
end if
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_general="si"%>
<div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="id_pag_sup" >Subpágina de.</label>
<div class="col-md-8" ><div class="input-icon"><select name="id_pag_sup" id="id_pag_sup"  class="select-100" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof
id_pag_sup=ob_rs("id_general")
tit_general=ob_rs("titulo_esp")
if cod<>""then
Sql2= "SELECT id_item, id_general, id_pag_sup from rel where id_general = "&cod&" and id_pag_sup= "&id_pag_sup&"" 
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close
end if%>
<option value="<%=id_pag_sup%>" <%if sel="si" then%>Selected<%end if%>><%=tit_general%>
<%ob_rs.movenext
sel=""
tit_general=""
id_general=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-angle-right" aria-hidden="true"></i><span class="help-block">selecciona una página principal</span></div>
</div>
</div>
<%else%>
<div style="width:100%;margin:0 auto;text-align:center;margin-left:45px"><i class="fa fa-info-circle" aria-hidden="true"></i> Actualmente no hay más páginas creadas</div>
<%end if
ob_rs.close
'ob_conn.close
end if%>
<!--IMAGEN-->
<%if ntres<>"hm" and ntres<>"ck" then%>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label">Imagen destacada.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_1" class="form-control" type="field" name="archivo_[1]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_1" type="button" onclick="javascript:archivo('Imagen',1);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[1]" id="orden_img_1" maxlength="250" value="1">
<div class="form-group form-md-line-input" id="alt_1">
<label class="col-md-4 control-label" for="alt_1" >Título imagen.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[1]" id="alt_1" maxlength="250" value="<%=alt_1%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
<div class="row" id="div_imagen_1">
<div class="col-md-7">
<div class="form-group form-md-line-input" id="imagen_1">
<label class="col-md-7 control-label">Imagen destacada.</label>
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
<%end if%>
<!--FIN IMAGEN-->
</div><!--col-md-6-->

<div class="col-md-6">
<%if ntres<>"hm" and ntres<>"ck" then%>
<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-7">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="visible" type="checkbox" class="md-check" id="visible" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if visible="si"then%>checked="checked"<%end if%>><label for="visible">Visible </label></div>
<div class="md-checkbox"><input name="destacado" type="checkbox" class="md-check" id="destacado"  value="si" <%if destacado="si"then%>checked="checked"<%end if%>><label for="destacado"> Destacado </label></div>
<div class="md-checkbox"><input name="pr_team" type="checkbox" class="md-check" id="pr_team" value="si" <%if pr_team="si"then%>checked="checked"<%end if%>><label for="pr_team">Incluir equipo </label></div>
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
<%if ntres<>"hm" and ntres<>"ck" and ntres<>"nt" and ntres<>"ct" and ntres<>"bh" and ntres<>"tn" and ntres<>"al" and ntres<>"mp" then
Sql= "SELECT titulo_esp,id_formulario from formularios order by titulo_esp"   '[ASOCIAMOS CON FRMULARIO]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then%>
<div class="form-group form-md-line-input" >
<label class="col-md-3 control-label" for="id_formulario" >Asociar formulario.</label>
<div class="col-md-6" ><div class="input-icon"><select name="id_formulario" id="id_formulario"  class="select-100" >
<option value="" >&nbsp;</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_formulario")%>" <%if id_formulario=ob_rs("id_formulario") then%>Selected<%end if%>><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-angle-right" aria-hidden="true"></i><span class="help-block">selecciona un formulario</span></div>
</div></div>
<%else%>
<div class="col-md-3" ></div><div col-md-3 style="color:#999"><i class="fa fa-info-circle" aria-hidden="true"></i> Actualmente no hay formularios creados</div>
<%end if
ob_rs.close
ob_conn.close
end if%></div></div>
<div class="col-md-12">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label margin-left-12" for="texto_esp">Texto<%if ntres="hm"then%> medio<%end if%>.</label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea></div>
</div></div>
<div class="col-md-12" <%if ntres<>"ct" and ntres<>"al" then%>style="display:none"<%end if%>>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label margin-left-12" for="texto_esp2"><%if ntres="al" then%>Aceptación aviso legal<%else%>Texto 2.<%end if%></label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp2" id="texto_esp2" rows="3"><%=texto_esp2%></textarea></div>
</div></div></div></div></div>
<div class="tab-pane" id="tab_2"><div class="form-body"><div class="row"><div class="col-md-12"><%if ntres<>"hm"then%><div class="col-md-6">
<!--IMAGEN-->
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label">Banner.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_2" class="form-control" type="field" name="archivo_[2]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_2" type="button" onclick="javascript:archivo('Imagen',2);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[2]" id="orden_img_2" maxlength="250" value="1">
<div class="row" id="div_imagen_2"><!--SI SELECCIONAMOS-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="imagen_2">
<label class="col-md-6 control-label">Banner.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_2();" class="thumbnail thumbs_p"><img src="<%=archivo_2%>" alt="100%x180"></a></div></div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<span class="input-group-btn" id="anular_2"><button class="btn default" id="anular" type="button" onclick="javascript:anular_2();"><i class="fa fa-arrow-left fa-fw" /></i> Anular Imagen</button></span>
<div class="form-group form-md-line-input"  id="eliminar_2">
<label class="col-md-8 control-label" for="del_img_2">Eliminar Img.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="del_img_2" type="checkbox" class="md-check" id="del_img_2" value="si" ></div></div></div></div></div></div>
<div class="modal fade" id="imagemodal_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;"><img src="<%=archivo_2%>" id="imagepreview_2" style="width: 400px; margin:0 auto;" ></div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div></div></div>
<script>
function modal_img_2() { $('#imagemodal_2').modal('show'); };  //   MODAL IMAGEN 2
<%if archivo_2=""then%>
function anular_2(){$('#archivo_2').val("");$('#div_imagen_2').fadeOut("fast");}
<%else%>
function anular_2(){$('#archivo_2').val("");$('#anular_2').fadeOut("fast");$('#eliminar_2').fadeIn("fast");$('#imagen_2 img').attr('src','<%=archivo_2%>');$('#imagepreview_2').attr('src','<%=archivo_2%>');}
<%end if%>
<%if archivo_2=""then%>
$('#div_imagen_2').hide();$('#eliminar_2').hide();<%else%>
$('#eliminar_2').show();$("[name='del_img_2']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#anular_2').hide();   // FIN  MODAL IMAGEN 2
<%end if%>
</script>
</div><!--row-->
<!--FIN IMAGEN-->
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="alt_2">
<label class="col-md-3 control-label" for="alt_2" >Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[2]" id="alt_2" maxlength="250" value="<%=alt_2%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
</div><!--col-md-5-->
<!--col-md-5-->
<%end if%>
<%if ntres<>"ct" and ntres<>"ck" then%>
<!--#include file="../comun/gest_galerias.asp"--><%end if%><!--FIN row GALERIAS-->
</div>
</div>
</div><!--form-body-->
</div><!--tab_2-->
<div class="tab-pane" id="tab_3">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="url_esp_a" <%if ntres="hm" or ntres="ck" then%>style="visibility:hidden;"<%end if%>>
<label class="col-md-2 control-label" for="url_esp">URL amigable.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="url_esp" id="url_esp" onkeyup="resetea_error('url_esp_a');urlea_esp_inf();" maxlength="250" value="<%=url_esp%>"><div class="form-control-focus"></div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">URL "amigable" (para espacios pulsa "espacio" sin soltar).</span></div></div>
</div>
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-2 control-label" for="meta_title" >[meta] Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="meta_title" id="meta_title" maxlength="65" value="<%=meta_title%>"><div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un título descriptivo de unos 65 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meta_desc">[meta] Descripción.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_desc" id="meta_desc" rows="2" maxlength="160"> <%=meta_desc%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">debes introducir una descripción concisa de unos 160 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="f_texto_legal">[meta] Keywords.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_key" id="meta_key" rows="2"><%=meta_key%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">palabras clave separadas por comas</span></div></div>
</div></div></div></div></div></div>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_generales(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>generales/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div></div></div></div>
</form>
</div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div class="modal fade" id="externo1" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i>  Listado de Cursos actuales</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat="))%><iframe src="<%=r%>items/listado_iframe.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat=")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div></div></div></div>
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
<script src="<%=r%>lib/app/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/url_amigable.js"></script>
<script>
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
CKEDITOR.replace('texto_esp2',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
$(document).ready(function() {
<%if mas_texto="si" then%><%else%>$("#mas_texto_c").hide();<%end if%>
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='visible'],[name='destacado'],[name='contacto'],[name='mas_texto'],[name='pr_team']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
function urlea_esp(){document.getElementById("url_esp").value = document.getElementById("titulo_esp").value.slugify();}
function urlea_esp_inf(){document.getElementById("url_esp").value=document.getElementById("url_esp").value.slugify();}
var limita=function(){
var a=function(){
$("#titulo_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#url_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_title").maxlength({limitReachedClass:"label label-danger"}),
$("#datos_complementarios").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_desc").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
function recargar() {location.reload();}
</script>