import 'package:equatable/equatable.dart';

abstract class ClockState extends Equatable {}

class DigitalState extends ClockState {
  @override
  List<Object> get props => [];
}

class AnalogState extends ClockState {
  @override
  List<Object> get props => [];
}
