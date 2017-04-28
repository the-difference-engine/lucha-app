(function() {
  "use strict";

  angular.module("app").controller("budgetCtrl", function($scope, $http) {

    var activeId = gon.id;

    $scope.init = function() {
      $("#budget-alert").hide();
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
      $scope.grossMonthlyIncome = sum(income());
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
        $scope.response = response.success;
        // flashAlert('success');
        window.location.replace("/clients/"+activeId+"/status");
      }).error(function(response) {
        var errors = response.error;
        $scope.response = '';
        for (var error in errors){
          var key = error.replace(/[_-]/g, " ");
          $scope.response += key.charAt(0).toUpperCase() + key.slice(1);
          $scope.response += ' ';
          $scope.response += errors[error].join(', ');
          $scope.response += ';';
        }

        flashAlert('danger');
      })
    }

    function flashAlert(flashType){ 
      $("html, body").animate({scrollTop:0}, "fast");
      $("#budget-alert")
          .addClass('alert-' + flashType)
          .show();
      // setTimeout(function() {
      //   $("#budget-alert")
      //     .slideUp(500, function() {
      //       $scope.closeAlert();
      //     })
      //     .removeClass('alert-' + flashType);
      // }, 4000);

    }

    document.onkeydown = function() {
      if (window.event.keyCode == '13') {
        $scope.submitData();
      }
    }

    $scope.closeAlert = function() {
      $("#budget-alert").hide();
    }

    $scope.$watch('budget', function() {
        $scope.updateSum();
    }, true);

    window.scope = $scope;

  });
}());
