<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CreateProject.aspx.cs"
    Inherits="Admin_CreateProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Create Project</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="AdminDashboard.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Create Project</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
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
                                        <h3 class="card-title">Project Entry</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Project Name</label>
                                                        <asp:TextBox ID="txt_projectName" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Project Location</label>
                                                        <asp:TextBox ID="txtlocation" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>



                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Project Type</label>
                                                        <asp:DropDownList ID="ddlDeptSelector" DataTextField="project_type" DataValueField="project_type" Style="width: 100%;" runat="server"
                                                            class="form-control select2bs4">
                                                        </asp:DropDownList>
                                                        <%--<asp:TextBox ID="txtprojecttype" runat="server" class="form-control"></asp:TextBox>--%>
                                                    </div>
                                                </div>
                                              
                                            </div>

                                            <div class="row">
                                                  <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Project Value</label>
                                                        <asp:TextBox ID="txtvalue" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserName">Project Timeline</label>
                                                        <asp:TextBox ID="txttimeline" runat="server" class="form-control"> </asp:TextBox>

                                                    </div>
                                                </div>
                                               

                                            </div>
                                             <div class="row">
                                                  <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserName">Project Head</label>
                                                        <asp:TextBox ID="txtProjectHead" runat="server" class="form-control"> </asp:TextBox>

                                                    </div>
                                                </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label for="exampleInputUserName">Head Amount</label>
                                                            <asp:TextBox ID="txtHeadAmount" runat="server" class="form-control"> </asp:TextBox>

                                                        </div>
                                                        </div>
                                                         <div style="padding-top: 15px; align-content: center; ">
                                                        
                                                            
                                                            <asp:Button ID="btnAddHead" runat="server" class="btn btn-primary"  Text="Add Head" OnClientClick="return validateHead();" OnClick="btnAddHead_Click"/>
                                                            
                                                        
                                                    
                                                    </div>
                                                </div>
                                            <!-- /.card-body -->

                                           
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
                                        <h3 class="card-title">Project List</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">

                                        <!--=================================================================== Displaying data in Gridview and Editing in Popup  =====================================================================-->
                                        <div class="box box-primary">

                                            <div class="box-body">
                                                <div class="form-group">
                                                    <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="False" CssClass="col-md-12 col-xs-12" CellPadding="4" EmptyDataText="NO RECORD FOUND"
                                                        OnRowCommand="Gridview1_RowCommand" AllowPaging="true"
                                                        OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="#">
                                                                <ItemTemplate>
                                                                    <%# Container.DisplayIndex + 1%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Name">
                                                                <ItemTemplate>
                                                                    <%#Eval("project_name")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Location">
                                                                <ItemTemplate>
                                                                    <%#Eval("project_location")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Type">
                                                                <ItemTemplate>
                                                                    <%#Eval("project_type")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="View">
                                                                <ItemTemplate>

                                                                   
                                                                   
                                                                  <%--  <asp:LinkButton ID="lnkedit" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="edt">View</asp:LinkButton>
                                                                    | --%> 
                                    <a href="viewProjectDetails.aspx?projectname=<%#Eval("project_name")%>" class="btn btn-primary">View</a>
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

                                                    <asp:Panel runat="server" ID="pnlshow" Width="800" Style="height: auto; display: none; border: 1px solid #61a9e4; padding: 5px;
                                                        background: #ffffff;">
                                                        <table class="table" cellpadding="0px" cellspacing="0px">
                                                            <%--<tr>
                                <td style="width: 24%">User ID :</td>
                                <td id="tduserid" runat="server" style="width: 50%"></td>
                            </tr>--%>


                                                            <tr>
                                                                <td>Project Name :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPName" runat="server"></asp:TextBox></td>
                                                            
                                                                <td>Project Location :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPLocation" runat="server"></asp:TextBox></td>
                                                            </tr>


                                                            <tr>
                                                                <td>Project Type :</td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlProjectTypeSelector" DataTextField="project_type" DataValueField="project_type" Style="width: 100%;"
                                                                        runat="server" class="form-control select2bs4">
                                                                    </asp:DropDownList>
                                                                    <%--  <asp:TextBox ID="txtPType" runat="server"></asp:TextBox></td>--%>
                                                            
                                                                <td>Project Timeline :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPTimeline" runat="server"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Project Value :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPValue" runat="server"></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <div id="PHead" runat="server" style="text-align:center;float:right;width:600;">

                                                            </div>


                                                            <tr>
                                                                <td >
                                                                    <asp:HiddenField ID="hd_value" runat="server" />
                                                                    <asp:Label runat="server" ID="lblsubmit"></asp:Label>
                                                                    <asp:Label runat="server" ID="lblgid" Visible="false"></asp:Label>
                                                                </td>
                                                                <td style="text-align:center;">
                                                                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnupdate_Click" />&nbsp;
                                    <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="btn btn-primary" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>

                                                    <AjaxControlToolkit:ModalPopupExtender ID="MessagePnl_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="lblsubmit"
                                                        BackgroundCssClass="ModalPopupBG" PopupControlID="pnlshow" CancelControlID="btnclose">
                                                    </AjaxControlToolkit:ModalPopupExtender>
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

                        <div class="col-md-12 text-center" id="btnpanel" runat="server" style="flex-align:center">
                                            <asp:GridView ID="GridView2" runat="server" Width="50%" AutoGenerateColumns="false"
                                                OnRowDeleting="GridView2_RowDeleting" CssClass="height" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Project Head">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProjectHead" runat="server" Text='<%#Eval("project_head")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Head Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHeadAmount" runat="server" Text='<%#Eval("head_amt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField> 
                                                 
                                                                                                     
                                                    <asp:CommandField ShowDeleteButton="true" HeaderText="Delete" />
                                                </Columns>
                                                <RowStyle Height="25px" ForeColor="#003399" BackColor="White" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="#009999" ForeColor="#CCFF99" HorizontalAlign="Center" />
                                                <HeaderStyle Height="30px" BackColor="#0187BC" Font-Bold="True" ForeColor="White" />
                                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>

                         <!-- Button to save Project details and project head details in respective tables in database -->
                         <div class="card-footer" style="text-align:center;">
                                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                                <asp:Button ID="btnsubmit" runat="server" class="btn btn-primary" Text="Submit" OnClientClick="return validate();" OnClick="btnsubmit_Click" />
                                                <p id="success" runat="server"></p>
                                            </div>
                        
                    </div>
                    <!-- /.container-fluid -->
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
                function validateHead() {
                    var ProjectHead = document.getElementById('<%=txtProjectHead.ClientID%>').value;
                    var HeadAmount = document.getElementById('<%=txtHeadAmount.ClientID%>').value;

                    if (ProjectHead == "") {
                        alert("Enter Project Head");
                        document.getElementById('<%=txtProjectHead.ClientID%>').focus();
                        return false;
                    }
                    if (HeadAmount == "") {
                        alert("Enter Head Amount");
                        document.getElementById('<%=txtHeadAmount.ClientID%>').focus();
                        return false;
                    }
                }
             </script>


            <script type="text/javascript">
                function validate() {

                    var txt_projectName = document.getElementById('<%=txt_projectName.ClientID%>').value;
                    var txtlocation = document.getElementById('<%=txtlocation.ClientID%>').value;
                    var ddlDeptSelector = document.getElementById('<%=ddlDeptSelector.ClientID%>').value; 
                    var ProjectHead = document.getElementById('<%=txtProjectHead.ClientID%>').value;
                    var HeadAmount = document.getElementById('<%=txtHeadAmount.ClientID%>').value;

                    var txtvalue = document.getElementById('<%=txtvalue.ClientID%>').value;
                    var txttimeline = document.getElementById('<%=txttimeline.ClientID%>').value;

                    if (txt_projectName == "") {
                        alert("Enter Project Name");
                        document.getElementById('<%=txt_projectName.ClientID%>').focus();
                        return false;
                    }
                    if (txtlocation == "") {
                        alert("Enter Project Location");
                        document.getElementById('<%=txtlocation.ClientID%>').focus();
                 return false;
             }
             if (txtvalue == "") {
                 alert("Select Project Value ");
                 document.getElementById('<%=txtvalue.ClientID%>').focus();
                 return false;
             }
             if (txttimeline == "") {
                 alert("Enter Project Timeline");
                 document.getElementById('<%=txttimeline.ClientID%>').focus();
                 return false;
             }
             if (txtvalue == "") {
                 alert("Select Project Value ");
                 document.getElementById('<%=txtvalue.ClientID%>').focus();
                 return false;
             }
             if (ddlDeptSelector == "") {
                 alert("Select the Project Type");
                 document.getElementById('<%=ddlDeptSelector.ClientID%>').focus();
                 return false;
             }

                    if (ProjectHead == "") {
                        alert("Enter Project Head");
                        document.getElementById('<%=txtProjectHead.ClientID%>').focus();
                 return false;
                    }
                    if (HeadAmount == "") {
                        alert("Enter Head Amount");
                        document.getElementById('<%=txtHeadAmount.ClientID%>').focus();
                        return false;
                    }

         }
            </script>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

