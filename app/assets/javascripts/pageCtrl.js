(function(){
	"use strict";
	angular.module("app").controller('pageCtrl', function($scope) {
		$scope.products = [
		{
			photo: 'assets/sports-shoes-1.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'kid'
		},
		{
			photo: 'assets/sports-shoes-2.jpg',
			name: 'Adidas Classic',
			price: 45,
			type: 'woman'
		},
		{
			photo: 'assets/sports-shoes-1.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'man'
		},
		];
		$scope.priceValue = function(price) {
			return parseFloat(str.replace('$', price));
		};
	});
})();