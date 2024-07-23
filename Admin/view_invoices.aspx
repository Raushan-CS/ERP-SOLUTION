<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_invoices.aspx.cs" Inherits="Admin_view_invoices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>SOLUTION ERP</title>
    <meta name="author" content="Angfuzsoft"/>
    <meta name="description" content="Invce - Invoice HTML Solution NGO biling"/>
    <meta name="keywords" content="Invce - Invoice HTML Solution NGO biling"/>
    <meta name="robots" content="INDEX,FOLLOW"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"/>
    <link rel="apple-touch-icon" sizes="57x57" href="../assets/img/apple-icon-57x57.png"/>
    <link rel="apple-touch-icon" sizes="60x60" href="../assets/img/apple-icon-60x60.png"/>
    <link rel="apple-touch-icon" sizes="72x72" href="../assets/img/apple-icon-72x72.png"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon-76x76.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="../assets/img/apple-icon-114x114.png"/>
    <link rel="apple-touch-icon" sizes="120x120" href="../assets/img/apple-icon-120x120.png"/>
    <link rel="apple-touch-icon" sizes="144x144" href="../assets/img/apple-icon-144x144.png"/>
    <link rel="apple-touch-icon" sizes="152x152" href="../assets/img/apple-icon-152x152.png"/>
    <link rel="apple-touch-icon" sizes="180x180" href="../assets/img/apple-icon-180x180.png"/>
    <link rel="icon" type="image/png" sizes="192x192" href="../assets/img/android-icon-192x192.png"/>
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon-32x32.png"/>
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon-96x96.png"/>
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/favicon-16x16.png"/>
    <link rel="manifest" href="../assets/img/manifest.json"/>
    <meta name="msapplication-TileColor" content="#ffffff"/>
    <meta name="msapplication-TileImage" content="../assets/img/ms-icon-144x144.png"/>
    <meta name="theme-color" content="#ffffff"/>
    <link rel="preconnect" href="https://fonts.googleapis.com/"/>
    <link rel="preconnect" href="https://fonts.gstatic.com/" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="../assets/css/app.min.css"/>
   
    <link rel="stylesheet" href="../assets/css/style.css"/>
    <style>
        .bold-see{
            font-weight:600;
            color:black;
        }
        .invoice-table, th, td{
            padding-top:0px;
            padding-bottom:0px;
            border:1px solid black;
        }
    </style>
   
