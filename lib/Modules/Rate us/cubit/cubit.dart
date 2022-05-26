import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/Modules/Rate%20us/cubit/states.dart';
import 'package:firstproject/Modules/register/cubit/states.dart';
import 'package:firstproject/models/Tech_rest_model/tech_rest_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/TechRest_Rateus_Model/tech_rest_rateus_model.dart';

class TechRateUsCubit extends Cubit<TechRateusStates> {
  TechRateUsCubit() : super(TechRateUsInitialState());

  static TechRateUsCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth auth =FirebaseAuth.instance;


  void RateUsCreate({
    required String ratetext,
    required String ratenumber,

  })
  {
    TechRestRateUsModel model=TechRestRateUsModel(
      ratetext: ratetext,
      ratenumber: ratenumber,

    );
    FirebaseFirestore.instance
        .collection('Rate')
        .doc('1')
        .set(model.toMap()).then((value) {

      emit(TechRateUsSuccessState());

    }).catchError((error){
      emit(TechRateUsErrorState(error.toString()));
    });
  }


}