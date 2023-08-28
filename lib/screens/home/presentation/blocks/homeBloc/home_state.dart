part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

sealed class HomeActionState extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadingSuccessState extends HomeState{}

class HomeErrorState extends HomeState{}

class HomeCardSelectedState extends HomeActionState{}
