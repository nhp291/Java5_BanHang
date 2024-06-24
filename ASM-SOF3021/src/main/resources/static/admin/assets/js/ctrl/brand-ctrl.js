let urlBrand = "/admin/rest/brands";
app.controller("brand-ctrl",function($scope, $http){
    $scope.brands = [];
    $scope.brand = {};
    $scope.chon = false;
    //get danh sach brand
    $http.get(urlBrand).then(resp => {
        $scope.brands = resp.data;
    });
    //get 1 brand
    $scope.edit = function(id){
        var url = `${urlBrand}/${id}`;
        $http.get(url).then(resp => {
            $scope.brand = resp.data;
            $scope.chon = true;
        }).catch(error => {
            if(error.status == 404){
                alert("Không tồn tại brand "+$scope.brand.id);
            }
        });
    };
    //upload img
    $scope.imageChanged = function(files){
        var url = "/admin/rest/upload/brand"
        var form = new FormData();
        form.append("file",files[0]);
        $http.post(url, form, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).then(resp => {
            $scope.brand.image = resp.data.filename;
        }).catch(error => {
            console.log("error",error);
        });
    };
    $scope.update = function(id){
        var url = `${urlBrand}/${id}`;
        var data = angular.copy($scope.brand);
        var index = $scope.brands.findIndex(b => b.id == id);
        $http.put(url, data).then(resp => {
            $scope.brands[index] = resp.data;
        }).catch(error => {
            if(error.status == 404){
                alert("Không tồn tại brand "+$scope.brand.id);
            }
        });
    };
    $scope.create = function(){
        var data = angular.copy($scope.brand);
        $http.post(urlBrand, data).then(resp => {
            $scope.brands.push(resp.data);
            $scope.reset();
        }).catch(error => {   
            if(error.status == 400){
                alert("Đã tồn tại brand "+$scope.brand.id);
            }
            console.log("error ",error);
        });
    };
    $scope.reset = function(){
        $scope.brand = {
            id: "",
            name: "",
            image: "logo.jpg"
        };
        $scope.chon = false;
    }
    $scope.delete = function(id){
        var url = `${urlBrand}/${id}`;
        $http.delete(url).then(resp => {
            var index = $scope.brands.findIndex(b => b.id == id);
            $scope.brands.splice(index, 1);
            $scope.reset();
        }).catch(error => {
            if(error.status == 404){
                alert("Không tồn tại brand "+$scope.brand.id);
            }
        });
    };
    $scope.search = function(kw){
        if(kw != null){
            var url = `${urlBrand}/search?kw=${kw}`;
            $http.get(url).then(resp => {
                $scope.brands = resp.data;
            });
        }
    };
    $scope.reset();
});