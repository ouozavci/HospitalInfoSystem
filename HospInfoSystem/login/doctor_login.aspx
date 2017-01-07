<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctor_login.aspx.cs" Inherits="HospInfoSystem.doctor_login" %>

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
            <td><asp:TextBox ID="txtDoctorTc" runat="server" MaxLength="11"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Şifre:"></asp:Label></td>
             <td><asp:TextBox ID="txtDoctorPassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnLoginDoctor" runat="server" Text="Giriş" OnClick="btnLoginDoctor_Click" />
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table> 
    </div>
    </form>
</body>
</html>
