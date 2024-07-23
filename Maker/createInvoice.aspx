<%@ Page Title="" Language="C#" MasterPageFile="~/Maker/MakerMasterPage.master" AutoEventWireup="true" CodeFile="createInvoice.aspx.cs" Inherits="Maker_createInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyQqO3VMpKUC5VJgaDM/6bQ6Z1KJWWnPbW" crossorigin="anonymous" />

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
                                <h1>Invoice details Entry</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="MakerDashboard.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Invoice Details Entry</li>
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
                            <div class="col-md-12">
                                <!-- general form elements -->
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Invoice Details Entry</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form>
                                        <div class="card-body">
                                            <div class="row">
                                                 <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblInvoiceNo" class="col-sm-4 col-form-label">Invoice No.</label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtInvoiceNo" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">

                                                               <div class="form-group row">
                                                                <label id="lblDesignation" class="col-sm-4 col-form-label">Bill To</label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtDesignation" class="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>


                                                          
                                                        </div>

                                                         <div class="col-md-3">
                                                                  <div class="form-group row">
                                                                <label id="lblBillName" class="col-sm-4 col-form-label">Company/Dept.</label>
                                                                <div class="col-sm-8">
                                                                     <asp:DropDownList ID="ddlFunderName" DataTextField="funder_name"  DataValueField="funder_name"  Style="width: 100%;" runat="server"  AutoPostBack="true" class="form-control select2bs4"   >
                                                                    </asp:DropDownList>
                                                                   <%--<asp:TextBox ID="txtFunderName" class="form-control" runat="server"></asp:TextBox>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                               
                                                                <label id="lblProject" class="col-sm-4 col-form-label">Project Name</label>
                                                                <div class="col-sm-8">
                                                                     <asp:DropDownList ID="ddlProjectName" DataTextField="project_name"  DataValueField="project_name"  Style="width: 100%;" runat="server" class="form-control select2bs4" OnTextChanged="ddlProjectName_TextChanged" AutoPostBack="true"  >
                                                                    </asp:DropDownList>
                                                                </div>
                                                            
                                                               <%-- <label id="lblFunderEmail" class="col-sm-4 col-form-label">Funder Email Id.</label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtFunderEmail" class="form-control" runat="server"></asp:TextBox>
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                       
                                                    </div>
                                                 </div>
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                         <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="Label1" class="col-sm-4 col-form-label">Project/Order Details</label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtprojectOrder" class="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblBillDescription" class="col-sm-4 col-form-label">Bill Description </label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtBillDescription"  runat="server" class="form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        
                                                        

                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblFromDate" class="col-sm-4 col-form-label">Bill Period- From </label>
                                                                <div class="col-sm-8">
                                                                    <div class="input-group date" id="Div1" data-target-input="nearest">
                                                                        <asp:TextBox ID="txtFromDate" TextMode="Date" runat="server" class="form-control"></asp:TextBox>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblToDate" class="col-sm-4 col-form-label">Bill Period- To</label>
                                                                <div class="col-sm-8">

                                                                    <div class="input-group date" id="Div2" data-target-input="nearest">
                                                                        <asp:TextBox ID="txtToDate" TextMode="Date" runat="server" class="form-control"></asp:TextBox>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                       
                                                    </div>

                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <div class="form-group row">
                                                                <label id="lblDescription" class="col-sm-2 col-form-label">Major Head</label>
                                                                <div class="input-group col-sm-6">
                                                                     <asp:DropDownList ID="txtDescription" DataTextField="project_head"  DataValueField="project_head"  Style="width: 100%;" runat="server" class="form-control select2bs4"  >
                                                                    </asp:DropDownList>
                                                                  <%-- <asp:TextBox ID="txtDescription" class="form-control"  runat="server"></asp:TextBox>--%>
                                                                  </div>
                                                                 <div class="input-group col-sm-4">
                                                                         <asp:Button ID="btnAddHeading" runat="server" class="btn btn-primary" Text="Add" Width="100"  OnClick="btnAddHeading_Click" OnClientClick="return validate();" />
                                                              
                                                                     </div>
                                                            </div>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                               
                                                <div class="col-md-12">
                                                  <div class="form-group row">

                                                       <div class="col-md-4">
                                                            <div class="form-group row">
                                                                <label id="lblSubDescription" class="col-sm-4 col-form-label">Sub Head</label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtSubDescription" class="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group row">
                                                                <label id="lblUnit" class="col-sm-5 col-form-label">Unit</label>
                                                                <div class="col-sm-7">
                                                                      <asp:TextBox ID="txtUnit" class="form-control" width="100" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="col-md-2">
                                                            <div class="form-group row">
                                                                <label id="lblQuantity" class="col-sm-5 col-form-label">Quantity</label>
                                                                <div class="col-sm-7">
                                                                   <asp:TextBox ID="txtQuantity" class="form-control"  width="100" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group row">
                                                                <label id="lblUnitPrice" class="col-sm-5 col-form-label">Unit Price</label>
                                                                <div class="col-sm-7">
                                                                   <asp:TextBox ID="txtUnitPrice" class="form-control" runat="server" width="100" AutoPostBack="true" OnTextChanged="txtUnitPrice_TextChanged"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group row">
                                                                <label id="lblAmount" class="col-sm-4 col-form-label">Amount</label>
                                                                <div class="col-sm-4">
                                                                     <asp:TextBox ID="txtAmount" class="form-control" Width="80" runat="server" Enabled="false"></asp:TextBox>
                                                                    

                                                                </div>
                                                                   <div class="col-sm-4">
                                                                        <asp:Button ID="btnAddSubDesc" runat="server" class="btn btn-primary" Text="Add"  OnClick="btnAddSubDesc_Click" OnClientClick="return Validate1();" />
                                                                       </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                   
                                                </div>
                                                
                                                
                                                
                                            </div>
                                        </div>
                                     

                                          <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblTotal" class="col-sm-2 col-form-label">Total</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="txtTotal" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                         <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblTax" class="col-sm-4 col-form-label">Tax if any</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="txtTax" class="form-control" runat="server"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                         <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblOthers" class="col-sm-4 col-form-label">Others if any</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="txtOthers" class="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtOthers_TextChanged"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                         <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblGrandTotal" class="col-sm-4 col-form-label">Grand Total</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="txtGrandTotal" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>
                                                       
                                                    </div>
                                                </div>

                                           <div class="col-md-12 text-center" id="btnpanel" runat="server" style="flex-align:center">
                                            <asp:GridView ID="GridView2" runat="server" Width="50%" AutoGenerateColumns="false"
                                                OnRowDeleting="GridView2_RowDeleting" CssClass="height" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDescr" runat="server" Text='<%#Eval("desc_head")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUnit" runat="server" Text='<%#Eval("unit") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField> 
                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQty" runat="server" Text='<%#Eval("quantity")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unit Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUPrice" runat="server" Text='<%#Eval("unit_price") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField> 
                                                    <asp:TemplateField HeaderText="Amount   ">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmt" runat="server" Text='<%#Eval("amount")%>'></asp:Label>
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


                                        <!-- /.card-body -->
                                        <div class="card-footer" style="text-align:center">
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
                                            <asp:Button ID="btnsave" runat="server" Width="150px"   class="btn btn-primary" Text="Save" OnClick="btnsave_Click" OnClientClick="return validatee();"/>
                                            <p id="success" runat="server"></p>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!--/.col (left) -->
                            <!-- right column -->
                            
                            <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

             <script type="text/javascript">
                 function validate() {
                     var txtInvoiceNo = document.getElementById('<%=txtInvoiceNo.ClientID%>').value;
                     var ddlFunderName = document.getElementById('<%=ddlFunderName.ClientID%>').value;
                     var ProjectName = document.getElementById('<%=ddlProjectName.ClientID%>').value;
                     var BillDescription = document.getElementById('<%=txtBillDescription.ClientID%>').value;
                     var FromDate = document.getElementById('<%=txtFromDate.ClientID%>').value;
                     var ToDate = document.getElementById('<%=txtToDate.ClientID%>').value;
                     var txtSubHeading = document.getElementById('<%=txtDescription.ClientID%>').value;
                    
                     
                    
                   
                   
                   


                     if (txtSubHeading == "") {
                        alert("Enter Sub Heading");
                        document.getElementById('<%=txtDescription.ClientID%>').focus();
                        return false;
                    }
                     if (txtInvoiceNo == "") {
                        alert("Enter Invoice Number ");
                        document.getElementById('<%=txtInvoiceNo.ClientID%>').focus();
                        return false;
                    }
                     if (ddlFunderName == "") {
                        alert("Select Funder Name");
                        document.getElementById('<%=ddlFunderName.ClientID%>').focus();
                        return false;
                    }
                     if (ProjectName == "") {
                        alert("Select Project Name");
                        document.getElementById('<%=ddlProjectName.ClientID%>').focus();
                        return false;
                    }
                     if (BillDescription == "") {
                        alert("Enter the Bill Description");
                        document.getElementById('<%=txtBillDescription.ClientID%>').focus();
                        return false;
                    }
                     if (FromDate == "") {
                        alert("Enter Bill period From Date");
                        document.getElementById('<%=txtFromDate.ClientID%>').focus();
                        return false;
                    }
                     if (ToDate == "") {
                         alert("Enter Bill period To Date");
                        document.getElementById('<%=txtToDate.ClientID%>').focus();
                        return false;
                    }

                }
            </script> 
            <script type="text/javascript">
                function Validate1() {
                    var txtInvoiceNo = document.getElementById('<%=txtInvoiceNo.ClientID%>').value;
                    var ddlFunderName = document.getElementById('<%=ddlFunderName.ClientID%>').value;
                     var ProjectName = document.getElementById('<%=ddlProjectName.ClientID%>').value;
                     var BillDescription = document.getElementById('<%=txtBillDescription.ClientID%>').value;
                     var FromDate = document.getElementById('<%=txtFromDate.ClientID%>').value;
                     var ToDate = document.getElementById('<%=txtToDate.ClientID%>').value;
                     var txtSubHeading = document.getElementById('<%=txtDescription.ClientID%>').value;





                    var SubDescription = document.getElementById('<%=txtSubDescription.ClientID%>').value;
                    var Unit = document.getElementById('<%=txtUnit.ClientID%>').value;
                    var Quantity = document.getElementById('<%=txtQuantity.ClientID%>').value;
                    var UnitPrice = document.getElementById('<%=txtUnitPrice.ClientID%>').value;


                     
                    if (txtInvoiceNo == "") {
                        alert("Enter Invoice Number");
                        document.getElementById('<%=txtInvoiceNo.ClientID%>').focus();
                        return false;
                    }
                    if (ddlFunderName == "") {
                        alert("Select Funder Name");
                        document.getElementById('<%=ddlFunderName.ClientID%>').focus();
                        return false;
                    }
                    if (ProjectName == "") {
                        alert("Select Project Name");
                        document.getElementById('<%=ddlProjectName.ClientID%>').focus();
                        return false;
                    }
                    if (BillDescription == "") {
                        alert("Enter the Bill Description");
                        document.getElementById('<%=txtBillDescription.ClientID%>').focus();
                        return false;
                    }
                    if (FromDate == "") {
                        alert("Enter Bill period From Date");
                        document.getElementById('<%=txtFromDate.ClientID%>').focus();
                        return false;
                    }
                    if (ToDate == "") {
                        alert("Enter Bill period To Date");
                        document.getElementById('<%=txtToDate.ClientID%>').focus();
                         return false;
                    }
                    if (txtSubHeading == "") {
                        alert("Enter Sub Heading");
                        document.getElementById('<%=txtDescription.ClientID%>').focus();
                         return false;
                    }


                    if (SubDescription == "") {
                        alert("Enter Sub Description");
                        document.getElementById('<%=txtDescription.ClientID%>').focus();
                         return false;
                    }
                    if (Unit == "") {
                        alert("Enter Unit");
                        document.getElementById('<%=txtUnit.ClientID%>').focus();
                         return false;
                    }
                    if (Quantity == "") {
                        alert("Enter Quantity");
                        document.getElementById('<%=txtQuantity.ClientID%>').focus();
                         return false;
                    }
                    if (UnitPrice == "") {
                        alert("Enter Unit Price");
                        document.getElementById('<%=txtUnitPrice.ClientID%>').focus();
                         return false;
                     }

                 }
            </script> 

             <script type="text/javascript">
                 function validatee() {
                     var txtInvoiceNo = document.getElementById('<%=txtInvoiceNo.ClientID%>').value;
                     var ddlFunderName = document.getElementById('<%=ddlFunderName.ClientID%>').value;
                    var ProjectName = document.getElementById('<%=ddlProjectName.ClientID%>').value;
                    var BillDescription = document.getElementById('<%=txtBillDescription.ClientID%>').value;
                    var FromDate = document.getElementById('<%=txtFromDate.ClientID%>').value;
                    var ToDate = document.getElementById('<%=txtToDate.ClientID%>').value;
                    var txtSubHeading = document.getElementById('<%=txtDescription.ClientID%>').value;





                    var SubDescription = document.getElementById('<%=txtSubDescription.ClientID%>').value;
                    var Unit = document.getElementById('<%=txtUnit.ClientID%>').value;
                    var Quantity = document.getElementById('<%=txtQuantity.ClientID%>').value;
                     var UnitPrice = document.getElementById('<%=txtUnitPrice.ClientID%>').value;

                     
                     var Tax = document.getElementById('<%=txtTax.ClientID%>').value;
                     var Others = document.getElementById('<%=txtOthers.ClientID%>').value;



                    if (txtInvoiceNo == "") {
                        alert("Enter Invoice Number");
                        document.getElementById('<%=txtInvoiceNo.ClientID%>').focus();
                        return false;
                    }
                     if (ddlFunderName == "") {
                         alert("Select Funder Name");
                         document.getElementById('<%=ddlFunderName.ClientID%>').focus();
                        return false;
                    }
                    if (ProjectName == "") {
                        alert("Select Project Name");
                        document.getElementById('<%=ddlProjectName.ClientID%>').focus();
                        return false;
                    }
                    if (BillDescription == "") {
                        alert("Enter the Bill Description");
                        document.getElementById('<%=txtBillDescription.ClientID%>').focus();
                        return false;
                    }
                    if (FromDate == "") {
                        alert("Enter Bill period From Date");
                        document.getElementById('<%=txtFromDate.ClientID%>').focus();
                        return false;
                    }
                    if (ToDate == "") {
                        alert("Enter Bill period To Date");
                        document.getElementById('<%=txtToDate.ClientID%>').focus();
                        return false;
                    }
                    if (txtSubHeading == "") {
                        alert("Enter Sub Heading");
                        document.getElementById('<%=txtDescription.ClientID%>').focus();
                        return false;
                    }


                    if (SubDescription == "") {
                        alert("Enter Sub Description");
                        document.getElementById('<%=txtDescription.ClientID%>').focus();
                        return false;
                    }
                    if (Unit == "") {
                        alert("Enter Unit");
                        document.getElementById('<%=txtUnit.ClientID%>').focus();
                        return false;
                    }
                    if (Quantity == "") {
                        alert("Enter Quantity");
                        document.getElementById('<%=txtQuantity.ClientID%>').focus();
                        return false;
                    }
                    if (UnitPrice == "") {
                        alert("Enter Unit Price");
                        document.getElementById('<%=txtUnitPrice.ClientID%>').focus();
                        return false;
                    }

                     if (Tax == "") {
                         alert("Enter Tax");
                         document.getElementById('<%=txtTax.ClientID%>').focus();
                        return false;
                    }
                    if (Others == "") {
                        alert("Enter Other amount");
                        document.getElementById('<%=txtOthers.ClientID%>').focus();
                        return false;
                    }

                }
            </script>


                </ContentTemplate>
                </asp:UpdatePanel>
</asp:Content>

