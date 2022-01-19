<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


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
        </div>
        <div class="container2" style="width: 1000px">
            <ul>
                    
                    <li>
                        <asp:Button ID="ViewCan" runat="server" CssClass="btn btn-success" OnClick="CanViewer_Click" style="text-align: center; margin-left: 55px; font-weight: 700; font-size: large;" Text="View Cancellations" Width="400px" />
                    </li>
                    <li>
                        <asp:Button ID="ViewCLS" runat="server" OnClick="Button1_Click2" Style="text-align: center; margin-left: 55px; font-weight: 700; font-size: large;" Text="View CLS Trials" Width="400px" />

                    </li>
                </ul>
            
            

        </div>
    </body>
    </html>
</asp:Content>


