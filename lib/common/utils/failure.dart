import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ClientFailure extends Failure {
  final String error;
  ClientFailure({required this.error});
}

class ServerFailure extends Failure {}

class UnauthorizedFailure extends Failure {
  final String? reason;
  UnauthorizedFailure({this.reason});
}

class ForbiddenFailure extends Failure {
  final String? reason;
  ForbiddenFailure({this.reason});
}

class NotAcceptableFailure extends Failure {
  final String? reason;
  NotAcceptableFailure({this.reason});
}

class ValidationException extends Failure {
  final String? reason;
  ValidationException({this.reason});
}

class UnknownFailure extends Failure {}

class ConnectionFailure extends Failure {}
