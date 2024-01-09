
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/setting_model.dart';
import 'package:dartz/dartz.dart';

 class SettingUseCase implements UseCase<SettingModel, NoParams> {
 
     @override
     Future<Either<Failure, SettingModel>> call(NoParams params) {
    // TODO: implement call
     throw UnimplementedError();
     }


}