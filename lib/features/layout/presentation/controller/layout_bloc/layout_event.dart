import 'package:equatable/equatable.dart';

abstract class LayoutEvent extends Equatable {
  const LayoutEvent();

  @override
  List<Object> get props => [];
}

class ScreenIndexChangeEvent extends LayoutEvent {
  final int newValue;

  const ScreenIndexChangeEvent(this.newValue);

  @override
  List<Object> get props => [newValue];
}
