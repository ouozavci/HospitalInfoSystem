<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctor_panel.aspx.cs" Inherits="HospInfoSystem.doctor.doctor_panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT [name], [surname] FROM [doctors] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="id" SessionField="doc_id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblDoctorName" runat="server" Text="Doktor Adı" ></asp:Label>
        </h1>
    </div>
        <h2><asp:Label ID="Label1" runat="server" Text="Randevular" ></asp:Label></h2>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Muayene No" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Muayene No" HeaderText="Muayene No" SortExpression="Muayene No" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="T.C Kimlik No" HeaderText="T.C Kimlik No" SortExpression="T.C Kimlik No" />
                <asp:BoundField DataField="İsim" HeaderText="İsim" SortExpression="İsim" />
                <asp:BoundField DataField="Soyisim" HeaderText="Soyisim" SortExpression="Soyisim" />
                <asp:BoundField DataField="Tarih" HeaderText="Tarih" SortExpression="Tarih" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandName="Muayene" CommandArgument='<%# Eval("[Muayene No]", "{0}") %>' Text="Muayene" />
                        <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("[Muayene No]", "{0}") %>' CommandName="Cancel" OnClientClick="return confirm(&quot;Randevuyu silmek istediğinizden eminmisiniz?&quot;)" Text="İptal" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT appointments.id AS 'Muayene No',patients.tc AS 'T.C Kimlik No', patients.name AS İsim, patients.surname AS Soyisim, appointments.date AS Tarih FROM appointments CROSS JOIN patients WHERE (appointments.patient_id = patients.id) AND (appointments.doctor_id = @doc_id)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="doc_id" SessionField="doc_id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </form>
</body>
</html>
