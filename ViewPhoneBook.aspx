<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPhoneBook.aspx.cs" Inherits="ViewRx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
    <link href="css/fontawesome.min.css" rel="stylesheet" />

    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
        <div>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/fontawesome.min.css" rel="stylesheet" />
    <link href="css/fontAwesome.css" rel="stylesheet" />
    <%--theme--%>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/templatemo-style.css" rel="stylesheet" />   
    <link href="css/owl-carousel.css" rel="stylesheet" />
    <link href="css/light-box.css" rel="stylesheet" />

    <link href="css/bootstrapValidator.min.css" rel="stylesheet" />

            <div class="container2">
                <div class="row">
                    <div class="col-md-offset-1 col-md-15">
                        <div class="panel">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-sm-5 col-xs-12">
                                        <h4 class="title">View <span>Phone Calls</span></h4>
                                        <table class="style1">
                                            <tr>
                                                <td class="auto-style4" style="color: #fff; font-size: large;">Search&nbsp; </td>
                                                <td class="auto-style4">
                                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Enter a keyword" Width="216px"></asp:TextBox>
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
                                        <asp:LinkButton ID="AddRx" runat="server" OnClick="AddRx_Click" CssClass="btn add-new" Width="95px"><i class="fa fa-plus-circle"></i>&nbsp;Add New</asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                            <div class="panel-body table-responsive">
                                <table class="table table-hover">
                                    <tbody>
                                        <asp:GridView ID="GridViewPB" ShowHeaderWhenEmpty="True" BorderColor="Aqua" runat="server" Height="450px" Width="900px" AutoGenerateColumns="false" align="center" AllowPaging="true" OnPreRender="GridViewPB_PreRender" PageSize="15" OnPageIndexChanging="OnPageIndexChanging" Style="text-align: center">
                                            <Columns>
                                                <asp:BoundField DataField="For" HeaderText="Message/Call For" />
                                                <asp:BoundField DataField="Caller_Name" HeaderText="Caller Name" />
                                                <asp:BoundField DataField="DateTime" HeaderText="Date/Time" />
                                                <asp:BoundField DataField="Caller_Number" HeaderText="Caller Number" />
                                                <asp:BoundField DataField="Message" HeaderText="Message Content" />
                                                <asp:BoundField DataField="Action" HeaderText="Action" />
                                                <asp:BoundField DataField="Initials" HeaderText="Initials" />
                                            </Columns>
                                            <EmptyDataTemplate>No Records Available</EmptyDataTemplate>
                                        </asp:GridView>
                                    </tbody>
                                </table>
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

