<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- belle/home5-cosmetic.html   11 Nov 2019 12:25:38 GMT -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Cart</title>
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
		<div id="page-content">
			<!--Page Title-->
			<div class="page section-header text-center mt-5">
				<div class="page-title">
					<div class="wrapper">
						<h1 class="page-width">Giỏ hàng</h1>
					</div>
				</div>
			</div>
			<!--End Page Title-->

			<div class="container">
				<div class="row">
					<div class="col-12 col-sm-12 col-md-8 col-lg-8 main-col">
						<form action="#" method="post" class="cart style2">
							<table>
								<thead class="cart__row cart__header">
									<tr>
										<th colspan="2" class="text-center">Sản phẩm</th>
										<th class="text-center">Giá</th>
										<th class="text-center">Số lượng</th>
										<th class="text-right">Tổng cộng</th>
										<th class="action">&nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="i in cart.items"
										class="cart__row border-bottom line1 cart-flex border-top">
										<td class="cart__image-wrapper cart-flex-item"><a
											href="/product/detail/{{i.id}}"><img class="cart__image"
												ng-src="/images/product/{{convertImage(i.images)}}"
												alt="{{i.name}}"></a></td>
										<td class="cart__meta small--text-left cart-flex-item">
											<div class="list-view-item__title">
												<a href="/product/detail/{{i.id}}">{{i.name}}</a>
											</div>
										</td>
										<td class="cart__price-wrapper cart-flex-item"><span
											class="money">{{i.price | number: 0}} $</span></td>
										<td class="cart__update-wrapper cart-flex-item text-right">
											<div class="cart__qty text-center">
												<div class="qtyField">
													<a ng-click="cart.minus(i.id)" class="qtyBtn minus"
														href="#"><i class="icon icon-minus"></i></a> <input
														ng-change="cart.saveToLocalStorage()" ng-model="i.qty"
														class="cart__qty-input qty" type="number" name="updates[]"
														id="qty" value="1" pattern="[0-9]*"> <a
														ng-click="cart.add(i.id)" class="qtyBtn plus" href="#"><i
														class="icon icon-plus"></i></a>
												</div>
											</div>
										</td>
										<td class="text-right small--hide cart-price">
											<div>
												<span class="money">{{cart.priceItem(i.id) | number:
													0}} $</span>
											</div>
										</td>
										<td class="text-center small--hide"><a ng-click="cart.remove(i.id)" href=""
											class="btn btn--secondary cart__remove" title="Remove tem"><i
												class="icon icon anm anm-times-l"></i></a></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="3" class="text-left"><a href="/product/list"
											class="btn--link cart-continue"><i
												class="icon icon-arrow-circle-left"></i> Tiếp tục mua sắm</a></td>
										<td colspan="3" class="text-right"><button
												ng-click="cart.clear()" type="submit" name="update"
												class="btn--link cart-update">
												<i class="fa fa-refresh"></i> Cập nhật
											</button></td>
									</tr>
								</tfoot>
							</table>

							<div class="currencymsg">Miễn phí vận chuyển đơn hàng từ
								10000$ nội thành TPHCM, ngoại thành chịu phí ship sẽ được cập nhật
								ở bước thanh toán</div>
							<hr>


						</form>
					</div>
					<div class="col-12 col-sm-12 col-md-4 col-lg-4 cart__footer">
						<div class="solid-border">
							<div class="row">
								<span class="col-12 col-sm-6 cart__subtotal-title"><strong>Tổng
										hóa đơn</strong></span> <span
									class="col-12 col-sm-6 cart__subtotal-title cart__subtotal text-right"><span
									class="money">{{cart.amount | number: 0}} $</span></span>
							</div>
							<form action="/order/checkout">
								<input type="submit" id="cartCheckout"
									class=" mt-3 btn btn--small-wide checkout" value="Thanh toán">
							</form>
							<div class="paymnet-img">
								<img src="/assets/images/payment-img.jpg" alt="Payment">
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