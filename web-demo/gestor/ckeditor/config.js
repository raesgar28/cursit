CKEDITOR.editorConfig = function( config ) {
config.language = 'es';
config.uiColor = '#ffffff';
config.allowedContent = true;
config.height = 150;
config.toolbarCanCollapse = false;
//config.extraPlugins= 'devtools';
config.extraPlugins = 'colorbutton,colordialog,image2,preview,print,sourcearea,format,stylescombo,tabletools,table,font,justify,div,maximize,horizontalrule,resize,removeformat,widgetbootstrap,widgettemplatemenu,menubutton,magicline,iframe,templates,scayt,pastefromword,blockquote,find,symbol,showblocks,selectall,indentblock';//youtube,
if( window.innerWidth>400){
config.toolbar_Medida =[
{ name: 'clipboard', items : [ 'Maximize','Source','Cut','Copy','Paste','PasteText','-'] },
{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Format'] },
{ name: 'paragraph', items : [ 'BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','Outdent','Indent'] },
{ name: 'insert', items : [ 'Image','Link','Unlink','TextColor','BGColor' ] },
//	'/',
{ name: 'styles', items : [ 'Font','FontSize','SelectAll','RemoveFormat','Table'] },
];
}else{
config.toolbar_Medida =[
{ name: 'clipboard', items: [ 'Maximize'] },
{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Link', 'Unlink' ] },
{ name: 'styles', items: [ 'Image','TextColor','SelectAll','RemoveFormat' ] },
'/'
];
}
if( window.innerWidth>400){
config.toolbar_Basica =[
{ name: 'clipboard', items : [ 'Maximize'] },
{ name: 'basicstyles', items : [ 'Bold','Italic','Underline'] },
{ name: 'paragraph', items : [ 'BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] },
{ name: 'insert', items : [ 'TextColor'] },//	'/',
{ name: 'styles', items : [ 'FontSize'] },];
}else{config.toolbar_Basica =[
{ name: 'clipboard', items: [ 'Maximize'] },
{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Link', 'Unlink' ] },
{ name: 'styles', items: [ 'TextColor' ] },
'/'
];
}
config.toolbar_Defecto = [
{ name: 'clipboard', items : [ 'Maximize','Source','Print','Preview','-','Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo', 'Iframe', 'Youtube','WidgetTemplateMenu','-', '-', 'Templates' ] },
{ name: 'editing', items : [ 'Replace','-','SelectAll','-','Scayt' ] },
{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','SelectAll','RemoveFormat','ShowBlocks' ] },
{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] },
{ name: 'insert', items : [ 'Image','Link','Unlink','Table','HorizontalRule','SpecialChar','PageBreak','Symbol','-','TextColor','BGColor' ] },//	'/',
{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
];
//config.removeButtons = 'Underline,Subscript,Superscript';
config.format_tags = 'p;h1;h2;h3;pre';
config.removeDialogTabs = 'image:advanced;';
config.allowedContent =true;
};
//SUBIDORES CKFINDER STANDALONE
ancho=$( window ).width();
alto=$( window ).height();
ancho_v=$( window ).width();
if (ancho_v >= 600){
ancho_f= ancho-250;
alto_f= alto-200;
}else{
ancho_f= 800;
alto_f= alto-200;}
for(i=1; i<=20; i++){
function archivo(tipo,num){
if (document.getElementById( 'modal_'+num )!=null){
selectFileWithCKFinder( 'archivo_'+num);};
function selectFileWithCKFinder( elementId ) {
CKFinder.modal( {
chooseFiles: true,
width: ancho_f,
height: alto_f,
resourceType: tipo,
onInit: function( finder ) {
finder.on( 'files:choose', function( evt ) {
var file = evt.data.files.first();
var output = document.getElementById( elementId );
output.value = file.getUrl();
	$('#div_imagen_'+num).fadeIn("fast");///////////////////////////////////////CAMBIA IMAGEN AL SELECCIONAR
	$('#anular_'+num).fadeIn("fast");
	$('#eliminar_'+num).fadeOut("fast");
	$('#imagen_'+num).fadeOut("fast");
	function camb(){
	$('#imagen_'+num+' img').attr('src',file.getUrl());
	$('#imagepreview_'+num).attr('src',file.getUrl());
	}
	setTimeout(camb, 20);
	$('#imagen_'+num).fadeIn();
});	
finder.on( 'file:choose:resizedImage', function( evt ) {
var output = document.getElementById( elementId );
output.value = evt.data.resizedUrl;
	$('#div_imagen_'+num).fadeIn("fast");///////////////////////////////////////CAMBIA IMAGEN AL SELECCIONAR
	$('#anular_'+num).fadeIn("fast");
	$('#eliminar_'+num).fadeOut("fast");
	$('#imagen_'+num).fadeOut("fast");
	function camb(){
	$('#imagen_'+num+' img').attr('src',evt.data.resizedUrl);
	$('#imagepreview_'+num).attr('src',fevt.data.resizedUrl);}
	setTimeout(camb, 20);
	$('#imagen_'+num).fadeIn();
});
}
});
}
}
}
///////////////// CKFINDER MODAL
CKEDITOR.on('dialogDefinition', function (event){
var editor = event.editor;
var dialogDefinition = event.data.definition;
var dialogName = event.data.name;
var dialog = event.data.definition.dialog;
var tabCount = dialogDefinition.contents.length;
if(dialogName=='image2' || dialogName=='link' ){
ancho=$( window ).width();
alto=$( window ).height();
ancho_v=$( window ).width();
if (ancho_v >= 600){
ancho_f= ancho-250;
alto_f= alto-200;
}else{
ancho_f= 800;
alto_f= alto-200;}
for (var i = 0; i < tabCount; i++) {
var browseButton = dialogDefinition.contents[i].get('browse');
if (browseButton !== null) {
browseButton.hidden = false;
browseButton.onClick = function (dialog, i){
$(".cke_dialog").css("z-index", "25");
$(".cke_dialog_background_cover").css("z-index", "24");
$(".ckf_dialog").css("z-index", "10000");
if(dialogName=='image2'){
CKFinder.modal( {
chooseFiles: true,
width: ancho_f,
height: alto_f,
resourceType: "Imagen",
onInit: function( finder ) {
finder.on( 'files:choose', function( evt ) {
var file = evt.data.files.first();
var fileName = file.getUrl();
var fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1); 
if (fileExtension=='jpg' || fileExtension=='gif' || fileExtension=='bmp' || fileExtension=='tiff' || fileExtension=='jpeg' || fileExtension=='png'){actualiza_imagen(file.getUrl());}
});  
}
});
}
if(dialogName=='link'){
CKFinder.modal( {
chooseFiles: true,
width: ancho_f,
height: alto_f,
onInit: function( finder ) {
finder.on( 'files:choose', function( evt ) {
var file = evt.data.files.first();
var fileName = file.getUrl();
var fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1); 
actualiza_link(file.getUrl());
});  
}
});
}
}
}
}
function actualiza_link(esto){dialog.setValueOf( 'info', 'url', esto);}
function actualiza_imagen(esto){dialog.setValueOf( 'info', 'src', esto);}
}
});