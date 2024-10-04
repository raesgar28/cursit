<!--#include file="../comun/menu_sup.asp"-->  
<%Sql= "SELECT * from items where id_item="&cod_prog&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
end if
ob_rs.close%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Cambiar Categoría Programa | <%=titulo_esp%></span></div>
</div>
<div class="portlet-body">
<form action="guardar_cambiar_cat.asp" class="form-horizontal" id="envio" name="envio" method="post">
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
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> La URL o el Destino ya se encuentran registrados.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="form-body">
<div class="row">
<div class="col-md-offset-0 col-md-12">
<div class="note note-info magin-top-0" style="margin-bottom:45px"><h4 class="block">Aviso Importante</h4><p><i class="fa fa-info-circle" aria-hidden="true"></i> Una vez realizado el cambio de Categoría, por favor revisar Secciones y Subsecciones asociadas si las hubiera.</p></div>
<%Sql= "SELECT titulo_esp, id_categoria from categorias order by titulo_esp "   
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then%>
<div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="id_web" >Categoría.<span class="required">*</span></label>
<div class="col-md-4"><div class="input-icon">
<select name="id_categoria" id="id_categoria" class="select-100">
<%do while not ob_rs.eof
id_categoria=ob_rs("id_categoria")
tit_cat=ob_rs("titulo_esp")
Sql2= "SELECT id_item, id_categoria from rel where id_item = "&cod_prog&" and id_categoria= "&id_categoria&" group by id_categoria, id_item"
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
sel="si"
end if
ob_rs2.close%>
<option value="<%=id_categoria%>" <%if sel="si" then%>Selected<%end if%>><%=tit_cat%>
<%sel=""
tit_cat=""
id_categoria=""%>
</option>
<%ob_rs.movenext
loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona una sección</span></div>
</div>
</div>
<%end if
ob_rs.close
ob_conn.close%>
</div>
</div>
</div>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-12">
<button type="button" class="btn green" onclick="Enviar_cambiar_cat(this.form);" value="enviar datos" language="javascript"><i class="fa fa-exchange" aria-hidden="true"></i> cambiar categoría</button>
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
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
function recargar() {location.reload();}
$(document).ready(function() {$('select').select2({minimumResultsForSearch: -1,language: "es"})})
</script>