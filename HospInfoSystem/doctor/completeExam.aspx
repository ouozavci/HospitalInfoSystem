<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="completeExam.aspx.cs" Inherits="HospInfoSystem.doctor.completeExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Muayene ile ilgili notlar:"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtNote" runat="server" Height="150px" MaxLength="1000" Rows="20" Width="335px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align:right">
                    <asp:Button ID="btnComplete" runat="server" Text="Tamamla" OnClick="btnComplete_Click" /></td>
            </tr>
        </table>
        
    </div>   
    </form>
</body>
</html>
