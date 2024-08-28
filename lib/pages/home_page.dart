import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_flutter/data/database.dart';
import 'package:todo_flutter/utilities/dialog_box.dart';

import '../utilities/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  late ToDoDatabase db;

  @override
  void initState() {
    super.initState();

    db=ToDoDatabase();
    //if this is the 1st time opening app give default data
    if (db.getToDoList().isEmpty) {
      db.createInitialData();
    } else{
      //data already exists
      db.loadData();
    }

  }

  //text controller
  final _controller = TextEditingController();



  //when the checkbox is tapped
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDatabase();
  }
  //save new task method
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //new method for creating task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=>Navigator.of(context).pop(),
      );
    },);
  }
  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskComplete: db.toDoList[index][1],
              onChanged: (value)=> checkBoxChanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
          );
        },
      ),
    );
  }
}
