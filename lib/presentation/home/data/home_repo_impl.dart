import 'package:dartz/dartz.dart';
import 'package:sleek_properties_flutter/common/settings/logger_customizations/custom_logger.dart';
import 'package:sleek_properties_flutter/common/utils/exception_failure_type_matcher.dart';
import 'package:sleek_properties_flutter/common/utils/failure.dart';
import 'package:sleek_properties_flutter/presentation/home/data/home_data_source.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/models/property_model.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  const HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PropertyModel>>> fetchProperties() async {
    try {
      final log = CustomLogger(className: "properties");
      final properties = await remoteDataSource.fetchProperties();
      log.w(properties);
      return Right(properties);
    } catch (e) {
      final log = CustomLogger(className: "properties");
      log.w(e);
      return Left(
        ExceptionFailureTypeMatcher.matchApiExceptionWithApiFailure(
          apiException: e,
        ),
      );
    }
  }
}
