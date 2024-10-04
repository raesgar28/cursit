<!--#include file="comun/menu_sup.asp"-->
<!--#include file="comun/z_check_user.asp"-->
<link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<%id_programa=request("id_programa")
id_programar=request("id_programar")
id_programa_f=request("id_programa_f")
if id_programar<>"" then id_programa=id_programar end if
if id_programa_f<>""then id_programa=id_programa_f end if
id_alumno=request("id_alumno")
Sql= "SELECT id_item, id_alumno, id_curso, pr_cancelacion_pr FROM programas_tmp WHERE id_programa="&id_programa&"  AND id_alumno="&id_alumno&" AND (id_usuario="&session("id_usuario")&" or id_agente_cod="&session("id_usuario")&") "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_item=ob_rs("id_item")
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
id_curso=ob_rs("id_curso")
id_alumno=ob_rs("id_alumno")
else
response.redirect(r&"preinscripciones-ko")
end if
ob_rs.close
Sql2= "SELECT pr_reserva, titulo_esp, completo, disponible FROM items WHERE id_item="&id_item&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then 
pr_reserva=ob_rs2("pr_reserva")+pr_cancelacion_pr
tit_programa=ob_rs2("titulo_esp")
completo_r=ob_rs2("completo")
disponible_r=ob_rs2("disponible")
end if
ob_rs2.close%>
<!--#include file="comun/moneda.asp"-->
<%Sql2= "SELECT titulo_esp, disponible, pr_reserva FROM itemsSub WHERE id_itemSub="&id_curso&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then 
tit_curso=ob_rs2("titulo_esp")
disponible_s_r=ob_rs2("disponible")
if ob_rs2("pr_reserva")<>0 and ob_rs2("pr_reserva")<>"0,00" then pr_reserva=ob_rs2("pr_reserva")+pr_cancelacion_pr end if
end if
ob_rs2.close
Sql2= "SELECT a_nombre, a_apellidos FROM alumnos_tmp WHERE id_alumno="&id_alumno&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
nombre_alumno=ob_rs2("a_nombre") &" "& ob_rs2("a_apellidos")
end if
ob_rs2.close%>
<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both"><div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-sbold"><%=titulo_esp_web%></h3><h4 class=""><%=titulo_esp_div%></h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li>
<a href="<%=r%>zona-privada">Zona usuario</a></li><li>/</li><li class="c-state_active">Inscripciones</li></ul></div></div>
<div class="container reserva_check">
<!--#include file="comun/z_menu.asp"-->
<div class="c-layout-sidebar-content ">
<%if completo_r="si" or (disponible_r ="" or disponible_s_r="") then ' SI CURSO COMPLETO%>
<div class="reg_curso_completo"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Lo sentimos, el curso se encuentra COMPLETO.</div>
<ul class="list-inline pull-right">
<li><a href="<%=r%>inscripciones" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  prev-step"><i class="fa fa-arrow-left" aria-hidden="true" style="margin-right:8px"></i> Inscripciones </a></li>
</ul>
<%else%>
<form name="f_reserva" id="f_reserva" method="post" action="<%=r%>formalizar-reserva-fin">
<input name="id_programa" type="hidden" value="<%=id_programa%>">
<input name="id_programa_ok" id="id_programa_ok" type="hidden" value="<%=id_programa%>">
<input name="rd" id="rd" type="hidden" value="<%=rd%>"><input name="r" id="r" type="hidden" value="<%=r%>"><input name="z_privada" id="z_privada" type="hidden" value="si">
<div class="c-content-title-1"><h3 class="">Zona Privada</h3><div class="c-line-left"></div></div>
<div id="pro_pago">
<div class="alu_metodos_pago"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <%=nombre_alumno%> <i class="fa fa-angle-double-right" aria-hidden="true"></i> <%=tit_programa%> :: <%=tit_curso%></div>
<div class="pr_reserva" style="text-align:center"><span class="pr_reserva_txt">Precio de la reserva</span><span class="pr_reserva_pr"><%=FormatNumber(ccur(pr_reserva),2)%>&nbsp;<%=mon%></span><span class="met_pag_ver_reserva"><a href="#/" onClick="javascript:a_pdf_presupuesto(<%=id_programa%>);"><i class="fa fa-download" aria-hidden="true"></i> ver presupuesto</a></span></div>
</div>
<!--Comprobamos si este caso está en rango-->
<%mes_sal=request("salida_mes")
if mes_sal="" then mes_sal=aeropuerto_mes end if
if mes_sal="" then mes_sal=s_mes end if
Sql= "SELECT id_seccion FROM rel WHERE id_item="&id_item&" and id_seccion<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_seccion=ob_rs("id_seccion")
end if
ob_rs.close
Sql= "SELECT id_destino FROM rel WHERE id_item="&id_item&" and id_destino<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_destino=ob_rs("id_destino")
end if
ob_rs.close
Sql= "SELECT id_categoria FROM rel WHERE id_item="&id_item&" and id_categoria<>0"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_categoria=ob_rs("id_categoria")
end if
ob_rs.close
Sql= "SELECT id_categoria FROM descuentosRel WHERE id_categoria="&id_categoria&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
Sql= "SELECT id_seccion FROM descuentosRel WHERE id_seccion="&id_seccion&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
if mes_sal<>"" then
Sql= "SELECT mes FROM descuentosRel WHERE mes='"&mes_sal&"' "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
if f_inicio<>"" then 
f_inicio_cod=year(f_inicio) 
Sql= "SELECT id_seccion FROM descuentosRel WHERE anyo="&f_inicio&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
if id_destino<>"" then
Sql= "SELECT mes FROM descuentosRel WHERE id_destino="&id_destino&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
if session("id_usuario")<>"" then
Sql= "SELECT mes FROM descuentosRel WHERE id_usuario="&session("id_usuario")&"  "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
end if
Sql= "SELECT mes FROM descuentosRel WHERE id_alumno<>0 "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
Sql= "SELECT mes FROM descuentosRel WHERE ciudad<>'' or ciudad is not null "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close
Sql= "SELECT mes FROM descuentosRel WHERE provincia<>'' or ciudad is not null "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
pasa="si"
end if
ob_rs.close

