﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewRecReq.aspx.cs" Inherits="ViewRecReq" %>

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
                                        <h4 class="title">View <span>Receipt Requests</span></h4>
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
                                        <asp:LinkButton ID="AddReq" runat="server" OnClick="Button1_Click2" CssClass="btn add-new" Width="95px"><i class="fa fa-plus-circle"></i>&nbsp;Add New</asp:LinkButton>
                                        <asp:LinkButton ID="Archive" runat="server" OnClick="Archive_Click" CssClass="btn add-new" Width="160px"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp;Archived Records</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel-body table-responsive">
                                <table class="table table-hover" width="70%" id="pnlGridView" runat="server" align="center">
                                    <tr>
                                        <td colspan="2">
                                        <asp:GridView ID="GridViewRecReq" runat="server"  CssClass="table table-responsive" BorderColor="Aqua"
                                            align="center" AllowSorting="true" AllowPaging="true" OnPreRender="GridViewRecReq_PreRender"
                                            PageSize="15" Style="text-align:center" ShowHeaderWhenEmpty="True" OnPageIndexChanging="OnPageIndexChanging"
                                            OnSelectedIndexChanged="GridViewRecReq_SelectedIndexChanged" OnSorting="GridViewRecReq_Sorting" OnRowDataBound="GridViewRecReq_RowDataBound" AutoGenerateColumns="False"
                                            DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                                            <Columns>
                                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                                <asp:BoundField DataField="Patient_Name" HeaderText="Patient Name" SortExpression="Patient_Name"/>
                                                <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" SortExpression="Phone_Number"/>
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>
                                                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes"/>
                                                <asp:BoundField DataField="Receiving_Via" HeaderText="Receiving Via" SortExpression="Receiving_Via"/>
                                                <asp:BoundField DataField="Date_Done" HeaderText="Date Done" SortExpression="Date_Done"/>
                                                <asp:BoundField DataField="Initials" HeaderText="Initials" SortExpression="Initials"/>
                                                <asp:ButtonField CommandName="Select" Text="Select" ControlStyle-CssClass="btn btn-info" ControlStyle-BorderColor="YellowGreen" />
                                            </Columns>
                                        </asp:GridView>

                                        <asp:DetailsView ID="dvRecReQ" CssClass="table table-curved" runat="server" AutoGenerateRows="False"
                                            DataKeyNames="ID" OnItemDeleting="dvRecReQ_ItemDeleting"
                                            OnItemUpdating="dvRecReQ_ItemUpdating" OnModeChanging="dvRecReQ_ModeChanging">
                                            <Fields>
                                                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editDate" runat="server" Text='<%# Bind("Date") %>' type="date" class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="DateLabel" runat="server" Text='<%# (String.IsNullOrEmpty(Eval("Date").ToString())) ? "&nbsp" : Convert.ToDateTime(Eval("Date")).ToString("MM/dd/yyyy") %>'></asp:Label>
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
                                                <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editNotes" runat="server" Text='<%# Bind("Notes") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Receiving Via" SortExpression="Receiving_Via">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="editReceiving_Via" runat="server" Text='<%# Bind("Receiving_Via") %>' class="form-control" Width="245px">
                                                            <asp:ListItem></asp:ListItem>
                                                            <asp:ListItem>Office Pick-Up</asp:ListItem>
                                                            <asp:ListItem>By Email</asp:ListItem>
                                                            <asp:ListItem>Mail To Home</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Receiving_ViaLabel" runat="server" Text='<%# Bind("Receiving_Via") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date Done" SortExpression="Date_Done">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editDate_Done" runat="server" Type="date" Text='<%# Bind("Date_Done") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Date_DoneLabel" runat="server" Text='<%# (String.IsNullOrEmpty(Eval("Date_Done").ToString())) ? "&nbsp" : Convert.ToDateTime(Eval("Date_Done")).ToString("MM/dd/yyyy") %>'></asp:Label>
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
                                            <asp:Label ID="Label2" runat="server" class="panel-footer" Text="Label"></asp:Label>
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

