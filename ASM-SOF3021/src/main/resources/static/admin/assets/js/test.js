var app = angular.module("test", []);
app.controller("ctrl", function ($scope, $http) {
    $scope.data = [0, 10, 5, 2, 20, 30, 45];
    $scope.chart = function () {

        const data = {
          labels: [
            'Red',
            'Blue',
            'Yellow'
          ],
          datasets: [{
            label: 'My First Dataset',
            data: [300, 50, 100],
            backgroundColor: [
              'rgb(255, 99, 132)',
              'rgb(54, 162, 235)',
              'rgb(255, 205, 86)'
            ],
            hoverOffset: 4
          }]
        };
    
        const config = {
          type: 'doughnut',
          data: data,
        };
        const myChart = new Chart(
          document.getElementById('categoryChart'),
          config
        );
      }
      $scope.chart();
});