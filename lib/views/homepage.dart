import 'package:clock_alarm_app/constants/theme.dart';
import 'package:clock_alarm_app/views/alarm_page.dart';
import 'package:clock_alarm_app/views/clock_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(

        backgroundColor: ThemeColors.pageBackgroundColor,

        body: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            SizedBox(height: 20),

            Text(
              'Clock',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.primaryTextColor,
                  fontSize: 24),
            ),

            SizedBox(height: 10),

            Expanded(child: ClockPage()),

            Expanded(child: Alarm()),

          ],

        ),

      ),
    );

  }


  
}
