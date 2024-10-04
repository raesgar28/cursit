<%Set Ob_Connb = Server.CreateObject ("ADODB.Connection")
Set Ob_Commandb = Server.CreateObject ("ADODB.Command")
Ob_Connb.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/back.mdb")
Ob_Commandb.ActiveConnection = Ob_Connb
if n="academia" then
Set Ob_Connc = Server.CreateObject ("ADODB.Connection")
Set Ob_Commandc = Server.CreateObject ("ADODB.Command")
Ob_Connc.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=p; Data Source=" & Server.MapPath(rd&"data/academia.mdb")
Ob_Commandc.ActiveConnection = Ob_Connc
end if%>