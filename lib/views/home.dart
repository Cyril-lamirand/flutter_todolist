// Default
import 'package:a5_todolist/widgets/list_tasks_w.dart';
import 'package:flutter/material.dart';
// Dependencies
// Widget(s)
import '../widgets/app_bar_w.dart';
import '../widgets/bottom_bar_w.dart';
// Fragment(s)
import '../dialogs/add_task_d.dart';
import '../fragments/box_decoration_f.dart';

var appContainerDecoration = boxDecorationContainer;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: appContainerDecoration,
        child: Scaffold(
          appBar: const AppBarWidget(title: "Accueil", hideActionProfile: false, actionReturnButton: false),
          bottomNavigationBar: const BottomBarWidget(),
          extendBody: true,
          body: ListTasksWidget(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AddTaskDialog();
                },
              );
            },
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add),
          ),
        )
    );
  }
}