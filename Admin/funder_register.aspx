<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="funder_register.aspx.cs"
    Inherits="Admin_funder_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyQqO3VMpKUC5VJgaDM/6bQ6Z1KJWWnPbW"
        crossorigin="anonymous" />

    <!-- DataTables -->

    <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />
    <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.js"></script>
    <link href="../assets/css/style1.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <link href="../assets/css/style3.css" rel="stylesheet" />
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
                                <h1>Funder details Entry</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="AdminDashboard.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Funder Details Entry</li>
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
                                        <h3 class="card-title">Funder Details Entry</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Funder Name</label>
                                                        <asp:TextBox ID="txtFunderName" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Funder Contact</label>
                                                        <asp:TextBox ID="txtContact" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Email Id</label>
                                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">Funder Type</label>
                                                        <asp:DropDownList ID="ddlFunderType" class="form-control" runat="server">
                                                                        <asp:ListItem Value="">--Select Funder Type--</asp:ListItem>
                                                                        <asp:ListItem> Government </asp:ListItem>
                                                                        <asp:ListItem> Individual </asp:ListItem>
                                                                        <asp:ListItem> Corporate </asp:ListItem>
                                                                    </asp:DropDownList>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">PAN No.</label>
                                                        <asp:TextBox ID="txtPan" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="exampleInputUserId">UID No.</label>
                                                        <asp:TextBox ID="txtUid" runat="server" class="form-control"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12">
                                                     <div class="form-group">
                                                        <label for="Label1" ">Address</label>
                                                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" class="form-control"></asp:TextBox>
                                                      </div>
                                                </div>
                                            </div>

















                                            <div class="row">
                                               <%-- <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblFunderName" class="col-sm-4 col-form-label">Funder Name</label>
                                                                <div class="col-sm-8">
                                                                    <asp:TextBox ID="" class="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblContact" class="col-sm-4 col-form-label">Funder Contact</label>
                                                                <div class="col-sm-8">
                                                                    <asp:TextBox ID="" class="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblEmail" class="col-sm-4 col-form-label">Email Id</label>
                                                                <div class="col-sm-8">
                                                                    <asp:TextBox ID="" class="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblFunderType" class="col-sm-4 col-form-label"></label>
                                                                <div class="col-sm-8">
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group row">

                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblPan" class="col-sm-4 col-form-label">PAN No. </label>
                                                                <div class="col-sm-8">
                                                                    <asp:TextBox ID="" runat="server" class="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblUID" class="col-sm-4 col-form-label">UID No. </label>
                                                                <div class="col-sm-8">

                                                                    <asp:TextBox ID="" runat="server" class="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label id="lblAddress" class="col-sm-2 col-form-label">Address</label>
                                                                <div class="col-sm-10">

                                                                    

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>--%>

                                            </div>

                                        </div>
                                        <div class="card-footer">
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
                                            <asp:Button ID="btnsubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnsubmit_Click" OnClientClick="return validate();" />
                                            <p id="success" runat="server"></p>
                                        </div>
                                </div>


                                </form>
                            </div>

                             <div class="col-md-6">
          
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Funder List</h3>
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
                            <asp:TemplateField HeaderText="Funder Name">
                                <ItemTemplate>
                                    <%#Eval("funder_name")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                              
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <%#Eval("funder_contact")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Funder Type">
                                <ItemTemplate>
                                    <%#Eval("funder_type")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PAN">
                                <ItemTemplate>
                                    <%#Eval("pan")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkedit" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="edt">Edit</asp:LinkButton>                                     
                                   
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
                            <%--<tr>
                                <td style="width: 24%">User ID :</td>
                                <td id="tduserid" runat="server" style="width: 50%"></td>
                            </tr>--%>
                           
                             
                            <tr>
                                <td> Funder Name :</td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Funder Mobile :</td>
                                <td>
                                    <asp:TextBox ID="txtFunderMob" runat="server"></asp:TextBox></td>
                            </tr>


                            <tr>
                                <td>Funder Email :</td>
                                <td>
                                    <asp:TextBox ID="txtFunderEmail" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>PAN :</td>
                                <td>
                                    <asp:TextBox ID="txtFunderPan" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>UID :</td>
                                <td>
                                    <asp:TextBox ID="txtUid_edit" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Address :</td>
                                <td>
                                    <asp:TextBox ID="txtAddressLine" runat="server"></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td>Funder Type :</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                                                                        <asp:ListItem Value="">--Select Funder Type--</asp:ListItem>
                                                                        <asp:ListItem> Government </asp:ListItem>
                                                                        <asp:ListItem> Individual </asp:ListItem>
                                                                        <asp:ListItem> Corporate </asp:ListItem>
                                                                    </asp:DropDownList>
                         
                                </td>
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

                        </div>
                    </div>
            </div>
                </section>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function validate() {

            var FunderName = document.getElementById('<%=txtFunderName.ClientID%>').value;
            var Mobile = document.getElementById('<%=txtContact.ClientID%>').value;
            var Email = document.getElementById('<%=txtEmail.ClientID%>').value;
            var Pan = document.getElementById('<%=txtPan.ClientID%>').value;
            var Uid = document.getElementById('<%=txtUid.ClientID%>').value;
            var Address = document.getElementById('<%=txtAddress.ClientID%>').value;

            var FunderType = document.getElementById('<%=ddlFunderType.ClientID%>').value;

            if (FunderName == "") {
                alert("Enter Funder's Name");
                document.getElementById('<%=txtFunderName.ClientID%>').focus();
                  return false;
              }
              if (Mobile == "") {
                  alert("Enter Funder Mobile");
                  document.getElementById('<%=txtContact.ClientID%>').focus();
                 return false;
             }
             if (Email == "") {
                 alert("Enter Funder Email ");
                 document.getElementById('<%=txtEmail.ClientID%>').focus();
                  return false;
              }
              if (FunderType == "--Select Funder Type--") {
                  alert("Select Funder Type");
                  document.getElementById('<%=ddlFunderType.ClientID%>').focus();
                 return false;
             }
             if (Pan == "") {
                 alert("Enter Funder Pan");
                 document.getElementById('<%=txtPan.ClientID%>').focus();
                 return false;
             }
             if (Uid == "") {
                 alert("Enter Funder UID ");
                 document.getElementById('<%=txtUid.ClientID%>').focus();
                  return false;
              }
              if (Address == "") {
                  alert("Enter Funder Address ");
                  document.getElementById('<%=txtAddress.ClientID%>').focus();
                  return false;
              }

          }
    </script>

</asp:Content>

