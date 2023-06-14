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

        <div class="container-ins">
            <h3>
                <br />
            <asp:Label ID="Label1" runat="server" Text="Cancellation List" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: left; margin-left: 150px" Width="575px" Font-Bold="False" ForeColor="Blue"></asp:Label>
        </h3>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtDate" required="" class="form-control" type="date" placeholder="MM/DD/YYYY" runat="server" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px" Visible="True"></asp:TextBox>
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
							<asp:TextBox ID="txtPatientName" autocomplete="off" required="" class="form-control" placeholder="Enter Patient Name" runat="server" Width="244px"></asp:TextBox>
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
                            <asp:TextBox ID="txtPhoneNumber" autocomplete="off" runat="server" class="form-control" placeholder="Enter Phone Number" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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

                            <asp:TextBox ID="txtEmail" runat="server" autocomplete="off" class="form-control" placeholder="Enter Email" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Cancellation Reason:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>

                            <asp:TextBox ID="txtReasonForCancel" autocomplete="off" required="" runat="server" class="form-control" TextMode="MultiLine" placeholder="Enter a reason" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Service Type:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-table"></i></span>
                            <asp:DropDownList ID="txtServType" runat="server" class="form-control"  Style="margin-bottom: 0px; margin-left: 0px;" Width="245px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Routine Exam</asp:ListItem>
                                <asp:ListItem>Medical</asp:ListItem>
                                <asp:ListItem>Iwellness/VF</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">New Appointmnent Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
							<asp:TextBox ID="txtNewDate" runat="server" type="date" class="form-control" placeholder="MM/DD/YYYY" Width="245px" Style="margin-left: 0px"></asp:TextBox>
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
                            <asp:TextBox ID="txtInitials" required="" autocomplete="off" runat="server" class="form-control" placeholder="Your Initials" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
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
        </div>
    <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-warning" OnClick="BtnSubmit_Click" Style="margin-left: 50%; text-align: center; Width: 200px;" Text="Submit" />
</body>
    
</asp:Content>

