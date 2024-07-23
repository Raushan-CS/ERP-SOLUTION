<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logout.aspx.cs" Inherits="logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        h2{font-family:Verdana; font-size:15px; text-align:center;}
        p{font-family:Verdana; font-size:15px; text-align:center;}

    </style>
       <script type="text/javascript">javascript: window.history.forward(-1);</script>
</head>
<body style="background-color:#2C3E50;">
     <form id="form1" runat="server">
   <div >
        <h2 style="color:white;">You are being redirected to the Home Page in 5 Seconds.</h2>
        <p style="color:white;">To continue, please <a href="index.aspx" style="color:white;">click here</a></p>
       
    </div>
    </form>
   
</body>
</html>
