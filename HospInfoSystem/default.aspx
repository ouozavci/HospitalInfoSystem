<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HospInfoSystem._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hospital Information</title>
    <link rel="stylesheet" href="css/styleMain.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="loginButtonContainer">
        <asp:Button ID="btnDoctor" runat="server" Text="Doktor Girişi" CssClass="loginButton" OnClick="btnDoctor_Click" />
        <asp:Button ID="btnPersonal" runat="server" Text="Hasta-Kayıt Personel Girişi" CssClass="loginButton" OnClick="btnPersonal_Click" />               
    </div>
    <div id="adminLinkContainer">
        <asp:LinkButton ID="linkAdmin" runat="server" CssClass="adminLink" OnClick="linkAdmin_Click">Administrator</asp:LinkButton>
    </div>
    </form>
</body>
</html>