if pasa="si" then%>
<div class="descuento">
<div id="check_descuento">
<div id="check_ko"><span class="cod_txt">¿Dispones de un código de agente?</span>
<div class="form-group"><i class="fa fa-barcode" aria-hidden="true"></i><input type="text" placeholder="Código agente" onclick="this.placeholder = ''" onblur="this.placeholder = 'Código agente'" class="form-control c-square c-theme input-lg inp"  name="cod_descuento" id="cod_descuento"></div>
<button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-10" onClick="ap_descuento();"><i class="fa fa-edit" aria-hidden="true"></i> Aplicar código </button>
</div>
</div>
</div>
<%end if%>
<input type="hidden" name="id_programa_desc" id="id_programa_desc" value=""/>
<div class="col-md-12 metodosPagos" id="pro_pago_opt">
<%Sql= "SELECT * FROM metodosPago WHERE id_metodoPago IS NOT NULL"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<%if ob_rs("transferencia")="si" and ob_rs("datos_transferencia")<>"" then
m_transferencia="si"
%>
<div class="metodoPago met_pago" style="margin-right:10%;max-width:130px;"><input name="metodoPago" type="radio" value="pag_transferencia" id="matodoPago1"  class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="En un plazo de 72 horas"><label for="matodoPago1" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="En un plazo de 72 horas"><i class="fa fa-exchange met_pago" aria-hidden="true"></i> Transferencia <br>Bancaria</label></div>
<%end if
if ob_rs("tarjeta")="si" and ob_rs("tar_comercio")<>"" and ob_rs("tar_cod_comercio")<>"" and ob_rs("tar_pass")<>"" then
m_tarjeta="si"%>
<div class="metodoPago met_pago" style="margin-right:10%;max-width:130px;"><input name="metodoPago" type="radio" value="pag_tarjeta" id="matodoPago2" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Se redirigirá a la pasarela bancaria"><label for="matodoPago2" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Se redirigirá a la pasarela bancaria"><i class="fa fa-credit-card met_pago" aria-hidden="true"></i> Tarjeta de Crédito</label></div>
<%end if
if ob_rs("paypal")="si" and ob_rs("pay_mail")<>""then
m_paypal="si"%>
<div class="metodoPago met_pago" style="margin-right:10%;max-width:130px;"><input name="metodoPago" type="radio" value="pag_paypal" id="matodoPago3" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Mediante redirección a pasarela PayPal"><label for="matodoPago3" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Mediante redirección a pasarela PayPal"><i class="fa fa-cc-paypal met_pago" aria-hidden="true"></i> PayPal</label></div>
<%end if
if ob_rs("oficina")="si"then
m_oficina="si"%>
<div class="metodoPago met_pago" style="margin-right:0%;max-width:130px;"><input name="metodoPago" type="radio" value="pag_oficina" id="matodoPago4" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Pago en metálico en oficina o delegación Cursit"><label for="matodoPago4" class="met_pago inp_n" data-toggle="tooltip" data-placement="top" title="Pago en metálico en oficina o delegación Cursit"><i class="fa fa-money met_pago" aria-hidden="true"></i> Pago en Oficina</label></div>
<%end if%>
<%else%>
<div class="no_hay_pago"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Actualmente no hay ningún método de pago habilitado.</div>
<%end if
ob_rs.close%>
</div>
<div class="col-md-12" style="margin-top:35px">
<div class="form-group"><i class="fa fa-comments-o" aria-hidden="true"></i>
<textarea rows="4" placeholder="Observaciones para el curso" onclick="this.placeholder = ''" onblur="this.placeholder = 'Observaciones para el curso'" class="form-control c-theme c-square input-lg inp" name="a_observaciones_curso" id="a_observaciones_curso"></textarea></div>
</div>
<%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='cc'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_cc=ob_rs("texto_esp")
titulo_cc=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="col-md-12">
<div class="condiciones_contratacion"><span class="condiciones_contratacion_tit"><i class="fa fa-gavel" aria-hidden="true"></i> <%=titulo_cc%></span>
<div class="clausula_aceptacion"><%=texto_cc%></div>
<div class="c-checkbox">
<input type="checkbox" class="c-check" name="acp_condiciones" id="acp_condiciones" autocomplete="off">
<label for="acp_condiciones" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-gavel" aria-hidden="true" style="color:#999"></i> Sí, he leido y acepto Las condiciones de contratación</label>
</div>
</div>
<div class="c-checkbox">
<input type="checkbox" class="c-check" name="acp_info" id="acp_info" autocomplete="off">
<label for="acp_info" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, he leido y acepto <a href="javascript:tratamiento_datos();" class="check_a">La Cláusula Informativa y Autorización al Tratamiento de los Datos</a></label>
<div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_td=ob_rs("texto_esp")
titulo_td=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i>
 <span><%=titulo_td%></span></h4>
