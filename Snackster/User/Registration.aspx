<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Snackster.User.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMag" runat="server" Visible="false"></asp:Label>
                </div>
              
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>

            <div class="row">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form_container">
                            <div>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name" ToolTip="Full Name"></asp:TextBox>

                                <asp:RequiredFieldValidator 
                                    ID="rfvName" 
                                    runat="server" 
                                    ErrorMessage="Name is required" 
                                    ControlToValidate="txtName" 
                                    ForeColor="Red" 
                                    Display="Dynamic" 
                                    SetFocusOnError="true">
                                </asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator 
                                    ID="revName" 
                                    runat="server" 
                                    ErrorMessage="Name must be in characters only" 
                                    ForeColor="Red" 
                                    Display="Dynamic" 
                                    SetFocusOnError="true" 
                                    ValidationExpression="^[a-zA-Z\s]+$"
                                    ControlToValidate="txtName">
                                </asp:RegularExpressionValidator>
                            </div>



                            <div>
   <div>
    <asp:TextBox 
        ID="txtUserName" 
        runat="server" 
        CssClass="form-control" 
        placeholder="Enter Username" 
        ToolTip="Username">
    </asp:TextBox>

    <asp:RequiredFieldValidator 
        ID="rfvUserNameRequired" 
        runat="server" 
        ErrorMessage="Username is required" 
        ControlToValidate="txtUserName" 
        ForeColor="Red" 
        Display="Dynamic" 
        SetFocusOnError="true">
    </asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator 
        ID="rfvUsername" 
        runat="server" 
        ErrorMessage="Username must be in characters only" 
        ControlToValidate="txtUserName"  
        ValidationExpression="^[a-zA-Z]+$" 
        ForeColor="Red" 
        Display="Dynamic" 
        SetFocusOnError="true">
    </asp:RegularExpressionValidator>
</div>





<div>
    <asp:TextBox 
        ID="txtEmail" 
        runat="server" 
        CssClass="form-control" 
        placeholder="Enter Email" 
        ToolTip="Email">
    </asp:TextBox>

    <!-- Required Email -->
    <asp:RequiredFieldValidator 
        ID="rfvEmailRequired" 
        runat="server" 
        ErrorMessage="Email is required" 
        ControlToValidate="txtEmail" 
        ForeColor="Red" 
        Display="Dynamic" 
        SetFocusOnError="true">
    </asp:RequiredFieldValidator>

    <!-- Regex Email -->
    <asp:RegularExpressionValidator 
        ID="revEmail" 
        runat="server" 
        ErrorMessage="Please enter a valid email address" 
        ControlToValidate="txtEmail"  
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
        ForeColor="Red" 
        Display="Dynamic" 
        SetFocusOnError="true">
    </asp:RegularExpressionValidator>
</div>





<div>
    <asp:TextBox 
        ID="txtMobile" 
        runat="server" 
        CssClass="form-control" 
        placeholder="Enter Mobile Number" 
        ToolTip="Mobile Number">
    </asp:TextBox>

    <asp:RequiredFieldValidator 
        ID="rfvMobile" 
        runat="server" 
        ErrorMessage="Mobile No. required" 
        ControlToValidate="txtMobile" 
        ForeColor="Red" 
        Display="Dynamic" 
        SetFocusOnError="true">
    </asp:RequiredFieldValidator>

   <asp:RegularExpressionValidator 
    ID="revMobile" 
    runat="server" 
    ErrorMessage="Mobile No must have 11 digits only" 
    ControlToValidate="txtMobile" 
    ValidationExpression="^[0-9]{11}$" 
    ForeColor="Red" 
    Display="Dynamic" 
    SetFocusOnError="true">
</asp:RegularExpressionValidator>

</div>






















                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form_container">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
