import 'dart:async';

import 'package:clock_alarm_app/bloc/clock_cubit.dart';
import 'package:clock_alarm_app/bloc/clock_state.dart';
import 'package:clock_alarm_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'clockview.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {

  int selectedValue = 1;

  BuildContext blocContext;

  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();

    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';

    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return BlocProvider<ClockCubit>(

      create: (context) {

        return ClockCubit();

      },

      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          BlocBuilder<ClockCubit, ClockState>(

            builder: (context, state) {

              blocContext = context;

              if (state is DigitalState) {

                return Center(
                  child: DigitalClockWidget(),
                );

              }
              else if (state is AnalogState) {

                return Center(

                  child: Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: ClockView(
                      size: MediaQuery.of(context).size.height / 5,
                    ),

                  ),

                );

              }
              else {

                return Container();

              }

            },
          ),

          SizedBox(height: 15),

          Text(
            formattedDate,
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w300,
                color: ThemeColors.primaryTextColor,
                fontSize: 20),
          ),

          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Text(
                  'Timezone',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.primaryTextColor,
                      fontSize: 24),
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Icon(
                      Icons.language,
                      color: ThemeColors.primaryTextColor,
                    ),

                    SizedBox(width: 16),

                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: ThemeColors.primaryTextColor,
                          fontSize: 14),
                    ),

                  ],

                ),

              ],

            ),

          ),

          Container(

            color: Colors.white,

            child: DropdownButton(

                value: selectedValue,

                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Digital",
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w700,
                          color: ThemeColors.clockBG,
                          fontSize: 20,
                      ),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(
                        "Analog",
                      style: TextStyle(
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.clockBG,
                        fontSize: 20,
                      ),
                    ),
                    value: 2,
                  ),

                ],
                onChanged: (value) {

                  if (value == 1) {

                    blocContext.read<ClockCubit>().onDigitalState();

                  }
                  else {

                    blocContext.read<ClockCubit>().onAnalogState();

                  }

                  setState(() {

                    selectedValue = value;

                  });

                }),

          ),

        ],

      ),

    );

  }

}

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DigitalClockWidgetState();
  }
}

class DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('HH:mm a').format(DateTime.now());
  Timer timer;

  @override
  void initState() {

    this.timer = Timer.periodic(Duration(seconds: 1), (timer) {

      var previousMinute = DateTime.now().add(Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;

      if (previousMinute != currentMinute)

        setState(() {

          formattedTime = DateFormat('HH:mm a').format(DateTime.now());

        });

    });

    super.initState();

  }

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print('Digital Clock Updated');

    return Text(
      formattedTime,
      style: TextStyle(
          fontFamily: 'avenir',
          color: ThemeColors.primaryTextColor,
          fontSize: 64),
    );

  }

}
