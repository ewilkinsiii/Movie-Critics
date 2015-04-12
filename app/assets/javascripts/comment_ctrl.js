(function () {
  "use strict";

  angular.module('app').controller("commentCtrl", function($scope, $http) {


    $scope.comments =[];

    $scope.setup = function(movie_id, user_id) {
      $scope.movie_id = movie_id;
      $scope.user_id = user_id;
      $http.get("/api/v1/comments/" + movie_id + ".json?user_id=" + user_id).then(function(response) {
        $scope.coment = response.data.score;
      });
    };


    $scope.addComment = function(newComment){
      var comment = {
        user_id: $scope.user_id,
        movie_id: $scope.movie_id,
        comment: newComment

        $http.post('/api/v1/comments/.json', comment).then(function(response) {

        }, function(error) {

        });
      };
      if($scope.txtcomment != ''){
        $scope.comments.push($scope.txtcomment);
        $scope.txtcomment = "";
      }
    }

    $scope.remItem = function($index) {
      $scope.comments.splice($index, 1);
    }
  });
})(); 