import 'package:dreambit_test/models/image_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState {}

class HomeInitialState implements HomeState {}

class HomeLoadState extends Equatable implements HomeState {
  final List<ImageEntity> images;

  HomeLoadState(this.images);

  @override
  List<Object> get props => images;
}

class HomeErrorState implements HomeState {}
