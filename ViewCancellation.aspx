<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCancellation.aspx.cs" Inherits="ViewCancellation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <link href="css/fontawesome.min.css" rel="stylesheet" />


    <style type="text/css">
        .demo {
            background-color: #e7e7e7;
            font-family: 'Raleway', sans-serif;
        }

        .panel {
            padding: 0;
            border-radius: 20px;
            border: none;
        }

            .panel .panel-heading {
                background: #2c96d3;
                padding: 15px;
                border-radius: 20px 20px 0 0;
                margin: 0;
            }

                .panel .panel-heading .title {
                    color: #fff;
                    font-size: 28px;
                    font-weight: 600;
                    line-height: 39px;
                    text-transform: capitalize;
                    margin: 0;
                }

                .panel .panel-heading .add-new {
                    color: #333;
                    background-color: #fff;
                    font-size: 14px;
                    font-weight: 600;
                    padding: 10px 12px 8px;
                    border-radius: 5px;
                    transition: all 0.3s ease 0s;
                }

                    .panel .panel-heading .add-new:hover,
                    .panel .panel-heading .add-new:focus {
                        color: #fff;
                        background-color: #333;
                    }

                .panel .panel-heading .btn_group {
                    background-color: #fff;
                    display: inline-block;
                    padding: 4px 10px;
                    border-radius: 5px;
                }

                    .panel .panel-heading .btn_group .btn {
                        padding: 5px 10px;
                    }

            .panel .panel-body {
                padding: 0;
            }

                .panel .panel-body .table thead tr th {
                    font-size: 17px;
                    font-weight: 600;
                    padding: 12px;
                }

                .panel .panel-body .table tbody tr td {
                    color: #555;
                    font-size: 15px;
                    padding: 10px 12px;
                    vertical-align: middle;
                }

                .panel .panel-body .table .user_icon {
                    width: 50px;
                    height: 50px;
                    margin: 0 5px 0 0;
                    border-radius: 10px;
                    overflow: hidden;
                }

                    .panel .panel-body .table .user_icon img {
                        width: 100%;
                        height: auto;
                    }

                .panel .panel-body .table tbody .status {
                    padding-left: 12px;
                    position: relative;
                }

                    .panel .panel-body .table tbody .status:before {
                        content: "";
                        background: #28a745;
                        width: 8px;
                        height: 8px;
                        border-radius: 50%;
                        position: absolute;
                        top: 5px;
                        left: 0;
                    }

                    .panel .panel-body .table tbody .status.block:before {
                        background: #dc3545;
                    }

                .panel .panel-body .table tbody .action-list {
                    padding: 0;
                    margin: 0;
                    list-style: none;
                }

                    .panel .panel-body .table tbody .action-list li {
                        display: inline-block;
                    }

                        .panel .panel-body .table tbody .action-list li a {
                            color: #fff;
                            font-size: 14px;
                            transition: all 0.3s ease 0s;
                        }

                            .panel .panel-body .table tbody .action-list li button:hover,
                            .panel .panel-body .table tbody .action-list li a:hover {
                                text-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
                                box-shadow: 0 0 5px rgba(0,0,0,0.3);
                            }

            .panel .panel-footer {
                background-color: transparent;
                text-align: center;
                padding: 15px;
                border: none;
            }

        .pagination {
            margin: 0;
        }

            .pagination li a {
                color: #999;
                background-color: #e7e7e7;
                font-size: 15px;
                font-weight: 600;
                margin: 0 2px;
                border: none;
                transition: all 0.3s ease 0s;
            }

                .pagination li a:hover,
                .pagination li a:focus,
                .pagination li.active a {
                    color: #fff;
                    background-color: #2C96D3;
                }

        @media only screen and (max-width:767px) {
            .panel .panel-heading .title {
                text-align: center;
                margin: 0 0 10px;
            }

            .panel .panel-heading .text-right {
                text-align: center;
            }
        }
    </style>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
        <div>
            <br />
            <br />
            <br />

            <div class="container">
                <div class="row">
                    <div class="col-md-offset-1 col-md-15">
                        <div class="panel">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-sm-5 col-xs-12">
                                        <h4 class="title">View <span>Cancellations</span></h4>
                                        <table class="style1">
                                            <tr>
                                                <td class="auto-style4" style="color: #fff; font-size: large;">Search&nbsp; </td>
                                                <td class="auto-style4">
                                                    <asp:TextBox ID="TextBox1" runat="server" Width="216px"></asp:TextBox>
                                                </td>
                                                <td class="auto-style4">

                                                    <asp:Button ID="Button1" class="btn add-new" runat="server" Text="Search" Font-Bold="true" OnClick="Button1_Click" Width="76px" />
                                                </td>
                                            </tr>

                                        </table>
                                    </div>
                                    <div class="col-sm-7 col-xs-10 text-right">
                                        <div class="btn_group">
                                            <asp:LinkButton ID="lnkPrint" runat="server" ToolTip="Click to Print All Records" OnClientClick="lnkPrint_Click" CssClass="btn add-new" Width="95px"><i class="fa fa-print"></i>&nbsp;Print</asp:LinkButton>


                                        </div>
                                        <asp:LinkButton ID="AddCancellation" runat="server" OnClick="Button1_Click2" CssClass="btn add-new" Width="95px"><i class="fa fa-plus-circle"></i>&nbsp;Add New</asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                            <div class="panel-body table-responsive">
                                <table class="table table-hover">
                                    <tbody>
                                        <asp:GridView ID="GridViewCancellation" ShowHeaderWhenEmpty="True" BorderColor="Aqua" runat="server" Height="450px" Width="900px" AutoGenerateColumns="false" align="center" AllowPaging="true" OnPreRender="GridViewCancellation_PreRender" PageSize="15" OnPageIndexChanging="OnPageIndexChanging" Style="text-align: center">
                                            <Columns>
                                                <asp:BoundField DataField="Appt_Date" HeaderText="Date" />
                                                <asp:BoundField DataField="Patient_Name" HeaderText="Patient Name" />
                                                <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                                <asp:BoundField DataField="CLS_Try" HeaderText="Appointment Date" />
                                                <asp:BoundField DataField="FU_Date" HeaderText="New Date" />
                                                <asp:BoundField DataField="Initials" HeaderText="Initials" />
                                            </Columns>
                                            <EmptyDataTemplate>No Records Available</EmptyDataTemplate>
                                        </asp:GridView>
                                    </tbody>
                                </table>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <ul class="pagination hidden-xs">
                                            <li><a href="#">Prev</a></li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#">Next</a></li>
                                        </ul>
                                        <br />
                                        <br />
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Label ID="Label2" runat="server" class="panel-footer" Text="Label"></asp:Label>
        </div>
    </body>
    </html>
</asp:Content>

