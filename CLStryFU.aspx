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
        <asp:Button ID="ViewCLS" runat="server" OnClick="Button1_Click2" Style="text-align: center; margin-left: 55px; font-weight: 700; font-size: large;" Text="View CLS Trials" Width="400px" />

        <div class="container">
            <h3>
                <asp:Label ID="Label1" runat="server" Text="Contact Lenses Follow Up" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: center; margin-left: 80px" Width="300px" Font-Bold="False" ForeColor="Blue"></asp:Label>
            </h3>
            <form id="defaultForm" class="form-horizontal">
                <div class="form-group">
                    <div class="row">
                        <label class="col-md-3 control-label">Appointment Date:</label>
                        <div class="col-md-6 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                <asp:TextBox ID="txtAppt_Date" runat="server" class="form-control" placeholder="Enter Appointment Date" OnTextChanged="TextBox1_TextChanged" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
                                <asp:TextBox ID="txtPatient_Name" runat="server" class="form-control" placeholder="Enter Patient Name" OnTextChanged="TextBox1_TextChanged" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
                        <label class="col-md-3 control-label">CLS Trying:</label>
                        <div class="col-md-6 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-quote-right"></i></span>
                                <asp:TextBox ID="txtCLS_Try" runat="server" class="form-control" placeholder="Enter CLS Trying" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label class="col-md-3 control-label">Date Of Follow Up:</label>
                        <div class="col-md-6 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                                <asp:TextBox ID="txtFU_Date" runat="server" class="form-control" placeholder="Date of Follow up" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
            </form>
            <div class="form-group">
                <label class="col-md-6 control-label"></label>
                <div class="col-md-5">
                    <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-warning" OnClick="BtnSubmit_Click" Style="text-align: center; Width: 200px;" Text="Submit" />
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#defaultForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    txtAppt_Date: {
                        container: '#firstNameMessage',
                        validators: {
                            notEmpty: {
                                message: 'The first name is required and cannot be empty'
                            }
                        }
                    },
                    lastName: {
                        container: '.lastNameMessage',
                        validators: {
                            notEmpty: {
                                message: 'The last name is required and cannot be empty'
                            }
                        }
                    },
                    username: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: 'The username is required and cannot be empty'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The username must be more than 6 and less than 30 characters long'
                            }
                        }
                    }
                }
            });
        });
    </script>
</asp:Content>
