<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCancellation.aspx.cs" Inherits="ViewCancellation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <div>
        <table class="style1">
            <tr>
                <td class="auto-style4" style="color: #800000; font-size: large;">
                Search</td>
                <td class="auto-style4">
                 <asp:TextBox ID="TextBox1" runat="server" Width="216px"></asp:TextBox>
                 </td>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" Width="76px" />
                </td>
            </tr>
           
        </table>
        <br />
        <asp:GridView ID="GridViewCancellation" ShowHeaderWhenEmpty="True" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="426px" Width="837px" AutoGenerateColumns="false" align="center" AllowPaging="true" OnPreRender="GridViewCancellation_PreRender" PageSize="20" OnPageIndexChanging="OnPageIndexChanging" style="text-align: center">
           <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date"  />
                <asp:BoundField DataField="Patient_Name" HeaderText="Patient Name" />
                <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" />
                <asp:BoundField DataField="Email" HeaderText="Email"  />
                <asp:BoundField DataField="Appt_Date" HeaderText="Appointment Date" />
                <asp:BoundField DataField="New_Date" HeaderText="New Date" />
                <asp:BoundField DataField="Initials" HeaderText="Initials" />
            </Columns>
            <EmptyDataTemplate>No Records Available</EmptyDataTemplate>
        </asp:GridView>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </div>
</body>
    </html>
</asp:Content>

