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
        	userCookie = $cookies.getObject('user');
        	if(userCookie!=undefined){
        		$scope.logged=true;
        		console.log("logged: " + $scope.logged + " user: " + userCookie.username);
        	}
        	else $scope.logged=false;



        };
        init();
        

        $scope.login = function(){
        	$location.path("login")
        }
        $scope.register = function(){
        	$location.path("register")
        }
        
        $scope.logout = function(){
        	$cookies.remove('user');
        	$cookies.remove('id');
        	$window.location.href = 'https://localhost:8096/';
        }

        
    }

})();