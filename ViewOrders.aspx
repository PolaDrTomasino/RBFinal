<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!DOCTYPE html>
    <link href="css/fontawesome.min.css" rel="stylesheet" />
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
  'Record Deleted Successfully',
  'Yeaaaaay!',
  'success'
)
        }
    </script>

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
            <style>
                .container2 {
                    margin-top: -40px;
                }
            </style>
            <script src="https://code.jquery.com/jquery-1.8.3.js" type="text/javascript"></script>
            <script src="js/jquery-ui-1.10.4/jquery-1.10.2.js" type="text/javascript"></script>
            <script src="js/jquery-ui.js" type="text/javascript"></script>

            <div class="container2">
                <div class="row">
                    <div class="col-md-offset-1 col-md-15">
                        <div class="panel">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-sm-5 col-xs-12">
                                        <h4 class="title">View <span>Patients Order</span></h4>
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
                                            <asp:LinkButton ID="btnprint" runat="server" CssClass="btn add-new" Width="95px"><i class="fa fa-print"></i>&nbsp;Print</asp:LinkButton>

                                        </div>
                                        <asp:LinkButton ID="AddOrder" runat="server" OnClick="AddNew_Click" CssClass="btn add-new" Width="95px"><i class="fa fa-plus-circle"></i>&nbsp;Add New</asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                            <div class="panel-body table-responsive">
                                <table class="table table-hover">
                                    <tbody>

                                        <asp:Label ID="Label2" runat="server" Text="Label" CssClass="alert alert-danger" Font-Size="Larger"></asp:Label>
                                        <asp:GridView ID="GridViewOrders" runat="server" Height="400px" BorderColor="Aqua"
                                            Width="940px" align="center" AllowPaging="true" OnPreRender="GridViewOrders_PreRender"
                                            PageSize="15" Style="text-align: center" ShowHeaderWhenEmpty="True"
                                            OnSelectedIndexChanged="GridViewOrders_SelectedIndexChanged" AutoGenerateColumns="False"
                                            DataKeyNames="OrderID">
                                            <Columns>
                                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                                <asp:BoundField DataField="Patient_Name" HeaderText="Patient_Name" SortExpression="Patient_Name" />
                                                <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                <asp:BoundField DataField="Initials" HeaderText="Initials" SortExpression="Initials" />
                                                <asp:ButtonField CommandName="Select" Text="Select" ControlStyle-CssClass="btn btn-info" ControlStyle-BorderColor="YellowGreen" />
                                            </Columns>
                                        </asp:GridView>


                                        <asp:DetailsView ID="DetailsView1" CssClass="table table-curved" runat="server" AutoGenerateRows="False" 
                                             DataKeyNames="OrderID" OnItemDeleting="DetailsView1_ItemDeleting"
                                            OnItemUpdating="DetailsView1_ItemUpdating" OnModeChanging="DetailsView1_ModeChanging">
                                            <Fields>
                                                <asp:CommandField ShowEditButton="true" ShowCancelButton="true" ShowDeleteButton="true">
                                                    <ControlStyle  CssClass="btn btn-info" />
                                                </asp:CommandField>
                                                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editDate" runat="server" Text='<%# Bind("Date") %>' type="date" class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Patient Name" SortExpression="Patient_Name">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editPatient_Name" runat="server" Text='<%# Bind("Patient_Name") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Patient_NameLabel" runat="server" Text='<%# Bind("Patient_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Phone Number" SortExpression="Phone_Number">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editPhone_Number" runat="server" Text='<%# Bind("Phone_Number") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Phone_NumberLabel" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editEmail" runat="server" Text='<%# Bind("Email") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Order Description" SortExpression="OrderDescription">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editOrderDescription" runat="server" Text='<%# Bind("OrderDescription") %>' TextMode="MultiLine" class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="OrderDescriptionLabel" runat="server" Text='<%# Bind("OrderDescription") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="OD" SortExpression="OD">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editOD" runat="server" Text='<%# Bind("OD") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="ODLabel" runat="server" Text='<%# Bind("OD") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="OS" SortExpression="OS">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editOS" runat="server" Text='<%# Bind("OS") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="OSLabel" runat="server" Text='<%# Bind("OS") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CC Number" SortExpression="CCNumber">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editCCNumber" runat="server" Text='<%# Bind("CCNumber") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="CCNumberLabel" runat="server" Text='<%# Bind("CCNumber") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Expiration" SortExpression="Expiration">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editExpiration" runat="server" type="month" Text='<%# Bind("Expiration") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="ExpirationLabel" runat="server" Text='<%# Bind("Expiration") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CVC" SortExpression="CVC">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editCVC" runat="server" Text='<%# Bind("CVC") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="CVCLabel" runat="server" Text='<%# Bind("CVC") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Home/Office" SortExpression="HomeOffice">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editHomeOffice" runat="server" Text='<%# Bind("HomeOffice") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="HomeOfficeLabel" runat="server" Text='<%# Bind("HomeOffice") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editStatus" runat="server" Text='<%# Bind("Status") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Order From" SortExpression="OrderFrom">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editOrderFrom" runat="server" Text='<%# Bind("OrderFrom") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="OrderFromLabel" runat="server" Text='<%# Bind("OrderFrom") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Initials" SortExpression="Initials">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editInitials" runat="server" Text='<%# Bind("Initials") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="InitialsLabel" runat="server" Text='<%# Bind("Initials") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                            </Fields>
                                        </asp:DetailsView>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    </html>

</asp:Content>

