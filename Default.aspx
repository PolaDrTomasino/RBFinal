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
            <script src="https://kit.fontawesome.com/607077bda6.js"></script>
        </div>
        <style>
            body {
                margin-top: 20px;
            }

            .container-def {
                height: 400px;
                width: 900px;
                margin-bottom: 30px;
            }
            .white-bg {
                background-color: #ffffff;
            }

            .page-heading {
                border-top: 0;
                padding: 0 10px 20px 10px;
            }

            .forum-post-container .media {
                margin: 10px 10px 10px 10px;
                padding: 20px 10px 20px 10px;
                border-bottom: 1px solid #f1f1f1;
            }

            .forum-avatar {
                float: left;
                margin-right: 20px;
                text-align: center;
                width: 110px;
            }

                .forum-avatar .img-circle {
                    height: 48px;
                    width: 48px;
                }

            .author-info {
                color: #676a6c;
                font-size: 11px;
                margin-top: 5px;
                text-align: center;
            }

            .forum-post-info {
                padding: 9px 12px 6px 12px;
                background: #f9f9f9;
                border: 1px solid #f1f1f1;
            }

            .media-body > .media {
                background: #f9f9f9;
                border-radius: 3px;
                border: 1px solid #f1f1f1;
            }

            .forum-post-container .media-body .photos {
                margin: 10px 0;
            }

            .forum-photo {
                max-width: 140px;
                border-radius: 3px;
            }

            .media-body > .media .forum-avatar {
                width: 70px;
                margin-right: 10px;
            }

                .media-body > .media .forum-avatar .img-circle {
                    height: 38px;
                    width: 38px;
                }

            .mid-icon {
                font-size: 66px;
            }

            .forum-item {
                margin: 10px 0;
                padding: 10px 0 20px;
                border-bottom: 1px solid #f1f1f1;
            }

            .views-number {
                font-size: 24px;
                line-height: 18px;
                font-weight: 400;
            }

            .forum-container,
            .forum-post-container {
                padding: 30px !important;
            }

            .forum-item small {
                color: #999;
            }

            .forum-item .forum-sub-title {
                color: #999;
                margin-left: 50px;
            }

            .forum-title {
                margin: 15px 0 15px 0;
            }

            .forum-info {
                text-align: center;
            }

            .forum-desc {
                color: #999;
            }

            .forum-icon {
                float: left;
                width: 30px;
                margin-right: 20px;
                text-align: center;
            }

            a.forum-item-title {
                color: inherit;
                display: block;
                font-size: 18px;
                font-weight: 600;
            }

                a.forum-item-title:hover {
                    color: inherit;
                }

            .forum-icon .fa {
                font-size: 30px;
                margin-top: 8px;
                color: #9b9b9b;
            }

            .forum-item.active .fa {
                color: #1ab394;
            }

            .forum-item.active a.forum-item-title {
                color: #1ab394;
            }

            @media (max-width: 992px) {
                .forum-info {
                    margin: 15px 0 10px 0;
                    /* Comment this is you want to show forum info in small devices */
                    display: none;
                }

                .forum-desc {
                    float: none !important;
                }
            }

            .ibox {
                clear: both;
                margin-bottom: 25px;
                margin-top: 0;
                padding: 0;
            }

                .ibox.collapsed .ibox-content {
                    display: none;
                }

                .ibox.collapsed .fa.fa-chevron-up:before {
                    content: "\f078";
                }

                .ibox.collapsed .fa.fa-chevron-down:before {
                    content: "\f077";
                }

                .ibox:after,
                .ibox:before {
                    display: table;
                }

            .ibox-title {
                -moz-border-bottom-colors: none;
                -moz-border-left-colors: none;
                -moz-border-right-colors: none;
                -moz-border-top-colors: none;
                background-color: #ffffff;
                border-color: #e7eaec;
                border-image: none;
                border-style: solid solid none;
                border-width: 3px 0 0;
                color: inherit;
                margin-bottom: 0;
                padding: 14px 15px 7px;
                min-height: 48px;
            }

            .ibox-content {
                background-color: #ffffff;
                color: inherit;
                padding: 15px 20px 20px 20px;
                border-color: #e7eaec;
                border-image: none;
                border-style: solid solid none;
                border-width: 1px 0;
            }

            .ibox-footer {
                color: inherit;
                border-top: 1px solid #e7eaec;
                font-size: 90%;
                background: #ffffff;
                padding: 10px 15px;
            }

            .message-input {
                height: 90px !important;
            }

            .form-control, .single-line {
                background-color: #FFFFFF;
                background-image: none;
                border: 1px solid #e5e6e7;
                border-radius: 1px;
                color: inherit;
                display: block;
                padding: 6px 12px;
                transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
                width: 100%;
                font-size: 14px;
            }

            .text-navy {
                color: #1ab394;
            }

            .mid-icon {
                font-size: 66px !important;
            }

            .m-b-sm {
                margin-bottom: 10px;
            }
        </style>
        <div class="container-def">
            <div class="row">
                <div class="col-lg-13">
                    <div class="wrapper wrapper-content animated fadeInRight">

                        <div class="ibox-content m-b-sm border-bottom">
                            <div class="p-xs">
                                <div class="pull-left m-r-md">
                                    <i class="fa fa-user-md text-navy mid-icon"></i>
                                </div>
                                <h2>Welcome to Natick EyeCare</h2>
                                <span>&nbsp;&nbsp;Your Vision Source</span>
                            </div>
                        </div>

                        <div class="ibox-content forum-container">

                            <div class="forum-title">

                                <h3>RedBook Records</h3>
                            </div>
                            <div class="forum-item active">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="forum-icon">
                                            <i class="fa fa-money"></i>
                                        </div>
                                        <a href="ViewOrders.aspx" class="forum-item-title" ">View Patients Orders</a>
                                        <div class="forum-sub-title">Here we can view patients contact lens orders</div>
                                        
                                    </div>
                                    <div class="col-md-3 forum-info">
                                        <span class="views-number">
                                            <asp:Label ID="OrderViews" runat="server" Text="OrderViews"></asp:Label>
                                        </span>
                                        <div>
                                            <small>Records</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="forum-item active">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="forum-icon">
                                            <i class="fa fa-pause"></i>
                                        </div>
                                        <a href="ViewCancellation.aspx" class="forum-item-title" ">View Cancellations</a>
                                        <div class="forum-sub-title">Here we can view patients who are on our cancellation waiting list </div>
                                        
                                    </div>
                                    <div class="col-md-3 forum-info">
                                        <span class="views-number">
                                            <asp:Label ID="canviews" runat="server" Text="canviews"></asp:Label>
                                        </span>
                                        <div>
                                            <small>Records</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="forum-item active">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="forum-icon">
                                            <i class="fa fa-dot-circle-o"></i>
                                        </div>
                                        <a href="ViewCLS.aspx" class="forum-item-title">View CLS Trials</a>
                                        <div class="forum-sub-title">Here we can see patients trying CLS and needs follow up</div>
                                    </div>
                                    <div class="col-md-3 forum-info">
                                        <span class="views-number">
                                            <asp:Label ID="clsviews" runat="server" Text="clsviews"></asp:Label>
                                        </span>
                                        <div>
                                            <small>Records</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="forum-item active">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="forum-icon">
                                            <i class="fa fa-sticky-note"></i>
                                        </div>
                                        <a href="ViewRecReq.aspx" class="forum-item-title">View Receipt Requests</a>
                                        <div class="forum-sub-title">Here we can see patients asking for receipts and needs follow up</div>
                                    </div>
                                    <div class="col-md-3 forum-info">
                                        <span class="views-number">
                                            <asp:Label ID="RecReq" runat="server" Text="RecReq"></asp:Label>
                                        </span>
                                        <div>
                                            <small>Records</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="forum-item active">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="forum-icon">
                                            <i class="fa fa-prescription"></i>
                                        </div>
                                        <a href="ViewRx.aspx" class="forum-item-title">View Rx Requests</a>
                                        <div class="forum-sub-title">Here we can see patients asking for a copy of their Rx</div>
                                    </div>
                                    <div class="col-md-3 forum-info">
                                        <span class="views-number">
                                            <asp:Label ID="RxReq" runat="server" Text="RxReq"></asp:Label>
                                        </span>
                                        <div>
                                            <small>Records</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="forum-item active">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="forum-icon">
                                            <i class="fa fa-wpforms"></i>
                                        </div>
                                        <a href="ViewRef.aspx" class="forum-item-title">View Referral Requests</a>
                                        <div class="forum-sub-title">Here we can see patients who needs referral</div>
                                    </div>
                                    <div class="col-md-3 forum-info">
                                        <span class="views-number">
                                            <asp:Label ID="RefReq" runat="server" Text="RefReq"></asp:Label>
                                        </span>
                                        <div>
                                            <small>Records</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    </html>
</asp:Content>


