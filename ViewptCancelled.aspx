﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewptCancelled.aspx.cs" Inherits="ViewptCancelled" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                        <h4 class="title">View Cancellations <span> List</span></h4>
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
                                            <asp:LinkButton ID="btnPrint" runat="server" OnClientClick="PrintPage()" CssClass="btn add-new" Width="95px"><i class="fa fa-print"></i>&nbsp;Print</asp:LinkButton>
                                            
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
                                        <asp:GridView ID="GridViewptCancelled" runat="server"  CssClass="table table-responsive" BorderColor="Aqua"
                                            align="center" AllowSorting="true" AllowPaging="true" OnPreRender="GridViewptCancelled_PreRender"
                                            PageSize="15" Style="text-align:center" ShowHeaderWhenEmpty="True" OnPageIndexChanging="OnPageIndexChanging"
                                            OnSelectedIndexChanged="GridViewptCancelled_SelectedIndexChanged" AutoGenerateColumns="False"
                                            DataKeyNames="ID" OnSorting="GridViewptCancelled_Sorting" OnRowDataBound="GridViewptCancelled_RowDataBound" EmptyDataText="There are no data records to display.">
                                            <Columns>
                                                <asp:BoundField DataField="Date" HeaderText="Date" HeaderStyle-HorizontalAlign="Center" SortExpression="Date"/>
                                                <asp:BoundField DataField="PatientName" HeaderText="Patient Name" SortExpression="PatientName"/>
                                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber"/>
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>
                                                <asp:BoundField DataField="ReasonForCancel" HeaderText="Cancellation Reason" SortExpression="ReasonForCancel"/>
                                                <asp:BoundField DataField="ServType" HeaderText="Service Type" SortExpression="ServType"/>
                                                <asp:BoundField DataField="NewDate" HeaderText="New Date" SortExpression="NewDate"/>
                                                <asp:BoundField DataField="Initials" HeaderText="Initials" SortExpression="Initials"/>
                                                <asp:ButtonField CommandName="Select" Text="Select" ControlStyle-CssClass="btn btn-info" ControlStyle-BorderColor="YellowGreen" />
                                            </Columns>
                                        </asp:GridView>

                                        <asp:DetailsView ID="dvCan" CssClass="table table-curved" runat="server" AutoGenerateRows="False"
                                            DataKeyNames="ID" OnItemDeleting="dvCan_ItemDeleting"
                                            OnItemUpdating="dvCan_ItemUpdating" OnModeChanging="dvCan_ModeChanging">
                                            <Fields>
                                                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editDate" runat="server" Text='<%# Bind("Date") %>' type="date" class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="DateLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("Date")).ToString("MM/dd/yyyy") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Patient Name" SortExpression="Patient_Name">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editPatientName" runat="server" Text='<%# Bind("PatientName") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="PatientNameLabel" runat="server" Text='<%# Bind("PatientName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Phone Number" SortExpression="Phone_Number">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
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
                                                <asp:TemplateField HeaderText="Cancellation Reason" SortExpression="Appt_Date">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editReasonForCancel" runat="server" Text='<%# Bind("ReasonForCancel") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="ReasonForCancelLabel" runat="server" Text='<%# Bind("ReasonForCancel") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Service Type" SortExpression="Status">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="editServType" Text='<%# Bind("ServType") %>' runat="server" class="form-control">
                                                            <asp:ListItem></asp:ListItem>
                                                            <asp:ListItem>Routine Exam</asp:ListItem>
                                                            <asp:ListItem>Medical</asp:ListItem>
                                                            <asp:ListItem>Iwellness/VF</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="ServTypeLabel" runat="server" Text='<%# Bind("ServType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="New Date" SortExpression="New_Date">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="editNewDate" runat="server" Type="date" Text='<%# Bind("NewDate") %>' class="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="NewDateLabel" runat="server" Text='<%# (String.IsNullOrEmpty(Eval("NewDate").ToString())) ? "&nbsp" : Convert.ToDateTime(Eval("NewDate")).ToString("MM/dd/yyyy") %>'></asp:Label>
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

