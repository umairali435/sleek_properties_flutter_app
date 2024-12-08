import 'package:dartz/dartz.dart';
import 'package:sleek_properties_flutter/common/utils/failure.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/models/property_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<PropertyModel>>> fetchProperties();
}
