<%@ Page Title="" Language="C#" MasterPageFile="~/Maker/MakerMasterPage.master" AutoEventWireup="true" CodeFile="edit_invoice.aspx.cs" Inherits="Maker_edit_invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                                <h1>Edit Invoice details</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="MakerDashboard.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Edit Invoice Details</li>
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
                                        <h3 class="card-title">Edit Invoice Details</h3>
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
                                                                <label id="lblBillTo" class="col-sm-4 col-form-label">Bill To</label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtDesignation" class="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblBillName" class="col-sm-4 col-form-label">Company/Dept.</label>
                                                                <div class="col-sm-8">
                                                                     
                                                                   <asp:TextBox ID="txtFunderName" class="form-control" runat="server" ReadOnly="true" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblProject" class="col-sm-4 col-form-label">Project Name</label>
                                                                <div class="col-sm-8">
                                                                     <asp:TextBox ID="txtProjectName" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                                     
                                                                </div>
                                                            </div>
                                                        </div>
                                                       
                                                    </div>
                                                 </div>
                                                  <div class="col-md-12">
                                                    <div class="form-group row">
                                                         
                                                        <div class="col-md-3">
                                                            <div class="form-group row">
                                                                <label id="lblProjectOrder" class="col-sm-4 col-form-label">Project Order/Details </label>
                                                                <div class="col-sm-8">
                                                                   <asp:TextBox ID="txtProjectOrdDetails"  runat="server" class="form-control"></asp:TextBox>
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
                                                                    <asp:DropDownList ID="txtSubDesc" DataTextField="project_head"  DataValueField="project_head"  Style="width: 100%;" runat="server" class="form-control select2bs4"  >
                                                                    </asp:DropDownList>
                                                                  <%-- <asp:TextBox ID="txtSubDesc" class="form-control"  runat="server"></asp:TextBox>--%>
                                                                  </div>
                                                                 <div class="input-group col-sm-4">
                                                                         <asp:Button ID="btnAddHeading" runat="server" class="btn btn-primary" OnClick="btnAddHeading_Click" Text="Add" Width="100"   />
                                                                            
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
                                                                   <asp:TextBox ID="txtQty" class="form-control"  width="100" runat="server" AutoPostBack="true" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                                                                    <label id="lblMsg2" runat="server"></label>
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
                                                                        <asp:Button ID="btnAddSubDesc" runat="server" class="btn btn-primary" Text="Add"    OnClick="btnAddSubDesc_Click" OnClientClick="return Validate1();" />
                                                                          <%--<asp:Button ID="Button3" runat="server" class="btn btn-outline-primary" Text="ADD" OnClientClick="return validate();" showfooter="true" OnClick="SUBMIT_Click"></asp:Button>--%>
                                                                       </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                   
                                                </div>
                                                
                                                
                                                
                                            </div>
                                        </div>
          

                                          <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group row">
                                                                <label id="lblTotal" class="col-sm-4 col-form-label">Total</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="txtTotal" class="form-control" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                         <div class="col-md-4">
                                                            <div class="form-group row">
                                                                <label id="lblTax" class="col-sm-4 col-form-label">Tax if any</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="txtTax" class="form-control" runat="server" OnTextChanged="txtTax_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                         <div class="col-md-4">
                                                            <div class="form-group row">
                                                                <label id="lblOthers" class="col-sm-4 col-form-label">Others if any</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="txtOthers" class="form-control" runat="server" OnTextChanged="txtOthers_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                     
                                                       
                                                    </div>
                                                </div>

                                          <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group row">
                                                                <label id="lblGrandTotal" class="col-sm-4 col-form-label">Grand Total</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="totalamount" class="form-control" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <%-- <div class="col-md-4">
                                                            <div class="form-group row">
                                                                <label id="lblPaymentReceived" class="col-sm-4 col-form-label">Total Received</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="paidamount" class="form-control" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>

                                                         <div class="col-md-4">
                                                            <div class="form-group row">
                                                                <label id="lblPaymentDues" class="col-sm-4 col-form-label">Total Dues</label>
                                                                <div class="input-group col-sm-8">
                                                                   <asp:TextBox ID="balancedue" class="form-control" runat="server" Width="100%" Enabled="false" ></asp:TextBox>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>--%>
                                                        </div>
                                              </div>

                                           <div class="col-md-12 text-center" id="btnpanel" runat="server" style="flex-align:center">
                                            <asp:GridView ID="GridView2" runat="server" Width="50%" AutoGenerateColumns="false"  OnRowDataBound="GridView2_RowDataBound" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating" OnRowDeleting="GridView2_RowDeleting"
                                                CssClass="height" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="ID" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'   ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDescr" runat="server" Text='<%#Eval("desc_head")%>'></asp:Label>
                                                        </ItemTemplate>
                                                         <EditItemTemplate>
                                                            <asp:TextBox ID="txtDescr" runat="server" Text='<%#Eval("desc_head") %>'></asp:TextBox>
                                                           </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUnit" runat="server" Text='<%#Eval("unit") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtUnit" runat="server" Text='<%#Eval("unit") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField> 
                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQty" runat="server" Text='<%#Eval("quantity")%>'></asp:Label>
                                                        </ItemTemplate>
                                                         <EditItemTemplate>
                                                            <asp:TextBox ID="txtQty" runat="server" Text='<%#Eval("quantity") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unit Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUPrice" runat="server" Text='<%#Eval("unit_price") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtUPrice" runat="server"  Text='<%#Eval("unit_price") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField> 
                                                    <asp:TemplateField HeaderText="Amount   ">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmt" runat="server" Text='<%#Eval("amount")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtAmt" runat="server"  Text='<%#Eval("amount") %>'></asp:TextBox>
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
                     var txtProjectName = document.getElementById('<%=txtProjectName.ClientID%>').value;
                  
                     var txtBillDescription = document.getElementById('<%=txtBillDescription.ClientID%>').value;
                     var FromDate = document.getElementById('<%=txtFromDate.ClientID%>').value;
                     var ToDate = document.getElementById('<%=txtToDate.ClientID%>').value;
                     var txtSubDesc = document.getElementById('<%=txtSubDesc.ClientID%>').value;








                     if (txtSubDesc == "") {
                         alert("Enter Sub Heading");
                         document.getElementById('<%=txtSubDesc.ClientID%>').focus();
                        return false;
                    }
                    if (txtInvoiceNo == "") {
                        alert("Enter Invoice Number ");
                        document.getElementById('<%=txtInvoiceNo.ClientID%>').focus();
                        return false;
                    }
                   
                     if (txtProjectName == "") {
                        alert("Select Project Name");
                        document.getElementById('<%=txtProjectName.ClientID%>').focus();
                        return false;
                    }
                     if (txtBillDescription == "") {
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
                    var txtProjectName = document.getElementById('<%=txtProjectName.ClientID%>').value;
                   
                    var txtBillDescription = document.getElementById('<%=txtBillDescription.ClientID%>').value;
                    var FromDate = document.getElementById('<%=txtFromDate.ClientID%>').value;
                    var ToDate = document.getElementById('<%=txtToDate.ClientID%>').value;
                   




                    var SubDescription = document.getElementById('<%=txtSubDescription.ClientID%>').value;
                    var Unit = document.getElementById('<%=txtUnit.ClientID%>').value;
                    var Quantity = document.getElementById('<%=txtQty.ClientID%>').value;
                    var UnitPrice = document.getElementById('<%=txtUnitPrice.ClientID%>').value;



                    if (txtSubDesc == "") {
                        alert("Enter Sub Heading");
                        document.getElementById('<%=txtSubDesc.ClientID%>').focus();
                         return false;
                     }
                     if (txtInvoiceNo == "") {
                         alert("Enter Invoice Number ");
                         document.getElementById('<%=txtInvoiceNo.ClientID%>').focus();
                        return false;
                    }
                   
                    if (txtProjectName == "") {
                        alert("Select Project Name");
                        document.getElementById('<%=txtProjectName.ClientID%>').focus();
                        return false;
                    }
                    if (txtBillDescription == "") {
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


                    if (txtSubDesc == "") {
                        alert("Enter Sub Description");
                        document.getElementById('<%=txtSubDesc.ClientID%>').focus();
                        return false;
                    }
                    if (Unit == "") {
                        alert("Enter Unit");
                        document.getElementById('<%=txtUnit.ClientID%>').focus();
                        return false;
                    }
                    if (Quantity == "") {
                        alert("Enter Quantity");
                        document.getElementById('<%=txtQty.ClientID%>').focus();
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
                     var txtProjectName = document.getElementById('<%=txtProjectName.ClientID%>').value;
                    
                     var txtBillDescription = document.getElementById('<%=txtBillDescription.ClientID%>').value;
                     var FromDate = document.getElementById('<%=txtFromDate.ClientID%>').value;
                     var ToDate = document.getElementById('<%=txtToDate.ClientID%>').value;
                  




                     var SubDescription = document.getElementById('<%=txtSubDescription.ClientID%>').value;
                     var Unit = document.getElementById('<%=txtUnit.ClientID%>').value;
                     var Quantity = document.getElementById('<%=txtQty.ClientID%>').value;
                     var UnitPrice = document.getElementById('<%=txtUnitPrice.ClientID%>').value;



                     var Tax = document.getElementById('<%=txtTax.ClientID%>').value;
                     var Others = document.getElementById('<%=txtOthers.ClientID%>').value;



                     if (txtInvoiceNo == "") {
                         if (txtSubDesc == "") {
                             alert("Enter Sub Heading");
                             document.getElementById('<%=txtSubDesc.ClientID%>').focus();
                             return false;
                         }
                         if (txtInvoiceNo == "") {
                             alert("Enter Invoice Number ");
                             document.getElementById('<%=txtInvoiceNo.ClientID%>').focus();
                             return false;
                         }
                         
                         if (txtProjectName == "") {
                             alert("Select Project Name");
                             document.getElementById('<%=txtProjectName.ClientID%>').focus();
                             return false;
                         }
                         if (txtBillDescription == "") {
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


                         if (txtSubDesc == "") {
                             alert("Enter Sub Description");
                             document.getElementById('<%=txtSubDesc.ClientID%>').focus();
                             return false;
                         }
                         if (Unit == "") {
                             alert("Enter Unit");
                             document.getElementById('<%=txtUnit.ClientID%>').focus();
                             return false;
                         }
                         if (Quantity == "") {
                             alert("Enter Quantity");
                             document.getElementById('<%=txtQty.ClientID%>').focus();
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
                 }
            </script>


                </ContentTemplate>
                </asp:UpdatePanel>

</asp:Content>

