(function () {
    'use strict';

    angular
		.module('app')
		.controller('uploadController', uploadController);

    uploadController.$inject = ['$location', '$scope', '$rootScope','$http', '$cookies', '$sce'];
    function uploadController($location, $scope, $rootScope, $http, $cookies, $sce) {
        var uc = this;
     
        var init = function (){
        	$scope.myFile="";
	         $scope.showW= false;
	         $scope.message="Something went wrong."
        };
        init();
        
        uc.logOut = function(){
        	
        }
        uc.uploadFile = function(){
        	var file = $scope.myFile;
        	var fileFormData = new FormData();
            fileFormData.append('file', file);
        	$http({
        		method: 'POST',
                url: 'https://localhost:8096/certificates/upload',
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined},
                data: fileFormData
            }).then(function onSuccess(response) {
            	$http({
            		method: 'POST',
                    url: 'https://localhost:8096/certificates/pass',
                    data: {"text": $scope.pass}
                }).then(function onSuccess(response) {
		        	$rootScope.certFile=response.data.text;
		        	$location.path("certificate");
                });
            }).catch(function onError(response) {
               
            });
        }
        
        uc.showWrong= function() {			
		      $scope.showW= true;
		      $timeout(function() {
		         $scope.showW= false;
		      }, 5000);
		   };

    }


})();