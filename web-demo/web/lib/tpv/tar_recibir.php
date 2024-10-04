<?php
include 'apiRedsys.php';
$miObj = new RedsysAPI;
$datos = $_GET["Ds_MerchantParameters"];
$decodec = $miObj->decodeMerchantParameters($datos);	
$deco = json_decode($decodec, true);
$ds_order= $deco['Ds_Order'];
$ds_date= $deco['Ds_Date'];
$ds_response= $deco['Ds_Response'];
$ds_amount= $deco['Ds_Amount']/100;?>
<link href="../../../web/lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../../../web/lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../../../web/lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="../../../web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<body>
<form name="formulario_tarjeta" id="formulario_tarjeta" action="../../../reserva-tar-fn" method='post' target='_self'>
<input type="hidden" name="ds_order" value="<?php echo $ds_order; ?>" />
<input type="hidden" name="ds_date" value="<?php echo $ds_date; ?>" />
<input type="hidden" name="ds_response" value="<?php echo $ds_response; ?>" />
<input type="hidden" name="ds_amount"  value="<?php echo $ds_amount; ?>" />
<input type="hidden" name="metodoPago"  value="Tarjeta" />
</form> 
<div class="centra_panel">
<div class="panel panel-default pagos_pasarela">
<div class="panel-heading"><h3 class="panel-title" ><i class="fa fa-credit-card" aria-hidden="true" style="margin-right:10px"></i>Recibiendo datos de Pasarela Bancaria</h3></div>
<div class="panel-body"><div class="nota_tpv">Finalizando proceso...</div>
<div id="progress"><div class="progress-bar"></div></div>
</div>
</div>
</div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="../../../web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<script src="../../../web/lib/js/jquery.min.js" type="text/javascript"></script>
<script src="../../../web/lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$('#spinner_back').fadeOut(500);
var progression = 0,
progress = setInterval(function() 
{$('#progress .progress-text').text(progression + '%');$('#progress .progress-bar').css({'width':progression+'%'});
if(progression == 100) {clearInterval(progress);//alert('done');
$('#spinner_back').fadeIn(100, function(){setTimeout(function(){document.formulario_tarjeta.submit();}, 250);});//
} else
progression += 20;
}, 500);
</script>