
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/todo_model.dart';
import 'package:dartz/dartz.dart';

 class TodoUseCase implements UseCase<TodoModel, NoParams> {
 
     @override
     Future<Either<Failure, TodoModel>> call(NoParams params) {
    // TODO: implement call
     throw UnimplementedError();
     }


}