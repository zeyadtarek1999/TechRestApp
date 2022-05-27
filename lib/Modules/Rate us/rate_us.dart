import 'package:firstproject/Modules/Rate%20us/cubit/cubit.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../layouts/Tech-Rest.layout/layout.dart';
import 'cubit/states.dart';

class rate_screen extends StatefulWidget {
  @override
  State<rate_screen> createState() => _rate_screenState();
}

class _rate_screenState extends State<rate_screen> {
  double? ratenumber;

  var comment_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TechRateUsCubit(),
        child: BlocConsumer<TechRateUsCubit, TechRateusStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image(
                      image: AssetImage('images/Rate us.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Thank You!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'We will appreciate to know your experience about restaurant :)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: comment_Controller,
                        type: TextInputType.text,
                        validate: () {},
                        prefix: Icons.comment,
                        text: 'Send comment'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rating',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RatingBar.builder(
                          itemSize: 30,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            ratenumber = rating;
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        width: 200,
                        height: 40,
                        function: () {
                          TechRateUsCubit.get(context).RateUsCreate(
                              ratenumber: ratenumber.toString(),
                              ratetext: comment_Controller.text.trim());

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Done, and enjoy your meal')),
                          );
                        },
                        text: 'Send',
                        write_text_color: Colors.white,
                        background: Colors.deepOrangeAccent.shade100),
                    TextButton(
                        onPressed: () {
                          navigateAndFinish(context, homescreen());
                        },
                        child: Text(
                          'Back To Home',
                          style: TextStyle(
                              fontSize: 15, color: Colors.purple.shade400),
                        ))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
