<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="HospInfoSystem.admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı:"></asp:Label></td>
            <td><asp:TextBox ID="txtAdminUsername" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Şifre:"></asp:Label></td>
             <td><asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Giriş" />
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table> 
    </div>
    </form>
</body>
</html>
