<%if no_estil<>"si" then
r=request("r")
if n<>"log" then
if r ="" then r = request_equerystring("r")
end if
domainname = Request.ServerVariables("SERVER_NAME") 
querystring = Request.ServerVariables("QUERY_STRING")
aPath1 = Split("/" & REquest.ServerVariables("PATH_INFO"), "/")%>
<link href="<%=r%>lib/app/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/css/components.min.css" rel="stylesheet" id="style_components" type="text/css">
<%if n="log"then%>
<link href="<%=r%>lib/css/login.css" rel="stylesheet" type="text/css">
<%else%>
<link href="<%=r%>lib/app/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/css/layout.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/css/custom.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">
<link href="<%=r%>lib/app/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css">
<%end if
end if 'no estil%>


