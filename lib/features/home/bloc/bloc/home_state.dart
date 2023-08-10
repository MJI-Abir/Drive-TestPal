part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState{}
final class HomeInitial extends HomeState {}


class HomeNavigateToQuestionCategoryScreenActionState extends HomeActionState{}

class HomeNavigateToQuizScreenActionState extends HomeActionState{}

class HomeNavigateToInformationScreenActionState extends HomeActionState{}

class HomeNavigateToSettingsScreenActionState extends HomeActionState{}

class HomeNavigateToUpgradeScreenActionState extends HomeActionState{}

class HomeNavigateToFreeStuffScreenActionState extends HomeActionState{}