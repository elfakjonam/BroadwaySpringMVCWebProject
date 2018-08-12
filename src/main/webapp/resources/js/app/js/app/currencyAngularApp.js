angular.module('currencyApp',[])
.controller('CurrencyController', function($scope, $http){
	$scope.rates = [];
	$http.get('http://data.fixer.io/api/latest?access_key=c0cea4bcd06896158c4c93284a9f230a').then(function(result) {
		//c0cea4bcd06896158c4c93284a9f230a
		//598de14638be682b2df002836dc972fb
		$scope.rates = result.data.rates;
       
    });			
});