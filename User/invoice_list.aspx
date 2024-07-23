<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="invoice_list.aspx.cs" Inherits="User_invoice_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <style>
        table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  text-align:center;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
             <div class="content-wrapper">
           <%-- <form id="form1" runat="server">--%>
                <div class="container-fluid px-4">

                    <div class="row col-lg-12">
                        <div class="col-md-12">
                            <div class="MainForm">
                                <h4 style="text-align:center;border:2px solid green;background:#c5ebc5;margin-top:5px;">Invoice List</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row col-lg-12">
                    <div class="col-sm-2" style="display:flex;flex-direction:row;">
                        <asp:TextBox ID="txtInvoice_No" runat="server" style="width:200px;margin-bottom:25px;" class="form-control" AutoPostBack="true" OnTextChanged="txtInvoice_No_TextChanged" placeholder="Search By Invoice No">
                        </asp:TextBox>
                       
                    </div>
                    <div class="col-sm-2" style="display:flex;flex-direction:row;">
                       <asp:DropDownList ID="ddlProjectName" DataTextField="project_name"  DataValueField="project_name"  Style="width: 200px;"  runat="server" class="form-control " AutoPostBack="true" OnTextChanged="btnSearchProject_Click"  >
                                                                    </asp:DropDownList>
                      
                   
                    </div>
                    <div class="col-sm-4" style="display:flex;flex-direction:row;">
                       <asp:Label ID="From" runat="server" Text="From" style="margin-right:10px;"></asp:Label>
                            <asp:TextBox ID="DATE1" runat="server" style="width:200px;margin-right:10px;margin-bottom:25px;" class="form-control" placeholder="Search By Date" TextMode="date">
                        </asp:TextBox>
                            <asp:Label ID="To" runat="server" Text="To" style="margin-right:20px;"></asp:Label>
                            <asp:TextBox ID="DATE2" runat="server" style="width:200px;margin-bottom:25px;" class="form-control" placeholder="Search By Date" TextMode="date" AutoPostBack="true" OnTextChanged="Button3_Click">
                        </asp:TextBox>
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                      
                    </div>
                         <div class="col-sm-2" style="display:flex;flex-direction:row;margin-right:20px;">
<asp:Button id="btnExporttoExcel" runat="server"  OnClick="btnExporttoExcel_Click" Style="width: 200px;margin-bottom:25px;" Text="Export to Excel" class="btn btn-outline-primary" />
                       
                       
                    </div>
                     
                    <div class="col-md-12">
                                <div class="col-xl-12 col-md-12 table table-bordered">
                                <asp:GridView ID="GridView2" runat="server" EmptyDataText="No Bills" AutoGenerateColumns="False" CellPadding="2" CellSpacing="5" Width="100%"  GridLines="Both" AllowPaging="True" ShowFooter="true" PageSize="25" OnPageIndexChanging="GridView2_PageIndexChanging" OnRowDataBound="GridView2_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S No.">
                                            <ItemTemplate>
                                                <%# Container.DisplayIndex + 1%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Bill Date" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("entry_date", "{0:dd-MM-yyyy}")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Bill No." HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("invoice_no")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Project Name" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("project_name")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Project Value" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("project_value")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Company/Dept." HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("billing_name")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Bill Amount" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%#Eval("total_amt")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="GST Amount" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("tax")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        
                                        <asp:TemplateField HeaderText="Total Bill Amount" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                 <asp:Label ID="lblGtotal" runat="server" Text='<%#Eval("grand_tot")%>' /> 
                                            </ItemTemplate>
                                             <FooterTemplate>
                                                    <asp:Label ID="lblTotalBillAmount" runat="server" />
                                             </FooterTemplate>
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Payment Received" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblPayReceive" runat="server" Text='<%#Eval("payment_received")%>' />
                                            </ItemTemplate>
                                              <FooterTemplate>
                                                    <asp:Label ID="lblTotalPayReceived" runat="server" />
                                                </FooterTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Payment Dues" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                 <asp:Label ID="lblPayDue" runat="server" Text='<%#Eval("payment_dues")%>' />
                                            </ItemTemplate>
                                              <FooterTemplate>
                                                    <asp:Label ID="lblTotalDues" runat="server"  />
                                                </FooterTemplate>
                                             </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Prepared By" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("EnteredBy")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       


                                     
                                      
                                         <asp:TemplateField headertext="Action">               
                                      <ItemTemplate>
                                            
                                             
                                           
                                            <a href="javascript:" class="btn btn-primary" onclick='javascript:window.open("viewInvoice.aspx?invoiceNo=<%#Eval("invoice_no") %>","","height=1000,width=1000,left=400;top=20,status=yes,resizable=no,toolbar=no,menubar=no,location=center,scrollbars=no")'>View</a>&nbsp;|&nbsp;
                                           <a href="user_payment_info.aspx?invoiceNo=<%#Eval("invoice_no") %>" class="btn btn-primary">Payment</a>
                                       
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#363636" ForeColor="White" />
                                     
                                </asp:GridView>


                           

                            </div>
                        </div>
                        </div>
                </div>
               <%-- </form>--%>
                 </div>
            
</asp:Content>

