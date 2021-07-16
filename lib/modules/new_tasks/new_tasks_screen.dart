import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/components/constants.dart';
import 'package:bmi/shared/cubit/cubit.dart';
import 'package:bmi/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // return Container();
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newtasks;
        return tasksBuilder(tasks: tasks);
      },

    );
  }
}
