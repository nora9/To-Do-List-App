import 'package:bmi/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:bmi/modules/done_tasks/done_tasks_screen.dart';
import 'package:bmi/modules/new_tasks/new_tasks_screen.dart';
import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/components/constants.dart';
import 'package:bmi/shared/cubit/cubit.dart';
import 'package:bmi/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {

  var scaffoldKey= GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                  cubit.titles[cubit.currentIndex]
              ),
            ),
            body: ConditionalBuilder(
              condition: state is !AppGetDatabaseLoadingState,
              builder: (context)=>cubit.screens[cubit.currentIndex],
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton:FloatingActionButton(
              onPressed: (){
                if(cubit.isBottomSheetShown){
                  if(formKey.currentState.validate()){
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );
                  }
                }else{
                  scaffoldKey.currentState.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0,),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormField(
                              controller:titleController ,
                              type:TextInputType.text,
                              validate: (String value){
                                if(value.isEmpty)
                                  return 'title must not be empty';
                                return null;
                              },
                              label: 'Task Title',
                              prefix: Icons.title,
                            ),
                            SizedBox(height: 15.0,),
                            defaultFormField(
                              controller:timeController ,
                              type:TextInputType.datetime,
                              validate: (String value){
                                if(value.isEmpty)
                                  return 'time must not be empty';
                                return null;
                              },
                              ontap: (){
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()
                                ).then((value){
                                  timeController.text=value.format(context).toString();
                                });
                              },
                              label: 'Time Title',
                              prefix: Icons.watch_later_outlined,
                            ),
                            SizedBox(height: 15.0,),
                            defaultFormField(
                              controller:dateController ,
                              type:TextInputType.datetime,
                              validate: (String value){
                                if(value.isEmpty)
                                  return 'date must not be empty';
                                return null;
                              },
                              ontap: (){
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2021-06-25')
                                ).then((value){
                                  dateController.text=DateFormat.yMMMd().format(value);
                                });
                              },
                              label: 'Date Title',
                              prefix: Icons.calendar_today,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //elevation: 20.0,
                  ).closed.then((value){
                    cubit.changeBottomSheetState(false);
                  });
                  cubit.changeBottomSheetState(true);
                }
              },
              child: !cubit.isBottomSheetShown?Icon(Icons.edit):Icon(Icons.add),
            ) ,
            bottomNavigationBar:BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.menu
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.check_circle_outline
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.archive_outlined
                  ),
                  label: 'Archived',
                ),
              ],
            ) ,
          );
        },

      ),
    );
  }


}

