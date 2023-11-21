part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTask;

  const TaskState({
    this.allTask = const <Task>[],
  });

  List<Object> get props => [allTask];
}
