(function() {
  "use strict";

  angular.module("app").controller("budgetCtrl", function($scope, $http) {

    $scope.submitIncome = function(income) {
      var monthlyIncome = {
        income: income
      }

      $http.patch("/budgets", monthlyIncome).success(function(response){

        $scope.success = response;

      }).error(function(response) {
        
        $scope.error = response;
        
      })
    }



  });
}());