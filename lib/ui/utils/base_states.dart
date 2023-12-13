class BaseInitialState{}
class BaseLoadingState{}
class BaseErrorState{
  String errorMessage;
  BaseErrorState(this.errorMessage);
}
class BaseSuccessState{}