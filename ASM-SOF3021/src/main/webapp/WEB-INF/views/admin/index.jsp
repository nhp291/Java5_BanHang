<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
    <title>Admin</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="Admin template that can be used to build dashboards for CRM, CMS, etc." />
    <meta name="author" content="Potenza Global Solutions" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <!-- plugin stylesheets -->
    <link rel="stylesheet" type="text/css" href="/admin/assets/css/vendors.css" />
    <!-- app style -->
    <link rel="stylesheet" type="text/css" href="/admin/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/admin/assets/css/custom.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body ng-app="admin-app">
    <!-- begin app -->
    <div class="app">
        <!-- begin app-wrap -->
        <div class="app-wrap">
            <!-- begin pre-loader -->
            <!-- end pre-loader -->
            
            <!-- begin app-header -->
            
            <!-- end app-header -->
            <%@include file="./layout/_header.jsp" %>
            <!-- begin app-container -->
            <div class="app-container">
            
                <!-- begin app-nabar -->
                
                <!-- end app-navbar -->
                <%@include file="./layout/_aside.jsp" %>
                <!-- begin app-main -->
                
                <div class="app-main" id="main">
                    <!-- begin container-fluid -->
                    <div ng-view class="container-fluid">
                        <!-- begin row -->
                        
                        <!-- end row -->
                    </div>
                    <!-- end container-fluid -->
                </div>
                <!-- end app-main -->
            </div>
            <!-- end app-container -->
        </div>
        <!-- end app-wrap -->
    </div>
    <!-- end app -->

    <!-- plugins -->
    <script src="/admin/assets/js/vendors.js"></script>

    <!-- custom app -->
    <script src="/admin/assets/js/app.js"></script>
    <script src="/admin/assets/js/ctrl/admin-app.js"></script>
    <script src="/admin/assets/js/ctrl/brand-ctrl.js"></script>
    <script src="/admin/assets/js/ctrl/category-ctrl.js"></script>
    <script src="/admin/assets/js/ctrl/product-ctrl.js"></script>
    <script src="/admin/assets/js/ctrl/user-ctrl.js"></script>
    <script src="/admin/assets/js/ctrl/authenticate-ctrl.js"></script>
    <script src="/admin/assets/js/ctrl/dashboard-ctrl.js"></script>
</body>


</html>