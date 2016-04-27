(function() {
  "use strict";

  angular.module("app").controller("budgetCtrl", function($scope, $http) {

    $scope.init = function() {
      $http.get("/api/budgets/1.json").then(function(response) {
        $scope.income = response.data["income"];
        console.log($scope.income)
      }); 
    }

    $scope.submitIncome = function(income) {
      var monthlyIncome = { income: income }
      $http.patch("/budgets", monthlyIncome).success(function(response){
        $scope.success = response.success;
        $scope.incomeBudget = response.budget;

      }).error(function(response) {
        $scope.error = response;
      })
    }

    $scope.submitDebt = function(debt) {
      var monthlyDebt = { debt: debt }
      $http.patch("/budgets", monthlyDebt).success(function(response){
        $scope.success = response.success;
        $scope.debtBudget = response.budget;
      }).error(function(response) {
        $scope.error = response;
      })
    }

    $scope.submitAssets = function(assets) {
      var monthlyAssets = { assets: assets }
      $http.patch("/budgets", monthlyAssets).success(function(response){
        $scope.success = response;
      }).error(function(response) {
        $scope.error = response;
      })
    }


  });
}());