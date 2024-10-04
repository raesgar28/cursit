<!--#include file="comun/menu_sup.asp"-->
<div class="c-layout-breadcrumbs-1 c-bgimage c-subtitle c-fonts-uppercase c-fonts-bold c-bg-img-center" id="baneriza2" style="background-image: url(<%=ruta_banner%>)">
<div class="container"><div class="c-page-title c-pull-left">
<h3 class="c-font-uppercase c-font-bold c-font-white c-font-20 c-font-slim"><%=titulo_esp_web%> | <%=titulo_esp_div%></h3>
<h4 class="c-font-white c-font-thin c-opacity-07"><%=alt_banner%></h4></div>
<ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">
<li><a href="<%=url_web%>" class="c-font-white"><%=titulo_esp_web%></a></li>
<li class="c-font-white">/</li>
<li class="c-state_active c-font-white">Test de nivel</li>
</ul></div></div><div class="c-content-box c-size-md c-bg-white"><div class="container"><div class="row"><div class="col-sm-12">
<form id="envio" name="envio" method="post" action="test-nivel-env">
<input type="hidden" name="pr" id="pr" test>
<div class="col-md-6 col-md-offset-2" style="margin-bottom:35px"><div class="form-group"><input type="text" placeholder="Nombre*" class="form-control c-square c-theme input-lg" name="nombre" id="nombre"></div>
<div class="form-group"><input type="text" placeholder="Edad*" class="form-control c-square c-theme input-lg" name="edad" id="edad"></div>
<div class="form-group"><input type="text" placeholder="eMail*" class="form-control c-square c-theme input-lg" name="email" id="email"></div>
<div class="c-checkbox" style="margin-bottom:25px"><input type="checkbox" class="c-check" name="acepto" id="acepto" autocomplete="off"><label for="acepto" class="check_txt" autocomplete="off"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-info-circle" aria-hidden="true" style="color:#999"></i> Sí, he leido y acepto <a href="javascript:tratamiento_datos();" class="check_a">La Cláusula Informativa y Autorización al Tratamiento de los Datos</a></label><div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_td=ob_rs("texto_esp")
titulo_td=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i> <span><%=titulo_td%></span></h4></div><div class="modal-body"><p><span><%=texto_td%></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div></div>
<div class="form-group"><label for="captchacode">c&oacute;digo seguro</label><img src="<%=r%>web/comun/captcha/captcha.asp" name="imgCaptcha" id="imgCaptcha"  style="margin-left:8px;"><a href="javascript:void(0)" onClick="RefreshImage('imgCaptcha')"><i class="fa fa-refresh" aria-hidden="true" style="margin-left:8px;margin-right:8px"></i></a><label for="captchacode">&nbsp;</label><input name="captchacode" type="text" id="captchacode" size="18" class="caja_contacto_contact"></div>
</div>
<div class="form-group col-md-12">


<label class="col-md-4 control-label preguntas"> 1.-Peter ________ got three brothers</label>
<div class="col-md-6"><div class="c-radio-list preguntas">
<div class="c-radio"><input type="radio" class="c-radio" name="Pregunta1" value="1"  id="1"/><label for="1"><span></span><span class="check"></span><span class="box"></span>a) have</label></div>
<div class="c-radio"><input type="radio" class="c-radio" name="Pregunta1" id="2" value="2" /><label for="2"><span></span><span class="check"></span><span class="box"></span>b) is having</label></div>
<div class="c-radio"><input type="radio" class="c-radio" name="Pregunta1"  id="3" value="3" /><label for="3"><span></span><span class="check"></span><span class="box"></span>c) has</label></div>
<div class="c-radio"><input type="radio" class="c-radio" name="Pregunta1" id="4" value="4"  /><label for="4"><span></span><span class="check"></span><span class="box"></span>d) hads</label></div>
</div></div>
<label class="col-md-4 control-label preguntas">2.-Mary and her family _____ dinner at the moment</label>
<div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 2" value="1"  id="11"/>
               <label for="11"><span></span><span class="check"></span><span class="box"></span>a) are having</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 2" value="2" id="22" />
               <label for="22"><span></span><span class="check"></span><span class="box"></span>b) have</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 2" value="3" id="33"/>
               <label for="33"><span></span><span class="check"></span><span class="box"></span>c) has</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 2" value="4" id="44" />
               <label for="44"><span></span><span class="check"></span><span class="box"></span>d) is having</label></div>
