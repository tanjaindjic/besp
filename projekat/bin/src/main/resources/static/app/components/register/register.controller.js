(function () {
    'use strict';

    angular
		.module('app')
		.controller('registerController', registerController);

    registerController.$inject = ['$location', '$scope', '$rootScope','$http', '$window', '$cookies', '$timeout'];
    function registerController($location, $scope, $rootScope, $http, $window, $cookies, $timeout) {
        var rc = this;
        var user;
        $scope.message="";
        var init = function (){

        if($cookies.get('user'))
            $location.path("home")

        };
        init();
        
        $scope.indexFunc = function(){
        	$location.path("home");
        }

         function validateString(val)
            {
                 if (!val.match(/^[a-zA-Z\s]*$/))
                {
                    return false;
                }

                return true;
            }
            
            function validateUsername(val)
            {
                 if (!val.match(/^[A-z]+$/))
                {
                    return false;
                }

                return true;
            }



        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }

        $scope.regFunc = function(username, pass, pass2, fname, lname, email){
            if(username==undefined || username=="" || pass==undefined || pass=="" || pass2==undefined || pass2==""
            || fname==undefined || fname=="" || lname==undefined || lname=="" || email=="" || email==undefined){
                $scope.message="Missing informations.";
                return;
            }
        	if(!(pass===pass2)){
        		$scope.message="Passwords don't match.";
        		return;
        	}
        	if(!validateEmail(email)){
        	    $scope.message="Enter valid email.";
        	    return;
        	}
        	if(!validateString(fname)){
                $scope.message="Enter valid First Name.";
                return;
            }

            if(!validateString(lname)){
                $scope.message="Enter valid Last Name.";
                return;
            }

            if(!validateUsername(username)){
                $scope.message="Enter valid Username. Only alphabet characters allowed.";
                return;
            }

        	var data = {
        			"username": username,
        			"password": pass,
        			"firstName": fname,
        			"lastName": lname,
        			"email": email,        			
        	}
        	console.log("userName" +  username +
        			"password"+ pass +
        			"ime"+ fname +
        			"prezime"+ lname +
        			"email"+ email)
            $http({
              method: 'POST',
              url: 'http://localhost:8096/api/register/',
              data: data
            }).then(function successCallback(response) {
            	if(response.data==""){
            	    $scope.message="Successful registration.";
                            $timeout(function() {
                               $location.path("login");
                                          }, 2000)
            	}

            	else
            		$scope.message="Username or email is already taken.";

                }, function errorCallback(response) {
                 $scope.message="Username or email is already taken.";

                });

        }
        
    }


})();