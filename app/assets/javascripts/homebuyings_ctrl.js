(function() {
  "use strict";

    angular.module("app").controller("homebuyingsCtrl", function($scope, $http){

  	$scope.setup = function(){
  		$http.get('clients.json').then(function(response){
  			$scope.clients = response.data;
  		});

  	};

  	$scope.toggle = true;

    $scope.descending = false;
    $scope.sortByAttribute = 'name';


    $scope.addNewClient = function( newFirstName, newLastName, newEmail, newPhoneNumber ){
          var newClient = {
            'first_name': newFirstName,
            'last_name': newLastName,
            email: newEmail,
            'phone_number': newPhoneNumber
          };

          $http.post('clients.json', newClient).then(function(response){
              console.log(response.data);
             $scope.volunteers.push(response.data);
          }, function(response){
            $scope.errors = response.data.errors;
          });
        };

    $scope.sortBy = function(sortAttribute){
      if (sortAttribute != $scope.sortByAttribute){
        $scope.descending = false;
      } else {
        $scope.descending = !$scope.descending;
      }
      $scope.sortByAttribute = sortAttribute;
    };

  });
}());