</head>
<body>
      <form id="form1" runat="server">
        <div class="invoice-container-wrap">
        <div class="invoice-container">
            <main>
                <div class="as-invoice invoice_style1" style="height:auto;">
                    <div class="download-inner" id="download_section" style="margin-top:10px; height:auto; " >
                        <div style="background-image:url(../assets/img/Solution-Letter-Head-22.png);height:auto; ">
                        <header class="as-header header-layout1">
                            <div class="row align-items-center justify-content-between">
                               <div class="col-auto">
                                    <div class="header-logo" style="margin-top:0px;">
                                        <img src="../assets/img/Solution_invoice_header.jpeg" style="width:100%;margin-top:0px;margin-left:0px;"/>

                                       </div>
                                </div>
                                <div class="col-auto">
                                    
                                    <hr style="margin-top:1px;margin-bottom:1px;line-height:3px;"/>
                                </div>
                            </div>
                            <div>
                                <div class="row align-items-center">
                                    <p class="invoice-number me-4" style="font-size:18px;font-weight:700;text-align:center; "><b>BILL/INVOICE</b></p>
                                    </div>
                            </div>
                            <div class="header-bottom" style="margin-top:0px;font-size:12px;">
                                <div class="row align-items-center">
                                    <div style="width:50%;">
                                        <div class="border-line">
                                            <address class="bold-see" id="recip_no" runat="server"></address></div>
                                    </div>
                                   
                                    <div style="width:50%;">
                                        <div class="border-line" style="text-align:end;">
                                            <address class="bold-see" id="entry_dat" runat="server"></address>
                                           </div>
                                    </div>
                                  
                                </div>
                            </div>
                        </header>
                        <div class="row justify-content-between mb-1" style="margin-top:0px;font-size:12px;">
                            <div class="col-auto">
                                <div class="invoice-left">
                                   
                                     <p class="bold-see">Bill To :</p>
                                     <p style="margin-top:-20px" class="bold-see"><span class="bold-see" id="NameOfOrganisation"  runat="server"></span></p>
                                    <p style="margin-top:-20px" class="bold-see"><span class="bold-see" id="NameOfCust"  runat="server"></span></p>
                                    <p style="margin-top:-20px" class="bold-see"><span class="bold-see" id="cust_address"  runat="server"></span></p>
                                 
                                </div>
                            </div>
                            <div class="col-auto" style="font-size:12px;">
                                   
                                <div class="invoice-right" style="text-align:left;">    
                                   
                                    <p class="bold-see">Project Name-<span class="bold-see" id="project_name"  runat="server"></span></p>
                                     <p style="margin-top:-20px" class="bold-see">Project Order Details-<span class="bold-see" id="project_ord_details"  runat="server"></span></p>
                                    <p style="margin-top:-20px" class="bold-see">Bill Description-<span class="bold-see" id="bill_desc"  runat="server"></span></p>
                                    <p style="margin-top:-20px" class="bold-see">Bill Period-<span class="bold-see" id="period_from"  runat="server"></span> To <span class="bold-see" id="period_to" runat="server"></span></p>
                                 </div>
                            </div>
                        </div>
                        
                        <div id="tblprg" runat="server" class="bold-see" style="font-size:12px;height:auto;">                        
                        
                          

                      </div>


                         <table style="padding-top:0px;">
                                <tr>
                                    <td style="font-size:12px;width:230px;">
                                        
                                    
                                   <p class="mb-0 bold-see"> <label class="bold-see">Bank Details</label></p>
                                        <p class="mb-0 bold-see"> <label class="bold-see">Bank Name : Union Bank of India  </label></p>
                                    
                                   
                                   <p class="mb-0 bold-see"><label class="bold-see">Branch Name: Tata Nagar</label> </p>
                                    
                                    
                                  <p class="mb-0 bold-see"> <label class="bold-see">Account No : 056911100000238 </label></p>
                                  
                                   
                                    <p class="mb-0 bold-see"><label class="bold-see">IFSC Code : UBIN0805696 </label></p>
                                   
                           
                                    </td>
                                    <td colspan="4" style="vertical-align:top; text-align:center;">
                                        
                                <p class="mb-0 bold-see" ><label class="bold-see">Seal</label></p>
                            
                                    </td>
                                    <td style="font-size:13px;width:320px;">
                                   <p class="mb-0 bold-see" style="font-size:11px;"><span class="bold-see">Note:</span>Kindly contact the concern Project coordinator<br /> if any clarification requires between the interim.</p>     
                                <p style="margin-top:0px;"><b class="mb-0 bold-see">For: SOLUTION, Jamshedpur</b></p>
                               <p><b class="mb-0 bold-see" style="margin-bottom:5px;" >Authorised Signatory</b> </p>

                            
                                    </td>
                                </tr>
                                
                            </table>

                     <%--  <div  style="margin-top:20px;  border:1px solid; padding-left:10px;padding-right:10px;" >

                             <label class="bold-see">Note:</label>&nbsp;&nbsp;<p class="mb-0 bold-see">Kindly contact the concern Project coordinator if any clarification requires between the interim.</p>
                           <div class="row justify-content-between" style="font-size:12px;line-height:18px;margin-bottom:0px;">
                            <div class="col-auto">
                                <div class="invoice-left">
                                    <b>Bank Details</b>
                                    <div style="display:flex;flex-direction:row;">
                                         <label class="bold-see">Bank Name: </label>&nbsp;&nbsp;<p class="mb-0 bold-see">Union Bank of India </p>
                                    </div>
                                    <div style="display:flex;flex-direction:row;">
                                    <label class="bold-see">Branch Name.:</label>&nbsp;&nbsp;<p class="mb-0 bold-see">Tata Nagar </p>
                                    </div>
                                    <div style="display:flex;flex-direction:row;">
                                    <label class="bold-see">Account No.: </label>&nbsp;&nbsp;<p class="mb-0 bold-see">056911100000238</p>
                                    </div>
                                    <div style="display:flex;flex-direction:row;">
                                    <label class="bold-see">IFSC Code:</label>&nbsp;&nbsp;<p class="mb-0 bold-see">UBIN0805696</p>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                            <div class="col-auto" style="font-size:12px;">
                                <table class="total-table" >
                                    
                                   
                                </table>
                            </div>
                            <div class="col-auto" style="margin-top:0px;padding-top:0px;font-size:12px;">
                            </div>
                            <div class="col-auto" style="margin-top:0px;padding-top:0px;font-size:12px;">
                                <p style="margin-bottom:18px;margin-top:0px;"><b style="font-size:13px;">For: SOLUTION, Jamshedpur</b></p>
                               <p><b>Authorised Signatory</b> </p>

                            </div>
                            
                        </div>
                        </div>--%> 
                       
               
                        
                        
                    </div>

                    
                    
                    
                    
                    </div>
                     

                     <div class="row justify-content-center" style="font-size:12px;line-height:18px;margin-bottom:0px;">
                         <div style="width:20%;"></div>
                          <div style="width:20%;">
                                        <div class="border-line">
                                            <asp:Button ID="Button1" runat="server" Text="Print" CssClass="btn-success" height="30px" Width="80px" OnClientClick="javascript:printDiv('download_section')" />
                                        </div>
                          </div>
                         <div style="width:30%;">
                                        <div class="border-line">
                                            <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn-success"  height="30px" Width="80px" OnClientClick="javascript:window.close()" />
                                        </div>
                          </div>
                            
                     </div>
                </div>
                
            </main>
        </div>
    </div>
    
    </form>
    <script src="../assets/js/vendor/jquery-3.6.0.min.js"></script>
    <script src="../assets/js/app.min.js"></script>
    <script src="../assets/js/main.js"></script>
     <script language="javascript" type="text/javascript">
         function printDiv(divID) {
             //Get the HTML of div
             var divElements = document.getElementById(divID).innerHTML;
             //Get the HTML of whole page
             var oldPage = document.body.innerHTML;
             //Reset the page's HTML with div's HTML only
             document.body.innerHTML =
               "<html><head><title></title></head><body>" +
               divElements + "</body>";
             //Print Page
             window.print();
             //Restore orignal HTML
             document.body.innerHTML = oldPage;
         }
    </script>
</body>
</html>