</div></div>  




   
     <label class="col-md-4 control-label preguntas">3.-They ______ TV every Sunday morning</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 3" value="1"  id="111"/>
               <label for="111"><span></span><span class="check"></span><span class="box"></span>a) are watching</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 3" value="2" id="222"/>
               <label for="222"><span></span><span class="check"></span><span class="box"></span>b) watchs</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 3" value="3" id="333"/>
               <label for="333"><span></span><span class="check"></span><span class="box"></span>c) watch</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 3" value="4" id="444" />
               <label for="444"><span></span><span class="check"></span><span class="box"></span>d) watches</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">4.-<span class="style13"> He ____ basketball at the school team </span></label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
           
               <input type="radio" name="Pregunta 4" value="1"  id="10"/>
               <label for="10"><span></span><span class="check"></span><span class="box"></span>a) play</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 4" value="2" id="20"/>
               <label for="20"><span></span><span class="check"></span><span class="box"></span>b) have played</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 4" value="3" id="30"/>
               <label for="30"><span></span><span class="check"></span><span class="box"></span>c) plaies</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 4" value="4" id="40" />
               <label for="40"><span></span><span class="check"></span><span class="box"></span>d) plays</label></div></div></div>   
               
                   
     <label class="col-md-4 control-label preguntas">5.-They _____ in the USA two years ago</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 5" value="1"  id="1a"/>
               <label for="1a"><span></span><span class="check"></span><span class="box"></span>a) was</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 5" value="2" id="2a"/>
               <label for="2a"><span></span><span class="check"></span><span class="box"></span>b) been</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 5" value="3" id="3a"/>
               <label for="3a"><span></span><span class="check"></span><span class="box"></span>c) go</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 5" value="4" id="4a" />
               <label for="4a"><span></span><span class="check"></span><span class="box"></span>d) were</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">6.-Would you like ____ biscuits?</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 6:" value="1"  id="1b"/>
               <label for="1b"><span></span><span class="check"></span><span class="box"></span>a) some</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 6:" value="2" id="2b"/>
               <label for="2b"><span></span><span class="check"></span><span class="box"></span>b) a</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 6:" value="3" id="3b"/>
               <label for="3b"><span></span><span class="check"></span><span class="box"></span>c) any</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 6:" value="4" id="4b" />
               <label for="4b"><span></span><span class="check"></span><span class="box"></span>d) an</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">7.- _____ students are there in the class?</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 7" value="1"  id="1c"/>
               <label for="1c"><span></span><span class="check"></span><span class="box"></span>a) How</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 7" value="2" id="2c"/>
               <label for="2c"><span></span><span class="check"></span><span class="box"></span>b) Who</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 7" value="3" id="3c"/>
               <label for="3c"><span></span><span class="check"></span><span class="box"></span>c) How many</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 7" value="4" id="4c" />
               <label for="4c"><span></span><span class="check"></span><span class="box"></span>d) How Much</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">8.-________ do you go the cinema? Twice a week</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 8" value="1"  id="1d"/>
               <label for="1d"><span></span><span class="check"></span><span class="box"></span>a) Where</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 8" value="2" id="2d"/>
               <label for="2d"><span></span><span class="check"></span><span class="box"></span>b) What</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 8" value="3" id="3d"/>
               <label for="3d"><span></span><span class="check"></span><span class="box"></span>c) How often</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 8" value="4" id="4d" />
               <label for="4d"><span></span><span class="check"></span><span class="box"></span>d) Who</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">9.-There is only _____ sugar for the cake</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 9" value="1"  id="1e"/>
               <label for="1e"><span></span><span class="check"></span><span class="box"></span>a) few</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 9" value="2" id="2e"/>
               <label for="2e"><span></span><span class="check"></span><span class="box"></span>b) little</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 9" value="3" id="3e"/>
               <label for="3e"><span></span><span class="check"></span><span class="box"></span>c) many</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 9" value="4" id="4e" />
               <label for="4e"><span></span><span class="check"></span><span class="box"></span>d) much</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">10.-Whose book is this? It&rsquo;s ______ </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 10" value="1"  id="1f"/>
               <label for="1f"><span></span><span class="check"></span><span class="box"></span>a) Mary</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 10" value="2" id="2f"/>
               <label for="2f"><span></span><span class="check"></span><span class="box"></span>b) her</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 10" value="3" id="3f"/>
               <label for="3f"><span></span><span class="check"></span><span class="box"></span>c) hers</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 10" value="4" id="4f" />
               <label for="4f"><span></span><span class="check"></span><span class="box"></span>d) them</label></div></div></div>    
     <label class="col-md-4 control-label preguntas">11-._______ parents come from England</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 11" value="1"  id="1g"/>
               <label for="1g"><span></span><span class="check"></span><span class="box"></span>a) Our</label></div>
               
           <div class="c-radio">
               <input type="radio" name="Pregunta 11" value="2" id="2g"/>
               <label for="2g"><span></span><span class="check"></span><span class="box"></span>b) Ours</label></div>
               
           <div class="c-radio">
               <input type="radio" name="Pregunta 11" value="3" id="3g"/>
               <label for="3g"><span></span><span class="check"></span><span class="box"></span>c) Us</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 11" value="4" id="4g" />
               <label for="4g"><span></span><span class="check"></span><span class="box"></span>d) Mys</label></div></div></div>    
               
               
                  
     <label class="col-md-4 control-label preguntas">12-.Peter has lived in England _________ three years</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 12" value="1"  id="1h"/>
               <label for="1h"><span></span><span class="check"></span><span class="box"></span>a) since</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 12" value="2" id="2h"/>
               <label for="2h"><span></span><span class="check"></span><span class="box"></span>b) ago</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 12" value="3" id="3h"/>
               <label for="3h"><span></span><span class="check"></span><span class="box"></span>c) for</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 12" value="4" id="4h" />
               <label for="4h"><span></span><span class="check"></span><span class="box"></span>d) during</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">13-.When are you visiting your cousins? ______ 21 st May</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 13" value="1"  id="1i"/>
               <label for="1i"><span></span><span class="check"></span><span class="box"></span>a) on</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 13" value="2" id="2i"/>
               <label for="2i"><span></span><span class="check"></span><span class="box"></span>b) at</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 13" value="3" id="3i"/>
               <label for="3i"><span></span><span class="check"></span><span class="box"></span>c) in</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 13" value="4" id="4i" />
               <label for="4i"><span></span><span class="check"></span><span class="box"></span>d) the</label></div></div></div>
       
    <label class="col-md-4 control-label preguntas"> 14-.In England ______ time of the year is usually from December to February</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 14" value="1"  id="1j"/>
               <label for="1j"><span></span><span class="check"></span><span class="box"></span>a) coldest</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 14" value="2" id="2j"/>
               <label for="2j"><span></span><span class="check"></span><span class="box"></span>b) colder</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 14" value="3" id="3j"/>
               <label for="3j"><span></span><span class="check"></span><span class="box"></span>c) coldder</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 14" value="4" id="4j" />
               <label for="4j"><span></span><span class="check"></span><span class="box"></span>d) the coldest</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">15-.Mohammed Ali ________ his first world title fight in 1960</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 15" value="1"  id="1k"/>
               <label for="1k"><span></span><span class="check"></span><span class="box"></span>a) won</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 15" value="2" id="2k"/>
               <label for="2k"><span></span><span class="check"></span><span class="box"></span>b) is winning</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 15" value="3" id="3k"/>
               <label for="3k"><span></span><span class="check"></span><span class="box"></span>c) has won</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 15" value="4" id="4k" />
               <label for="4k"><span></span><span class="check"></span><span class="box"></span>d) was winning</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">16-.I feel very well because I went to bed early_________ </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 16" value="1"  id="1l"/>
               <label for="1l"><span></span><span class="check"></span><span class="box"></span>a) tonight</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 16" value="2" id="2l"/>
               <label for="2l"><span></span><span class="check"></span><span class="box"></span>b) this night</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 16" value="3" id="3l"/>
               <label for="3l"><span></span><span class="check"></span><span class="box"></span>c) in the night</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 16" value="4" id="4l" />
               <label for="4l"><span></span><span class="check"></span><span class="box"></span>d) last night</label></div></div> </div>      
     <label class="col-md-4 control-label preguntas">17-.I&rsquo;m going to give _________ </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 17" value="1"  id="1m"/>
               <label for="1m"><span></span><span class="check"></span><span class="box"></span>a) to him a record</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 17" value="2" id="2m"/>
               <label for="2m"><span></span><span class="check"></span><span class="box"></span>b) him a record</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 17" value="3" id="3m"/>
               <label for="3m"><span></span><span class="check"></span><span class="box"></span>c) some record to him</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 17" value="4" id="4m" />
               <label for="4m"><span></span><span class="check"></span><span class="box"></span>d) his a record</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">18-.In cold countries people wear thick clothes ______ warm</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 18" value="1"  id="1n"/>
               <label for="1n"><span></span><span class="check"></span><span class="box"></span>a) for keeping</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 18" value="2" id="2n"/>
               <label for="2n"><span></span><span class="check"></span><span class="box"></span>b) which</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 18" value="3" id="3n"/>
               <label for="3n"><span></span><span class="check"></span><span class="box"></span>c) who</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 18" value="4" id="4n" />
               <label for="4n"><span></span><span class="check"></span><span class="box"></span>d) whom</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">19-.A nurse is a person _____ looks after people</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 19" value="1"  id="1o"/>
               <label for="1o"><span></span><span class="check"></span><span class="box"></span>a) what</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 19" value="2" id="2o"/>
               <label for="2o"><span></span><span class="check"></span><span class="box"></span>b) which</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 19" value="3" id="3o"/>
               <label for="3o"><span></span><span class="check"></span><span class="box"></span>c) who</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 19" value="4" id="4o" />
               <label for="4o"><span></span><span class="check"></span><span class="box"></span>d) whom</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">20-.Look out! The car _____ crash!</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 20" value="1"  id="1p"/>
               <label for="1p"><span></span><span class="check"></span><span class="box"></span>a) will</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 20" value="2" id="2p"/>
               <label for="2p"><span></span><span class="check"></span><span class="box"></span>b) goes</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 20" value="3" id="3p"/>
               <label for="3p"><span></span><span class="check"></span><span class="box"></span>c) going</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 20" value="4" id="4p" />
               <label for="4p"><span></span><span class="check"></span><span class="box"></span>d) is going to</label></div></div></div>  
               
               
               
                    
     <label class="col-md-4 control-label preguntas">21-. Students_______ speak in class</label><div class="col-md-6"><div class="c-radio-list preguntas">

           <div class="c-radio">
               <input type="radio" name="Pregunta 21" value="1"  id="1q"/>
               <label for="1q"><span></span><span class="check"></span><span class="box"></span>a) let to</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 21" value="2" id="2q"/>
               <label for="2q"><span></span><span class="check"></span><span class="box"></span>b) aren't allowed to</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 21" value="3" id="3q"/>
               <label for="3q"><span></span><span class="check"></span><span class="box"></span>c) allowed to</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 21" value="4" id="4q" />
               <label for="4q"><span></span><span class="check"></span><span class="box"></span>d) let</label></div></div></div>     
               
                 
     <label class="col-md-4 control-label preguntas">22-.You met him while you were on holidays,__________?</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 22" value="1"  id="1r"/>
               <label for="1r"><span></span><span class="check"></span><span class="box"></span>a) didn't you</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 22" value="2" id="2r"/>
               <label for="2r"><span></span><span class="check"></span><span class="box"></span>b) weren't you</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 22" value="3" id="3r"/>
               <label for="3r"><span></span><span class="check"></span><span class="box"></span>c) haven't you</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 22" value="4" id="4r" />
               <label for="4r"><span></span><span class="check"></span><span class="box"></span>d) aren't you</label></div></div></div>
       
     
      <label class="col-md-4 control-label preguntas">23-. I had a car accident last week. I am still in hospital , but the doctor has told me that i_________ leave tomorrow</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 23" value="1"  id="1s"/>
               <label for="1s"><span></span><span class="check"></span><span class="box"></span>a) must</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 23" value="2" id="2s"/>
               <label for="2s"><span></span><span class="check"></span><span class="box"></span>b) have</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 23" value="3" id="3s"/>
               <label for="3s"><span></span><span class="check"></span><span class="box"></span>c) may</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 23" value="4" id="4s" />
               <label for="4s"><span></span><span class="check"></span><span class="box"></span>d) ought to</label></div></div></div>   
               
                   
     <label class="col-md-4 control-label preguntas">24-.I haven&rsquo;t seen Peter _________ </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 24" value="1"  id="1t"/>
               <label for="1t"><span></span><span class="check"></span><span class="box"></span>a) already</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 24" value="2" id="2t"/>
               <label for="2t"><span></span><span class="check"></span><span class="box"></span>b) still</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 24" value="3" id="3t"/>
               <label for="3t"><span></span><span class="check"></span><span class="box"></span>c) yet</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 24" value="4" id="4t" />
               <label for="4t"><span></span><span class="check"></span><span class="box"></span>d) just</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">25-. They put loudspeakers so that everyone ________hear </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 25" value="1"  id="1u"/>
               <label for="1u"><span></span><span class="check"></span><span class="box"></span>a) should</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 25" value="2" id="2u"/>
               <label for="2u"><span></span><span class="check"></span><span class="box"></span>b) would</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 25" value="3" id="3u"/>
               <label for="3u"><span></span><span class="check"></span><span class="box"></span>c) ought</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 25" value="4" id="4u" />
               <label for="4u"><span></span><span class="check"></span><span class="box"></span>d) ought to</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">26-. These houses ______ in 1960 </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 26" value="1"  id="1w"/>
               <label for="1w"><span></span><span class="check"></span><span class="box"></span>a) built</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 26" value="2" id="2w"/>
               <label for="2w"><span></span><span class="check"></span><span class="box"></span>b) have built</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 26" value="3" id="3w"/>
               <label for="3w"><span></span><span class="check"></span><span class="box"></span>c) are being built</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 26" value="4" id="4w" />
               <label for="4w"><span></span><span class="check"></span><span class="box"></span>d) were built</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">27-. You_____ told me that ages ago </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 27" value="1"  id="1x"/>
               <label for="1x"><span></span><span class="check"></span><span class="box"></span>a) should</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 27" value="2" id="2x"/>
               <label for="2x"><span></span><span class="check"></span><span class="box"></span>b) ought to</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 27" value="3" id="3x"/>
               <label for="3x"><span></span><span class="check"></span><span class="box"></span>c) ought</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 27" value="4" id="4x" />
               <label for="4x"><span></span><span class="check"></span><span class="box"></span>d) should have</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">28-. If that man ______ towards me I would scream </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 28" value="1"  id="1y"/>
               <label for="1y"><span></span><span class="check"></span><span class="box"></span>a) would come</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 28" value="2" id="2y"/>
               <label for="2y"><span></span><span class="check"></span><span class="box"></span>b) should come</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 28" value="3" id="3y"/>
               <label for="3y"><span></span><span class="check"></span><span class="box"></span>c) comes</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 28" value="4" id="4y" />
               <label for="4y"><span></span><span class="check"></span><span class="box"></span>d) came</label></div></div></div>
       
     
