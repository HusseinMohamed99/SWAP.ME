abstract class SwapStates {}
class SwapInitialState extends SwapStates {}


class GetUserDataLoadingState extends SwapStates {}
class GetUserDataSuccessState extends SwapStates {}
class GetUserDataErrorState extends SwapStates {
  final String error;

  GetUserDataErrorState(this.error);
}

class ShowPasswordState extends SwapStates {}

class ChangeBottomNavBarState extends SwapStates {}

class GetPlaceDataLoadingState extends SwapStates {}

class GetPlaceDataSuccessState extends SwapStates {}

class GetPlaceDataErrorState extends SwapStates {
  final String error;

  GetPlaceDataErrorState(this.error);
}

class GetAdsImagePickedSuccessState extends SwapStates {}

class GetAdsImagePickedErrorState extends SwapStates {}

class CreateAdsLoadingState extends SwapStates {}

class CreateAdsSuccessState extends SwapStates {}

class CreateAdsErrorState extends SwapStates {}

class RemoveAdsImageSuccessState extends SwapStates {}
