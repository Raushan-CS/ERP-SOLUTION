<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="change_password.aspx.cs" Inherits="Admin_change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <style>
        .loginmodal-container {
            padding: 30px;
            max-width: 350px;
            width: 100% !important;
            background-color: #F7F7F7;
            margin: 0 auto;
            border-radius: 2px;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            font-family: roboto;
            margin-top: 70px;
        }

            .loginmodal-container h1 {
                text-align: center;
                font-size: 1.8em;
                font-family: roboto;
            }

            .loginmodal-container input[type=submit] {
                width: 100%;
                display: block;
                margin-bottom: 10px;
                position: relative;
            }

            .loginmodal-container input[type=text], input[type=password] {
                height: 44px;
                font-size: 16px;
                width: 100%;
                margin-bottom: 10px;
                -webkit-appearance: none;
                background: #fff;
                border: 1px solid #d9d9d9;
                border-top: 1px solid #c0c0c0;
                /* border-radius: 2px; */
                padding: 0 8px;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
            }

                .loginmodal-container input[type=text]:hover, input[type=password]:hover {
                    border: 1px solid #b9b9b9;
                    border-top: 1px solid #a0a0a0;
                    -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                    -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                    box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                }

        .loginmodal {
            text-align: center;
            font-size: 14px;
            font-family: 'Arial', sans-serif;
            font-weight: 700;
            height: 36px;
            padding: 0 8px;
            /* border-radius: 3px; */
            /* -webkit-user-select: none;
  user-select: none; */
        }

        .loginmodal-submit {
            /* border: 1px solid #3079ed; */
            border: 0px;
            color: #fff;
            text-shadow: 0 1px rgba(0,0,0,0.1);
            background-color: #2C3E50;
            padding: 17px 0px;
            font-family: roboto;
            font-size: 14px;
            cursor: pointer;
            /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
        }

            .loginmodal-submit:hover {
                /* border: 1px solid #2f5bb7; */
                border: 0px;
                text-shadow: 0 1px rgba(0,0,0,0.3);
                background-color: #2C3E50;
                cursor: pointer;
                /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
            }

        .loginmodal-container a {
            text-decoration: none;
            color: #666;
            font-weight: 400;
            text-align: center;
            display: inline-block;
            opacity: 0.6;
            transition: opacity ease 0.5s;
        }

        .login-help {
            font-size: 12px;
        }

        .fill-btn {
            width: 30%;
            background-color: #007bff;
            color: white;
        }
    </style>
     <script type="text/javascript">
         function validate() {
             var old_pwd = document.getElementById('<%=txt_old_pwd.ClientID%>').value;
             var new_pwd = document.getElementById('<%=txt_new_pwd.ClientID%>').value;
             var confirm_pwd = document.getElementById('<%=txt_confirm.ClientID%>').value;
             if (old_pwd == "") {
                 alert("Enter Old Password");
                 document.getElementById('<%=txt_old_pwd.ClientID%>').focus();
                 return false;
             }
             if (new_pwd == "") {
                 alert("Enter New Password");
                 document.getElementById('<%=txt_new_pwd.ClientID%>').focus();
                 return false;
             }
             if (confirm_pwd == "") {
                 alert("Enter Confirm Password");
                 document.getElementById('<%=txt_confirm.ClientID%>').focus();
                 return false;
             }
             if (confirm_pwd != new_pwd) {
                 alert("Both Password doesn't Match.");
                 document.getElementById('<%=txt_confirm.ClientID%>').focus();
                  return false;
              }
          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="h1">CHANGE PASSWORD</h1>
                    </div>
                    <!-- /.col -->
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->
        <br />
        <!-- Main content -->
        <section class="content" style="">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="card card-primary" >
                        <div class="card-header">
                            <h3 class="card-title ">CHANGE PASSWORD</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            
                            <table id="example2" class="table table-bordered table-hover" runat="server">
                                <thead>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txt_old_pwd" runat="server" Class="form-control" placeholder="Old Password*"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="txt_new_pwd" runat="server" Class="form-control" placeholder="New Password*"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="txt_confirm" runat="server" Class="form-control" placeholder="Confirm Password*"></asp:TextBox>
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
                                        </td>
                                    </tr>
                                   
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td style="background-color: white; color: black;">

                                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" Class="fill-btn" OnClientClick="return validate();" OnClick="btnsubmit_Click" />
                                            <label id="td_message" runat="server"></label>
                                        </td>
                                        

                                    </tr>
                                  
                                </tfoot>

                            </table>
                               
                        </div>
                        <!-- /.card-body -->
                    </div>
                    
                </div>
                <!-- /.col -->

            </div>
            <!-- /.row -->
        </section>

    </div>
</asp:Content>

