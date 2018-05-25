(function () {
    'use strict';

    angular
		.module('app')
		.controller('certificateController', certificateController);

    certificateController.$inject = ['$location', '$scope', '$rootScope','$http', '$window', '$cookies', '$timeout'];
    function certificateController($location, $scope, $rootScope, $http, $window, $cookies, $timeout) {
        var crc = this;
        var init = function (){
        	$scope.self=false;
        	$scope.status = "";
        	$scope.showStatus= false;
        	$scope.cert = {};
     
        /*	$http({
                method: 'GET',
                url: 'http://localhost:8096/user/'

              }).then(function successCallback(response) {
            	  alert(response.data)
                  $scope.users = response.data;
            	  alert($scope.users.length)
              });    
              
        	if($cookies.get('user'))
                $location.path("home")*/
        }
        
        init();
       
        crc.send = function(){
        	$scope.cert.issuerName="";
        	$scope.cert.startDate=$scope.dateFrom;
        	$scope.cert.endDate=$scope.dateTo;
        	$scope.cert.caa=1;
        	var data = $scope.cert;
        	$http({
                method: 'POST',
                url: 'http://localhost:8096/certificates',
                data: data
              }).then(function successCallback(response) {
            	  $scope.status="Certificate made succesfully!";
            	  crc.showDone();
              });  
        	
        	
        }
       
        crc.showDone= function() {			
		      $scope.showStatus= true;
		      $timeout(function() {
		         $scope.showStatus = false;
		      }, 3000);
		   };
    }


})();