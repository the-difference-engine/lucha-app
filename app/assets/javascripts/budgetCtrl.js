(function() {
  "use strict";

  angular.module("app").controller("budgetCtrl", function($scope, $http) {

    var activeId = gon.id;

    $scope.init = function() {
      $http.get('/api/budgets/' + activeId + '.json').then(function(response) {
        $scope.budget = response.data;
        $scope.updateSum();
      }); 
    }

    function income(){
      return _.pick($scope.budget, [
        'gross_wages', 
        'self_employment_income',
        'overtime',
        'unemployment',
        'tips_commissions_bonus',
        'nontaxable_social_security',
        'taxable_social_security',
        'rental_income',
        'other_income'])
    }

    function debt(){
      return _.pick($scope.budget, [
        'principal_and_interest', 
        'prop_tax',
        'assoc_fees',
        'junior_mortgage',
        'min_credit_card_payment',
        'student_loan',
        'gas',
        'electricity',
        'water',
        'phone',
        'other_utilities',
        'food',
        'gas_car_maintenance',
        'child_care',
        'medical_expenses',
        'rent',
        'rental_insurance'])
    }

    $scope.updateSum = function() {
      $scope.grossMontlyIncome = sum(income());
      $scope.totalMonthlyDebt = sum(debt());
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

    $scope.submitData = function(data) {
      var monthlyIncome = data;
      $http.patch('/budgets/' + activeId, monthlyIncome).success(function(response){
        $scope.success = response.success;
        $scope.closeAlert();
      }).error(function(response) {
        $scope.error = response;
        $scope.closeAlert();
      })
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

    $scope.$watch('budget', function() {
        $scope.updateSum();
    }, true);

    window.scope = $scope;

  });
}());