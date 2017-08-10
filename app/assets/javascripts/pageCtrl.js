(function(){
	"use strict";
	angular.module("app").controller('pageCtrl', ['$scope', function($scope) {
		$scope.products = [
		{
			photo: 'assets/running-shoe-1.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'kid'
		},
		{
			photo: 'assets/sports-shoes-1.jpg',
			name: 'Adidas Classic',
			price: 45,
			type: 'woman'
		},
		{
			photo: 'assets/running-shoe-2.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'man'
		},
		{
			photo: 'assets/running-shoe-1.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'man'
		},
		{
			photo: 'assets/running-shoe-1.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'kid'
		},
		{
			photo: 'assets/sports-shoes-1.jpg',
			name: 'Adidas Classic',
			price: 45,
			type: 'woman'
		},
		{
			photo: 'assets/running-shoe-2.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'man'
		},
		{
			photo: 'assets/running-shoe-1.jpg',
			name: 'Nike Air Max',
			price: 30,
			type: 'man'
		},
		];
		$scope.priceValue = function(price) {
			return parseFloat(str.replace('$', price));
		};
	}]);
})();