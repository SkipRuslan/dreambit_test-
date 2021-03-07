part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadState extends Equatable implements HomeState {
  final List<ImageEntity> images;
  HomeLoadState(this.images);

  @override
  List<Object> get props =>[images];

}
class HomeErrorState implements HomeState{}

