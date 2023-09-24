import 'package:booky_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Parameter> {
  //type => general type to call with any type you want
  //parameter=> its optional to sent parameter with general type and use class NoParameter when we dont hava any parameter

  Future<Either<Failure, Type>> call([Parameter p]);
}

class NoParameter {}
