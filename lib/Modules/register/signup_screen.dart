import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/Modules/register/cubit/cubit.dart';
import 'package:firstproject/Modules/register/cubit/states.dart';
import 'package:firstproject/Modules/register/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class register_screen extends StatefulWidget {
  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  var formKey = GlobalKey<FormState>();

  var name_controller = TextEditingController();

  var phone_controller = TextEditingController();

  var email_controller = TextEditingController();

  var address_controller = TextEditingController();

  var password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TechRegisterCubit(),
        child: BlocConsumer<TechRegisterCubit, TechRegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return TechRegisterCubit.get(context).showloading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop()),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black.withOpacity(
                                0.9,
                              ),
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Add your details to sign up'),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: name_controller,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Full Name',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(300.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: email_controller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email address must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Email address',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(300.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: phone_controller,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Mobile no.',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(Icons.phone_android),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(300.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: address_controller,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Country/Area must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Country/Area',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(Icons.home),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(300.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: password_controller,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText:
                          TechRegisterCubit.get(context).isPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  TechRegisterCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon: Icon(TechRegisterCubit.get(context)
                                    .suffix)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(300.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                              color: Colors.deepOrangeAccent[100],
                            ),
                            width: double.infinity,
                            child: ConditionalBuilder(
                              builder: (context) => MaterialButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    TechRegisterCubit.get(context)
                                        .userRegister(
                                        address: address_controller
                                            .text
                                            .trim(),
                                        email: email_controller.text
                                            .trim(),
                                        password: password_controller
                                            .text
                                            .trim(),
                                        phone: phone_controller.text
                                            .trim(),
                                        name: name_controller.text
                                            .trim());

                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                      phoneNumber: '+20${phone_controller.text}',
                                      verificationCompleted:
                                          (PhoneAuthCredential
                                      credential) {},
                                      verificationFailed:
                                          (FirebaseAuthException e) {
                                        setState(() {
                                          TechRegisterCubit.get(context)
                                              .verficationFailedmessage=e.code;
                                        });
                                      },
                                      codeSent: (String verificationId,
                                          int? resendToken) {
                                        Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>sent_an_OTP(isTimeOut2: false ,verificationId:verificationId ,phone: phone_controller.text,)));
                                      },
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {},
                                    );
                                  }
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              fallback: (context) => Center(
                                  child: CircularProgressIndicator()),
                              condition:
                              state is! TechRegisterLoadingState,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(TechRegisterCubit.get(context)
                            .verficationFailedmessage),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}