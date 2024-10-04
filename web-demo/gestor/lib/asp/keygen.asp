<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>
<body>
<% Const g_KeyLocation = "E:\Web\GetUp\web\gestor\lib\asp\key.txt"
Const g_KeyLen = 512 
On Error Resume Next 
Call WriteKeyToFile(KeyGeN(g_KeyLen),g_KeyLocation) 
if Err <> 0 Then 
Response.Write "ERROR GENERANDO CLAVE." & "<P>" 
Response.Write Err.Number & "<BR>" 
Response.Write Err.Description & "<BR>" 
Else 
Response.Write "CLAVE CREADA" 
End If 
Sub WriteKeyToFile(MyKeyString,strFileName) 
Dim keyFile, fso 
set fso = Server.CreateObject("scripting.FileSystemObject") 
set keyFile = fso.CreateTextFile(strFileName, true) 
keyFile.WriteLine(MyKeyString) 
keyFile.Close 
End Sub 
Function KeyGeN(iKeyLength) 
Dim k, iCount, strMyKey 
lowerbound = 35 
upperbound = 96 
Randomize 
for i = 1 to iKeyLength 
s = 255 
k = Int(((upperbound - lowerbound) + 1) * Rnd + lowerbound) 
strMyKey = strMyKey & Chr(k) & "" 
next 
KeyGeN = strMyKey 
End Function %> 
</body>
</html>