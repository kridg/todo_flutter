import 'package:flutter/material.dart';
import 'package:todo_flutter/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input for new task
          TextField(
            controller: controller,
            decoration:
            InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",),
          ),

          //now buttons to save or cancel the task
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //save button
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(width: 8,),

              //cancel button
              MyButton(text: "Cancel", onPressed: onCancel),

            ],)
        ],),
      ),
    );
  }
}