<label class="col-md-4 control-label preguntas">29-.If I _______ a garden like that I would have planted some rose bushes </label>
     <div class="col-md-6"><div class="c-radio-list preguntas">

           <div class="c-radio">
               <input type="radio" name="Pregunta 29" value="1"  id="1z"/>
               <label for="1z"><span></span><span class="check"></span><span class="box"></span>a) had</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 29" value="2" id="2z"/>
               <label for="2z"><span></span><span class="check"></span><span class="box"></span>b) would have</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 29" value="3" id="3z"/>
               <label for="3z"><span></span><span class="check"></span><span class="box"></span>c) had had</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 29" value="4" id="4z" />
               <label for="4z"><span></span><span class="check"></span><span class="box"></span>d) have</label></div></div></div>     
                 
     <label class="col-md-4 control-label preguntas">30-. &quot;I&rsquo;ve missed the train .&quot; he said . He said that he ____ the train </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 30" value="1"  id="1aa"/>
               <label for="1aa"><span></span><span class="check"></span><span class="box"></span>a) had missed</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 30" value="2" id="2aa"/>
               <label for="2aa"><span></span><span class="check"></span><span class="box"></span>b) could miss</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 30" value="3" id="3aa"/>
               <label for="3aa"><span></span><span class="check"></span><span class="box"></span>c) missed</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 30" value="4" id="4aa" />
               <label for="4aa"><span></span><span class="check"></span><span class="box"></span>d) was</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">31-. The doctor said. &ldquo;I&rsquo;ll be back tomorrow&rdquo;. The doctor said that he ___________ </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 31" value="1"  id="1bb"/>
               <label for="1bb"><span></span><span class="check"></span><span class="box"></span>a) would be back tomorrow</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 31" value="2" id="2bb"/>
               <label for="2bb"><span></span><span class="check"></span><span class="box"></span>b) will be back the following day</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 31" value="3" id="3bb"/>
               <label for="3bb"><span></span><span class="check"></span><span class="box"></span>c) must come back the next day</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 31" value="4" id="4bb" />
               <label for="4bb"><span></span><span class="check"></span><span class="box"></span>d) would be back the following day</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">32-. I&rsquo;m going to _______ by the dentist next week </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 32" value="1"  id="1cc"/>
               <label for="1cc"><span></span><span class="check"></span><span class="box"></span>a) have my teeth checked </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 32" value="2" id="2cc"/>
               <label for="2cc"><span></span><span class="check"></span><span class="box"></span>b) check my teeth </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 32" value="3" id="3cc"/>
               <label for="3cc"><span></span><span class="check"></span><span class="box"></span>c) get checked my teeth </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 32" value="4" id="4cc" />
               <label for="4cc"><span></span><span class="check"></span><span class="box"></span>d) have checked my teeth</label></div></div></div>
       
     





 <label class="col-md-4 control-label preguntas">33-. Mary&rsquo;s parents are working hard ______ she could study at Oxford University </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 33" value="1"  id="1dd"/>
               <label for="1dd"><span></span><span class="check"></span><span class="box"></span>a) to</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 33" value="2" id="2dd"/>
               <label for="2dd"><span></span><span class="check"></span><span class="box"></span>b) as</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 33" value="3" id="3dd"/>
               <label for="3dd"><span></span><span class="check"></span><span class="box"></span>c) so that</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 33" value="4" id="4dd" />
               <label for="4dd"><span></span><span class="check"></span><span class="box"></span>d) in order</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">34-.Paul never got used _______ early in the morning </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 34" value="1"  id="1ee"/>
               <label for="1ee"><span></span><span class="check"></span><span class="box"></span>a) getting up</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 34" value="2" id="2ee"/>
               <label for="2ee"><span></span><span class="check"></span><span class="box"></span>b) to getting up</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 34" value="3" id="3ee"/>
               <label for="3ee"><span></span><span class="check"></span><span class="box"></span>c) to Cursit</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 34" value="4" id="4ee" />
               <label for="4ee"><span></span><span class="check"></span><span class="box"></span>d) that have to get up</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">35-.It was __________ we decided to go out for lunch </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 35" value="1"  id="1ff"/>
               <label for="1ff"><span></span><span class="check"></span><span class="box"></span>a) so nice day</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 35" value="2" id="2ff"/>
               <label for="2ff"><span></span><span class="check"></span><span class="box"></span>b) such nice day</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 35" value="3" id="3ff"/>
               <label for="3ff"><span></span><span class="check"></span><span class="box"></span>c) so a nice day that</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 35" value="4" id="4ff" />
               <label for="4ff"><span></span><span class="check"></span><span class="box"></span>d) such a nice day that</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">36-.It&rsquo;s starting to rain, I wish I ____ my umbrella</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 36" value="1"  id="1gg"/>
               <label for="1gg"><span></span><span class="check"></span><span class="box"></span>a) would have</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 36" value="2" id="2gg"/>
               <label for="2gg"><span></span><span class="check"></span><span class="box"></span>b) had had</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 36" value="3" id="3gg"/>
               <label for="3gg"><span></span><span class="check"></span><span class="box"></span>c) had</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 36" value="4" id="4gg" />
               <label for="4gg"><span></span><span class="check"></span><span class="box"></span>d) have</label></div></div></div>     
               
               
                 
     <label class="col-md-4 control-label preguntas">37-.I regret ____ that you have failed your exam</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 37" value="1"  id="1hh"/>
               <label for="1hh"><span></span><span class="check"></span><span class="box"></span>a) to tell</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 37" value="2" id="2hh"/>
               <label for="2hh"><span></span><span class="check"></span><span class="box"></span>b) saying</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 37" value="3" id="3hh"/>
               <label for="3hh"><span></span><span class="check"></span><span class="box"></span>c) telling</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 37" value="4" id="4hh" />
               <label for="4hh"><span></span><span class="check"></span><span class="box"></span>d) to say</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">38-. ____of all her efforts , she couldn&rsquo;t arrive on time </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 38" value="1"  id="1ii"/>
               <label for="1ii"><span></span><span class="check"></span><span class="box"></span>a) despite</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 38" value="2" id="2ii"/>
               <label for="2ii"><span></span><span class="check"></span><span class="box"></span>b) though</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 38" value="3" id="3ii"/>
               <label for="3ii"><span></span><span class="check"></span><span class="box"></span>c) in spite</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 38" value="4" id="4ii" />
               <label for="4ii"><span></span><span class="check"></span><span class="box"></span>d) although</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">39-.Mrs Robins _________ ten children, all of them are alive.</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 39" value="1"  id="1jj"/>
               <label for="1jj"><span></span><span class="check"></span><span class="box"></span>a) is believed to have </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 39" value="2" id="2jj"/>
               <label for="2jj"><span></span><span class="check"></span><span class="box"></span>b) is believed she had </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 39" value="3" id="3jj"/>
               <label for="3jj"><span></span><span class="check"></span><span class="box"></span>c) was believed to have </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 39" value="4" id="4jj" />
               <label for="4jj"><span></span><span class="check"></span><span class="box"></span>d) was believed to have had</label></div></div></div>
       
     
