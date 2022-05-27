abstract class TechRateusStates {}

class TechRateUsInitialState extends TechRateusStates {}

class TechRateUsLoadingState extends TechRateusStates {}

class TechRateUsSuccessState extends TechRateusStates {}

class TechRateUsErrorState extends TechRateusStates {
  final String error;

  TechRateUsErrorState(this.error);
}

class TechRateUsGetSuccessState extends TechRateusStates {}

class TechRateUsGetErrorState extends TechRateusStates {
  final String error;

  TechRateUsGetErrorState(this.error);
}
