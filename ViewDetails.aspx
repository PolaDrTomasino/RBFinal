<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <h4 class="form-signin-heading">Info</h4>
    <div class="form-group">
        <div class="col-xs-7 col-sm-7">
            <asp:TextBox runat="server" placeholder="Garage Name" CssClass="form-control username" ID="txtAddress"></asp:TextBox>
        </div>
        <div class="col-xs-7 col-sm-5">
            <span class="help-inline pull-left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtAddress"
                    ErrorMessage="Address is a required field."
                    ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </span>
        </div>
    </div>
    <br />
    <br />

    <div class="form-group">
        <div class="col-xs-7 col-sm-7">
            <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-lg btn-primary btn-block" />
        </div>
    </div>
</div>
</asp:Content>

