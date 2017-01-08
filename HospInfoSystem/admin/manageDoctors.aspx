<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageDoctors.aspx.cs" Inherits="HospInfoSystem.admin.manageDoctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Doktorlar</h2>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="tc" HeaderText="tc" SortExpression="tc" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" DeleteCommand="DELETE FROM [doctors] WHERE [id] = @original_id AND [tc] = @original_tc AND [name] = @original_name AND [surname] = @original_surname AND [title_id] = @original_title_id AND [dep_id] = @original_dep_id AND [password] = @original_password" InsertCommand="INSERT INTO [doctors] ([tc], [name], [surname], [title_id], [dep_id], [password]) VALUES (@tc, @name, @surname, @title_id, @dep_id, @password)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT doctors.id,tc,titles.name AS title,doctors.name,surname,departments.name AS department,password FROM [doctors],[titles],[departments] where titles.id=title_id AND departments.id=dep_id ORDER BY [tc]" UpdateCommand="UPDATE [doctors] SET [tc] = @tc, [name] = @name, [surname] = @surname, [title_id] = @title_id, [dep_id] = @dep_id, [password] = @password WHERE [id] = @original_id AND [tc] = @original_tc AND [name] = @original_name AND [surname] = @original_surname AND [title_id] = @original_title_id AND [dep_id] = @original_dep_id AND [password] = @original_password">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_tc" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_surname" Type="String" />
                <asp:Parameter Name="original_title_id" Type="Int32" />
                <asp:Parameter Name="original_dep_id" Type="Int32" />
                <asp:Parameter Name="original_password" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tc" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="title_id" Type="Int32" />
                <asp:Parameter Name="dep_id" Type="Int32" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tc" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="title_id" Type="Int32" />
                <asp:Parameter Name="dep_id" Type="Int32" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_tc" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_surname" Type="String" />
                <asp:Parameter Name="original_title_id" Type="Int32" />
                <asp:Parameter Name="original_dep_id" Type="Int32" />
                <asp:Parameter Name="original_password" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnAddDoctor" runat="server" OnClick="btnAddDoctor_Click" Text="Yeni Doktor Ekle" />
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
                    <td><asp:Label ID="label1" runat="server" Text="Soyisim:"></asp:Label></td>
                    <td><asp:TextBox ID="txtSurname" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td><asp:Label ID="label3" runat="server" Text="Ünvan:"></asp:Label></td>     
                    <td><asp:DropDownList ID="listTitle" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT [name], [id] FROM [titles] ORDER BY [id]"></asp:SqlDataSource>
                     </td>             
                </tr>
                <tr>
                    <td><asp:Label ID="label4" runat="server" Text="Bölüm:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="listDepartment" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT * FROM [departments]"></asp:SqlDataSource>
                    </td>
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
