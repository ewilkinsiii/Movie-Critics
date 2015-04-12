(function () {
  "use strict";

  angular.module('app').controller('ratingCtrl', function ($scope, $http) {
      
      $scope.max = 5;
      $scope.isReadonly = false;

      $scope.setup = function(movie_id, user_id) {
        $scope.movie_id = movie_id;
        $scope.user_id = user_id;
        $http.get("/api/v1/ratings/" + movie_id + ".json?user_id=" + user_id).then(function(response) {
          $scope.rate = response.data.score;
        });
      };

      $scope.rateMovie = function() {
        var rating = {
          user_id: $scope.user_id,
          movie_id: $scope.movie_id,
          score: $scope.rate
        };
        $http.post('/api/v1/ratings.json', rating).then(function(response) {

        }, function(error) {

        });
      }
      

      $scope.hoveringOver = function(value) {
        $scope.overStar = value;
        $scope.percent = 100 * (value / $scope.max);
      };

      $scope.ratingStates = [
        {stateOn: 'glyphicon-ok-sign', stateOff: 'glyphicon-ok-circle'},
        {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
        {stateOn: 'glyphicon-heart', stateOff: 'glyphicon-ban-circle'},
        {stateOn: 'glyphicon-heart'},
        {stateOff: 'glyphicon-off'}
      ];
    });
})(); 