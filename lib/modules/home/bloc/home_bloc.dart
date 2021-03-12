import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dreambit_test/core/repository/image_repository.dart';
import 'package:dreambit_test/models/image_entity.dart';
import 'package:dreambit_test/modules/home/bloc/home_event.dart';
import 'package:dreambit_test/modules/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ImageRepository _imageRepository = ImageRepository();
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadImageEvent) {
      yield HomeInitialState();

      try {
        List<ImageEntity> images = await _imageRepository.getImages();
        yield HomeLoadState(images);
      } catch (error) {
        print(" ${error.toString()}");
        yield HomeErrorState();
      }
    }
  }
}
