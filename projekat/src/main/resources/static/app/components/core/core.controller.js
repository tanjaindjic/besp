(function () {
    'use strict';

    angular
		.module('app')
		.controller('coreController', coreController);

    coreController.$inject = ['$location', '$scope', '$rootScope','$http', '$cookies', '$window'];
    function coreController($location, $scope, $rootScope,$http, $cookies, $window) {
    	var cc = this;
    	$scope.logged = false;
    	var userCookie;
    	var userId;
        $scope.isAdmin = false;
        $scope.isAgent = false;
        $scope.user = undefined;
    	var init = function(){
        	userCookie = $cookies.get('user');
            userId = $cookies.get('id');
        	if (userCookie && userId){
                $scope.logged=true;
                $http({
                    method: 'GET',
                    url: 'http://localhost:8096/#!/user/'+userId
                  }).then(function successCallback(response){
                	  if(response.data!="")
                		  $scope.user = response.data;
                	  alert($scope.user)
                  });
                
        	}else $scope.logged=false;



        };
        init();
        console.log("logged: " + $scope.logged + " user: " + userCookie + ", id: " + userId);

        $scope.login = function(){
        	$location.path("login")
        }
        $scope.register = function(){
        	$location.path("register")
        }
        
        $scope.logout = function(){
        	$cookies.remove('user');
        	$cookies.remove('id');
        	$window.location.href = 'http://localhost:8096/';
        }

        
    }

})();