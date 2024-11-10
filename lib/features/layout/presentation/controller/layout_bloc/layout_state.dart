import 'package:equatable/equatable.dart';

class LayoutState extends Equatable {
  final String layout;
  final int screenIndex;

  const LayoutState({
    this.layout = 'layout',
    this.screenIndex = 0,
  });

  LayoutState copyWith({
    String? layout,
    int? screenIndex,
  }) {
    return LayoutState(
      layout: layout ?? this.layout,
      screenIndex: screenIndex ?? this.screenIndex,
    );
  }

  @override
  List<Object> get props => [
        layout,
        screenIndex,
      ];
}
