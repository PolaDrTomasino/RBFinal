<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RxRequest.aspx.cs" Inherits="RxRequest" %>

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


    <%--jquery--%>
    <script src="js/vendor/jquery-3.6.0.min.js"></script>
        <script src="js/vendor/jquery-1.11.2.js"></script>
    <%--bootstrap js--%>
    <script src="js/vendor/bootstrap.min.js"></script>
    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <script src="js/vendor/bootstrapValidator.min.js"></script>
    <script src="js/vendor/bootstrap.min.js"></script>
        
        <script src="https://kit.fontawesome.com/607077bda6.js"></script>
        <script src="popup.js" type="text/javascript"></script>
        <script>
            function alert() {
                Swal.fire(
      'Referral Request Submitted Successfully',
      'Yeaaaaay!',
      'success'
    )
            }
        </script>

    </head>
    <body>
        <br />
        <div class="container-ins">
            <h3>
                <asp:Label ID="Label1" runat="server" Text="Add Rx Request" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: left; margin-left: 150px" Width="575px" Font-Bold="False" ForeColor="Blue"></asp:Label>
            </h3>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
							<asp:TextBox ID="txtDate" type="date" runat="server" class="form-control" placeholder="MM/DD/YYYY" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
                            <asp:TextBox ID="txtPatient_Name" required="" runat="server" class="form-control" placeholder="Enter Patient Name" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
                            <asp:TextBox ID="txtPhone_Number" runat="server" class="form-control" placeholder="Enter Phone Number" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
                    <label class="col-md-3 control-label">Rx:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fas fa-prescription"></i></span>
							<asp:DropDownList ID="txtRx" runat="server" class="form-control" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Contacts Rx</asp:ListItem>
                            <asp:ListItem>Galsses Rx</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
			<div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Receiving Via:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-spinner"></i></span>
							<asp:DropDownList ID="txtReceiving_Via" runat="server" class="form-control" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px">
                            <asp:ListItem>Office Pick-Up</asp:ListItem>
                            <asp:ListItem>By Email</asp:ListItem>
                            <asp:ListItem>Mail To Home</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Date Done:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtDate_Done" type="date" runat="server" class="form-control" placeholder="MM/DD/YYYY" Width="245px" Style="margin-left: 0px"></asp:TextBox>
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
                            <asp:TextBox ID="txtInitials" required="" runat="server" class="form-control" placeholder="Your Initials" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
                            <asp:DropDownList ID="txtStatus" runat="server" class="form-control"  Style="margin-bottom: 0px; margin-left: 0px;" Width="245px">
                                <asp:ListItem>Processing</asp:ListItem>
                                <asp:ListItem>Done (Closed)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-warning" OnClick="BtnSubmit_Click" Style="margin-left:220px; text-align: center; Width: 200px; " Text="Submit" />
    </body>
</asp:Content>

