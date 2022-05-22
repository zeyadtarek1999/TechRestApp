abstract class TechrestLoginStates {}

class TechrestLoginInitialState extends TechrestLoginStates {}

class TechrestLoginLoadingState extends TechrestLoginStates {}

class TechrestLoginSuccessState extends TechrestLoginStates
{
  final String uId;

  TechrestLoginSuccessState(this.uId);
}

class TechrestLoginErrorState extends TechrestLoginStates
{
  final String error;

  TechrestLoginErrorState(this.error);
}

class TechrestChangePasswordVisibilityState extends TechrestLoginStates {}