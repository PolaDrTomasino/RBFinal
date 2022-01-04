<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CLStryFU.aspx.cs" Inherits="CLStryFU" %>
// Contact Lens Follow up requests
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

    <head id="Head1">
        <title></title>
        //Pop up message after success/fail
        <script src="popup.js" type="text/javascript"></script>
        <script>
            function alert() {
                Swal.fire(
      'Contact Lenses Trial Appointment Submitted Successfully',
      'Yeaaaaay!',
      'success'
    )
            }
        </script>
        <link href="StyleSheet.css" rel="stylesheet" />
        //Form Style
        <style type="text/css">
            .auto-style2 {
                height: 23px;
                width: 259px;
            }

            .auto-style22 {
                width: 76%;
                direction: ltr;
            }

            .auto-style23 {
                font-weight: bold;
                text-decoration: underline;
                width: 141px;
            }

            .auto-style24 {
                font-weight: bold;
                text-decoration: underline;
                width: 141px;
            }

            .auto-style25 {
                font-weight: bold;
                text-decoration: underline;
                height: 28px;
                width: 141px;
            }

            .auto-style26 {
                height: 28px;
                width: 259px;
            }

            .auto-style27 {
                width: 259px;
            }
        </style>
    </head>
//CLS Form
    <body>
        <div style="height: 360px; width: 757px;">

            <h1>

            <asp:Label ID="Label1" runat="server" Text="Contact Lenses Follow Up" BorderStyle="None" CssClass="auto-style22" style="font-weight: 700; text-align: center; margin-left: 98px" Width="575px" Font-Bold="False"></asp:Label>
            </h1>

            <br />
            <table border="1" class="auto-style22" aria-atomic="False" aria-busy="False" align="center">
                <tr>
                    <td class="auto-style25">Appointment Date:</td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtAppt_Date" runat="server" placeholder="Enter Appointment Date" OnTextChanged="TextBox1_TextChanged" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">Patient Name:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtPatient_Name" runat="server" Width="244px" placeholder="Enter Patient Name" OnTextChanged="txtPatient_Name_TextChanged1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">Phone Number:</td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtPhone_Number" runat="server" placeholder="Enter Phone Number" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Email:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email" OnTextChanged="TextBox4_TextChanged" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">CLS Trying:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtCLS_Try" placeholder="Enter CLS being tried" runat="server" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Date Of Follow Up:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtFU_Date" placeholder="Follow up Date" runat="server" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Initials:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtInitials" placeholder="Your Initials" runat="server" Width="245px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="BtnSubmit" runat="server" OnClick="Button1_Click" Style="margin-left: 360px; text-align: center;" Text="Submit" Width="259px" BorderStyle="Groove" CssClass="auto-style25" />
            <br />

        </div>
</body>
</asp:Content>
