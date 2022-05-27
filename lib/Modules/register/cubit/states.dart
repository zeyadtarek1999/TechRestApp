abstract class TechRegisterStates {}

class TechRegisterInitialState extends TechRegisterStates {}

class TechRegisterLoadingState extends TechRegisterStates {}

class TechRegisterSuccessState extends TechRegisterStates {}

class TechRegisterErrorState extends TechRegisterStates {
  final String error;

  TechRegisterErrorState(this.error);
}

class TechCreateUserSuccessState extends TechRegisterStates {}

class TechCreateUserErrorState extends TechRegisterStates {
  final String error;

  TechCreateUserErrorState(this.error);
}

class TechRegisterChangePasswordVisibilityState extends TechRegisterStates {}
