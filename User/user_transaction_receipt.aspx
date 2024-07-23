<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_transaction_receipt.aspx.cs" Inherits="User_user_transaction_receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement Receipt</title>
    <meta charset="UTF-8"/>
    <style type="text/css">
        .btn-success1 {
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
            width: 150px;
            height:30px
        }

        .table {
            border-collapse: collapse;
        }

        h2 {
            margin-bottom: 0px;
        }

        p {
            margin-bottom: 0px;
        }
        .table tr td {
            font-family: Tahoma, Verdana;
            border:solid 1px;
            text-align: center;
            font-size: 13px;
            padding: 4px;
            vertical-align:top;
        }
    </style>
    <script type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML =
              "<html><head></head><body>" +
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;
        }
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
     <form id="form1" runat="server">
        <div id="printablediv">
            <div id="Div1" style=" margin: 0 auto" runat="server">
                <div style="width:100%;">
                  
                   <img src="../assets/img/Solution_invoice_header.jpeg" style="width:100%;" />
            <hr />
                </div>
              
                <table class="table" cellpadding="0" cellspacing="0" style="width:100%;background-image:url(../assets/img/transactionhead.png);">
                   
                    <tr>
                        <td  colspan="5">
                             <b style="font-size:15px; text-align:center;">ACKNOWLEDGEMENT RECEIPT</b>
                            <p>
                                 <span  style="float:left;margin-left: 10px;"><b>Received with Thanks from : <asp:Label ID="lbl_name" runat="server"></asp:Label></b></span><span style="margin-right: 10px;float:right;" ><b>Receipt No : <asp:Label ID="lbl_recipt" runat="server"></asp:Label></b></span><br />
                            </p>

                            <p>
                               <span  style="float:left;margin-left: 10px;"><b>Address : <asp:Label ID="lbl_address" runat="server"></asp:Label></b></span><span style="margin-right: 10px;float:right;" ><b> Payment Received Date: <asp:Label ID="lbl_date" runat="server"></asp:Label></b></span><br />
                               
                            </p>
                        </td>
                      
                    </tr>

                    <tr>
                         <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>Contact: </b> </p></td>
                       <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="contact" runat="server"></span></b></p></td>
                    </tr>
                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>Email:</b> </p></td>
                        <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="email" runat="server"></span></b></p></td>
                    </tr>

                     <tr>
                         <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>Pan:</b>  </p></td>
                       <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="pan" runat="server"></span></b></p></td>
                    </tr>

                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>UID:</b>  </p></td>
                         <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="uid" runat="server"></span></b></p></td>
                    </tr>

                    <tr >
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2" >
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>Amount Received:</b>  </p>
                        </td>
                        <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><i class="fa fa-rupee"></i><b><span id="amount" runat="server"></span></b></p></td>
                    </tr>

                    <tr>
                         <td style="height:15px;padding:1px;padding:1px;" colspan="2">
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>Amount in Words:</b> </p>
                        </td>
                        <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="amt_words" runat="server"></span></b></p></td>
                    </tr>
                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2">
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>MODE(CASH/CHEQUE/DD/ONLINE):</b> </p>
                        </td>
                         <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="pay_mode" runat="server"></span></b></p></td>
                    </tr>

                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2">
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>Transaction No.:</b> </p>
                        </td>

                         <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="transaction_no" runat="server"></span></b></p></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height:15px;padding:1px;padding:1px;" >
                            <p style="float:initial;margin-right:5px; margin-top:5px;"><b>Received on Account-Head </b> </p>
                        </td>
                        <td colspan="3" style="height:15px;padding:1px;padding:1px;" >
                            <p style="float:initial;margin-right:5px; margin-top:5px; "><b><span id="majorHead" runat="server"></span> </b></p>
                        </td>
                    </tr>
                    <tr >
                        <td style="text-align: left;" rowspan="2" ><p style="margin-left: 5px; vertical-align:central;"  >
                                <b>Date: <asp:Label ID="cudt" runat="server"></asp:Label></b><br />
                               <br />
                            </p></td>
                         <td style="text-align: left;" rowspan="2" ><p style="margin-left: 5px; margin-top:0px;text-align:center;" >
                                <b>Revenue or Seal:</b><br />
                               
                            </p></td>
                         <td style="text-align: left;"   colspan="3"><p style="margin-left: 5px;margin-top:0px; text-align:center;" >
                                <b style="font-size:10px; vertical-align:top;">Kindly contact the concerned coordinator for any clarifications:</b>
                                <p style="margin-top:2px;text-align:center; "><b>For SOLUTION</b></p><br />
                               <br />
                            </p></td>
                    </tr>
                    <tr>
                      <td style="text-align: center;" ><b style="color: red;">Accounts Manager</b></td>
                        <td style="text-align: center;" ><b style="color: red;">Treasurer/Secretary</b></td>
                    </tr>
                </table>
            </div>



            <div style="width:90%;margin:10px 0;">
                <img src="../assets/img/maint.jpg" />
            </div>
            <div id="Div2" style=" margin: 0 auto" runat="server">
                <div style="width:100%;">
                 
                    <img src="../assets/img/Solution_invoice_header.jpeg" style="width:100%;" />
            <hr />
                </div>
              
                 <table class="table" cellpadding="0" cellspacing="0" style="width: 100%;background-image:url(../assets/img/transactionhead.png)">
                   
                    
                    <tr>
                        <td  colspan="5">
                             <b style="font-size:15px; text-align:center;">ACKNOWLEDGEMENT RECEIPT</b>
                            <p>
                                 <span  style="float:left;margin-left: 10px;"><b>Received with Thanks from : <asp:Label ID="lblReceived" runat="server"></asp:Label></b></span><span style="margin-right: 10px;float:right;" ><b>Receipt No : <asp:Label ID="lblReceipt" runat="server"></asp:Label></b></span><br />
                            </p>

                            <p>
                               <span  style="float:left;margin-left: 10px;"><b>Address : <asp:Label ID="lblAddress" runat="server"></asp:Label></b></span><span style="margin-right: 10px;float:right;" ><b> Payment Received Date: <asp:Label ID="LblReceivedDate" runat="server"></asp:Label></b></span><br />
                               
                            </p>
                        </td>
                      
                    </tr>
                 
                   <tr>
                         <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>Contact: </b> </p></td>
                       <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="contact1" runat="server"></span></b></p></td>
                    </tr>
                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>Email: </b></p></td>
                        <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="email1" runat="server"></span></b></p></td>
                    </tr>

                     <tr>
                         <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>Pan: </b> </p></td>
                       <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="pan1" runat="server"></span></b></p></td>
                    </tr>

                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2"><p style="float:left;margin-right:5px;margin-left:5px;"><b>UID: </b> </p></td>
                         <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="uid1" runat="server"></span></b></p></td>
                    </tr>

                    <tr >
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2" >
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>Amount Received:</b>  </p>
                        </td>
                        <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><i class="fa fa-rupee"></i><b><span id="amtReceived" runat="server"></span></b></p></td>
                    </tr>

                    <tr>
                         <td style="height:15px;padding:1px;padding:1px;" colspan="2">
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>Amount in Words:</b> </p>
                        </td>
                        <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="amtReceived_words" runat="server"></span></b></p></td>
                    </tr>
                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2">
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>MODE(CASH/CHEQUE/DD/ONLINE):</b> </p>
                        </td>
                         <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="mode" runat="server"></span></b></p></td>
                    </tr>

                    <tr>
                        <td style="height:15px;padding:1px;padding:1px;" colspan="2">
                            <p style="float:left;margin-right:5px;margin-left:5px;"><b>Transaction No.:</b> </p>
                        </td>

                         <td  style="height:15px;padding:1px;padding:1px;"colspan="3"> <p style="float:left;margin-right:5px;margin-left:5px;"><b><span id="transact" runat="server"></span></b></p></td>
                    </tr>
                    <tr>
                         <td colspan="2" style="height:15px;padding:1px;padding:1px;" >
                            <p style="float:initial;margin-right:5px; margin-top:5px;"><b>Received on Account-Head </b></p>
                        </td>
                        <td colspan="3" style="height:15px;padding:1px;padding:1px;" >
                            <p style="float:initial;margin-right:5px; margin-top:5px; "><b><span id="majrHead" runat="server"></span> </b></p>
                        </td>
                    </tr>
                    <tr >
                        <td style="text-align: left;" rowspan="2" ><p style="margin-left: 5px; vertical-align:central;"  >
                                <b>Date: <asp:Label ID="current" runat="server"></asp:Label></b><br />
                               <br />
                            </p></td>
                         <td style="text-align: left;" rowspan="2" ><p style="margin-left: 5px; margin-top:0px;text-align:center;" >
                                <b>Revenue or Seal:</b><br />
                               
                            </p></td>
                          <td style="text-align: left;"   colspan="3"><p style="margin-left: 5px;margin-top:0px; text-align:center;" >
                                <b style="font-size:10px; vertical-align:top;">Kindly contact the concerned coordinator for any clarifications:</b>
                                <p style="margin-top:2px;text-align:center; "><b>For SOLUTION</b></p><br />
                               <br />
                            </p></td>
                    </tr>
                    <tr>
                      <td style="text-align: center;" ><b style="color: red;">Accounts Manager</b></td>
                        <td style="text-align: center;" ><b style="color: red;">Treasurer/Secretary</b></td>
                    </tr>
                </table>

            </div>
        </div>
        <table style="text-align: center; width: 100%; margin-top: 50px;">
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Print" CssClass="btn-success1" OnClientClick="javascript:printDiv('printablediv')" />
                    <asp:Button ID="Button1" runat="server" Text="Cancel" CssClass="btn-success1" OnClientClick="javascript:window.close()" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
