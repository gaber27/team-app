abstract class UserStates{}

class UserInitialState extends UserStates{}
 // three states for get users from api
class UserLoadGetUsersState extends UserStates{}
class UserSuccessGetUsersState extends UserStates{}
class UserErrorGetUsersState extends UserStates{}
// pagination
class UserSuccessIncreaseState extends UserStates{}
class UserChangeLoadingState extends UserStates{}
