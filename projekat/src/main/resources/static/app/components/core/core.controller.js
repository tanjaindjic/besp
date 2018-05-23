(function () {
    'use strict';

    angular
		.module('app')
		.controller('coreController', coreController);

    coreController.$inject = ['$location', '$scope', '$rootScope','$http', '$cookies', '$window'];
    function coreController($location, $scope, $rootScope,$http, $cookies, $window) {
    	var cc = this;
  
    	var userCookie;
    	var userId;
        $scope.isAdmin = false;
        $scope.isAgent = false;
        $scope.isUser = false;
        $scope.user = undefined;
        $scope.logged = false;
    	var init = function(){
    		
        	userCookie = $cookies.get('user');
            userId = $cookies.get('id');
        	if (userCookie && userId){
      		  $scope.logged = true;
        		$http({
                    method: 'GET',
                    url: 'http://localhost:8096/#!/user/'+userId
                  }).then(function successCallback(response){
                	  if(response.data!=""){
                		  console.log(response.data)
                
                    	  if($scope.user!=undefined && $scope.user!=null){
                    		  if($scope.user.role=="ADMIN")
                    			  $scope.isAdmin = true;
                    		  else if($scope.user.role=="AGENT")
                    			  $scope.isAgent = true;
                    		  else if($scope.user.role=="USER")
                    			  $scope.isUser = true;
                    		  else alert("error in roles")
                    		  console.log($scope.user)
                    	  }
                	  }else $scope.logged = false;
                	
                  });
        		
        	}

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