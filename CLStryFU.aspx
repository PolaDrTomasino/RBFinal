<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CLStryFU.aspx.cs" Inherits="CLStryFU" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>

    <head id="Head1">
        <title></title>

        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrapValidator.css" rel="stylesheet" />
        <link href="css/fontawesome.min.css" rel="stylesheet" />
        <link href="css/fontAwesome.css" rel="stylesheet" />

        <%--theme--%>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <link href="css/owl-carousel.css" rel="stylesheet" />
        <link href="css/light-box.css" rel="stylesheet" />
        <link href="StyleSheet.css" rel="stylesheet" />
        <link href="css/bootstrapValidator.min.css" rel="stylesheet" />
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" />

        <%--jquery--%>
        <script src="js/jquery-1.10.2.min.js"></script>
        <script src="js/vendor/jquery-3.6.0.min.js"></script>
        <%--bootstrap js--%>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="js/vendor/bootstrapValidator.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/bootstrapValidator.js"></script>

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

    </head>
    <body>
        <br />
        <br />
        <div class="container">
            <h3>
                <asp:Label ID="Label1" runat="server" Text="Contact Lenses Follow Up" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: center; margin-left: 80px" Width="300px" Font-Bold="False" ForeColor="Blue"></asp:Label>
            </h3>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Appointment Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtAppt_Date" runat="server" class="form-control" placeholder="MM/DD/YYYY" OnTextChanged="TextBox1_TextChanged" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-xs-15 col-sm-10">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ControlToValidate="txtAppt_Date" ErrorMessage="Appointment Date is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Patient Name:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <asp:TextBox ID="txtPatient_Name" runat="server" class="form-control" placeholder="Enter Patient Name" OnTextChanged="TextBox1_TextChanged" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-xs-15 col-sm-10">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPatient_Name" ErrorMessage="Patient Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
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
                <div class="col-xs-15 col-sm-10">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone_Number" ErrorMessage="Phone Number is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
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
                <div class="col-xs-15 col-sm-10">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">CLS Trying:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-quote-right"></i></span>
                            <asp:TextBox ID="txtCLS_Try" runat="server" class="form-control" placeholder="Enter CLS Trying" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-xs-15 col-sm-10">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCLS_Try" ErrorMessage="CLS under trial is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Date Of Follow Up:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtFU_Date" runat="server" class="form-control" placeholder="MM/DD/YYYY" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-xs-15 col-sm-10">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFU_Date" ErrorMessage="Follow-up Date is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
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
                <div class="col-xs-15 col-sm-10">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtInitials" ErrorMessage="Initialsis required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
                </div>
            </div>
        </div>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" OnClick="BtnSubmit_Click" Style="margin-left:100px; text-align: center; Width: 200px; " Text="Submit" />
    </body>
</asp:Content>
