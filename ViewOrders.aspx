<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="ViewOrders" %>

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
    <link href="StyleSheet.css" rel="stylesheet" />
    <link href="css/bootstrapValidator.min.css" rel="stylesheet" />

            <div class="container2" style="width:1000px">
                
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
                                        <asp:LinkButton ID="AddOrder" runat="server" OnClick="AddNew_Click" CssClass="btn add-new" Width="95px"><i class="fa fa-plus-circle"></i>&nbsp;Add New</asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                            <div class="panel-body table-responsive">
                                <table class="table table-hover">
                                    <tbody>
                                        <asp:GridView ID="GridViewOrders" ShowHeaderWhenEmpty="True" BorderColor="Aqua" runat="server" Height="450px" Width="940px" AutoGenerateColumns="false" align="center" AllowPaging="true" OnPreRender="GridViewOrders_PreRender" PageSize="15" OnPageIndexChanging="OnPageIndexChanging" Style="text-align: center">
                                            <Columns>
                                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                                <asp:BoundField DataField="Patient_Name" HeaderText="Patient Name" />
                                                <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                                <asp:BoundField DataField="OrderDescription" HeaderText="Order Description" />
                                                <asp:BoundField DataField="OD" HeaderText="OD" />
                                                <asp:BoundField DataField="OS" HeaderText="OS" />
                                                <asp:BoundField DataField="OS" HeaderText="OS" />
                                                <asp:BoundField DataField="CCNumber" HeaderText="CCNumber" />
                                                <asp:BoundField DataField="Expiration" HeaderText="Expiration" />
                                                <asp:BoundField DataField="CVC" HeaderText="CVC" />
                                                <asp:BoundField DataField="HomeOffice" HeaderText="HomeOffice" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                                <asp:BoundField DataField="OrderFrom" HeaderText="OrderFrom" />
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
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </div>
    </body>
    </html>

</asp:Content>

