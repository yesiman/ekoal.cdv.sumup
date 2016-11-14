angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})

.controller('PlaylistsCtrl', function($scope) {
  var Sumup = {
    pay: function (success, failure, amount, dev) {
        cordova.exec(success, failure, "Sumup", "pay", ["10,00", dev]);
    },
    log: function (success, failure) {
        cordova.exec(success, failure, "Sumup", "log", []);
    }
    //LOG function missing (wait a little)
  };
  $scope.pay = function()
  {
    function nativePluginResultHandler(result) {
        alert(result);
        if (result === 1);
        {
            //PAYMENT OK
        }
    }
    function nativePluginErrorHandler(error) {
        alert("ERROR: \r\n" + error);
    }
    Sumup.pay(nativePluginResultHandler, nativePluginErrorHandler, "AMOUNT", "CURRENCY_CODE");
  }
  $scope.log = function()
  {
    function nativePluginResultHandler(result) {
        if (result === 1);
        {
            //PAYMENT OK
        }
    }
    function nativePluginErrorHandler(error) {
        alert("ERROR: \r\n" + error);
    }
    Sumup.log(nativePluginResultHandler, nativePluginErrorHandler);
  }
})

.controller('PlaylistCtrl', function($scope, $stateParams) {
  
});
