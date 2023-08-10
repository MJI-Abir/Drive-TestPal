part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeQuizScreenNavigateEvent extends HomeEvent{}

class HomeQuestionCategoryScreenNavigateEvent extends HomeEvent{}

class HomeInformationScreenNavigateEvent extends HomeEvent{}

class HomeSettingsScreenNavigateEvent extends HomeEvent{}

class HomeUpgradeScreenNavigateEvent extends HomeEvent{}

class HomeFreeStuffScreenNavigateEvent extends HomeEvent{}