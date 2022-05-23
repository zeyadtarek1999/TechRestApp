import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/Modules/login/cubit/cubit.dart';
import 'package:firstproject/Modules/login/cubit/states.dart';
import 'package:firstproject/Modules/register/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layouts/Tech-Rest.layout/layout.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';

class Login_Screen extends StatelessWidget {
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TechrestLoginCubit(),
      child: BlocConsumer<TechrestLoginCubit, TechrestLoginStates>(
        listener: (context, state) {
          if (state is TechrestLoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if(state is TechrestLoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value)
            {
              navigateAndFinish(context,  homescreen());

            });
          }},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_ios,
                                      color: HexColor("#4A4B4D"))),
                              const Spacer(),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const Spacer(flex: 2)
                            ],
                          ),
                          Text(
                            'Add your details to login',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(

                            controller: EmailController,
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
                              hintText: 'Your Email',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(300.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(


                              controller: PasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                              TechrestLoginCubit.get(context).ispassword,
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
                                      TechrestLoginCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    icon: Icon(TechrestLoginCubit.get(context)
                                        .suffix)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: BorderRadius.circular(300.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.deepOrangeAccent[100],
                              ),
                              width: double.infinity,
                              child: ConditionalBuilder(
                                builder: (context) => MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      TechrestLoginCubit.get(context).userLogin(
                                          email: EmailController.text.trim(),
                                          password: PasswordController.text.trim());
                                    }

                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator()),
                                condition: state is! TechrestLoginLoadingState,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),
                          Text('Or login with'),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.blue,
                              ),
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'Login with Facebook',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.red,
                              ),
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'Login with Google',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'by continuing you agree  ',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Terms of service',
                                      style: TextStyle(fontSize: 10),
                                      maxLines: 2,
                                    )),
                                Text(
                                  'and',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'privacy policy',
                                      style: TextStyle(fontSize: 10),
                                      maxLines: 2,
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an Account?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => register_screen()),
                                    );
                                  },
                                  child: Text('Sign Up'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}