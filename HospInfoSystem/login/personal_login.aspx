<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personal_login.aspx.cs" Inherits="HospInfoSystem.personel_login" %>

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
            <td><asp:Label ID="Label1" runat="server" Text="T.C. Kimlik Numarası:"></asp:Label></td>
            <td><asp:TextBox ID="txtPersonalTc" runat="server" MaxLength="11"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Şifre:"></asp:Label></td>
             <td><asp:TextBox ID="txtPersonalPassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnLoginPersonal" runat="server" Text="Giriş" OnClick="btnLoginPersonal_Click" />
                <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table> 
    </div>
    </form>
</body>
</html>
