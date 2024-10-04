$(document).ready(function () {
$('.nav-tabs > li a[title]').tooltip();
$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
var $target = $(e.target);
if ($target.parent().hasClass('disabled')) {
return false;}});
$(".next-step").click(function (e) {
var $active = $('.wizard .nav-tabs li.active');
$active.next().removeClass('disabled');
nextTab($active);
$(document).scrollTop( $("#arriba").offset().top );  });
$(".prev-step").click(function (e) {
var $active = $('.wizard .nav-tabs li.active');
prevTab($active);
$(document).scrollTop( $("#arriba").offset().top );  
});
});
function nextTab(elem) {
$(elem).next().find('a[data-toggle="tab"]').click();
$(document).scrollTop( $("#arriba").offset().top );}
function prevTab(elem) {
$(elem).prev().find('a[data-toggle="tab"]').click();
$(document).scrollTop( $("#arriba").offset().top ); }
"use strict";!function(a,b,c,d){a(".inputfile").each(function(){var b=a(this),c=b.next("label"),d=c.html();b.on("change",function(a){var b="";this.files&&this.files.length>1?b=(this.getAttribute("data-multiple-caption")||"").replace("{count}",this.files.length):a.target.value&&(b=a.target.value.split("\\").pop()),b?c.find(".spanea").html(b):c.html(d)}),b.on("focus",function(){b.addClass("has-focus")}).on("blur",function(){b.removeClass("has-focus");$(".desadjuntar").css( "visibility","visible" );})})}(jQuery,window,document);