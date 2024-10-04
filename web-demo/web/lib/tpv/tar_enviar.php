<?php
$precio = $_POST["Precio"];
$orden =  $_POST["Orden"];
//$titular = $_POST["Titular"];
$urlMerchant = $_POST["urlMerchant"];
$urlweb_ok = $_POST["urlweb_ok"];
$urlweb_ko = $_POST["urlweb_ko"];
$kc = $_POST["kodigo"];
$url_tpvv = $_POST["url_send"];
$kodigo = $_POST["kodigo"];
$comercio= $_POST["comercio"];
$cl= $_POST["cl"];
//$currency= $_POST["divisa"];
//$consumerlng= $_POST["idioma"];
include "apiRedsys.php";  
$miObj = new RedsysAPI;
$url_tpvv=$url_tpvv;//"https://sis-t.redsys.es:25443/sis/realizarPago"; // TEST   $url_tpvv="";  REAL  https://sis.redsys.es/sis/realizarPago
$version="HMAC_SHA256_V1"; 
$name=$comercio;//"Get Up";
$code=$kodigo;//"333432847"; //$code="qwertyasdf0123456789";
$terminal=1;
$order=$orden;
$currency="978";
$consumerlng="001";
$transactionType="0";
$urlMerchant=$urlMerchant;
$urlweb_ok=$urlweb_ok;
$urlweb_ko=$urlweb_ko;
$miObj->setParameter("DS_MERCHANT_AMOUNT",$precio);
$miObj->setParameter("DS_MERCHANT_ORDER",$order);
//$miObj->setParameter("DS_MERCHANT_TITULAR",$titular);
$miObj->setParameter("DS_MERCHANT_MERCHANTCODE",$code);
$miObj->setParameter("DS_MERCHANT_CURRENCY",$currency);
$miObj->setParameter("DS_MERCHANT_TRANSACTIONTYPE",$transactionType);
$miObj->setParameter("DS_MERCHANT_TERMINAL",$terminal);
$miObj->setParameter("DS_MERCHANT_MERCHANTURL",$urlMerchant);
$miObj->setParameter("DS_MERCHANT_URLOK",$urlweb_ok);      
$miObj->setParameter("DS_MERCHANT_URLKO",$urlweb_ko);
$version="HMAC_SHA256_V1";
$kc = $cl;//'sq7HjrUOBfKmC576ILgskD5srU870gJ7';//  sq7HjrUOBfKmC576ILgskD5srU870gJ7  >> TEST   REEAL>>> MHVUmkoUT8ITn4On/SIoIzY27J3Lk+o0
$request = "";
$params = $miObj->createMerchantParameters();
$signature = $miObj->createMerchantSignature($kc);?>
<link href="web/lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="web/lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="web/lib/css/custom.css" rel="stylesheet" type="text/css" />
<link href="web/lib/css/reserva-steps.css" rel="stylesheet" type="text/css" />
<body class="fuente2">
<form id="formulario_tarjeta" name="formulario_tarjeta" action="<?php echo $url_tpvv; ?>" method="post" target="_self">
<input type='hidden' name='Ds_SignatureVersion' value='<?php echo $version; ?>'> 
<input type='hidden' name='Ds_MerchantParameters' value='<?php echo $params; ?>'> 
<input type='hidden' name='Ds_Signature' value='<?php echo $signature; ?>'> 
</form>
<div class="centra_panel">
<div class="panel panel-default pagos_pasarela">
<div class="panel-heading"><h3 class="panel-title" ><i class="fa fa-credit-card" aria-hidden="true" style="margin-right:10px"></i>Redirigiendo a Pasarela Bancaria</h3></div>
<div class="panel-body"><div class="nota_tpv">Es muy importante que tras finalizar el proceso de pago de la reserva des a "Finalizar" en la pasarela bancaria.</div>
<div id="progress"><div class="progress-bar"></div></div>
</div>
</div>
</div>
<div id="spinner_back" ><div id="spinner" class="spinner" ><img src="web/lib/img/carga.gif" width="128" height="128"><br><br>Recibiendo datos...</div></div>
<script src="web/lib/js/jquery.min.js" type="text/javascript"></script>
<script src="web/lib/app/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$('#spinner_back').fadeOut(500);
var progression = 0,
progress = setInterval(function() 
{$('#progress .progress-text').text(progression + '%');$('#progress .progress-bar').css({'width':progression+'%'});
if(progression == 100) {clearInterval(progress);//alert('done');
$('#spinner_back').fadeIn(100, function(){setTimeout(function(){document.formulario_tarjeta.submit();}, 350);});//
} else
progression += 20;
}, 650);
</script>