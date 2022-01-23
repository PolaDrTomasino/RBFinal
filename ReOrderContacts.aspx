<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReOrderContacts.aspx.cs" Inherits="ReOrderContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<head id="Head1">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/fontawesome.min.css" rel="stylesheet" />
    <link href="css/fontAwesome.css" rel="stylesheet" />
    <%--theme--%>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/templatemo-style.css" rel="stylesheet" />   
    <link href="css/owl-carousel.css" rel="stylesheet" />
    <link href="css/light-box.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
    <link href="css/bootstrapValidator.min.css" rel="stylesheet" />

    <script src="https://kit.fontawesome.com/607077bda6.js"></script>
    <script src="popup.js" type="text/javascript"></script>
    <script>
        function alert() {
            Swal.fire(
  'Contact Lenses Order Submitted Successfully!',
  'Yeaaaaay!',
  'success'
)
        }
    </script>
</head>
<body>
    <br />
    <br />
        <div class="container">
            
            <h3>
            <asp:Label ID="Label1" runat="server" Text="ReOrder Contact Lenses Requests" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: left; margin-left: 150px" Width="575px" Font-Bold="False" ForeColor="Blue"></asp:Label>
        </h3>
            <asp:Button ID="ViewOrd" runat="server" CssClass="btn btn-success" OnClick="OrderViewer_Click" style="text-align: center; margin-left: 55px; font-weight: 700; font-size: large;" Text="View CLS Orders" Width="400px" />
            <br />
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Appointment Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtDate" class="form-control" placeholder="Enter Date" runat="server" OnTextChanged="TextBox1_TextChanged"  Style="margin-bottom: 0px; margin-left: 0px;" Width="245px" Visible="True"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Patient Name:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
							<asp:TextBox ID="txtPatient_Name" class="form-control" placeholder="Enter Patient Name" runat="server" Width="244px" OnTextChanged="txtPatient_Name_TextChanged1"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Phone Number:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                            <asp:TextBox ID="txtPhone_Number" runat="server" class="form-control" placeholder="Enter Phone Number" OnTextChanged="TextBox1_TextChanged" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Email:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>

                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Email" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Order Description:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info-circle"></i></span>
							<asp:TextBox ID="txtOrderDescription" class="form-control" placeholder="Enter Order Description" TextMode="MultiLine" runat="server" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">OD/OS</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fas fa-prescription"></i></span>
							<asp:TextBox ID="txtOD" class="form-control" placeholder="OD" runat="server" Width="80px"></asp:TextBox>
                            <span class="input-group-addon"><i class="fas fa-prescription"></i></span>
                            <asp:TextBox ID="txtOS" class="form-control" placeholder="OS" runat="server" Width="80px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
			<div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">CC Number:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
							<asp:TextBox ID="txt_CCNumber" class="form-control" placeholder="Enter CC Number" runat="server" Width="245px" Style="margin-left: 0px"></asp:TextBox>
							
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Expiration Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info-circle"></i></span>
							<asp:TextBox ID="txt_Expiration" class="form-control" placeholder="Enter Expiration Date" runat="server" Width="185px"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<asp:TextBox ID="txtCVC" class="form-control" placeholder="CVC" runat="server" Width="60px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            
			<div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Delivery Location:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-truck"></i></span>
							<asp:DropDownList ID="txtHomeOffice" runat="server" class="form-control">
                            <asp:ListItem>Home</asp:ListItem>
                            <asp:ListItem>Office</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
			<div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Status:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-spinner"></i></span>
							<asp:DropDownList ID="txtStatus" runat="server" class="form-control">
                            <asp:ListItem>Insurance</asp:ListItem>
                            <asp:ListItem>Rebate</asp:ListItem>
                            <asp:ListItem>Charged</asp:ListItem>
                            <asp:ListItem>Done (Closed)</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Order From:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-shopping-cart"></i></span>
							<asp:DropDownList ID="txtOrderFrom" runat="server" class="form-control">
                            <asp:ListItem>Marlo</asp:ListItem>
                            <asp:ListItem>ABB</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Initials:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-star"></i></span>
                            <asp:TextBox ID="txtInitials" runat="server" class="form-control" placeholder="Your Initials" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-6 control-label"></label>
                <div class="col-md-5">
                    <asp:Button ID="ReOrder" runat="server" CssClass="btn btn-warning" OnClick="ReOrder_Click" Style="text-align: center;" Text="Submit" />
                </div>
            </div>

            <br />
            <br />
        </div>
    </body>
</asp:Content>

