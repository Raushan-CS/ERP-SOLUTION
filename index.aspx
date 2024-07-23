<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>SOLUTION ERP LOGIN</title>
    <meta content="" name="description"/>
    <meta content="" name="keywords"/>

    <!-- Favicons -->
    <link href="assets/img/favicon1.png" rel="icon"/>
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet"/>
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet"/>
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet"/>

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet"/>

  
</head>
<body>
  <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="#" class="logo d-flex align-items-center w-auto">
                 
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                       <img src="img/Rlogo.gif" alt="" style="text-align:center;  width:150px; display: block; margin-left: auto; margin-right: auto;" />
                      
                    <h4 class="card-title text-center pb-0 fs-4">Login to Your Account</h4>
                    <p class="text-center small">Enter your username & password to login</p>
                        <hr />
                  </div>

                  <form id="Form1" class="row g-3 needs-validation" method="post" runat="server" style="margin-top:-50px">

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                       <%-- <span class="input-group-text" id="inputGroupPrepend">@</span>--%>
                         <%-- <asp:TextBox ID="txtUsername" class="form-control" runat="server" ></asp:TextBox>--%>
                        <input type="text" name="username" class="form-control" id="txtyourUsername" runat="server" required="required"/>
                        <div class="invalid-feedback">Please enter your username.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                        <%--<asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>--%>
                      <input type="password" name="password" class="form-control" id="txtyourPassword" runat="server" required/>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>

                      <div class="col-12">
                        <label id="lblMessage" class="form-label" style="color:red" runat="server"></label>
                      </div>

                   
                    <div class="col-12">
                      <asp:Button ID="Button1" class="btn btn-primary w-100" runat="server" Text="Login"  OnClick="Button1_Click"></asp:Button>
                      
                    </div>
                    
                  </form>

                </div>
              </div>

             

            </div>
          </div>
        </div>

      </section>

    </div>

    <!-- End #main -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.umd.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
</body>
</html>
