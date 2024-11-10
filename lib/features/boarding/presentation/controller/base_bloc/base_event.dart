import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetIsLoggedEvent extends BaseEvent {}

class GetUserDataEvent extends BaseEvent {}



