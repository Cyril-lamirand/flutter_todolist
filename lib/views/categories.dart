// Default
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// Dependencies
// Widget(s)
import '../dialogs/delete_task_d.dart';
import '../dialogs/edit_task_d.dart';
import '../widgets/app_bar_w.dart';
import '../widgets/bottom_bar_w.dart';
// Fragment(s)
import '../fragments/box_decoration_f.dart';
// Dialog(s)
import '../dialogs/add_task_d.dart';

var appContainerDecoration = boxDecorationContainer;

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: appContainerDecoration,
        child: Scaffold(
          appBar: const AppBarWidget(title: "Categories", hideActionProfile: false, actionReturnButton: false),
          bottomNavigationBar: const BottomBarWidget(),
          extendBody: true,
          backgroundColor: Colors.transparent,
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
            backgroundColor: Colors.deepPurpleAccent,
            child: const Icon(Icons.add),
          ),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: fireStore.collection('tasks').where('userId', isEqualTo: currentUser.uid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Aucune tâche disponible');
                } else {
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      Color taskColor = Colors.orange;
                      var taskTag = data['taskTag'];
                      if (taskTag == 'Travail') {
                        taskColor = Colors.blue;
                      } else if (taskTag == 'École') {
                        taskColor = Colors.green;
                      }
                      return Container(
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5.0,
                              offset: Offset(0, 5), // shadow direction: bottom right
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: taskColor,
                            ),
                          ),
                          title: Text(data['taskName']),
                          subtitle: Text(data['taskDesc']),
                          isThreeLine: true,
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: const Text(
                                    'Modifier',
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                  onTap: () {
                                    String taskId = (data['id']);
                                    String taskName = (data['taskName']);
                                    String taskDesc = (data['taskDesc']);
                                    String taskTag = (data['taskTag']);
                                    Future.delayed(
                                      const Duration(seconds: 0),
                                          () =>
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                EditTaskDialog(taskId: taskId,
                                                  taskName: taskName,
                                                  taskDesc: taskDesc,
                                                  taskTag: taskTag,),
                                          ),
                                    );
                                  },
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: const Text(
                                    'Supprimer',
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                  onTap: () {
                                    String taskId = (data['id']);
                                    String taskName = (data['taskName']);
                                    Future.delayed(
                                      const Duration(seconds: 0),
                                          () =>
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                DeleteTaskDialog(taskId: taskId,
                                                    taskName: taskName),
                                          ),
                                    );
                                  },
                                ),
                              ];
                            },
                          ),
                          dense: true,
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          )
        )

    );
  }
}