<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UserEntry.aspx.cs" Inherits="Admin_UserEntry" %>


  
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
   <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
  <!-- DataTables -->
    
  <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />
  <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />
  <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Create User</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="AdminDashboard.aspx">Home</a></li>
              <li class="breadcrumb-item active">Create User</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">User Registration</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
                   
                            <div class="form-group">
                                <label for="exampleInputUserId">Name</label>
                                <asp:TextBox ID="txt_Name" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        
                   

                     
                            <div class="form-group">
                                <label for="exampleInputUserId">Username</label>
                                <asp:TextBox ID="txtusername" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        
                      
                            <div class="form-group">
                                <label for="exampleInputUserId">Password</label>
                                <asp:TextBox ID="txtpassword" runat="server" class="form-control"></asp:TextBox>

                            </div>
                      
                    
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                    <asp:Button ID="btnsubmit" runat="server" class="btn btn-primary" Text="Submit" OnClientClick="return validate();" OnClick="btnsubmit_Click" />
               <p id="success" runat="server"></p>
                </div>
              </form>
            </div>
            <!-- /.card -->


          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">
          
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">User List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                
<!--=================================================================== Displaying data in Gridview and Editing in Popup  =====================================================================-->
                  <div class="box box-primary">
            
            <div class="box-body">
                <div class="form-group">
                    <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="False" CssClass="col-md-12 col-xs-12"  CellPadding="4"  EmptyDataText="NO RECORD FOUND" OnRowCommand="Gridview1_RowCommand" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DisplayIndex + 1%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <%#Eval("name")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                              
                            <asp:TemplateField HeaderText="User Name">
                                <ItemTemplate>
                                    <%#Eval("username")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Password">
                                <ItemTemplate>
                                    <%#Eval("password")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkedit" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="edt">Edit</asp:LinkButton>                                     
                                    |
                                    <asp:LinkButton ID="lnkunblock" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="unblock" Text='<%# Convert.ToBoolean(Eval("status")) == false ? "Blocked" : "Active" %>'>Blocked</asp:LinkButton>
                                    |  
                                    <asp:LinkButton ID="lnkdelete" runat="server" CommandArgument=' <%#Eval("id")%>' CommandName="del" OnClientClick="return confirm('Do you want to delete this Record');">Delete</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                        </Columns>

                        <RowStyle Height="25px" ForeColor="#003399" BackColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#009999" ForeColor="#CCFF99" HorizontalAlign="Center" />
                        <HeaderStyle Height="30px" BackColor="#0187BC" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    </asp:GridView>

                    <asp:Panel runat="server" ID="pnlshow" Width="500" Style="height: auto; display: none; border: 1px solid #61a9e4; padding: 5px; background: #ffffff;">
                        <table class="table" cellpadding="0px" cellspacing="0px">
                           
                            <tr>
                                <td>Name :</td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                            </tr>
                           
                            <tr>
                                <td>UserName :</td>
                                <td>
                                    <asp:TextBox ID="txtUsrName" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Password :</td>
                                <td>
                                    <asp:TextBox ID="txtUserPwd" runat="server"></asp:TextBox></td>
                            </tr>
                           
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hd_value" runat="server" />
                                    <asp:Label runat="server" ID="lblsubmit"></asp:Label>
                                    <asp:Label runat="server" ID="lblgid" Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="button_example"  OnClick="btnupdate_Click" />&nbsp;
                                    <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="button_example" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <AjaxControlToolkit:ModalPopupExtender ID="MessagePnl_ModalPopupExtender" runat="server"  Enabled="True" TargetControlID="lblsubmit" BackgroundCssClass ="ModalPopupBG" PopupControlID="pnlshow" CancelControlID="btnclose"></AjaxControlToolkit:ModalPopupExtender>
                </div>
            </div>
        </div>

<!-- ===============================================================================================================================================================================================================-->
              </div>
              <!-- /.card-body -->
            </div>

            
           </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
 <!-- /.content-wrapper -->


       

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->


              
              <!-- ./wrapper -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../plugins/jszip/jszip.min.js"></script>
<script src="../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>




    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>


<!-- Page specific script -->

    
     <script type="text/javascript">
         function validate() {
             var txt_Name = document.getElementById('<%=txt_Name.ClientID%>').value;
           
             var txtusername = document.getElementById('<%=txtusername.ClientID%>').value;
             var txtpassword = document.getElementById('<%=txtpassword.ClientID%>').value;
            
             if (txtusername == "") {
                 alert("Enter User's username");
                 document.getElementById('<%=txtusername.ClientID%>').focus();
                 return false;
             }
             if (txtpassword == "") {
                 alert("Enter Password");
                 document.getElementById('<%=txtpassword.ClientID%>').focus();
                 return false;
             }
            
             if (txt_Name == "") {
                 alert("Enter User Name");
                 document.getElementById('<%=txt_Name.ClientID%>').focus();
                 return false;
             }
             

         }
    </script>


   
   </ContentTemplate>
    </asp:UpdatePanel> 

</asp:Content>

