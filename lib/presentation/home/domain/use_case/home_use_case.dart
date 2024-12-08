import 'package:dartz/dartz.dart';
import 'package:sleek_properties_flutter/common/utils/failure.dart';
import 'package:sleek_properties_flutter/common/utils/use_case.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/models/property_model.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/repository/home_repository.dart';

class HomeUseCase extends UseCase<List<PropertyModel>, NoParams> {
  final HomeRepository repository;
  HomeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PropertyModel>>> call(NoParams params) async {
    return await repository.fetchProperties();
  }
}
