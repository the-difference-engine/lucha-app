(function() {
  "use strict";

  angular.module("app").controller("budgetCtrl", function($scope, $http) {

    $scope.init = function() {
      $http.get("/api/budgets/1.json").then(function(response) {
        $scope.income = response.data["income"];
        $scope.debt = response.data["debt"];
        $scope.assets = response.data["assets"];
        $scope.updateSum();
      }); 
    }

    $scope.updateSum = function() {
      $scope.grossMontlyIncome = sum($scope.income);
      $scope.totalMonthlyDebt = sum($scope.debt);
    }

    $scope.closeAlert = function() {
      setTimeout(function() {
        $("#budget-alert").fadeTo(500, 0).slideUp(500, function() {
          $(this).remove();
          $scope.success = '';
          $scope.error = '';
        });
      }, 5000);
    }

    function sum(obj) {
      var sum = 0;
      for (var el in obj) {
        if (obj.hasOwnProperty(el)) {
          sum += parseFloat(obj[el]);
        }
      }
      return sum;
    }   

    $scope.submitIncome = function(income) {
      var monthlyIncome = { income };
      $http.patch("/budgets", monthlyIncome).success(function(response){
        $scope.success = response.success;
        $scope.closeAlert();
      }).error(function(response) {
        $scope.error = response;
        $scope.closeAlert();
      })
    }

    $scope.submitDebt = function(debt) {
      var monthlyDebt = { debt };
      $http.patch("/budgets", monthlyDebt).success(function(response){
        $scope.success = response.success;
        $scope.closeAlert();
      }).error(function(response) {
        $scope.error = response;
        $scope.closeAlert();
      })
    }

    $scope.submitAssets = function(assets) {
      var monthlyAssets = { assets };
      $http.patch("/budgets", monthlyAssets).success(function(response){
        $scope.success = response.success;
        $scope.closeAlert();
      }).error(function(response) {
        $scope.error = response;
        $scope.closeAlert();
      })
    }

    window.scope = $scope;

  });
}());