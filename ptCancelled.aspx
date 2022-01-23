<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ptCancelled.aspx.cs" Inherits="ptCancelled" %>


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
    
</head>
<body>
        <br />
        <br />
    
        <div class="container">
            <asp:Button ID="ViewCan" runat="server" CssClass="btn btn-success" OnClick="CanViewer_Click" style="text-align: center; margin-left: 55px; font-weight: 700; font-size: large;" Text="View Cancellations" Width="400px" />
            <h2>
            <asp:Label ID="Label1" runat="server" Text="Cancellation Waiting List" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: left; margin-left: 100px" Width="430px" Font-Bold="False" ForeColor="Blue"></asp:Label>
        </h2>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Appointment Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtDate" class="form-control" placeholder="MM/DD/YYYY" runat="server" OnTextChanged="TextBox1_TextChanged"  Style="margin-bottom: 0px; margin-left: 0px;" Width="245px" Visible="True"></asp:TextBox>
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
                    <label class="col-md-3 control-label">Appointment Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-quote-right"></i></span>
							<asp:TextBox ID="txtAppt_Date" class="form-control" placeholder="MM/DD/YYYY" runat="server" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">New Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
							<asp:TextBox ID="txtNew_Date" runat="server" class="form-control" placeholder="MM/DD/YYYY" Width="245px" Style="margin-left: 0px"></asp:TextBox>
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
                    <asp:Button ID="Button1" runat="server"  CssClass="btn btn-warning"  OnClick="SubmitCan_Click" Style="text-align: center;" Text="Submit" />
                    
                </div>
            </div>

            <br />
            <br />
        </div>
    </body>
</asp:Content>

