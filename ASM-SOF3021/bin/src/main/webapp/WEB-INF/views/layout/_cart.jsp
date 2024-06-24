<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-4 col-sm-3 col-md-3 col-lg-2">
                        <div class="site-cart">
                            <a href="#" class="site-header__cart" title="Cart">
                                <i class="icon anm anm-bag-l"></i>
                                <span id="CartCount" class="site-header__cart-count"
                                    data-cart-render="item_count">{{cart.count}}</span>
                            </a>
                            <!--Minicart Popup-->
                            <div id="header-cart" class="block block-cart">
                                <ul class="mini-products-list">
                                    <li ng-repeat="i in cart.items" class="item">
                                        <a class="product-image" href="#">
                                            <img ng-src="/images/product/{{convertImage(i.images)}}"
                                                alt="{{i.name}}" title="" />
                                        </a>
                                        <div class="product-details">
                                            <a ng-click="cart.remove(i.id)" href="" class="remove"><i class="anm anm-times-l"
                                                    aria-hidden="true"></i></a>
                                            <a class="pName" ng-href="/product/detail/{{i.id}}">{{i.name}}</a>
                                            <div class="wrapQtyBtn">
                                                <div class="qtyField">
                                                    <span class="label">SL:</span>
                                                    <a ng-click="cart.minus(i.id)" class="qtyBtn minus" href=""><i
                                                            class="fa anm anm-minus-r" aria-hidden="true"></i></a>
                                                    <input ng-change="cart.saveToLocalStorage()" ng-model="i.qty" type="number" id="Quantity" name="quantity" 
                                                        class="product-form__input qty">
                                                    <a ng-click="cart.add(i.id)" class="qtyBtn plus" href=""><i
                                                            class="fa anm anm-plus-r" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                            <div class="priceRow">
                                                <div class="product-price">
                                                    <span class="money">{{cart.priceItem(i.id) | number: 0}} $</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    
                                </ul>
                                <div class="total">
                                    <div class="total-in">
                                        <span class="label">TỔNG TIỀN:</span><span class="product-price"><span
                                                class="money">{{cart.amount | number:0}}$</span></span>
                                    </div>
                                    <div class="buttonSet text-center">
                                        <a href="/order/cart" class="btn btn-secondary btn--small">XEM GIỎ HÀNG</a>
                                        <a href="/order/checkout" class="btn btn-secondary btn--small">THANH TOÁN</a>
                                    </div>
                                </div>
                            </div>
                            <!--End Minicart Popup-->
                        </div>
                        <div class="site-header__search">
                            <button type="button" class="search-trigger"><i class="icon anm anm-search-l"></i></button>
                        </div>
                    </div>