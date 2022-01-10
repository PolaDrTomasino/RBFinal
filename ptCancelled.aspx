<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ptCancelled.aspx.cs" Inherits="ptCancelled" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<head id="Head1">
    <title></title>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <link href="css/owl-carousel.css" rel="stylesheet" />
        <link href="css/light-box.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="StyleSheet.css" rel="stylesheet" />
        <link href="css/bootstrapValidator.min.css" rel="stylesheet" />
        <link href="css/all.css" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/fontawesome.css" rel="stylesheet" />
        <link href="css/solid.css" rel="stylesheet" />
    <script src="popup.js" type="text/javascript"></script>
    <script>
        function alert() {
            Swal.fire(
  'Patient Added to Cancellation list Successfully',
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

            <asp:Button ID="ViewCan" runat="server" OnClick="Button1_Click2" style="text-align: center; margin-left: 74px; font-weight: 700; font-size: large;" Text="View Cancellations" Width="583px" />

            <br />
            <table border="1" class="auto-style22">
                <tr>
                    <td class="auto-style25">Date:</td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtDate" placeholder="Date" runat="server" OnTextChanged="TextBox1_TextChanged"  Style="margin-bottom: 0px; margin-left: 0px;" Width="245px" Visible="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">Patient Name:</td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtPatient_Name" placeholder="Enter Patient Name" runat="server" Width="244px" OnTextChanged="txtPatient_Name_TextChanged1"></asp:TextBox>
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
                    <td class="auto-style24" aria-atomic="False">Appt. Date/Time Reference:</td>
                    <td class="auto-style27" aria-atomic="False">
                        <asp:TextBox ID="txtAppt_Date" placeholder="Enter Appointment Date" runat="server" Width="245px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">New Date:</td>
                    <td>
                        <asp:TextBox ID="txtNew_Date" runat="server" placeholder="Enter New Date" Width="245px" Style="margin-left: 0px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Initials:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtInitials" runat="server" placeholder="Your Initials" Width="245px"></asp:TextBox>
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

