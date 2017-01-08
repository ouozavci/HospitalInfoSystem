<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personal_panel.aspx.cs" Inherits="HospInfoSystem.personal.personal_panel" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Hasta-Kayıt Randevu Paneli
            </h1>
            <h3 style="float: right">
                <asp:Label ID="lblPersonalName" runat="server" Text="Label"></asp:Label></h3>
        </div>
        <asp:Button ID="btnAddAppointment" runat="server" OnClick="btnAddAppointment_Click" Text="Randevu Oluştur" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT [name], [surname] FROM [personal] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id" SessionField="personal_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <table>
            <tr>
                <td colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddAppointment" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel ID="pnlDepartment" runat="server" Visible="false">
                                <asp:Label ID="Label1" runat="server" Text="Bölüm:"></asp:Label>
                                <asp:DropDownList ID="listDepartments" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="listDepartments_SelectedIndexChanged" AutoPostBack="True" OnDataBound="listDepartment_DataBound">
                                    <asp:ListItem Enabled="True" Selected="True" Value="0">Bir bölüm seçiniz...</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT [name], [id] FROM [departments]"></asp:SqlDataSource>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlDoctor" runat="server" Visible="false">
                                <asp:Label ID="Label2" runat="server" Text="Doktor:"></asp:Label>
                                <asp:DropDownList ID="listDoctors" runat="server" DataSourceID="SqlDataSource3" DataTextField="fullname" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="listDoctors_SelectedIndexChanged" OnDataBound="listDoctors_DataBound">
                                    <asp:ListItem Enabled="False" Selected="True" Value="0">Bir bölüm seçiniz.</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT [id], [name]+' '+ [surname] AS fullname FROM [doctors] WHERE ([dep_id] = @dep_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="listDepartments" DefaultValue="0" Name="dep_id" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="listDepartments" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlCalendar" Visible="false" runat="server">
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px">
                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                </asp:Calendar>

                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="listDoctors" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlHours" runat="server" Visible="false">
                                <asp:RadioButtonList ID="rButtonsHours" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rButtonsHours_SelectedIndexChanged">
                                    <asp:ListItem>09:00</asp:ListItem>
                                    <asp:ListItem>10:00</asp:ListItem>
                                    <asp:ListItem>11:00</asp:ListItem>
                                    <asp:ListItem>12:00</asp:ListItem>
                                    <asp:ListItem>13:00</asp:ListItem>
                                    <asp:ListItem>14:00</asp:ListItem>
                                    <asp:ListItem>15:00</asp:ListItem>
                                    <asp:ListItem>16:00</asp:ListItem>
                                    <asp:ListItem>17:00</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT appointments.time, patients.name, patients.surname FROM appointments INNER JOIN patients ON appointments.patient_id = patients.id WHERE (appointments.doctor_id = @doctor_id) AND (appointments.date = @date)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="listDoctors" DefaultValue="0" Name="doctor_id" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="Calendar1" DefaultValue="0" Name="date" PropertyName="SelectedDate" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Calendar1" EventName="SelectionChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlHastaTc" runat="server" Visible="false">
                                <asp:Label ID="Label3" runat="server" Text="T.C Kimlik No:"></asp:Label>
                                <asp:TextBox ID="txtTc" runat="server" MaxLength="11"></asp:TextBox>
                                <asp:Button ID="btnSorgula" runat="server" Text="Hasta Sorgula" OnClick="btnSorgula_Click" />
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT patients.id, patients.tc, patients.name, patients.surname, patients.birth_year,insurances.id AS insurance_id, insurances.name AS insurance FROM patients CROSS JOIN insurances WHERE (patients.tc = @id) AND (patients.insurance_type = insurances.id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtTc" DefaultValue="0" Name="id" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:HisConnectionString %>" SelectCommand="SELECT [name], [id] FROM [insurances]"></asp:SqlDataSource>
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="rButtonsHours" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlHastaForm" runat="server" Visible="false">
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="lblMessage" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="İsim"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Soyisim"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Doğum Yılı"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBirth" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text="Sigorta Bilgisi:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="listInsurance" runat="server" DataSourceID="SqlDataSource6" DataTextField="name" DataValueField="id"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right;">
                                            <asp:Button ID="btnSave" runat="server" Text="Kaydet" OnClick="btnSave_Click" />
                                        </td>
                                    </tr>
                                </table>

                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSorgula" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