<label class="col-md-4 control-label preguntas">40-.It&rsquo;s no use _______ to learn a language just by studying a dictionary</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 40" value="1"  id="1kk"/>
               <label for="1kk"><span></span><span class="check"></span><span class="box"></span>a) to try</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 40" value="2" id="2kk"/>
               <label for="2kk"><span></span><span class="check"></span><span class="box"></span>b) trying</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 40" value="3" id="3kk"/>
               <label for="3kk"><span></span><span class="check"></span><span class="box"></span>c) in trying</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 40" value="4" id="4kk" />
               <label for="4kk"><span></span><span class="check"></span><span class="box"></span>d) try</label></div></div></div>  
                    
     <label class="col-md-4 control-label preguntas">41-.It&rsquo;s time________ </label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 41" value="1"  id="1ll"/>
               <label for="1ll"><span></span><span class="check"></span><span class="box"></span>a) we go home</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 41" value="2" id="2ll"/>
               <label for="2ll"><span></span><span class="check"></span><span class="box"></span>b) we would go home</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 41" value="3" id="3ll"/>
               <label for="3ll"><span></span><span class="check"></span><span class="box"></span>c) we went home</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 41" value="4" id="4ll" />
               <label for="4ll"><span></span><span class="check"></span><span class="box"></span>d) we go</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">42-.Many students of English ______ take a test. </label><div class="col-md-6"><div class="c-radio-list preguntas">
     

           <div class="c-radio">
               <input type="radio" name="Pregunta 42" value="1"  id="1mm"/>
               <label for="1mm"><span></span><span class="check"></span><span class="box"></span>a) would prefer not</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 42" value="2" id="2mm"/>
               <label for="2mm"><span></span><span class="check"></span><span class="box"></span>b) would rather not to </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 42" value="3" id="3mm"/>
               <label for="3mm"><span></span><span class="check"></span><span class="box"></span>c) would rather not </label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 42" value="4" id="4mm" />
               <label for="4mm"><span></span><span class="check"></span><span class="box"></span>d) prefer</label></div></div></div>     
               
               
                 
     <label class="col-md-4 control-label preguntas">43-.He gets annoyed when people don&rsquo;t do _____ he tells them to do</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 43" value="1"  id="1nn"/>
               <label for="1nn"><span></span><span class="check"></span><span class="box"></span>a) that</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 43" value="2" id="2nn"/>
               <label for="2nn"><span></span><span class="check"></span><span class="box"></span>b) what</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 43" value="3" id="3nn"/>
               <label for="3nn"><span></span><span class="check"></span><span class="box"></span>c) which</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 43" value="4" id="4nn" />
               <label for="4nn"><span></span><span class="check"></span><span class="box"></span>d) who</label></div></div></div>
       
     
    <label class="col-md-4 control-label preguntas">44-.You can learn the basic structures of a language quite quickly, but only if you _____ make an effort.</label><div class="col-md-6"><div class="c-radio-list preguntas">
           <div class="c-radio">
               <input type="radio" name="Pregunta 44" value="1"  id="1oo"/>
               <label for="1oo"><span></span><span class="check"></span><span class="box"></span>a) are waiting</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 44" value="2" id="2oo"/>
               <label for="2oo"><span></span><span class="check"></span><span class="box"></span>b) will to</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 44" value="3" id="3oo"/>
               <label for="3oo"><span></span><span class="check"></span><span class="box"></span>c) are willing to</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 44" value="4" id="4oo" />
               <label for="4oo"><span></span><span class="check"></span><span class="box"></span>d) want</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">45-.This is the man ______ son is clever </label><div class="col-md-6"><div class="c-radio-list preguntas">
     

           <div class="c-radio">
               <input type="radio" name="Pregunta 45" value="1"  id="1pp"/>
               <label for="1pp"><span></span><span class="check"></span><span class="box"></span>a) what</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 45" value="2" id="2pp"/>
               <label for="2pp"><span></span><span class="check"></span><span class="box"></span>b) whose</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 45" value="3" id="3pp"/>
               <label for="3pp"><span></span><span class="check"></span><span class="box"></span>c) which</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 45" value="4" id="4pp" />
               <label for="4pp"><span></span><span class="check"></span><span class="box"></span>d) that</label></div></div></div>       
     <label class="col-md-4 control-label preguntas">46-. I apologize _______ rude to you.</label><div class="col-md-6"><div class="c-radio-list preguntas">
     

           <div class="c-radio">
               <input type="radio" name="Pregunta 46" value="1"  id="1qq"/>
               <label for="1qq"><span></span><span class="check"></span><span class="box"></span>a) to be</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 46" value="2" id="2qq"/>
               <label for="2qq"><span></span><span class="check"></span><span class="box"></span>b) for being</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 46" value="3" id="3qq"/>
               <label for="3qq"><span></span><span class="check"></span><span class="box"></span>c) for be</label></div>
           <div class="c-radio">
               <input type="radio" name="Pregunta 46" value="4" id="4qq" />
               <label for="4qq"><span></span><span class="check"></span><span class="box"></span>d) to being</label></div></div></div>
