(function () {
    'use strict';

    angular
		.module('app')
		.controller('loginController', loginController);

    loginController.$inject = ['$location', '$scope', '$rootScope','$http', '$window', '$cookies'];
    function loginController($location, $scope, $rootScope, $http, $window, $cookies) {
        var lc = this;
        var user;
        $scope.message="";
        var init = function (){
              
        	if($cookies.get('user'))
                $location.path("home")
        }
        
        init();
       
        $scope.indexFunc = function(){
        	$location.path("home");
        }
        
        $scope.prijavaFunc = function(username, pass){
        	if(username===undefined || pass===undefined || username==="" || pass===""){
        		$scope.message="Enter both username and password.";
        		return;
        	}
        	
        	
        	
        	var postData = {
           			"username": username,
           			"password": pass          			
        		};
        	$http({
                method: 'POST',
                url: 'http://localhost:8096/login/',
                headers: {'Content-Type': 'application/json'},
                data: postData                
              }).then(function successCallback(response) {
                  var user = response.data;
                  
                  if(user===null || user===undefined || user===""){
                  $scope.message="Login error. Please check your credentials.";
                  	return;
                  }
                  
       	
  	     			$cookies.put("user", user.username, {path: 'core'});
  	     			$cookies.put("id", user.id, {path: 'core'});
  	     			console.log("Uspesno logovanje: " + $cookies.get('user') + ", id: " +  $cookies.get('id'))
  	            	$window.location.href = 'http://localhost:8096/';
                  
                  
                  }, function errorCallback(response) {
                   $scope.message="Error.";

                  });
            	
        }
        
    }


})();