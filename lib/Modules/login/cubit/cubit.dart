import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/Modules/login/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechrestLoginCubit extends Cubit<TechrestLoginStates> {
  TechrestLoginCubit() : super(TechrestLoginInitialState());

  static TechrestLoginCubit get(context) => BlocProvider.of(context);
  bool ispassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    ispassword = !ispassword;
    suffix =
        ispassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(TechrestChangePasswordVisibilityState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(TechrestLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(TechrestLoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(TechrestLoginErrorState(error.toString()));
    });
  }
}
