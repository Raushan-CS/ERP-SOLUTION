<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="Admin_AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Admin Dashboard</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="AdminDashboard.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3 id="userentered" runat="server"></h3>

                                <p>User Entry</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person"></i>
                            </div>
                            <a href="UserEntry.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3 id="stdEntered" runat="server"></h3>

                                <p>Project  Entry</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person"></i>
                            </div>
                            <a href="CreateProject.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3 id="facEntered" runat="server"></h3>

                                <p> Maker/Checker Entry</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person"></i>
                            </div>
                            <a href="CreateUser.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                  
                </div>
              
             <%--   <div class="row">
                    
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3 id="bkEntry" runat="server"></h3>

                                <p>Book Entry</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-ios-book"></i>
                            </div>
                            <a href="Book_List.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                   
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3 id="bkIssue" runat="server">65</h3>

                                <p>Books Issued</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-ios-book-outline"></i>
                            </div>
                            <a href="Book_IssueDetails.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>--%>

             <%--   <div class="row">
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Student Query/Messages  </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">



                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Student Name</th>
                                            <th>Mobile No.</th>
                                            <th>Notification</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Test data</td>
                                            <td>Test data
                      
                                            </td>
                                            <td>Test data</td>
                                            <td>Test data</td>
                                            
                                        </tr>
                                      

                                    </tbody>
                                    <tfoot>
                                      
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                     <div class="col-lg-4 col-6">
                        <!-- small box -->
                         <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Faculty Query/Messages</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">



                                <table id="Table1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Faculty Name</th>
                                            <th>Mobile No.</th>
                                            <th>Notification</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Test data</td>
                                            <td>Test data
                     
                                            </td>
                                            <td>Test data</td>
                                            <td>Test data</td>
                                           
                                        </tr>
                                     

                                    </tbody>
                                    <tfoot>
                                        
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="card bg-gradient-success">
                            <div class="card-header border-0">

                                <h3 class="card-title">
                                    <i class="far fa-calendar-alt"></i>
                                    Calendar
                </h3>
                              
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body pt-0">
                                <!--The calendar -->
                                <div id="calendar" style="width: 100%"></div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!-- ./col -->


                </div>
                <!-- /.row -->--%>

            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->

        <!-- /.content-wrapper -->
        

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
</asp:Content>

