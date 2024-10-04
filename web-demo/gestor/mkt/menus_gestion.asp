<!--#include file="../comun/menu_sup.asp"-->  
<script type="text/javascript" src="../lib/js/jquery-ui.js"></script>

<style>
.menu_disponibles{padding:0px;margin-bottom:30px;margin-top:15px;min-height:2px}
#src{list-style-type:none;list-style:none;padding:0;margin:0;min-height:35px;color:#CCCCCC}
#src li .fa{color:#CCCCCC;margin-right:10px;}
#src li a{margin-left:5px;float:right;display:inline-block;width:22px;text-align:center;}
#src li a .fa{margin-right:0px;}
#src li{display:inline-block;border:1px solid #ccc;padding:7px;padding-left:12px;padding-right:12px;margin-bottom:10px;margin-right:10px;background:#fff;}

.dest{min-height:25px}
.menus{width:100%;min-height:35px}
.menus ul{list-style-type:none;list-style:none;padding:0;margin:0;width:100%;margin-bottom:15px;padding-top:15px;padding-left:15px;padding-bottom:35px;background:#fafafa}
.menus ul li{color:#32C5D3;text-align:center;}

.menus ul li:first-child{background:#32C5D3;color:#fff;width:100%;text-align:center;font-weight: bold;}
.menus ul:nth-child(3){width:100%;float:left;margin-right:10px;padding-right:12px;}
.menus ul:nth-child(4){width:100%;float:left;margin-right:10px;padding-right:12px;}
.menus ul:nth-child(5){width:100%;float:left;margin-right:10px;padding-right:12px;}
.menus ul:nth-child(6){width:100%;float:left;margin-right:10px;padding-right:12px;}
.menus ul:nth-child(1){width:100%;float:left;margin-right:10px;padding-right:12px;}
.menus ul:nth-child(2){width:100%;float:left;margin-right:10px;padding-right:12px;}
@media (min-width:800px){
.menus ul:nth-child(3){width:48%;float:left;margin-right:2%;padding-right:12px;}
.menus ul:nth-child(4){width:48%;float:right;padding-right:0px;}

}


.menus ul li{display:inline-block;border:1px solid #32C5D3;padding:7px;padding-left:12px;padding-right:5px;margin-bottom:10px;margin-right:10px;background:#fff;}
.menus .highlight{background:#eee;width:150px;height:15px;margn-left:8px;}
.menus ul .fa{color:#32C5D3;margin-right:10px;}
.menus ul:nth-child(3) li{margin-right:0px;}
.menus ul:nth-child(4) li{margin-right:0px;}
.menus ul:nth-child(5) li{margin-right:0px;}
.menus ul:nth-child(6) li{margin-right:0px;}
.menus ul li a{margin-left:5px;float:right;display:inline-block;width:22px;text-align:center}
.menus ul li a .fa{margin-right:0px;}
.sec_rel .select2-container--default .select2-search--inline .select2-search__field {background-image:url(../images/lupa.png);background-repeat:no-repeat;border:none;outline:0;min-width:23px;height:23px;}
.sec_rel .select2-container--default .select2-search--inline .select2-search__field:hover,  .select2-container--default .select2-search--inline .select2-search__field:focus{background-image:none;background-color:#ddd;}
.formato{width:100%;float:left;background:#efefef;padding:15px;margin-top:15px;border:1px solid #999}
</style>
<style type="text/css">#src .delet i{display:none;}.delete{display:inline-block;}</style>
<div class="page-content-container">
<div class="page-content-row">
<div class="row">
<div class="col-md-12">
<div class="portlet light portlet-fit">
<div class="portlet-title ">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Menús</span></div>
</div>
<div class="portlet-body">
<div class="note note-info magin-top-0" style="margin-bottom:45px"><h4 class="block">Información</h4>
<p><i class="fa fa-info-circle" aria-hidden="true"></i> Arrastra de las opciones disponibles superiores hacia la zona del menú deseado. No repitas el mismo botón en el mismo menú. Tampoco es necesario guardar ya que se hace de manera automática.<br>
<br>
Por favor, NUNCA actualices la página (mediante F5 o botón Refresh) o podría perderse la ordenación de los menús.</p></div>
<style type="text/css">#src .delet i{display:none;}.delete{display:inline-block;}</style>
<script>
$(function () {
<%num=1
do while num <=5%>
$("#dest<%=num%> .delete").click(function() { 
del<%=num%>=$(this).parent().data("x");
$("#info1").load("menus_mod.asp?del<%=num%>="+del<%=num%>)
$(this).parent().remove();
});
$("#dest<%=num%>").sortable({
placeholder: "highlight",
opacity: "0.8",
//revert: true,
connectWith: "ul",
items: "li:not(.ui-state-disabled)",
update: function() {
$("#dest<%=num%> .delet").addClass( "delete" );
var orders = [];
$("#dest<%=num%> .delete").click(function() { 
del<%=num%>=$(this).parent().data("x");
$("#info1").load("menus_mod.asp?del<%=num%>="+del<%=num%>)
$(this).parent().remove();
});
$.each($(this).children(), function(i, item) {
orders.push($(item).data("x"));
});
$("#info1").load("menus_mod.asp?order<%=num%>="+orders); 
},
});
<%num=num+1
loop%>
$('#src > li').draggable({helper: 'clone',connectToSortable: '.dest'});
});
</script>
<div class="menu_disponibles">
<ul id="src">
<%Sql= "SELECT titulo_esp, id_general FROM generales  WHERE tipo <>'bh'"
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
do while not ob_rs.eof%>
<li data-x="G<%=ob_rs("id_general")%>" id="<%=ob_rs("id_general")%>" style="cursor:move;"><i class="fa fa-bars"></i><%=ob_rs("titulo_esp")%><a href="#/" class="delet" data-x="G<%=ob_rs("id_general")%>" ><i class="fa fa-times" ></i></a></li>
<%ob_rs.movenext
loop
end if
ob_rs.close
'Sql= "SELECT titulo_esp, id_general FROM generales_fijos where id_general <> 7"
'Ob_Command.CommandText = Sql
'SET Ob_RS = Ob_Command.Execute ()
'if not ob_rs.eof then
'do while not ob_rs.eof%>
<!--<li data-x="GF<%'=ob_rs("id_general")%>" id="<%'=ob_rs("id_general")%>" style="cursor:move;"><i class="fa fa-bars"></i><%'=ob_rs("titulo_esp")%><a href="#/" class="delet" data-x="GF<%'=ob_rs("id_general")%>"><i class="fa fa-times" ></i></a></li>-->
<%'ob_rs.movenext
'loop
'end if
'ob_rs.close
Sql= "SELECT titulo_esp, id_categoria FROM categorias"
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
do while not ob_rs.eof%>
<li data-x="C<%=ob_rs("id_categoria")%>" id="<%=ob_rs("id_categoria")%>" style="cursor:move;"><i class="fa fa-bars"></i><%=ob_rs("titulo_esp")%><a href="#/" class="delet" data-x="C<%=ob_rs("id_categoria")%>"><i class="fa fa-times" ></i></a></li>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</ul>
</div>
<div class="menus" >
<%num=1
do while num <=4%>
<ul id="dest<%=num%>" class="dest" style="border:1px solid #ccc;min-height:60px">
<li data-x="0" id="0" class="ui-state-disabled"><i class="fa fa-folder-open" aria-hidden="true" style="color:#fff"></i>MENU <%=num%></li>
<%Sql= "SELECT *  FROM menus where menu="&num&" order by posicion"
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
do while not ob_rs.eof
if ob_rs("id_general")<>0then
Sql2= "SELECT *  FROM generales where id_general="&ob_rs("id_general")&" "
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
id_x="G"&ob_rs("id_general")
id=ob_rs("id_general")
nombre=ob_rs2("titulo_esp")
end if
ob_rs2.close
end if
'if ob_rs("id_general_fijo")<>0then
'Sql2= "SELECT * FROM generales_fijos where id_general="&ob_rs("id_general_fijo")&""
'Ob_Command.CommandText = Sql2
'SET Ob_RS2 = Ob_Command.Execute ()
'if not ob_rs2.eof then
'id_x="GF"&ob_rs("id_general_fijo")
'id=ob_rs("id_general_fijo")
'nombre=ob_rs2("titulo_esp")
'end if
'ob_rs2.close
'end if
if ob_rs("id_categoria")<>0then
Sql2= "SELECT * FROM categorias where id_categoria="&ob_rs("id_categoria")&""
Ob_Command.CommandText = Sql2
SET Ob_RS2 = Ob_Command.Execute ()
if not ob_rs2.eof then
id_x="C"&ob_rs("id_categoria")
id=ob_rs("id_categoria")
nombre=ob_rs2("titulo_esp")
end if
ob_rs2.close
end if%>
<li data-x="<%=id_x%>" id="<%=id%>" style="cursor:move;" ><i class="fa fa-bars"></i><%=nombre%><a href="#/" class="delete" data-x="<%=id_x%>"><i class="fa fa-times" ></i></a></li>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</ul>
<%num=num+1
loop%>    
</div>
<span id="info1"></span>  
<div style="clear:both;width:100%;height:10px;"></div>
</div><!--portlet-body-->
</div><!--portlet light portlet-fit portlet-form bordered-->
</div>
</div>
</div><!--page-content-row-->
</div><!--page-content-container-->
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
