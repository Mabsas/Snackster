<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Snackster.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-sm-6 col-xl-3">
                        <div class="card widget-card-1">
                            <div class="card-block-small">
                               <i class="icofont icofont-muffin bg-c-blue card1-icon"></i>
                                 <span class="text-c-blue f-w-600">Categories</span>
                                <h4>5</h4>
                                <div>
                                    <span class="f-left m-t-10 text-muted"></span>
                                      <a href="Category.aspx"><i class="text-c-blue f-16 icofont icofont-eye-alt"></i>View Details</a>
                                </div>
                            </div>
                            <!-- end card-header -->

                            
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end col-sm-12 -->
                </div>
                <!-- end row -->
            </div>
            <!-- end page-body -->
        </div>
        <!-- end page-wrapper -->
    </div>
</asp:Content>
