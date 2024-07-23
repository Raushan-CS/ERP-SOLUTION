<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="user_payment_info.aspx.cs" Inherits="User_payment_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        .MainForm {
            margin-top: 20px;
           /* margin-left: 500px;*/
            border-radius: 15px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border: 2px solid #f42420;
            padding: 25px;
        }
    </style>
    <script type="text/javascript">
        function validate() {
            var query = document.getElementById('<%=CurPay.ClientID%>').value;
            if (query == "" || query == "0") {
                alert("Please Enter Current Pay");
                document.getElementById('<%=CurPay.ClientID%>').focus();
                return false;
            }

        }
        function CheckNumericValue(e) {
            var key = e.which ? e.which : e.keyCode;
            //enter key  //backspace //tabkey      //escape key                  
            if ((key >= 48 && key <= 57) || key == 13 || key == 8 || key == 9 || key == 27) {
                return true;
            }
            else {
                alert("Enter Number");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
     <div id="layoutSidenav_content">
        <main>
            <form >
                <div class="container-fluid px-4">

                    <div class="row col-lg-12" >
                        <div class="col-md-9">
                            <div class="MainForm">
                                <h3 style="text-align: center; border: 2px solid green; background: #c5ebc5;">Payment Receipt</h3>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label for="recipno" class="form-label">Invoice No</label>        
                                <asp:TextBox ID="recipno" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                       <asp:HiddenField id="hiddenfield1" runat="server"/>
                                
                                    </div>
                                    <div class="col-sm-4">
                                        <label for="exampleFormControlTextarea1" class="form-label">Project Name</label>
                                        <asp:TextBox ID="Projectname" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                                    </div>
                                    <div class="col-sm-4">
                                        <label for="exampleFormControlTextarea1" class="form-label">Project Value</label>
                                        <asp:TextBox ID="Projectvalue" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                                    </div>
                                    <div class="col-sm-4">
                                        <label for="exampleFormControlTextarea1" class="form-label">Total Bill Amount</label>
                                        <asp:TextBox ID="TotalAm" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                 
                                    </div>
                                    <div class="col-sm-4">
                                         <label for="exampleFormControlTextarea1" class="form-label">Paid Amount</label>
                                        <asp:TextBox ID="PaidAm" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                                    </div>
                                    <div class="col-sm-4">
                                        <label for="exampleFormControlTextarea1" class="form-label">Dues Amount </label>
                                        <asp:TextBox ID="DueAm" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                                    </div>
                                    <div class="col-sm-4">
                                        <label for="exampleFormControlTextarea1" class="form-label">Current Payment</label>
                                        <asp:TextBox ID="CurPay" runat="server" CssClass="form-control" placeholder="0" AutoPostBack="true" OnTextChanged="CurPay_TextChanged" onkeypress="return CheckNumericValue(event)"></asp:TextBox>
                                        
                                    </div>

                                    <div class="col-sm-4">
                                        <label for="chequeno" class="form-label">MODE (Cash/Cheque/DD/Online)</label>
                                        <asp:TextBox ID="chequeno" runat="server" CssClass="form-control" ></asp:TextBox>

                                    </div>
                                    <div class="col-sm-4">
                                        <label for="bycash" class="form-label">Transaction No</label>
                                        <asp:TextBox ID="TransactionNo" runat="server" CssClass="form-control" ></asp:TextBox>
                                        
                                         
                                    </div>

                                      <div class="col-sm-4">
                                        <label for="bycash" class="form-label">Project Head</label>
                                      
                                        <asp:DropDownList ID="ddlProjectHead" DataTextField="project_head"  DataValueField="project_head"  Style="width: 100%;" runat="server" class="form-control select2bs4"  >
                                                                    </asp:DropDownList>
                                         
                                    </div>
                                    
                                    <div class="col-sm-4">
                                       <%-- <label for="prnno" class="form-label">Prn No</label>
                                        <asp:TextBox ID="prnno" runat="server" CssClass="form-control" ></asp:TextBox>--%>
                                        <asp:TextBox ID="UserId" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                      <%-- <asp:TextBox ID="RowsCount" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                               --%>
                                    </div>
                                </div>
                                       
                                        <div runat="server" id="message" style="color: dodgerblue;"></div>
                                <div class="d-grid gap-2 col-md-6 mx-auto" style="margin-left: 50%; margin-right: 50%; margin-top: 10px; text-align:center;">
                                    <asp:Button ID="SUBMIT" runat="server" class="btn btn-outline-primary" Text="Submit" OnClientClick="return validate();"  OnClick="Submit_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                       
                         
<%--                        <div class="row">--%>
                            <div class="col-md-9">
                                <div class="col-md-12" style="display:flex;flex-direction:row;margin-top:25px;">
                                    <asp:TextBox ID="Date1" runat="server" style="width:200px;margin-right:50px;margin-bottom:25px;" class="form-control" placeholder="Search By Date" TextMode="Date">
                                    </asp:TextBox>
                                    <asp:TextBox ID="Date2" runat="server" style="width:200px;margin-right:50px;margin-bottom:25px;" class="form-control" placeholder="Search By Date" TextMode="Date" AutoPostBack="true" OnTextChanged="Button2_Click">
                                    </asp:TextBox>
                                    <%--<asp:Button ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" class="btn btn-primary" style="margin-bottom:25px;"/>--%>
                                </div>
                                 <h3 style="text-align: center; border: 2px solid green; background: #c5ebc5; margin-top: 30px;">Payment History</h3>
                                <div class=" col-md-12 table">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="" EnableModelValidation="True" CellPadding="2" CellSpacing="5" Width="100%"  GridLines="Both">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S No.">
                                                <ItemTemplate>
                                                    <%# Container.DisplayIndex + 1%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="ID" >
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'   ></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Invoice No" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Eval("invoice_no")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                               <asp:TemplateField HeaderText="Project Head" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Eval("project_head")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Total Amount" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Eval("grand_tot")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Total Paid" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Eval("payment_received")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Payment" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Eval("cur_pay")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Eval("entry_date")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Time" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Eval("entry_time")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                  <a href="javascript:" class="btn btn-primary" onclick='javascript:window.open("user_transaction_receipt.aspx?invoiceNo=<%#Eval("invoice_no") %>&ID=<%#Eval("ID") %> ","","height=1000,width=1000,left=400;top=20,status=yes,resizable=no,toolbar=no,menubar=no,location=center,scrollbars=no")'>View</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#363636" ForeColor="White" />

                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </main>
    </div>
        </div>
</asp:Content>

