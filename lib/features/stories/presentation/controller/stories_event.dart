import 'package:equatable/equatable.dart';

abstract class StoriesEvent extends Equatable {
  const StoriesEvent();

  @override
  List<Object> get props => [];
}

class CreateStoryEvent extends StoriesEvent {}


class GetStoriesEvent extends StoriesEvent{}

class ErrorGetStoriesEvent extends StoriesEvent{}

