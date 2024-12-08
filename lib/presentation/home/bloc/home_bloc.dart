import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sleek_properties_flutter/common/utils/dep_injection.dart';
import 'package:sleek_properties_flutter/common/utils/use_case.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/models/property_model.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/use_case/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final homeUseCase = locator.get<HomeUseCase>();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is LoadProperties) {
          emit(PropertiesLoading());
          final response = await homeUseCase.call(NoParams());
          response.fold(
            (l) => emit(PropertiesError()),
            (r) => emit(PropertiesLoaded(propertyModel: r)),
          );
        }
      },
    );
  }
}
