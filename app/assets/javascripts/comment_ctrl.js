(function () {
  "use strict";

  angular.module('app').controller("commentCtrl", function($scope) {


    $scope.comments =[];

    $scope.setup = function(movie_id, user_id) {
      $scope.movie_id = movie_id;
      $scope.user_id = user_id;
      });
    };


    $scope.addComment = function(){
      var comment = {
        user_id: $scope.user_id,
        movie_id: $scope.movie_id,
        comment: txtcomment

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