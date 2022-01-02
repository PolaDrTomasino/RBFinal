﻿<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="ViewCancellation.aspx.cs" Inherits="ViewCancellation"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridViewCancellation" ShowHeaderWhenEmpty="True" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="426px" Width="837px" AutoGenerateColumns="false" >
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
    </div>
    </form>
</body>
</html>