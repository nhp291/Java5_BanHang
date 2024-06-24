app.controller ("authenticate-ctrl", function($scope, $http){
    $http.get(`/admin/rest/accounts/authorities`).then(resp =>{
    	$scope.db = resp.data;
    })
    $scope.index_of = function(username, role){
    	return $scope.db.authorities.
    	findIndex(a => a.account.username == username && a.role.role == role);
    }
    $scope.update = function(username, role){
    	var index = $scope.index_of(username, role);
    	console.log(index);
    	if(index > 0){
    		var id = $scope.db.authorities[index].id;
    		$http.delete(`/admin/rest/accounts/authorities/${id}`).then(resp => {
    			$scope.db.authorities.splice(index, 1);
    		})
    	}else{
    		var authority = {
    			account:{username: username},
    			role:{role: role}
    		}
    		$http.post(`/admin/rest/accounts/authorities`,authority).then(resp => {
    			$scope.db.authorities.push(resp.data);
    		})
    	}
    }
    $scope.search = function(kw){
        if(kw != null){
            var url = `/admin/rest/accounts/authorities/search?kw=${kw}`;
            $http.get(url).then(resp => {
                $scope.db.accounts = resp.data;
            });
        }
    };
})