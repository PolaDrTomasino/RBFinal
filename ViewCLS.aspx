<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCLS.aspx.cs" Inherits="ViewCLS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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

            <script language="javascript" type="text/javascript">
                function PrintPage() {
                    var printContent = document.getElementById('<%= pnlGridView.ClientID %>');
                    var printWindow = window.open("All Records", "Print Panel", 'left=50000,top=50000,width=0,height=0');
                    printWindow.document.write(printContent.innerHTML);
                    printWindow.document.close();
                    printWindow.focus();
                    printWindow.print();
                }
                function update() {
                    Swal.fire(
          'Record Updated Successfully!',
          'Yeaaaaay!',
          'success'
        )
                }
            </script>

            <div class="container-view">
                <div class="row">
                    <div class="col-md-offset-1 col-md-15">
                        <div class="panel">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-sm-5 col-xs-12">
                                        <h4 class="title">View Contact<span> Lenses Trials</span></h4>
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
                                            <asp:LinkButton ID="btnprint" runat="server" OnClientClick="PrintPage()" CssClass="btn add-new" Width="95px"><i class="fa fa-print"></i>&nbsp;Print</asp:LinkButton>
                                        </div>
                                        <asp:LinkButton ID="AddCancellation" runat="server" OnClick="Button1_Click2" CssClass="btn add-new" Width="95px"><i class="fa fa-plus-circle"></i>&nbsp;Add New</asp:LinkButton>
                                        <asp:LinkButton ID="Archive" runat="server" OnClick="Archive_Click" CssClass="btn add-new" Width="160px"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp;Archived Records</asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-body table-responsive">
                                <table class="table table-hover" width="70%" id="pnlGridView" runat="server" align="center">
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="GridViewCLS" runat="server" CssClass="table table-responsive" BorderColor="Aqua"
                                                align="center" AllowSorting="true" AllowPaging="true" OnPreRender="GridViewCLS_PreRender"
                                                PageSize="15" Style="text-align: center" ShowHeaderWhenEmpty="True" OnPageIndexChanging="OnPageIndexChanging"
                                                OnSelectedIndexChanged="GridViewCLS_SelectedIndexChanged" OnRowDataBound="GridViewCLS_RowDataBound" OnSorting="GridViewCLS_Sorting" AutoGenerateColumns="False"
                                                DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                                <Columns>
                                                    <asp:BoundField DataField="Appt_Date" SortExpression="Appt_Date" HeaderText="Appointment Date" />
                                                    <asp:BoundField DataField="Patient_Name" SortExpression="Patient_Name" HeaderText="Patient Name" />
                                                    <asp:BoundField DataField="Phone_Number" SortExpression="Phone_Number" HeaderText="Phone Number" />
                                                    <asp:BoundField DataField="Email" SortExpression="Email" HeaderText="Email" />
                                                    <asp:BoundField DataField="CLS_Try" SortExpression="CLS_Try" HeaderText="CLS Under Trial" />
                                                    <asp:BoundField DataField="FU_Date" SortExpression="FU_Date" HeaderText="F/U Date" />
                                                    <asp:BoundField DataField="Initials" SortExpression="Initials" HeaderText="Initials" />
                                                    <asp:ButtonField CommandName="Select" Text="Select" ControlStyle-CssClass="btn btn-info" ControlStyle-BorderColor="YellowGreen" />
                                                </Columns>
                                            </asp:GridView>

                                            <asp:DetailsView ID="dvCLS" CssClass="table table-curved" runat="server" AutoGenerateRows="False"
                                                DataKeyNames="ID" OnItemDeleting="dvCLS_ItemDeleting"
                                                OnItemUpdating="dvCLS_ItemUpdating" OnModeChanging="dvCLS_ModeChanging">
                                                <Fields>
                                                    <asp:TemplateField HeaderText="Appointment Date" SortExpression="Appt_Date">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="editAppt_Date" runat="server" Text='<%# Bind("Appt_Date") %>' type="date" class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Appt_DateLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("Appt_Date")).ToString("MM/dd/yyyy") %>'></asp:Label>
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
                                                    <asp:TemplateField HeaderText="CLS Try" SortExpression="CLS_Try">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="editCLS_Try" runat="server" Text='<%# Bind("CLS_Try") %>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="CLS_TryLabel" runat="server" Text='<%# Bind("CLS_Try") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Follow Up Date" SortExpression="FU_Date">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="editFU_Date" runat="server" Type="date" Text='<%# Bind("FU_Date") %>' class="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="FU_DateLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("FU_Date")).ToString("MM/dd/yyyy") %>'></asp:Label>
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
                                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="editStatus" Text='<%# Bind("Status") %>' runat="server" class="form-control">
                                                            <asp:ListItem>Processing</asp:ListItem>
                                                            <asp:ListItem>Done (Closed)</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                    <asp:CommandField ShowEditButton="true" ShowCancelButton="true" ShowDeleteButton="true">
                                                        <ControlStyle CssClass="btn btn-info" />
                                                    </asp:CommandField>
                                                </Fields>
                                            </asp:DetailsView>
                                            <asp:Label ID="Label2" runat="server" Text="Label" class="xd-message-content"></asp:Label>
                                        </td>
                                    </tr>
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

