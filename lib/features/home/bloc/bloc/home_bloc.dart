import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    on<HomeQuizScreenNavigateEvent>(homeQuizScreenNavigateEvent);
    on<HomeQuestionCategoryScreenNavigateEvent>(homeQuestionCategoryScreenNavigateEvent);
    on<HomeInformationScreenNavigateEvent>(homeInformationScreenNavigateEvent);
    on<HomeSettingsScreenNavigateEvent>(homeSettingsScreenNavigateEvent);
    on<HomeUpgradeScreenNavigateEvent>(homeUpgradeScreenNavigateEvent);
    on<HomeFreeStuffScreenNavigateEvent>(homeFreeStuffScreenNavigateEvent);
  }

  FutureOr<void> homeQuizScreenNavigateEvent(homeNavigateToQuizScreenNavigateEvent, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeQuestionCategoryScreenNavigateEvent(HomeQuestionCategoryScreenNavigateEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeInformationScreenNavigateEvent(HomeInformationScreenNavigateEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeSettingsScreenNavigateEvent(HomeSettingsScreenNavigateEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeUpgradeScreenNavigateEvent(HomeUpgradeScreenNavigateEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeFreeStuffScreenNavigateEvent(HomeFreeStuffScreenNavigateEvent event, Emitter<HomeState> emit) {
  }

}
