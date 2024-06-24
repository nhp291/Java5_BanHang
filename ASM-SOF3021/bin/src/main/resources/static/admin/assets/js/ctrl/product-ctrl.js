let urlProduct = "/admin/rest/products";
app.controller("product-ctrl", function ($scope, $http) {
    $scope.product = {};
    $scope.db = [];
    $scope.pageSize = 10;

    $scope.init = function () {
        //LOAD DB
        $http.get(urlProduct).then(resp => {
            $scope.db = resp.data;
            $scope.db.products.forEach(p => {
                p.createDate = new Date(p.createDate);
            });
        }).catch(error => {
            alert("Load data fail");
        });
        $scope.start = 0;
    }
    $scope.next = function(){
        if($scope.start < $scope.db.products.length - $scope.pageSize){
            $scope.start += $scope.pageSize;
        }
    }
    $scope.prev = function(){
        if($scope.start > 0){
            $scope.start -= $scope.pageSize;
        }
    }
    $scope.last = function(){
        var sotrang = Math.ceil($scope.db.products.length / $scope.pageSize);
        $scope.start = (sotrang - 1) * $scope.pageSize;
    }
    $scope.first = function(){
        $scope.start = 0;
    }
    
    //HAM KHOI DAU
    $scope.init();

    //HAM EDIT
    $scope.edit = function (id) {
        $http.get(`${urlProduct}/${id}`).then(resp => {
            $scope.product = resp.data[0].product;
            $scope.product.createDate = new Date($scope.product.createDate);
            $scope.product.images = JSON.parse($scope.product.images);
        })
        $scope.chon = true;
    };
    //HAM UPLOAD HINH
    $scope.imageChanged = function (files) {
        $scope.product.images = [];
        var form = new FormData();
        for (var i = 0; i < files.length; i++) {
            form.append("files", files[i]);
        }
        $http.post('/admin/rest/upload/product/product', form, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            for (var i = 0; i < $scope.product.images.length; i++) {
                if ($scope.product.images[i] == "logo.jpg") {
                    $scope.product.images.splice(i, 1);
                }
            }
            for (var i = 0; i < resp.data.length; i++) {
                $scope.product.images.push(resp.data[i].filename);
            }
        }).catch(error => {
            console.log("error", error);
            alert("Upload image fail");
        });
    };
    //HAM THEM MOI
    $scope.create = function () {
        var product = angular.copy($scope.product);
        var data = {
            p: {
                name: product.name,
                price: +product.price,
                createDate: product.createDate,
                available: product.available,
                brand: {
                    id: product.brand.id,
                },
                images: JSON.stringify(product.images),
            }
        }
        $http.post(urlProduct, data).then(resp => {
            resp.data.images = JSON.parse(resp.data.images);
            $scope.db.products.push(resp.data);
            alert("Add Product Success")
            $scope.reset();
        }).catch(error => {
            alert("Add Product Fail");
            console.log(error)
        })
    };
    //HAM UPDATE
    $scope.update = function (id) {
        var product = angular.copy($scope.product);
        var data = {
            p: {
                id: product.id,
                name: product.name,
                price: +product.price,
                createDate: product.createDate,
                available: product.available,
                brand: {
                    id: product.brand.id,
                },
                images: JSON.stringify(product.images),
            }
        }
        $http.put(`${urlProduct}/${id}`, data).then(resp => {
            resp.data.images = JSON.parse(resp.data.images);
            var index = $scope.db.products.findIndex(p => p.id == resp.data.id);
            $scope.db.products[index] = resp.data;
            alert("Update Product Success")
        }).catch(error => {
            alert("Update Product Fail");
            console.log(error)
        })
    };
    //HAM DELETE
    $scope.delete = function (id) {
        $http.delete(`${urlProduct}/${id}`).then(resp => {
            var index = $scope.db.products.findIndex(p => p.id == id);
            $scope.db.products.splice(index, 1);
            for (var i = 0; i < $scope.db.productCates.length; i++) {
                if ($scope.db.productCates[i].product.id == id) {
                    $scope.db.productCates.splice(i, 1);
                }
            }
            alert("Delete Product Success");
            $scope.reset();
        }).catch(error => {
            alert("Delete Product Fail");
            console.log(error);
        })
    }
    // HAM RESET
    $scope.reset = function () {
        $scope.product = {
            id: -1,
            name: '',
            price: 0,
            createDate: new Date(),
            available: true,
            brand: { id: "BRZ" },
            images: ["logo.jpg"],
        }
        $scope.chon = false;
    };
    //HAM CHECK BANG CATEGORY
    $scope.indexOf = function (pid, cid) {
        return $scope.db.productCates.findIndex(pc => pc.product.id == pid && pc.category.id == cid);
    };
    //HAM UPDATE TEN BRAND KHI CREATE PRODUCT
    $scope.brandName = function (bid) {
        var index = $scope.db.brands.findIndex(b => b.id == bid);
        return $scope.db.brands[index].name;
    };
    //HAM CHECK PRODUCT CATEGORY
    $scope.updateProductCates = function (pid, cid) {
        var index = $scope.indexOf(pid, cid);
        if (index >= 0) {
            var id = $scope.db.productCates[index].id;
            $http.delete(`${urlProduct}/productcategory/${id}`).then(resp => {
                $scope.db.productCates.splice(index, 1);
            })
        } else {
            var productCates = {
                product: { id: pid },
                category: { id: cid }
            }
            $http.post(`${urlProduct}/productcategory`, productCates).then(resp => {
                $scope.db.productCates.push(resp.data);
            })
        }
    };
    //TIM KIEM PRODUCT
    $scope.search = function (kw) {
        $http.get(`${urlProduct}/search?kw=${kw}`).then(resp => {
            $scope.db.products = resp.data;
        }).catch(error => {
            console.log(error);
        })
    };
    $scope.reset();
});