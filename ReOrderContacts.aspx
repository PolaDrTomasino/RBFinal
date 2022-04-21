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
        <div class="container-ins">

            <h3>
                <asp:Label ID="Label1" runat="server" Text="Order Contact Lenses Requests" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: left; margin-left: 150px" Width="575px" Font-Bold="False" ForeColor="Blue"></asp:Label></h3>
            <br />
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Creation Date:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtDate" required="" class="form-control" type="date" placeholder="Enter Date" runat="server" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px" Visible="True"></asp:TextBox>
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
                            <asp:TextBox ID="txtPatient_Name" required="" class="form-control" placeholder="Enter Patient Name" runat="server" Width="244px"></asp:TextBox>
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
                    <label class="col-md-3 control-label">Supply Amount:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-plus" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="txtSupAmt" runat="server" class="form-control" Width="245px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>1 Month</asp:ListItem>
                                <asp:ListItem>3 Months</asp:ListItem>
                                <asp:ListItem>6 Months</asp:ListItem>
                                <asp:ListItem>1 Year</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Patient comments:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info-circle"></i></span>
                            <asp:TextBox ID="txtOrderDescription" required="" class="form-control" placeholder="Enter Order Description" TextMode="MultiLine" runat="server" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Card Holder Name:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <asp:TextBox ID="txtCCName" required="" class="form-control" placeholder="Enter Card Holder Name" runat="server" Width="245px"></asp:TextBox>
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
                            <asp:TextBox ID="txt_Expiration" class="form-control" type="month"  placeholder="MM/YYYY" runat="server" Width="150px"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <asp:TextBox ID="txtCVC" class="form-control" placeholder="CVC" runat="server" Width="60px" CausesValidation="True" AutoCompleteType="None"></asp:TextBox>
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
                            <asp:DropDownList ID="txtHomeOffice" runat="server" class="form-control" Width="245px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Home</asp:ListItem>
                                <asp:ListItem>Office</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Ordered?</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-shopping-cart"></i></span>
                            <asp:DropDownList ID="txtIsOrdered" runat="server" class="form-control" Width="245px">
                                <asp:ListItem>Not Ordered Yet</asp:ListItem>
                                <asp:ListItem>In ABB's Cart</asp:ListItem>
                                <asp:ListItem>Ordered Through Marlo</asp:ListItem>
                                <asp:ListItem>Ordered Through ABB</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Patient Charged?</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-plus" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="txtCharged" runat="server" class="form-control" Width="67px">
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                            <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                            <asp:TextBox ID="txtChargeAmt" class="form-control"  placeholder="Amount" runat="server" Width="75px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Insurance Billed?</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-plus" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="txtIsInsBil" runat="server" class="form-control" Width="67px">
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>N/A</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                            <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                            <asp:TextBox ID="txtAmount" class="form-control"  placeholder="Amount" runat="server" Width="75px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Rebate Sent?</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-plus" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="txtRebate" runat="server" class="form-control" Width="67px">
                                <asp:ListItem>N/A</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
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
                            <asp:DropDownList ID="txtStatus" runat="server" class="form-control" Width="245px">
                                <asp:ListItem>Processing</asp:ListItem>
                                <asp:ListItem>Done (Closed)</asp:ListItem>
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
                            <asp:TextBox ID="txtInitials" required="" runat="server" class="form-control" placeholder="Initials" Style="margin-bottom: 0px; margin-left: 0px;" Width="90px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-warning" OnClick="BtnSubmit_Click" Style="margin-left: 200px; text-align: center; Width: 200px;" Text="Submit" />
            <br />
            <br />

        </div>
    </body>
</asp:Content>

