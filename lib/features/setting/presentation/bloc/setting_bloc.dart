    
    
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'setting_state.dart';
 import 'setting_event.dart';

 class SettingBloc extends Bloc<SettingEvent,SettingState> {

 SettingBloc() : super(SettingStateInitial()){
 
 
   //  Handle Events here
  //  on<TestEvent>((event, emit) async {
  //  emit(loginStateTest());
  //  });

}

}