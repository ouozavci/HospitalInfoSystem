<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="managePersonal.aspx.cs" Inherits="HospInfoSystem.admin.managePersonal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h2>Doktorlar</h2>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="tc" HeaderText="tc" SortExpression="tc" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [personal] ORDER BY [tc], [id]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [personal] WHERE [id] = @original_id AND [tc] = @original_tc AND [name] = @original_name AND [surname] = @original_surname AND [password] = @original_password" InsertCommand="INSERT INTO [personal] ([tc], [name], [surname], [password]) VALUES (@tc, @name, @surname, @password)" UpdateCommand="UPDATE [personal] SET [tc] = @tc, [name] = @name, [surname] = @surname, [password] = @password WHERE [id] = @original_id AND [tc] = @original_tc AND [name] = @original_name AND [surname] = @original_surname AND [password] = @original_password">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_tc" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_surname" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tc" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tc" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_tc" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_surname" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnAddDoctor" runat="server" OnClick="btnAddDoctor_Click" Text="Yeni Personel Ekle" />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAddDoctor" EventName="Click">
                </asp:AsyncPostBackTrigger>
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlAddDoctorForm" Visible="false" runat="server">
                    
            <table>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="T.C Kimlik No:"></asp:Label></td>
                    <td><asp:TextBox ID="txtTc" runat="server" MaxLength="11"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="label" runat="server" Text="İsim:"></asp:Label></td>
                    <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td class="auto-style1"><asp:Label ID="label1" runat="server" Text="Soyisim:"></asp:Label></td>
                    <td class="auto-style1"><asp:TextBox ID="txtSurname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="label5" runat="server" Text="Şifre:"></asp:Label></td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>                        
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="btnSave" runat="server" Text="Kaydet" OnClick="btnSave_Click" />
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
                        </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
