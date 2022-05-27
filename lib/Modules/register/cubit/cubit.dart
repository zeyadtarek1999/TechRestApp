import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/Modules/register/cubit/states.dart';
import 'package:firstproject/models/Tech_rest_model/tech_rest_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechRegisterCubit extends Cubit<TechRegisterStates> {
  TechRegisterCubit() : super(TechRegisterInitialState());

  static TechRegisterCubit get(context) => BlocProvider.of(context);
  String verficationFailedmessage = '';
  bool showloading = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String password,
  }) {
    emit(TechRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
          uId: value.user!.uid,
          address: address,
          email: email,
          name: name,
          phone: phone);
      emit(TechRegisterSuccessState());
    }).catchError((error) {
      emit(TechRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String uId,
  }) {
    TechRestUserModel model = TechRestUserModel(
      phone: phone,
      name: name,
      email: email,
      address: address,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(TechCreateUserSuccessState());
    }).catchError((error) {
      emit(TechCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(TechRegisterChangePasswordVisibilityState());
  }
}
