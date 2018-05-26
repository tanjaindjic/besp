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
        	$scope.isAll=true;
        	$scope.isCheck=false;
        	$scope.isMake=false;
        	$scope.isGet=false;
        	$scope.isRevoke=false;
        	$scope.checkedStatus="";
        	$scope.showCheckedStatus=false;
        	$scope.showIsRevoked=false;
        	$scope.revokedStatus="";
        	$scope.allCerts = [];
        	
     
        	$http({
                method: 'GET',
                url: 'https://localhost:8096/certificates'
              }).then(function successCallback(response) {
            	  for(var i=0; i<response.data.length; i++)            		  
            		  $scope.allCerts.push(response.data[i]);
              });    
              
        }
        
        init();
       
        crc.send = function(){
        	$scope.cert.issuerName="";
        	$scope.cert.startDate=$scope.dateFrom;
        	$scope.cert.endDate=$scope.dateTo;
        	$scope.cert.caa=1;
        	$scope.cert.serialNumber=0;
        	var data = $scope.cert;
        	$http({
                method: 'POST',
                url: 'https://localhost:8096/certificates',
                data: data
              }).then(function successCallback(response) {
            	  $scope.status="Certificate made succesfully! SERIAL NUMBER:" + response.data.serialNumber;
            	  crc.showDone();
        		  $scope.allCerts.push(response.data);
              });  
        	
        	
        }
        crc.all = function(){
        	$scope.isAll=true;
        	$scope.isCheck=false;
        	$scope.isMake=false;
        	$scope.isGet=false;
        	$scope.isRevoke=false;
        	$scope.showIsRevoked=false;
        	$scope.showCheckedStatus=false;
        	
        }
        crc.makeNew = function(){
        	$scope.isAll=false;
        	$scope.isCheck=false;
        	$scope.isMake=true;
        	$scope.isGet=false;
        	$scope.isRevoke=false;
        	$scope.showIsRevoked=false;
        	$scope.showCheckedStatus=false;
        	
        }
        crc.getCert = function(){
        	$scope.isAll=false;
        	$scope.isCheck=false;
        	$scope.isMake=false;
        	$scope.isGet=true;
        	$scope.isRevoke=false;
        	$scope.showIsRevoked=false;
        	$scope.showCheckedStatus=false;
        	
        }
        crc.check = function(){
        	$scope.isAll=false;
        	$scope.isCheck=true;
        	$scope.isMake=false;
        	$scope.isGet=false;
        	$scope.isRevoke=false;    
        	$scope.showIsRevoked=false;
        	$scope.showCheckedStatus=false;    	
        }
        crc.revokeCert = function(){
        	$scope.isAll=false;
        	$scope.isCheck=false;
        	$scope.isMake=false;
        	$scope.isGet=false;
        	$scope.isRevoke=true;
        	$scope.showIsRevoked=false;
        	$scope.showCheckedStatus=false;
        }
        crc.logOut = function(){
        	
        }
        crc.download = function(){
        	
        }
        crc.checkStatus = function(){
        	$http({
                method: 'GET',
                url: 'https://localhost:8096/certificates/check/'+$scope.checkNumber
              }).then(function successCallback(response) {
            	  if(response.data.text=="good")
            		  $scope.checkedStatus = "status for "+$scope.checkNumber+" : VALID";
            	  else
            		  $scope.checkedStatus = "status for "+$scope.checkNumber+" :NOT VALID";
            	  $scope.showCheckedStatus=true;
              }); 
        }
        crc.revokeCertificate = function(){
        	$http({
                method: 'GET',
                url: 'https://localhost:8096/certificates/revoke/'+$scope.revokeNumber
              }).then(function successCallback(response) {
            	  if(response.data.text=="good")
            		  $scope.revokedStatus = "status for "+$scope.checkNumber+" : REVOKED";
            	  else
            		  $scope.revokedStatus = "status for "+$scope.checkNumber+" :NOT REVOKED";
            	  $scope.showIsRevoked=true;
              }); 
        }
        crc.showDone= function() {			
		      $scope.showStatus= true;
		      $timeout(function() {
		         $scope.showStatus = false;
		      }, 20000);
		   };
    }


})();