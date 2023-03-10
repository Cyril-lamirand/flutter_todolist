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
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Objectif de cette page",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: const Divider(
                    color: Colors.white,
                    height: 10.0,
                  )
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "J'avais pour objectif d'afficher les <ToDos> par cat??gorie et de permettre ?? l'utilisateur de cr??er ses propres cat??gories.",
                  style: TextStyle(
                    color: Colors.white,
                  ),

                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Pour pouvoir faire cela, j'aurais du repenser une bonne partie de l'application, notamment la cr??ation d'une cat??gorie par d??faut ?? chaque enregistrement d'un nouvel utilisateur.",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Et bien s??r, d'emp??cher l'utilisateur de supprimer cette cat??gorie, car sinon cela aurait provoqu?? une erreur dans la liste des cat??gories pour pouvoir cr??er une ToDo...",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Peut-??tre dans une v2 :D",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ],
            )
          )
        )
    );
  }
}