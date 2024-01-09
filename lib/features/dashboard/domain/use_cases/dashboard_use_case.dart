
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/dashboard_model.dart';
import 'package:dartz/dartz.dart';

 class DashboardUseCase implements UseCase<DashboardModel, NoParams> {
 
     @override
     Future<Either<Failure, DashboardModel>> call(NoParams params) {
    // TODO: implement call
     throw UnimplementedError();
     }


}