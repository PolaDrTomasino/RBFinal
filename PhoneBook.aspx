﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PhoneBook.aspx.cs" Inherits="PhoneBook" %>

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
    <%--bootstrap js--%>
    <script src="js/vendor/bootstrap.min.js"></script>
    <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <script src="js/vendor/bootstrapValidator.min.js"></script>
    <script src="js/vendor/bootstrap.min.js"></script>
        
        <script src="popup.js" type="text/javascript"></script>
        <script>
            function alert() {
                Swal.fire(
      'Phone Call Recorded Successfully',
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
                <asp:Label ID="Label1" runat="server" Text="PhoneBook" BorderStyle="None" CssClass="fa fa-fontawesome" Style="font-weight: 700; text-align: left; margin-left: 150px" Width="575px" Font-Bold="False" ForeColor="Blue"></asp:Label>
            </h3>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">For:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:DropDownList ID="txtMSGFor" runat="server" class="form-control" Width="245px">
                                <asp:ListItem Text="Dr T." Value="susan@drtomasino.com"></asp:ListItem>
                                <asp:ListItem Text="Pola" Value="pola@drtomasino.com"></asp:ListItem>
                                <asp:ListItem Text="Melissa" Value="Melissa@drtomasino.com"></asp:ListItem>
                                <asp:ListItem Text="Mariana" Value="Mariana@drtomasino.com"></asp:ListItem>
                                <asp:ListItem Text="Marie" Value="marie@drtomasino.com"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Caller Name</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <asp:TextBox ID="txtCaller_Name" required="" runat="server" autocomplete="off" class="form-control" placeholder="Enter Caller's Name" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Date/Time:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o"></i></span>
                            <asp:TextBox ID="txtDateTime" required="" type="datetime-local" runat="server" class="form-control" placeholder="Enter Date/Time" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Caller Phone Number:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                            <asp:TextBox ID="txtCaller_Number" required="" autocomplete="off" runat="server" class="form-control" placeholder="Enter Phone Number" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Message:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<asp:TextBox ID="txtMessage" required="" class="form-control" autocomplete="off" placeholder="Enter Message Content" TextMode="MultiLine" runat="server" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label class="col-md-3 control-label">Action Needed:</label>
                    <div class="col-md-6 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-bookmark" aria-hidden="true"></i></span>
							<asp:DropDownList ID="txtAction" runat="server" class="form-control" Width="245px">
                            <asp:ListItem>Telephoned</asp:ListItem>
                            <asp:ListItem>Returned Your Call</asp:ListItem>
                            <asp:ListItem>Please Call</asp:ListItem>
                            <asp:ListItem>Will Call Again</asp:ListItem>
                            <asp:ListItem>Came To See You</asp:ListItem>
                            <asp:ListItem>Wants To See You</asp:ListItem>
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
                            <asp:TextBox ID="txtInitials" required="" autocomplete="off" runat="server" class="form-control" placeholder="Your Initials" Style="margin-bottom: 0px; margin-left: 0px;" Width="245px"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-warning" OnClick="BtnSubmit_Click" Style="margin-left:50%; text-align: center; Width: 200px; " Text="Submit" />
    </body>
</asp:Content>