<button type="button" class="btn c-theme-btn c-btn-uppercase btn-lg c-btn-bold c-btn-square" id="envia_form" language="javascript" >Enviar formulario</button>
</div>
</form>
</div>
</div></div></div></div>
<div id="tratamiento_datos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><%Sql= "SELECT titulo_esp, texto_esp FROM generales WHERE tipo='td'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
texto_td=ob_rs("texto_esp")
titulo_td=ob_rs("titulo_esp")
end if
ob_rs.close%>
<div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
<span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-info" aria-hidden="true" style="margin-right:15px;"></i><i class="fa fa-database" aria-hidden="true"></i> <span><%=titulo_td%></span></h4></div><div class="modal-body"><p><span><%=texto_td%></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content c-square"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">×</span></button><h4 class="modal-title" style="color:#32C5D2"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right:15px;"></i> <span id="alerta_tit"></span></h4></div><div class="modal-body"><p><span id="alerta_txt"></span></p></div><div class="modal-footer"><button type="button" class="btn c-theme-btn c-btn-border-2x c-btn-square c-btn-bold c-btn-uppercase" data-dismiss="modal">Aceptar</button></div></div></div></div>
<div id="spinner_back_usu" style="display:none"><div id="spinner" class="spinner_usu" ><img src="<%=r%>web/lib/img/carga.gif" width="128" height="128"><br><br>Enviando datos...</div></div>
<style>.spinner_usu {position: fixed; top: 25%; left: 50%;margin-left: -125px;margin-top: -50px;text-align:center;z-index:1234;overflow: hidden;width: 350px;height: 220px;background:#fff;padding-top:25px;color:#32C5D2;font-weight:bold;-webkit-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.75);-moz-box-shadow:0px 0px 8px 0px rgba(50, 50, 50, 0.75);box-shadow:0px 0px 8px 0px rgba(50, 50, 50,0.75);}#spinner_back_usu{position: fixed; background:rgba(0,0,0,0.5);position: fixed; top: 0; left: 0;width:100%;height:100%;overflow: hidden;text-align:center;z-index:111111111;}</style>
<!--#include file="comun/menu_inf.asp"-->
<script>
function tratamiento_datos(){$('#tratamiento_datos').modal('show');}
function RefreshImage(valImageId) {
var objImage = document.images[valImageId];
if (objImage == undefined) {return;}var now = new Date();
objImage.src = objImage.src.split('?')[0] + '?x=' + now.toUTCString();}
$(document).ready(function(){$("#envia_form").click(function() {
$.getJSON("<%=r%>web/comun/captcha/captcha.asp?validateCaptchaCode=" +  $("#captchacode").val() + "&format=json&jsoncallback=?", function(data){
if (data.status == "1")
{if (Enviar() == true){
$('#spinner_back_usu').show();
setTimeout(function(){ document.envio.submit(); }, 300);
}result = true;}else{
if (data.session == "0")
RefreshImage("imgCaptcha");
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Por favor introduce las letras y números correctos en la caja de Código Seguro!');$('#alerta_tit').html('Introduce el código.');$('#alerta').modal('show');
$('#captchacode').css('border', '2px solid #FF0000');$('#captchacode').click(function() {$('#captchacode').css('border', '1px solid #D0D7DE');});
result = false;}});});});













function nombre() {Ctrl = document.envio.nombre;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce tu nombre.');$('#alerta_tit').html('Nombre no introducido.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function edad() {Ctrl = document.envio.edad;if (Ctrl.value == "" ) {$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Introduce tu edad.');$('#alerta_tit').html('Edad no introducida.');$('#alerta').modal('show');$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');});return (false);} else return (true);}
function email(form){
var resultado
var str=document.envio.email.value;
var Ctrl=document.envio.email;
var filtro=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
if (filtro.test(str))
resultado=true
else{
$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> El eMail introducido no es correcto.');$('#alerta_tit').html('eMail introducido incorrecto.');$('#alerta').modal('show');
$(Ctrl).css('border', '2px solid #FF0000');$(Ctrl).click(function() {$(Ctrl).css('border', '1px solid #D0D7DE');})
resultado=false
}return (resultado)}
function correcto(){if (document.getElementById("acepto").checked==true)
{return (true);}else{$('#alerta_txt').html('<i class="fa fa-check-square-o" aria-hidden="true"></i> Debes aceptar la Cláusula Informativa y Autorización al Tratamiento de datos.');$('#alerta_tit').html('Aceptar cláusula informativa.');$('#alerta').modal('show');return (false)}}
function Enviar (form)  {if (!nombre(form)) return;if (!email(form)) return;if (!edad(form)) return;if (!correcto(form)) return;return true;}
</script>