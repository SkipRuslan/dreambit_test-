import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambit_test/core/repository/image_repository.dart';
import 'package:dreambit_test/models/image_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadImageEvent) {
      yield HomeInitialState();

      try {
        List<ImageEntity> images = await ImageRepository.getImages();
        yield HomeLoadState(images);
      } catch (error) {
        yield HomeErrorState();
      }
    }
  }
}
