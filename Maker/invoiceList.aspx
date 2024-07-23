<%@ Page Title="" Language="C#" MasterPageFile="~/Maker/MakerMasterPage.master" AutoEventWireup="true" CodeFile="invoiceList.aspx.cs" Inherits="Maker_invoiceList" %>

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                     
                    <div class="col-md-12">
                                <div class="col-xl-12 col-md-12 table table-bordered">
                                <asp:GridView ID="GridView2" runat="server" EmptyDataText="No Bills" AutoGenerateColumns="False" CellPadding="2" CellSpacing="5" Width="100%" OnRowCommand="GridView2_RowCommand" GridLines="Both" AllowPaging="True" PageSize="25" OnPageIndexChanging="GridView2_PageIndexChanging">
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


                                        <asp:TemplateField HeaderText="Other Amount" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("others")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total Bill Amount" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("grand_tot")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Bill Status" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("status")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Comment" HeaderStyle-HorizontalAlign="Center" >
                                            <ItemTemplate>
                                                <%#Eval("comment")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                      
                                         <asp:TemplateField headertext="Action">               
                                      <ItemTemplate>
                                            
                                             <%-- <a href="MakePayment.aspx?MEMNO=<%#Eval("Id")%>" class="btn btn-primary">Payment</a>&nbsp;|&nbsp;--%>
                                           
                                            <a href="javascript:" class="btn btn-primary" onclick='javascript:window.open("viewInvoice.aspx?invoiceNo=<%#Eval("invoice_no") %>","","height=1000,width=1000,left=400;top=20,status=yes,resizable=no,toolbar=no,menubar=no,location=center,scrollbars=no")'>View</a>&nbsp;|&nbsp;
                                          <a href="edit_invoice.aspx?InvoiceNo=<%#Eval("invoice_no")%>" class="btn btn-primary">Edit</a>
                                       <%--   |&nbsp;
                                            <a><asp:Button ID="Button1" type="button" class="btn btn-outline-danger" runat="server" Text="Remove" CommandName="Remove" OnClientClick="return confirm_Delete();" CommandArgument='<%# Eval("Id") %>'/></a>--%>
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
            </ContentTemplate>
            </asp:UpdatePanel>
           
      
</asp:Content>

