<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReceiptRequest.aspx.cs" Inherits="ReceiptRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<head id="Head1">
    <title></title>
    <script src="popup.js" type="text/javascript"></script>
    <script>
        function alert() {
            Swal.fire(
  'Receipt Request Submitted Successfully!',
  'Yeaaaaay!',
  'success'
)
        }
    </script>
    <style type="text/css">
        .auto-style2 {
            height: 23px;
            width: 259px;
        }

        .auto-style22 {
            width: 100%;
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
<body>
        <div style="height: 360px; width: 757px;">

            <table border="1" class="auto-style22">
                <tr>
                    <td class="auto-style25">Date:</td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtDate" runat="server" OnTextChanged="TextBox1_TextChanged" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">Patient Name:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtPatient_Name" runat="server" Width="244px" OnTextChanged="txtPatient_Name_TextChanged1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">Phone Number:</td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtPhone_Number" runat="server" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Email:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server" OnTextChanged="TextBox4_TextChanged" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">Service Provider:</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="txtService_Provider" runat="server" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Receiving Via:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="txtReceiving_Via" runat="server">
                            <asp:ListItem>Office Pick-Up</asp:ListItem>
                            <asp:ListItem>By Email</asp:ListItem>
                            <asp:ListItem>Mail To Home</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">Date Done:</td>
                    <td>
                        <asp:TextBox ID="txtDate_Done" runat="server" Width="245px" Style="margin-left: 0px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Initials:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtInitials" runat="server" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                
            </table>
            <br />
            <br />
            <asp:Button ID="BtnSubmit" runat="server" OnClick="Button1_Click" Style="margin-left: 360px; text-align: center;" Text="Submit" Width="259px" BorderStyle="Groove" CssClass="auto-style25" />
            <br />
            <br />

        </div>
</body>
</asp:Content>