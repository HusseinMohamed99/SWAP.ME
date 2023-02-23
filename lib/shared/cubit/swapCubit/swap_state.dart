abstract class SwapStates {}
class SwapInitialState extends SwapStates {}


class GetUserDataLoadingState extends SwapStates {}
class GetUserDataSuccessState extends SwapStates {}
class GetUserDataErrorState extends SwapStates {
  final String error ;
  GetUserDataErrorState (this.error);
}


class ShowPasswordState extends SwapStates {}


class ChangeBottomNavBarState extends SwapStates {}

