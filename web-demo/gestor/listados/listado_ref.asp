<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<link href="<%=r%>lib/app/datatables/datatables.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css">
<%proc = request_equerystring("proc") 'INDICA PROCEDENCIA MENU SUP "alumnos"
t = request_equerystring("t")%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Listados </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li class="active">Listados</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Listado</span><%if pr_contabilidad_ad="si" and t="lst_fact" then%><span class="caption-subject font-green  "> *Selecciona grupos para obtener resultados</span><%end if%></div></div>
<div class="portlet-body">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ok_env_mail"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Mails enviados con éxito!!</div><%end if%>
<%if ms="del_gest"then%><div class="alert alert-success" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> registros eliminados con éxito!!</div><%end if%>
<form action="listado_ref2.asp" method="post" name="envio" class="form-horizontal" id="envio"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="cod_cat" type="hidden" value="<%=cod_cat%>"><input name="t" type="hidden" value="<%=t%>">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-12">
<%if pr_contabilidad_ad="si" and t="cont" then%>
<%end if%>
<%if pr_contabilidad_ad="si" and t="fact" then%>
<%Sql= "SELECT  mid(n_factura,7,2) AS n_factura FROM programas UNION select  mid(n_factura,7,2) AS n_factura from facturas "
Ob_Commandb.CommandText = Sql
SET Ob_RS = Ob_Commandb.Execute ()
if not ob_rs.eof then%>
<%end if
ob_rs.close
end if%>

<%if pr_contabilidad_ad="si" and t="refPago" then%>
<div class="form-group form-md-line-input " style="margin-bottom:30px;padding-bottom:30px;border-bottom:3px solid #ddd">
<label class="col-md-2 control-label col-md-offset-2" for="refPago" style="padding-right:25px">Ref pago.</label>
<div class="col-md-3"  style="padding-left:5px"><div class="input-icon">
<input type="text" class="form-control" id="refPago" name="refPago" value="" placeholder="dejar en blanco para ver todos"><div class="form-control-focus"></div>
<div class="form-control-focus"> </div><i class="fa fa-search" aria-hidden="true"></i><span class="help-block">escribe una referencia</span></div></div></div>
<%end if%>
<%if t<>"fact" then%>
<%end if%>
</div></div></div></div>
<%if t<>"fact" then%><%end if%>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-12">
<div class="col-md-5">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_listado1(this.form);"  language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> realizar la selección</button>
</div></div></div></div>
</div><!--ACCIONES fin form-body-->
</form>
</div></div></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
$('#opciones').hide();
function Enviar_listado1 (form)  {	////////////////////////////////////   WEBS 
$('#spinner_back').show();
$('#spinner').show();
setTimeout(function(){ document.envio.submit(); }, 300);
return;}
function toggle_to(){$("#opciones").slideToggle( "slow" );}
$(document).ready(function() {$('select').select2({minimumResultsForSearch: -1,language: "es"})})
</script>
<script src="<%=r%>lib/js/custom.js" type="text/javascript"></script>