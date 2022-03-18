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
          'Order Updated Successfully!',
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
                                            <asp:LinkButton ID="btnprint" runat="server" OnClientClick="PrintPage()" CssClass="btn add-new" Width="95px"><i class="fa fa-print"></i>&nbsp;Print</asp:LinkButton>
                                        </div>
                                        <asp:LinkButton ID="AddRx" runat="server" OnClick="AddRx_Click" CssClass="btn add-new" Width="95px"><i class="fa fa-plus-circle"></i>&nbsp;Add New</asp:LinkButton>
                                        <asp:LinkButton ID="Archive" runat="server" OnClick="Archive_Click" CssClass="btn add-new" Width="160px"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp;Archived Records</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel-body table-responsive">
                                <table class="table table-hover" width="70%" id="pnlGridView" runat="server" align="center">
                                    <tr>
                                        <td colspan="2">
                                        <asp:GridView ID="GridViewPB" runat="server"  CssClass="table table-responsive" BorderColor="Aqua"
                                            align="center" AllowPaging="true" OnPreRender="GridViewPB_PreRender"
                                            PageSize="15" Style="text-align:center" ShowHeaderWhenEmpty="True" OnPageIndexChanging="OnPageIndexChanging"
                                            OnSelectedIndexChanged="GridViewPB_SelectedIndexChanged" AutoGenerateColumns="False"
                                            DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                            <Columns>
                                                <asp:BoundField DataField="MSGFor" HeaderText="Message/Call For" />
                                                <asp:BoundField DataField="Caller_Name" HeaderText="Caller Name" />
                                                <asp:BoundField DataField="DateTime" HeaderText="Date/Time" />
                                                <asp:BoundField DataField="Caller_Number" HeaderText="Caller Number" />
                                                <asp:BoundField DataField="Message" HeaderText="Message Content" />
                                                <asp:BoundField DataField="Action" HeaderText="Action" />
                                                <asp:BoundField DataField="Initials" HeaderText="Initials" />
                                                <asp:ButtonField CommandName="Select" Text="Select" ControlStyle-CssClass="btn btn-info" ControlStyle-BorderColor="YellowGreen" />
                                            </Columns>
                                        </asp:GridView>

                                        <asp:DetailsView ID="dvPB" CssClass="table table-curved" runat="server" AutoGenerateRows="False"
                                            DataKeyNames="ID" OnItemDeleting="dvPB_ItemDeleting"
                                            OnItemUpdating="dvPB_ItemUpdating" OnModeChanging="dvPB_ModeChanging">
                                            <Fields>
                                                <asp:TemplateField HeaderText="Message For:" SortExpression="MSGFor">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="editMSGFor" runat="server" Text='<%# Eval("MSGFor") %>' class="form-control" Width="245px">
                                                            <asp:ListItem>Dr T.</asp:ListItem>
                                                            <asp:ListItem>Mary Alan</asp:ListItem>
                                                            <asp:ListItem>Jennifer</asp:ListItem>
                                                            <asp:ListItem>Pola</asp:ListItem>
                                                            <asp:ListItem>Rachel</asp:ListItem>
                                                            <asp:ListItem>Alexis</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="MSGForLabel" runat="server" Text='<%# Eval("MSGFor") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Caller Name:" SortExpression="Caller_Name">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editCaller_Name" runat="server" Text='<%# Bind("Caller_Name") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Caller_NameLabel" runat="server" Text='<%# Bind("Caller_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date/Time:" SortExpression="DateTime">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editDateTime" type="datetime-local" runat="server" Text='<%# Bind("DateTime") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="DateTimeLabel" runat="server" Text='<%# Bind("DateTime") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Caller Number:" SortExpression="Caller_Number">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editCaller_Number" runat="server" Text='<%# Bind("Caller_Number") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Caller_NumberLabel" runat="server" Text='<%# Bind("Caller_Number") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Message:" SortExpression="Message">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editMessage" runat="server" Text='<%# Bind("Message") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="MessageLabel" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action:" SortExpression="Action">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="editAction" runat="server" Text='<%# Bind("Action") %>' class="form-control" Width="245px">
                                                            <asp:ListItem></asp:ListItem>
                                                            <asp:ListItem>Telephoned</asp:ListItem>
                                                            <asp:ListItem>Returned Your Call</asp:ListItem>
                                                            <asp:ListItem>Please Call</asp:ListItem>
                                                            <asp:ListItem>Will Call Again</asp:ListItem>
                                                            <asp:ListItem>Came To See You</asp:ListItem>
                                                            <asp:ListItem>Wants To See You</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="ActionLabel" runat="server" Text='<%# Bind("Action") %>'></asp:Label>
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
                                                <asp:TemplateField HeaderText="Initials:" SortExpression="Initials">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editInitials" runat="server" Text='<%# Bind("Initials") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="InitialsLabel" runat="server" Text='<%# Bind("Initials") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="true" ShowCancelButton="true" ShowDeleteButton="true">
                                                    <ControlStyle CssClass="btn btn-info" />
                                                </asp:CommandField>
                                            </Fields>
                                        </asp:DetailsView>
                                            <asp:Label ID="Label2" runat="server" class="panel-footer" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>                              
                    </div>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>

