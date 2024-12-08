part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class PropertiesLoading extends HomeState {}

class PropertiesLoaded extends HomeState {
  final List<PropertyModel> propertyModel;
  const PropertiesLoaded({required this.propertyModel});
}

class PropertiesError extends HomeState {}
