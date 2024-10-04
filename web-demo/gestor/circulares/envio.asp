<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
check=request("check")
accion=request("accion")
cod_cat=request("cod_cat")
if r ="" then r = request_equerystring("r")
if rd ="" then rd = request_equerystring("rd")
if n ="" then n = request_equerystring("n")
if ndos ="" then ndos = request_equerystring("ndos")
if ntres ="" then ntres = request_equerystring("ntres")
if ncuat ="" then ncuat = request_equerystring("ncuat")
if op ="" then op = request_equerystring("op")
if cod ="" then cod = request_equerystring("cod")
if check ="" then check = request_equerystring("check")
if accion ="" then accion = request_equerystring("accion")
if cod_cat ="" then cod_cat = request_equerystring("cod_cat")%>
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../../conex/conex_back.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<link href="../../web/lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../../web/lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../../web/lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="../../web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<body class="fuente2">
<%'Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&accion=env_mail_lst&proc=gest&cod="&cod))%>
<form id="envio" name="envio" action="acciones.jpk2" method="post" target="_self">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="accion" type="hidden" value="<%=accion%>">
<input name="proc" type="hidden" value="<%=proc%>">
<input name="cod" type="hidden" value="<%=cod%>">
<input name="check" type="hidden" value="<%=check%>">
</form>
<div class="centra_panel">
<div class="panel panel-default pagos_pasarela">
<div class="panel-heading">
<h3 class="panel-title" ><i class="fa fa-envelope" aria-hidden="true" style="margin-right:10px"></i><%if accion="del" or accion="del_gest" then%>Eliminando del comunicado<%else%>Enviando mails<%end if%></h3></div>
<div class="panel-body">
<div class="nota_tpv">Este proceso puede llegar a tardar unos minutos</div>
<div id="progress"><div class="progress-bar"></div></div>
</div>
</div>
</div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="../images/pag_loader.gif" width="64" height="64"><br><br>
Finalizando...</div></div>
<script src="../../web/lib/js/jquery.min.js" type="text/javascript"></script>
<script src="../../web/lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$('#spinner_back').fadeOut(500);
var progression = 0,
progress = setInterval(function() 
{$('#progress .progress-text').text(progression + '%');$('#progress .progress-bar').css({'width':progression+'%'});
if(progression == 100) {clearInterval(progress);//alert('done');
$('#spinner_back').fadeIn(100, function(){setTimeout(function(){document.envio.submit();}, 350);});//
} else
progression += 20;
}, 650);
</script>