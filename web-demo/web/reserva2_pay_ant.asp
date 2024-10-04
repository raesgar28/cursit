<%refPago=request("cm")
estadoPago=request("st")
refPagoPay=request("tx")%>
<script type="text/javascript">document.formulario_paypal.submit();</script>
<link href="lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<body class="fuente2">
<form id="formulario_paypal" name="formulario_paypal" action="../reserva-tar-pk-ant" method="post">
<input name="refPago" type="hidden" value="<%=refPago%>">
<input name="estadoPago" type="hidden" value="<%=estadoPago%>">
<input name="refPagoPay" type="hidden" value="<%=refPagoPay%>">
</form>
<div class="centra_panel">
<div class="panel panel-default pagos_pasarela">
<div class="panel-heading"><h3 class="panel-title" ><i class="fa fa-credit-card" aria-hidden="true" style="margin-right:10px"></i>Finalizando proceso de pago</h3></div>
<div class="panel-body"><div class="nota_tpv">Un segundo, por favor. Estamos filalizando el proceso de pago por PayPal.</div>
<div id="progress"><div class="progress-bar"></div></div>
</div>
</div>
</div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<script src="lib/js/jquery.min.js" type="text/javascript"></script>
<script src="lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$('#spinner_back').fadeOut(500);
var progression = 0,
progress = setInterval(function() 
{$('#progress .progress-text').text(progression + '%');$('#progress .progress-bar').css({'width':progression+'%'});
if(progression == 100) {clearInterval(progress);//alert('done');
$('#spinner_back').fadeIn(100, function(){setTimeout(function(){document.formulario_paypal.submit();}, 350);});//
} else
progression += 20;
}, 450);
</script>