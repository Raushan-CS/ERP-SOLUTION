<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewProjectDetails.aspx.cs" Inherits="Admin_ViewProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>SOLUTION ERP</title>
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
                            <div class="col-sm-12 " style="text-align:center;">
                                <h1>Edit Project details</h1>
                            </div>
                           
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>
           
             <section class="content">
                    <div class="container-fluid">
                        <div class="row" style="justify-content: center;">
                            <!-- left column -->
                            <div class="col-md-9   ">
                                <!-- general form elements -->
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Project Details</h3>
                                    </div>
                            <form>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputUserId">Project Name</label>
                                                <asp:TextBox id="txt_projectName" runat="server" class="form-control" />

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
                                                <asp:DropDownList ID="ddlProjectTypeSelector" DataTextField="project_type" DataValueField="project_type" Style="width: 100%;" runat="server"
                                                    class="form-control select2bs4">
                                                </asp:DropDownList>
                                               
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
                                                        <asp:HiddenField ID="hd_value" runat="server" />
                                                            
                                                            <asp:Button ID="btnAddHead" runat="server" class="btn btn-primary"  Text="Add Head" OnClientClick="return validateHead();" OnClick="btnAddHead_Click"/>
                                                            
                                                        
                                                    
                                                    </div>
                                                </div>

                                    <div class="col-md-12 text-center"  id="btnpanel" runat="server" style="flex-align: center">
                                        <asp:GridView ID="GridView2" runat="server" Width="90%" AutoGenerateColumns="false" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing"  OnRowDeleting="GridView2_RowDeleting" OnRowUpdating="GridView2_RowUpdating"
                                            
                                            CssClass="height" HorizontalAlign="Center">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Id">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Project Head">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblprojectHead" runat="server" Text='<%#Eval("project_head")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtProjectHead" runat="server" Text='<%#Eval("project_head") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Head Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHeadAmt" runat="server" Text='<%#Eval("head_amt") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtHeadAmt" runat="server" Text='<%#Eval("head_amt") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkEdit" Text="Edit" runat="server" CommandName="Edit" />
                                                        |
                                                <asp:LinkButton ID="LnkDelete" Text="Delete" runat="server" CommandName="Delete" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LnkUpdate" Text="Update" runat="server" CommandName="Update" />
                                                        <asp:LinkButton ID="LnkCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                            <RowStyle Height="25px" ForeColor="#003399" BackColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#009999" ForeColor="#CCFF99" HorizontalAlign="Center" />
                                            <HeaderStyle Height="30px" BackColor="#0187BC" Font-Bold="True" ForeColor="White" />
                                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                     <!-- /.card-body -->
                                        <div class="card-footer" style="text-align:center">
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
                                            <asp:Button ID="btnUpdate" runat="server" Width="150px"   class="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" />
                                            <p id="success" runat="server"></p>
                                        </div>


                                </div>
                            </form>
                        </div>
                            </div>
                    </div>
                </div>
            </section>

        </div>
            </ContentTemplate>
        </asp:UpdatePanel>

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
</asp:Content>