</div>
<div class="modal-body"><p><span><%=texto_td%></span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div>
</div>
</div>
</div>
</div>
<div class="c-checkbox">
<input name="acp_mail" type="checkbox" class="c-check" id="acp_mail" autocomplete="off">
<label for="acp_mail" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-envelope-o" aria-hidden="true" style="color:#999"></i> Sí, quiero formar parte de la base de datos para el envío de Newsletters de Cursit </label>
</div>

</div>
<ul class="list-inline pull-right">
<li><a href="<%=r%>inscripciones" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  prev-step"><i class="fa fa-arrow-left" aria-hidden="true" style="margin-right:8px"></i> Inscripciones </a></li>
<li><button type="button" class="btn c-theme-btn c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20 pull-right  next-step" id="nxt_step_3" onClick="javascript:paso_fin();">Confirmar Reserva <i class="fa fa-check" aria-hidden="true" style="margin-left:8px"></i>
</button></li>
</ul>
</form>
<%end if%>
</div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4>
</div>
<div class="modal-body"><p><span id="alerta_txt"></span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div>
</div>
</div>
</div>
<div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_td=ob_rs("texto_esp")
titulo_td=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="modal-dialog">
<div class="modal-content c-square">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span>
</button>
<h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i>
 <span><%=titulo_td%></span></h4>
</div>
<div class="modal-body"><p><span><%=texto_td%></span></p></div>
<div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div>
</div>
</div>
</div>
<div id="spinner_back_usu" ><div id="spinner" class="spinner_usu" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Comprobando datos...</div></div>
<!--#include file="comun/menu_inf.asp"-->
<script>
$(document).ready(function(e) {
$(".inp_n").tooltip({html:true});

$('#spinner_back_usu').hide();})

function tratamiento_datos(){$('#tratamiento_datos').modal('show');}
function a_pdf_presupuesto(programa){window.location.href = "<%=r%>web/pr_pdf_preins.asp?id_programa="+programa;}
function acp_info(){
if (document.getElementById("acp_info").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar la Cláusula Informativa y Autorización al Tratamiento de datos.');$('#alerta_tit').html('Aceptar cláusula informativa.');$('#alerta').modal('show');return (false)}}
function acp_condiciones(){
if (document.getElementById("acp_condiciones").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar las condiciones de contratación.');$('#alerta_tit').html('Aceptar condiciones de contratación.');$('#alerta').modal('show');return (false)}}
function metodos(){check='no';
<%if m_transferencia="si" then%>if(!document.all.matodoPago1 && check!='si'){check='no'}else {if (document.getElementById("matodoPago1").checked==true){check='si'}};<%end if%>
<%if m_tarjeta="si" then%>if(!document.all.matodoPago2 && check!='si'){check='no'}else {if (document.getElementById("matodoPago2").checked==true){check='si'}};<%end if%>
<%if m_paypal="si" then%>if(!document.all.matodoPago3 && check!='si'){check='no'}else {if (document.getElementById("matodoPago3").checked==true){check='si'}};<%end if%>
<%if m_oficina="si" then%>if(!document.all.matodoPago4 && check!='si'){check='no'}else {if (document.getElementById("matodoPago4").checked==true){check='si'}};<%end if%>
if(check=='si'){return(true)}else{	$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes seleccionar un método de pago.');$('#alerta_tit').html('Método de pago.');$('#alerta').modal('show');return(false)}	}
function paso_fin(){
if (!metodos()) return;
if (!acp_condiciones()) return;
if (!acp_info()) return;
$('#spinner_back_usu').fadeIn(100, function(){setTimeout(function(){ document.f_reserva.submit(); }, 0);});
return;}
function ap_descuento(){
$('#spinner_back_usu').fadeIn(100, function(){});
var url = "<%=r%>web/pr_descuento.asp";
$.ajax({
type: "GET",
url: url,
data: $("#f_reserva").serialize(),
success: function(data){
$('#spinner_back_usu').fadeOut(100, function(){});
$('#check_descuento').html(data); 
}
});
return false;}

</script>