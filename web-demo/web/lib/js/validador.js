function curso() {
Ctrl = reserva.curso;	
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
$('#alerta_txt').html('Para poder continuar debes seleccionar un <u>curso</u> del desplegable de la reserva.');
$('#alerta_tit').html('Curso no seleccionado.');
$('#alerta').modal('show');
return (false);	
} 
else		
return (true);
}
function aeropuerto() {
if(document.reserva.aero_ob.value=='si'){		
Ctrl = reserva.aeropuerto;	
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
$('#alerta_txt').html('Para poder continuar debes seleccionar un <u>aeropuerto</u> del desplegable de la reserva.');
$('#alerta_tit').html('Aeropuerto no seleccionado.');
$('#alerta').modal('show');
return (false);	
} 
else		
return (true);
}
else
return(true);}
function grupo() {
if(document.reserva.grupo_ob.value=='si'){		
Ctrl = reserva.grupo;	
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
$('#alerta_txt').html('Para poder continuar debes seleccionar un <u>grupo</u> del desplegable de la reserva.');
$('#alerta_tit').html('Grupo no seleccionado.');
$('#alerta').modal('show');
return (false);	
} 
else		
return (true);
}
else
return(true);}
function codPrivado() {
if(document.reserva.codPrivado.value=='si'){		
Ctrl = reserva.aeropuerto;	
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
$('#alerta_txt').html('Para poder continuar debes seleccionar un <u>aeropuerto</u> del desplegable de la reserva.');
$('#alerta_tit').html('Curso no seleccionado.');
$('#alerta').modal('show');
return (false);	
} 
else		
return (true);
}
else
return(true);}
function codPrivado() {
if(document.reserva.codPrivado.value=='si'){		
Ctrl = reserva.aeropuerto;	
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
$('#alerta_txt').html('Para poder continuar debes seleccionar un <u>aeropuerto</u> del desplegable de la reserva.');
$('#alerta_tit').html('Curso no seleccionado.');
$('#alerta').modal('show');
return (false);	
} 
else		
return (true);
}
else
return(true);}
function quincena() {
if(document.reserva.quincena_ob.value=='si'){		
Ctrl = reserva.salida;	
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
$('#alerta_txt').html('Por favor, selecciona una quincena del menú desplegable.');
$('#alerta_tit').html('Quincena no seleccionada.');
$('#alerta').modal('show');
return (false);	
} 
else		
return (true);
}
else
return(true);}

function salida_fecha() {
if(document.reserva.salida_fecha_ob.value=='si'){		
Ctrl = reserva.salida_fecha;	
if (Ctrl.value == "" ) {		
id_txt=	"#url_a";	
$('#alerta_txt').html('Por favor, selecciona una fecha de salida.');
$('#alerta_tit').html('Fecha no seleccionada.');
$('#alerta').modal('show');
return (false);	
} 
else		
return (true);
}
else
return(true);}
function Enviar_reserva(){
    if (!curso()) return;
	if (!aeropuerto()) return;
	if (!grupo()) return;
	if (!quincena()) return;
	if (!salida_fecha()) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.reserva.submit(); }, 300);
	return;
}
function Enviar_reserva_cod(){
    if (!curso()) return;
	if (!aeropuerto()) return;
	if (!codPrivado()) return;
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.reserva.submit(); }, 300);
	return;
}
