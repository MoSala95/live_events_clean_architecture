import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Failure extends Equatable {
  String message;
  String? stacktrace;

  Failure(this.message, [this.stacktrace]);

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ServerFailure extends Failure {
  ServerFailure(String message,[ String? stacktrace]) : super(message, stacktrace);
}

// ignore: must_be_immutable
class CacheFailure extends Failure {
  CacheFailure(String message, String? stacktrace) : super(message, stacktrace);
}
