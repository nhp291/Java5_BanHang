var app = angular.module("shopping-app",[]);
app.controller("shopping-ctrl", function($scope, $http){
	
	$scope.cart = {
		items: [],
		add(id){
			var item = this.items.find(item => item.id == id);
			if(item){
				item.qty++;
				this.saveToLocalStorage();
			}else{
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = 1;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
			}
		},
		minus(id){
			var index = this.items.findIndex(item => item.id == id);
			if(this.items[index].qty == 1){
				this.remove(id);
			}else{
				this.items[index].qty -= 1;
				this.saveToLocalStorage();
			}
		},
		remove(id){
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		get count(){
			return this.items
				.map(item => item.qty)
				.reduce((total, qty) => total += qty,0);
		},
		priceItem(id){
			var index = this.items.findIndex(item => item.id == id);
			return this.items[index].qty * this.items[index].price ;
		},
		get amount(){
			return this.items
				.map(item => item.qty * item.price)
				.reduce((total, price) => total += price, 0);
		},
		saveToLocalStorage(){
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart",json);
		},
		clear(){
			this.items = [];
			this.saveToLocalStorage();
		},
		loadFromLocalStorage(){
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json):[];
		}
	}
	$scope.convertImage = function(json){
		var lstImage = JSON.parse(json);
		return lstImage[0];
	}
	$scope.cart.loadFromLocalStorage();
	
	$scope.order = {
		createDate: new Date(),
		address: "",
		account: {username: $("#username").text()},
		get orderDetails(){
			return $scope.cart.items.map(item => {
				return {
					product: {id: item.id},
					price: item.price,
					quantity: item.qty
				}
			});
		}, 
		purchase(){
			var order = angular.copy(this);
			console.log(order);
			$http.post('/rest/order', order).then(resp => {
				alert("Đặt hàng thành công");
				$scope.cart.clear();
				location.href = "/order/detail/"+resp.data.id;
			}).catch(error => {
				alert("Đặt hàng thất bại");
				console.log(error);
			});
		}
	}
});
app.controller("register",function($scope, Shttp){
	
});