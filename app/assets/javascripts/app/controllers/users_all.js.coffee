window.letspair.application.controller 'UsersAllCtrl',
['$scope', 'serverUsers', '$log',
($scope, serverUsers, $log) ->
  $scope.users = []
  $scope.data = []
  $scope.currentPage = 0
  $scope.pageSize = 10
  $scope.sort = "username"
  $scope.dir = false
  serversort = 'created_at DESC'

  $scope.numPages = ->
    Math.ceil $scope.users.length / $scope.pageSize

  $scope.loadUsers = ->
    users = serverUsers.getFor(serversort)
    users.then(
      (data) ->
        $scope.users = data
      (status) ->
        $log.error "cannot load users for #{defaultsort} #{status}"
    )
  $scope.loadUsers()
]
