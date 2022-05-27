import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/components.dart';
import '../Resetvation Details/reservation_details.dart';

DateTime dateTime = DateTime.now();
String? date;

String Time = '00:00';

var counter = 1;

String photoname = 'images/chair1.png';

void change() {
  if (counter == 1) {
    photoname = 'images/chair1.png';
  } else if (counter == 2) {
    photoname = 'images/chair2.png';
  } else if (counter == 3) {
    photoname = 'images/chair3.png';
  } else if (counter == 4) {
    photoname = 'images/chair4.png';
  } else if (counter == 5) {
    photoname = 'images/chair5.png';
  } else if (counter == 6) {
    photoname = 'images/chair6.png';
  } else if (counter == 7) {
    photoname = 'images/chair7.png';
  } else {
    counter = 0;
  }
}

class table_details extends StatefulWidget {
  @override
  State<table_details> createState() => _State();
}

class _State extends State<table_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F9F9FF'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#F9F9FF'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Receive  A Table',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                Spacer(),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  child: Image.asset('${photoname}'),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Amount Of Guests',
                style: TextStyle(color: HexColor('#BEBEBE')),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: [
                  Container(
                      width: 32,
                      height: 32,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                              change();
                              print(counter);
                            });
                          },
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 23),
                          ),
                          backgroundColor: HexColor('#00DAAC'),
                        ),
                      )),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                      width: 32,
                      height: 32,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              counter--;
                              change();
                              print(counter);
                            });
                          },
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 23),
                          ),
                          backgroundColor: HexColor('#FF5763'),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Reservation Date ',
                style: TextStyle(color: HexColor('#BEBEBE')),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Row(
                children: [
                  Text(
                    '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 95,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurStyle: BlurStyle.normal,
                              blurRadius: 2,
                            ),
                          ],
                          color: Colors.white),
                      child: MaterialButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2200));
                          if (newDate == null) return;
                          setState(() {
                            dateTime = newDate;
                            date =
                                '${newDate.day}/${newDate.month}/${newDate.year}';
                          });
                        },
                        child: Text(
                          'Select Date',
                          style: TextStyle(
                              color: HexColor('#767676'), fontSize: 11),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Available Time Slots ',
                style: TextStyle(color: HexColor('#BEBEBE')),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    '${Time}',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                      width: 95,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurStyle: BlurStyle.normal,
                              blurRadius: 2,
                            ),
                          ],
                          color: Colors.white),
                      child: MaterialButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (newTime != null) {
                            setState(() {
                              Time = newTime.format(context);
                            });
                          }
                        },
                        child: Text(
                          'Select Time',
                          style: TextStyle(
                              color: HexColor('#767676'), fontSize: 11),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 57,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HexColor('#F0997A')),
                    child: MaterialButton(
                      onPressed: () {
                        navigateTo(
                            context,
                            reservation_details(
                              date: date.toString(),
                              table: photoname.toString(),
                              time: Time.toString(),
                            ));
                      },
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Receive  A Table',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                        ],
                      ),
                    )),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
