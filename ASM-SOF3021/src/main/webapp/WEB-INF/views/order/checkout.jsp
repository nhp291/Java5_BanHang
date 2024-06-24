<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- belle/home5-cosmetic.html   11 Nov 2019 12:25:38 GMT -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Check out</title>
<meta name="description" content="description">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Plugins CSS -->
<link rel="stylesheet" href="/assets/css/plugins.css">
<!-- Bootstap CSS -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
<!-- Main Style CSS -->
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" href="/assets/css/custom.css">
<link rel="stylesheet" href="/assets/css/responsive.css">
<!-- angularjs -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
</head>

<body ng-app="shopping-app" ng-controller="shopping-ctrl"
	class="template-index belle home5-cosmetic">
	<div id="pre-loader">
		<img src="/assets/images/loader.gif" alt="Loading..." />
	</div>
	<div class="pageWrapper">
		<%@include file="../layout/_header.jsp"%>

		<!--Body Content-->
		<!--Body Content-->
		<div id="page-content">
			<!--Page Title-->
			<div class="page section-header text-center mt-5">
				<div class="page-title">
					<div class="wrapper">
						<h1 class="page-width">CHECK OUT</h1>
					</div>
				</div>
			</div>
			<!--End Page Title-->

			<div class="container">
				<div class="row">
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 mb-3">
						<div class="customer-box returning-customer">
							<h3>
								<i class="icon anm anm-user-al"></i> EDIT ACCOUNT? <a href="#customer-login" id="customer"
									class="text-white text-decoration-underline"
									data-toggle="collapse">Click here</a>
							</h3>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 mb-3">
						<div class="customer-box customer-coupon">
							<h3 class="font-15 xs-font-13">
								<i class="icon anm anm-gift-l"></i> Do you have voucher? <a
									href="#have-coupon"
									class="text-white text-decoration-underline"
									data-toggle="collapse">Click here to add voucher</a>
							</h3>
							<div id="have-coupon" class="collapse coupon-checkout-content">
								<div class="discount-coupon">
									<div id="coupon" class="coupon-dec tab-pane active">
										<label class="required get" for="coupon-code"><span
											class="required-f">*</span> Voucher</label> <input id="coupon-code"
											required="" type="text" class="mb-3">
										<button class="coupon-btn btn" type="submit">USE VOUCHER</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row billing-fields">
					<div
						class="col-xl-6 col-lg-6 col-md-6 col-sm-12 sm-margin-30px-bottom">
						<div class="create-ac-content bg-light-gray padding-20px-all">
							<form name="frmOrder">
								<fieldset>
									<h2 class="login-title mb-3">Checkout information </h2>
									<div class="row">
										<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
											<label for="input-firstname ">Username<span
												class="required-f">*</span></label>
											<div id="username">${userDetail.username}</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
											<label for="input-firstname">Fullname<span
												class="required-f">*</span></label> <input disabled="disabled"
												name="fullname" value="${userDetail.fullname}"
												id="input-firstname" type="text">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
											<label for="input-email">E-Mail <span
												class="required-f">*</span></label> <input disabled="disabled"
												name="email" value="${userDetail.email}" id="input-email"
												type="email">
										</div>

									</div>
								</fieldset>
								<fieldset>
									<div class="row">
										<div class="form-group col-md-6 col-lg-6 col-xl-6 required">
											<label for="input-address-1">Address <span
												class="required-f">*</span></label> <input name="address"
												ng-model="order.address" id="input-address-1" required
												type="text">
											<div ng-show="frmOrder.address.$invalid"
												class="badge badge-danger m-2">Please enter address</div>
										</div>
									</div>
								</fieldset>
								<fieldset>
									<div class="row">
										<div class="form-group col-md-12 col-lg-12 col-xl-12">
											<label for="input-company">Note<span
												class="required-f">*</span></label>
											<textarea class="form-control resize-both" rows="3"></textarea>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
						<div class="your-order-payment">
							<div class="your-order">
								<h2 class="order-title mb-4">Your order</h2>

								<div class="table-responsive-sm order-table">
									<table
										class="bg-white table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th class="text-left">Product</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="i in cart.items">
												<td class="text-left">{{i.name}}</td>
												<td>{{i.price | number: 0}} $</td>
												<td>{{i.qty}}</td>
												<td>{{cart.priceItem(i.id) | number: 0}}$</td>
											</tr>
										</tbody>
										<tfoot class="font-weight-600">
											<tr>
												<td colspan="4" class="text-right font-weight-bold">Check out</td>
												<td class="font-weight-bold">{{cart.amount | number:0}}$</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>

							<hr />


									<div class="order-button-payment">
										<button ng-disabled="frmOrder.$invalid"
											ng-click="order.purchase()" class="btn" value="Place order"
											type="submit">Submit</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!--End Body Content-->
		<!--End Body Content-->

		<!--Footer-->
		<%@include file="../layout/_footer.jsp"%>
		<!--End Footer-->

		<!--Scoll Top-->
		<span id="site-scroll"><i class="icon anm anm-angle-up-r"></i></span>
		<!--End Scoll Top-->

		<!-- Including Jquery -->
		<script src="/assets/js/vendor/jquery-3.3.1.min.js"></script>
		<script src="/assets/js/vendor/modernizr-3.6.0.min.js"></script>
		<script src="/assets/js/vendor/jquery.cookie.js"></script>
		<script src="/assets/js/vendor/wow.min.js"></script>
		<!-- Incing Jascript -->
		<script src="/assets/js/bootstrap.min.js"></script>
		<script src="/assets/js/plugins.js"></script>
		<script src="/assets/js/popper.min.js"></script>
		<script src="/assets/js/lazysizes.js"></script>
		<script src="/assets/js/main.js"></script>
		<!-- Shopping cart -->
		<script src="/assets/js/shopping-cart.js"></script>
		<!--For Newsletter Popup-->
		<script>
			jQuery(document).mouseup(
					function(e) {
						var container = jQuery('#popup-container');
						if (!container.is(e.target)
								&& container.has(e.target).length === 0) {
							container.fadeOut();
							jQuery('#modalOverly').fadeIn(200);
							jQuery('#modalOverly').hide();
						}
					});
		</script>
		<!--End For Newsletter Popup-->
	</div>
</body>


</html>