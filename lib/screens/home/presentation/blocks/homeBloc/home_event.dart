part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class HomeInitialEvent extends HomeEvent{}
class HomeCardClickedEvent extends HomeEvent{
  final HomeQuizCard clickedCard;
  HomeCardClickedEvent(this.clickedCard);
}