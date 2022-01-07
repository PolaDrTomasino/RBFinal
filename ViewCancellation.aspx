<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="ViewCancellation.aspx.cs" Inherits="ViewCancellation"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            text-align: center;
            background-color:#f00;
            
        }
        .auto-style3 {
            text-align: center;
            font-weight: normal;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
    <div>
        <table align="center" style="width:1350px;">
            <tr style="height:100px;">
                <td class="auto-style1"><strong>Dr. Susan Tomasino<br/>
                    Natick Eye Care<br/>
                    Red Book<br />
                    </strong></td>
            </tr>
            </table>
        </div>
        <table class="style1">
            <tr>
                <td class="style3" style="color: #800000; font-size: large;">
                Search</td>
                <td class="style2">
                 <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                 </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Go" onclick="Button1_Click" />
                </td>
            </tr>
           
        </table>

        <asp:GridView ID="GridViewCancellation" ShowHeaderWhenEmpty="True" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="426px" Width="837px" AutoGenerateColumns="false" align="center" AllowPaging="true" OnPreRender="GridViewCancellation_PreRender" PageSize="20" OnPageIndexChanging="OnPageIndexChanging">
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
    </form>
</body>
</html>