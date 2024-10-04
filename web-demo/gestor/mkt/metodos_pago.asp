<!--#include file="../comun/menu_sup.asp"-->  
<%Sql= "SELECT * from metodosPago where id_metodoPago IS NOT NULL"     '[RECOGEMOS DATOS]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
cod=ob_rs("id_metodoPago")
transferencia=ob_rs("transferencia")
tarjeta=ob_rs("tarjeta")
paypal=ob_rs("paypal")
oficina=ob_rs("oficina")
datos_transferencia=ob_rs("datos_transferencia")
pay_test=ob_rs("pay_test")
pay_mail=ob_rs("pay_mail")
tar_comercio=ob_rs("tar_comercio")
tar_cod_comercio=ob_rs("tar_cod_comercio")
tar_pass=ob_rs("tar_pass")
tar_test=ob_rs("tar_test")
end if
ob_rs.close   '[FIN RECOGEMOS DATOS]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Métodos de Pago </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li class="active">Gestión Métodos de Pago</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Métodos de Pago</span></div>
</div>
<div class="portlet-body">
<form action="metodos_pago_mod.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="edi" type="hidden" value="<%=edi%>">
<input name="cod" type="hidden" value="<%=cod%>">
<%if cod<>""then%><input name="op" type="hidden" value="up"><%else%><input name="op" type="text" value="in"><%end if%>
<div class="form-body no_pad">
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="form-body">
<div class="row">
<div class="col-md-5 ">
<div class="form-group form-md-line-input">
<div class="col-md-4"></div>
<div class="md-checkbox col-md-8"><input name="transferencia" type="checkbox" class="md-check" id="transferencia" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if transferencia="si"then%>checked="checked"<%end if%>><label for="transferencia"> Habilitar transferencia. </label></div>
</div>
<div class="form-group form-md-line-input">

<label class="col-md-4 control-label" for="datos_transferencia">Datos transferencia.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="datos_transferencia" id="datos_transferencia" maxlength="250" value="<%=datos_transferencia%>"><div class="form-control-focus"></div><i class="fa fa-exchange" aria-hidden="true"></i><span class="help-block">cc, banco, iban,...</span></div></div>
</div>



<div class="form-group form-md-line-input">
<div class="col-md-4"></div>
<div class="md-checkbox-inline col-md-8" style="margin-top:25px" >
<div class="md-checkbox"><input name="tarjeta" type="checkbox" class="md-check" id="tarjeta" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if tarjeta="si"then%>checked="checked"<%end if%> ><label for="tarjeta">Habilitar Pago Tarjeta. </label></div>
<div class="md-checkbox"><input name="tar_test" type="checkbox" class="md-check" id="tar_test" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if tar_test="si"then%>checked="checked"<%end if%> ><label for="tar_test">Entorno test. </label></div>
</div>
</div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="tar_comercio">Nombre comercio.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tar_comercio" id="tar_comercio" maxlength="250" value="<%=tar_comercio%>"><div class="form-control-focus"></div><i class="fa fa-credit-card" aria-hidden="true"></i><span class="help-block">nombre comercio para el TPV</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="tar_cod_comercio">Código comercio.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="tar_cod_comercio" id="tar_cod_comercio" maxlength="250" value="<%=tar_cod_comercio%>"><div class="form-control-focus"></div><i class="fa fa-credit-card" aria-hidden="true"></i><span class="help-block">código comercio para el TPV</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="tar_pass">Clave comercio.</label>
<div class="col-md-7"><div class="input-icon"><input type="password" class="form-control" placeholder="" name="tar_pass" id="tar_pass" maxlength="250" value="<%=tar_pass%>"><div class="form-control-focus"></div><i class="fa fa-credit-card" aria-hidden="true"></i><span class="help-block">clave comercio para el TPV</span></div></div>
</div>
</div><!--col-md-6-->
<div class="col-md-5">
<div class="form-group form-md-line-input">
<div class="col-md-4"></div>
<div class="md-checkbox-inline  col-md-8" style="margin-top:25px" >
<div class="md-checkbox"><input name="paypal" type="checkbox" class="md-check" id="paypal" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if paypal="si"then%>checked="checked"<%end if%> ><label for="paypal">Habilitar Pago Paypal. </label></div>
<div class="md-checkbox"><input name="pay_test" type="checkbox" class="md-check" id="pay_test" value="si" <%if cod=""then%>checked="checked"<%end if%> <%if pay_test="si"then%>checked="checked"<%end if%> ><label for="pay_test">Entorno test. </label></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="pay_mail">Mail de comercio.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pay_mail" id="pay_mail" maxlength="250" value="<%=pay_mail%>"><div class="form-control-focus"></div><i class="fa fa-paypal" aria-hidden="true"></i><span class="help-block">mail comercio para PayPal</span></div></div>
</div>
<div class="form-group form-md-line-input">
<div class="col-md-4"></div>
<div class="md-checkbox-inline col-md-8" style="margin-top:25px" >
<div class="md-checkbox"><input name="oficina" type="checkbox" class="md-check" id="oficina" value="si" <%if oficina="si"then%>checked="checked"<%end if%> ><label for="oficina">Habilitar Pago Oficina. </label></div>
</div>
</div>
</div><!--col-md-6-->





</div><!--row-->
</div>

<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_metodosPago(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<button type="reset" class="btn default"><i class="fa fa-eraser" aria-hidden="true"></i> resetear formulario</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
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
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"});
$("[name='transferencia'],[name='tarjeta'],[name='oficina'],[name='paypal'],[name='tar_test'],[name='pay_test']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});})
</script>