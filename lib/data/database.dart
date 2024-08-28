 import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList=[];

  //reference the box
   late final Box _myBox;

  ToDoDatabase() {
    // Initialize the box synchronously after it's opened
    _myBox = Hive.box('mybox');
  }
  List getToDoList() {
    return _myBox.get("TODOLIST", defaultValue: []);
  }

   void createInitialData(){
     toDoList=[
       ["Make App",false],
       ["Hit the GYM",false],
     ];
   }
   //load the data from the database
void loadData(){
toDoList= _myBox.get("TODOLIST");
}
//update the hive database
void updateDatabase(){
_myBox.put("TODOLIST",toDoList);
}
 }