import 'package:flutter_bloc/flutter_bloc.dart';

import 'clock_state.dart';

class ClockCubit extends Cubit<ClockState> {

  ClockCubit() : super(DigitalState()) {
    getAnalogClock();
  }

  void onDigitalState() => emit(DigitalState());
  void onAnalogState() => emit(AnalogState());


  void getAnalogClock() async {

    try {

      emit(DigitalState());

    }
    catch (e) {

      emit(AnalogState());

    }

  }



}
