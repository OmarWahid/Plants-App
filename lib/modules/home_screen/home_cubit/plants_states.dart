

abstract class PlantsState {
}

class InitialState_ extends PlantsState {}
class changeIndexButton extends PlantsState {}

class SuccessProfileData extends PlantsState {}
class ErrorProfileData extends PlantsState {}
class LoadingProfileData extends PlantsState {}
class StateCountCartMinus extends PlantsState {}
class StateCountCartPlus extends PlantsState {}
class StateButtonAll extends PlantsState {}
class StateButtonPlants extends PlantsState {}
class StateButtonSeeds extends PlantsState {}
class StateButtonTools extends PlantsState {}
class StateButtonProducts extends PlantsState {}

class SuccessUpdateData extends PlantsState {
}
class ErrorUpdateData extends PlantsState {}
class LoadingUpdateData extends PlantsState {}


class SeedsSuccessState extends PlantsState {}
class SeedsErrorState extends PlantsState {
  final String error;
  SeedsErrorState(this.error);
}
class SeedsLoadingState extends PlantsState {}

class PlantsSuccessState extends PlantsState {}
class PlantsErrorState extends PlantsState {
  final String error;
  PlantsErrorState(this.error);
}
class PlantsLoadingState extends PlantsState {}

class AllSuccessState extends PlantsState {}
class AllErrorState extends PlantsState {
  final String error;
  AllErrorState(this.error);
}
class AllLoadingState extends PlantsState {}


class ToolsSuccessState extends PlantsState {}
class ToolsErrorState extends PlantsState {
  final String error;
  ToolsErrorState(this.error);
}
class ToolsLoadingState extends PlantsState {}
class SuccessLogoutData extends PlantsState {}
class ErrorLogoutData extends PlantsState {}

class LoadingGetUserData extends PlantsState {}
class SuccessGetUserData extends PlantsState {
  // final UserData userData;
  // SuccessGetUserData({required this.userData});
}
class ErrorGetUserData extends PlantsState {
  final String error;
  ErrorGetUserData({required this.error});
}


class UserSuccessState extends PlantsState {}
class UserErrorState extends PlantsState {
  final String error;
  UserErrorState(this.error);
}
class UserLoadingState extends PlantsState {}

class BlogsSuccessState extends PlantsState {}
class BlogsErrorState extends PlantsState {
  final String error;
  BlogsErrorState(this.error);
}
class BlogsLoadingState extends PlantsState {}
