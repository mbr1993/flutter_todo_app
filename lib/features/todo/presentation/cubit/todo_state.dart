 import 'package:equatable/equatable.dart';
 
 abstract  class TodoState extends Equatable {
 const TodoState();

 @override
 List<Object?> get props => [];

}

class TodoStateInitial extends TodoState{

  @override
  List<Object> get props => [];
}


