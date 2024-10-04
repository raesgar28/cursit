<!--#include file="comun/menu_sup.asp"-->
<!--#include file="comun/z_check_user.asp"-->
<%if session("id_usuario")<>"" then
Sql= "SELECT u_telefono,u_email,u_movil,u_direccion,u_ciudad, u_provincia, u_pais,u_empresa from usuarios where id_usuario= "&session("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_email=ob_rs("u_email")
u_telefono=ob_rs("u_telefono")
u_movil=ob_rs("u_movil")
u_direccion=ob_rs("u_direccion")
u_ciudad=ob_rs("u_ciudad")
u_provincia=ob_rs("u_provincia")
u_pais=ob_rs("u_pais")
u_empresa=ob_rs("u_empresa")
end if
ob_rs.close
else
response.redirect(r&"zona-privada")
end if%>
<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both"><div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-sbold"><%=titulo_esp_web%></h3><h4 class=""><%=titulo_esp_div%></h4></div><ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular"><li>
<a href="<%=r%>zona-privada">Zona usuario</a></li><li>/</li>
<li class="c-state_active">Inscribir alumno</li></ul></div></div>
<div class="container reserva_check">
<!--#include file="comun/z_menu.asp"--><link href="<%=r%>web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<div class="c-layout-sidebar-content ">
<div class="c-content-title-1"><h3 class="">Inscribir nuevo alumno</h3><div class="c-line-left"></div></div>
<div class="col-md-4"  style="width:100%;max-width:340px;float:left;min-height:320px">
<select name="programa" id="programa" onChange="MM_jumpMenu('parent',this,0)" style="width:90%">
<option value="">Selecciona un programa</option>
<%Sql= "SELECT rel.id_item, items.titulo_esp, rel.id_categoria, categorias.titulo_esp, items.url_esp, categorias.url_esp FROM rel, items, categorias WHERE rel.id_item=items.id_item AND rel.id_categoria=categorias.id_categoria AND rel.id_categoria<>0 AND rel.id_item<>0  GROUP BY rel.id_item, rel.id_categoria, items.titulo_esp, categorias.titulo_esp, items.url_esp, categorias.url_esp ORDER BY categorias.titulo_esp, items.titulo_esp"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof
titulo=ob_rs("items.titulo_esp")
id_item_n=ob_rs("id_item")
cat=ob_rs("categorias.titulo_esp")
url_esp_ite=ob_rs("items.url_esp")
url_esp_cat=ob_rs("categorias.url_esp")
'url_esp_sec=ob_rs("secciones.url_esp")
'url_esp_des=ob_rs("destinos.url_esp")
Sql2= "SELECT id_item FROM agentesCursos WHERE id_item="&id_item_n&" AND id_agente="& session("id_usuario")&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<option value="<%=r%>inscribir/<%=url_esp_cat%>/<%=url_esp_ite%>" <%if int(id_item)=int(id_item_n) then%>selected<%end if%>><%=titulo%> - <%=cat%></option>
<%end if
ob_rs2.close
ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
Selecciona uno de los programas disponibles del desplegable
</div>
<%if id_item<>"" then%>
<div class="col-md-8 reserva" style="width:100%;max-width:500px;margin-top:0px;float:left" >
<form name="reserva" id="reserva" method="post" action="<%=r%>reserva">
<input name="cod_ko" type="hidden" value="<%=cod_ko%>" sutocomplete="off">
<input name="id_item" type="hidden" value="<%=id_item%>">
<%Sql= "SELECT rel.id_itemSub, itemsSub.titulo_esp FROM rel, itemsSub WHERE rel.id_item="&id_item&" and rel.id_itemSub <>0 and rel.id_itemSub=itemsSub.id_itemSub"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="caja_curso">
<select name="curso" id="curso" onChange="suma();" style="width:100%" autocomplete="off">
<option value="">Selecciona Curso</option>
<%do while not ob_rs.eof%>
<option value="<%=ob_rs("id_itemSub")%>"><%=ob_rs("titulo_esp")%></option>
<%ob_rs.movenext
loop%>
</select>
</div>
<%end if
ob_rs.close
Sql= "SELECT rel.id_alo_tipo, alo_tipo.titulo_esp FROM rel, alo_tipo WHERE rel.id_item="&id_item&" and rel.id_alojamiento <>0 and rel.id_alo_tipo=alo_tipo.id_alo_tipo GROUP BY rel.id_alo_tipo, alo_tipo.titulo_esp,  alo_tipo.orden ORDER BY alo_tipo.orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="caja_aloja">
<select name="alojamiento" id="alojamiento" onChange="suma();" style="width:100%" autocomplete="off">
<option value="">Selecciona Alojamiento</option>
<%do while not ob_rs.eof%>
<optgroup value="" label="<%=ob_rs("titulo_esp")%>">
<%Sql2= "SELECT alo_conceptos.titulo_esp, alo_op.titulo_esp, rel.id_alo_op, rel.id_alo_opcion, rel.id_alojamiento FROM alo_conceptos, rel, alo_op WHERE rel.id_alo_tipo="&ob_rs("id_alo_tipo")&" AND rel.id_item="&id_item&" AND rel.id_alo_op=alo_op.id_alo_op AND rel.id_alojamiento=alo_conceptos.id_alojamiento ORDER BY alo_conceptos.orden, alo_op.orden"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof%>
<option value="<%=ob_rs2("id_alo_opcion")%>|<%=ob_rs2("id_alojamiento")%>"><%=ob_rs2("alo_conceptos.titulo_esp")%> / <%=ob_rs2("alo_op.titulo_esp")%></option>
<%ob_rs2.movenext
loop
end if
ob_rs2.close%>
</optgroup>
<%ob_rs.movenext
loop%>
</select>
</div>
<%end if
ob_rs.close
Sql= "SELECT id_item,id_itemSub FROM rel WHERE id_item="&id_item&" and rel.id_itemSub <>0 " 'CALCULO MINIMO SEMANAS
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
sema_min=2
do while not ob_rs.eof
id_itemSub=ob_rs("id_itemSub")
Sql2= "SELECT semanas, rel.id_itemSub, rel.id_itemSubSemana FROM itemsSubSemanas, rel WHERE rel.id_itemSub="&id_itemSub&" and rel.id_itemSubSemana <>0 and rel.id_itemSubSemana=itemsSubSemanas.id_itemSubSemana order by semanas ASC"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then
semana_min_p=ob_rs2("semanas")
if semana_min_p < sema_min then sema_min=semana_min_p end if
end if
ob_rs2.close
ob_rs.movenext
loop
end if
ob_rs.close%>
<input name="semanas_p" type="hidden" value="<%=sema_min%>">
<%Sql= "SELECT opcion_esp, opcion_ob, rel.id_itemOp FROM rel, itemsOp WHERE id_item="&id_item&" AND rel.id_itemOp<>0 AND rel.id_itemOp=itemsOp.id_itemOp  ORDER BY opcion_orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<div class="c-checkbox-list" >
<%do while not ob_rs.eof%>
<div class="c-checkbox">
<%if ob_rs("opcion_ob")="si"then%>
<input type="checkbox" id="no<%=i%>" class="c-check" disabled="disabled" checked="CHECKED" name="no<%=i%>">
<label for="no<%=i%>" class="check_txt"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("opcion_esp")%></label>
<input type="hidden" name="opp[<%=i%>]" value="<%=ob_rs("id_itemOp")%>" />
<%else%>
<input type="checkbox" id="opp[<%=i%>]" class="c-check" onclick="suma_total();" value="<%=ob_rs("id_itemOp")%>" name="opp[<%=i%>]" autocomplete="off">
<label for="opp[<%=i%>]" class="check_txt" onclick="suma_total();"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs("opcion_esp")%></label>
<%end if%>
</div>
<%ob_rs.movenext
i=i+1
loop%>
</div>
<%end if
ob_rs.close%>
<div id="Suma_Curso"></div>
<div id="Suma_Total"></div>
<div class="carga">calculando...</div>
</form>
<script language="javascript">
suma_total();
function datea(esto){
String.prototype.contains = function(it){return this.indexOf(it) != -1;};
var esto2;
var uno = esto.contains("1"); 
if (uno==false){esto2=esto2+"1"}
var dos = esto.contains("2"); 
if (dos==false){esto2=esto2+"2"}
var tres = esto.contains("3"); 
if (tres==false){esto2=esto2+"3"}
var cuatro = esto.contains("4"); 
if (cuatro==false){esto2=esto2+"4"}
var cinco = esto.contains("5"); 
if (cinco==false){esto2=esto2+"5"}
var seis = esto.contains("6"); 
if (seis==false){esto2=esto2+"6"}
var siete = esto.contains("7"); 
if (siete==false){esto2=esto2+"0"}
$('.date-picker').datepicker({ startDate: new Date() , minDate: 0, language: 'es',autoclose: true,daysOfWeekHighlighted: esto,daysOfWeekDisabled: esto2});}
function selectItemCombo(combo, valor)
{for(i=0; i<combo.length; i++){if (combo.options[i].value == valor)combo.selectedIndex = i;
var manejador = $(combo).msDropDown().data("dd");
if(manejador) {manejador.set("selectedIndex", combo.selectedIndex)}}}
function cargaCurso(semanas,id_curso){
selectItemCombo(document.reserva.curso, id_curso);
document.reserva.semanas_p.value=semanas;
$( ".caja_curso .dd .ddTitle" ).addClass( "cajote" );}
function cargaAloja(opcion,alojamiento){
$( ".caja_aloja .dd .ddTitle" ).addClass( "cajote" );
selectItemCombo(document.reserva.alojamiento, opcion+"|"+alojamiento);
suma_total();}
$('.carga').hide();
$("#curso").change(function(){suma();})
$("#alojamiento").change(function(){suma();})
function suma(){
semanas_p=	document.reserva.semanas_p.value;
id_itemSub=document.reserva.curso.value;
$('#Suma_Total').hide();
$('.carga').fadeIn(100, function(){});
$(function() {     
$.ajax({
url:'<%=r%>web/pr_curso.asp?id_item=<%=id_item%>&id_itemSub='+id_itemSub+'&semanas_p='+semanas_p+'',
type: 'get',
success: function(content,code) {
$('#Suma_Curso').html(content);$('#Suma_Curso').hide();
$('.carga').fadeOut(800, function(){$('#Suma_Curso').fadeIn(800, function(){});$( ".caja_curso .dd .ddTitle" ).removeClass( "cajote" );});}});});}
function suma_total(){
$('#Suma_Total').hide();
$('.carga').fadeIn(100, function(){});
var url = "<%=r%>web/pr_total.asp";
$.ajax({
type: "GET",
url: url,
data: $("#reserva").serialize(),
success: function(data){
$('#Suma_Total').html(data);
$('#Suma_Total').hide();
$('.carga').fadeOut(500, function(){$('#Suma_Total').html(data).fadeIn(500);$( ".caja_aloja .dd .ddTitle" ).removeClass( "cajote" );});}});return false;}
function curso() {Ctrl = reserva.curso;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Selecciona un curso del menú desplegable.');$('#alerta_tit').html('Curso no seleccionado.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function Enviar_reserva(){
    if (!curso()) return;
	//if (!aeropuerto()) return;//if (!grupo()) return;//if (!quincena()) return;//if (!salida_fecha()) return;
	$('#spinner_back').show();$('#spinner').show();
	setTimeout(function(){ document.reserva.submit(); }, 300);
	return;
}
</script>
</div>
<%end if%>
</div>
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
<!--#include file="comun/menu_inf.asp"-->
<link rel="stylesheet" type="text/css" href="<%=r%>web/lib/css/dd.css" />
<script src="<%=r%>web/lib/js/jquery.dd.min.js"></script>
<link href="<%=r%>web/lib/app/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"> 
<script src="<%=r%>web/lib/app/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=r%>web/lib/app/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<script language="javascript">$(document).ready(function(e) {$("body select").msDropDown();})</script>