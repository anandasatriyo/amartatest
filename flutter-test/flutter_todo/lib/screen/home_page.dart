import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_todo/widget/dialog_box.dart';
import 'package:flutter_todo/widget/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [];

  //Function
  void tapTextChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(String input) {
    setState(() {
      toDoList.add([input, false]);
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          onSave: saveNewTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TodoList",
          style: GoogleFonts.poppins(
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('fabplus'),
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListView.builder(
            itemCount: toDoList.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ToDoTile(
                leading: "${index + 1}",
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: () => tapTextChanged(index),
                deleteFunction: (context) => deleteTask(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
