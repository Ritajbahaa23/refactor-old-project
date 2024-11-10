import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../chat/presentation/components/screens/chat_screen.dart';
import '../../../../home/presentation/screens/home_screen.dart';
import '../../../../profile/presentation/screens/profile_screen.dart';
import '../../../../search/presentation/screens/search_screen.dart';
import 'layout_event.dart';
import 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  ///VARS
  ///
  ///SCREENS LIST
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  ///
  ///
  ///

  LayoutBloc() : super(const LayoutState()) {
    on<LayoutEvent>((event, emit) {});

    on<ScreenIndexChangeEvent>((event, emit) {
      _changeScreenIndex(event, emit, event.newValue);
    });
  }

  _changeScreenIndex(
      ScreenIndexChangeEvent event, Emitter<LayoutState> emit, int newValue) {
    ///UPDATE STATE screenIndex VALUE.
    emit(state.copyWith(
      screenIndex: newValue,
    ));
  }
}
