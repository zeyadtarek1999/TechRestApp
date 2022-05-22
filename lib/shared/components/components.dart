import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildTaskItem(Map model)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(backgroundColor: Colors.blue,radius: 40,
        child: Text('${model['time']}',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 17),
        ),
      ),
      SizedBox(width: 5,),
      Column(mainAxisSize: MainAxisSize.min,
        children: [
          Text('${model['title']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text('${model['date']}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey),)
        ],
      )
    ],
  ),
);


Widget defaultButton({
  required double width,
  required double height,
  required Function function,
  required String text,
  required Color write_text_color,
  required Color background,
  bool isUpperCase = true,
}) =>

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(300), color: background,),

        width: width,
        height: height,

        child: MaterialButton(
          onPressed: (){
            function();
          },
          child: Text(isUpperCase? text.toUpperCase() : text,
            style: TextStyle(
              color: write_text_color,
            ),
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  // Function? onTap,
  bool isPassword = false,
   Function? validate,
   IconData? prefix,
  required String text,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable=true,
  Color ? background,
  Color ? fillcolor,
})
=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child:   TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    enabled: isClickable,
    onFieldSubmitted: (s){onSubmit!();},
    onChanged: (s){onChange!();},
    // onTap: (){ onTap!();},
    validator: (s)
    {
      validate!(s);
      return null;
    },

    decoration:InputDecoration(
      hintText: text,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(300),
          borderSide:  BorderSide(color: Colors.white,width: 2)
      ),
      hintStyle: TextStyle(color: background,),
      prefixIcon: Icon(prefix,color: Colors.purple.shade400,),
      suffixIcon: suffix!= null ? IconButton(onPressed:(){suffixPressed!();} ,icon: Icon(suffix,color: Colors.purple.shade400,)) : null,

      filled: true,
      fillColor: fillcolor,

    ),),
);
void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget,)
);
void navigateAndFinish(context,widget)=>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget,
      ),(Route<dynamic>route)=>false,
    );


void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}