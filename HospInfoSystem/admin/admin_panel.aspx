<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_panel.aspx.cs" Inherits="HospInfoSystem.admin_panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Administrator Panel</h1>
    </div>
        <asp:Button ID="btnManageDoctors" runat="server" OnClick="btnManageDoctors_Click" Text="Doktorlar" />
        <asp:Button ID="btnManagePersonal" runat="server" OnClick="btnManagePersonal_Click" Text="Personel" />
    </form>
</body>
</html>
