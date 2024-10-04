$(window).load(function() {$(".se-pre-con").fadeOut("fast");})
$('.despliega').click(function() {var panel = $(this).next();$('.acordeon').not(panel).slideUp("slow");panel.slideToggle({direction: "up"}, 100);});
function marca(parametro){document.formulario.check_on.value= (parseInt(document.formulario.check_on.value)+parseInt(parametro));}
function eliminarTodas(){
if (document.formulario.check_on.value>0 ) {
if (confirm("Seguro que quieres eliminar los registros?")){document.formulario.submit();}
}else{alert("No has seleccionado ningún registro.");}
}
function checkUncheckAll(theElement){
var theForm = theElement.form, z = 0;
for(z=0; z<theForm.length;z++){
if(theForm[z].type == 'checkbox' && theForm[z].name != 'checkall'){theForm[z].checked = theElement.checked;}
}
}
function checkUncheckSome(controller,theElements) {
var formElements = theElements.split(',');
var theController = document.getElementById(controller);
for(var z=0; z<formElements.length;z++){
theItem = document.getElementById(formElements[z]);
if(theItem.type && theItem.type=='checkbox'){
theItem.checked=theController.checked;
} else {
theInputs = theItem.getElementsByTagName('input');
for(var y=0; y<theInputs.length; y++){
if(theInputs[y].type == 'checkbox' && theInputs[y].id != theController.id){
theInputs[y].checked = theController.checked;
}
}
}
}
}
function eliminarTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaElimina').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarElimina_ok(){
	document.formulario.accion.value="del";
	$('#confirmaElimina').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}

function confirmarElimina_b_ok(){
	document.formulario.accion.value="del_b";
	$('#confirmaElimina').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}


function visibleTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaVisible').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarVisible_ok(){
	document.formulario.accion.value="vis";
	$('#confirmaVisible').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function visibleNoTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaNoVisible').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarNoVisible_ok(){
	document.formulario.accion.value="vis_no";
	$('#confirmaNoVisible').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function disponibleTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaDisponible').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarDisponible_ok(){
	document.formulario.accion.value="dis";
	$('#confirmaDisponible').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function disponibleNoTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaNoDisponible').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarNoDisponible_ok(){
	document.formulario.accion.value="dis_no";
	$('#confirmaNoDisponible').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function destacadoTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaDestacado').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarDestacado_ok(){
	document.formulario.accion.value="des";
	$('#confirmaDestacado').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function destacadoNoTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaNoDestacado').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarNoDestacado_ok(){
	document.formulario.accion.value="des_no";
	$('#confirmaNoDestacado').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function reordenar(){
if (document.formulario.check_on.value>0 ) {
$('#reordenar').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function reordenar_ok(){
	document.formulario.accion.value="reor";
	$('#reordenar').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function metas(){
if (document.formulario.check_on.value>0 ) {
$('#metas').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function metas_ok(){
	document.formulario.accion.value="metas";
	$('#reordenar').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}

function metas_v(){$('#metas_v').modal('show');}
function metas_ok_v(){
	document.formulario.accion.value="metas_v";
	$('#reordenar').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
function metas_t(){$('#metas_t').modal('show');}
function metas_ok_t(){
	document.formulario.accion.value="metas_t";
	$('#reordenar').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}

function bloquearTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaBloquea').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarBloquea(){
	document.formulario.accion.value="bloq";
	$('#confirmaBloquea').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}

function desbloquearTodas(){
if (document.formulario.check_on.value>0 ) {
$('#confirmaDesbloquea').modal('show');
}else{
$('#sinSeleccion').modal('show');}
}
function confirmarDesbloquea(){
	document.formulario.accion.value="desbloq";
	$('#confirmaDesbloquea').modal('hide');
	$('#spinner_back').show();
	$('#spinner').show();
	setTimeout(function(){ document.formulario.submit(); }, 300);
}
setTimeout(function(){ $('.alert').fadeOut("slow")}, 2000);