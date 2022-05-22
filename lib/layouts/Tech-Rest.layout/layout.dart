import 'package:firstproject/Modules/More%20Screen/more_screen.dart';
import 'package:firstproject/Modules/Profile%20Screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Modules/Homepage/home_layout.dart';
import '../../Modules/Notifications/notification_screen.dart';

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

int currentTab = 0;

class _homescreenState extends State<homescreen> {
  final List<Widget> screens = [
    notification_screen(),
    profile_details(),
    More(),
    services()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: dialogcontent(context),
                );
              });
        },
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 23,
          child: ClipOval(
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = services();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apps,
                          color: currentTab == 0
                              ? HexColor("#A27CB1")
                              : Colors.grey,
                        ),
                        Text('Service',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? HexColor("#A27CB1")
                                    : Colors.grey)),
                      ],
                    ),
                    //child:
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = notification_screen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: currentTab == 1
                              ? HexColor("#A27CB1")
                              : Colors.grey,
                        ),
                        Text('Notify',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? HexColor("#A27CB1")
                                    : Colors.grey)),
                      ],
                    ),
                    //child:
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = profile_details();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_rounded,
                          color: currentTab == 2
                              ? HexColor("#A27CB1")
                              : Colors.grey,
                        ),
                        Text('Profile',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? HexColor("#A27CB1")
                                    : Colors.grey)),
                      ],
                    ),
                    //child:
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = More();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: currentTab == 3
                              ? HexColor("#A27CB1")
                              : Colors.grey,
                        ),
                        Text('More',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? HexColor("#A27CB1")
                                    : Colors.grey)),
                      ],
                    ),
                    //child:
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

dialogcontent(BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding:
            EdgeInsets.only(top: 100.0, bottom: 16.0, left: 16.0, right: 16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Thank you ',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '(>‿◠)✌',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('ok',style: TextStyle(color: Colors.black45,fontSize: 17
                ),),
              ),
            )
          ],
        ),
      ),
      Positioned(
          left: 16,
          right: 16,
          top: 0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 50,
            backgroundImage: NetworkImage('https://i.gifer.com/XLpr.gif')
            ,
          ))
    ],
  );
}
