import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _ToDoPage();
}

class _ToDoPage extends State<TodoPage> {
  TextEditingController textEditingController = TextEditingController();
  final List<String> _tasks = []; // Store tasks as strings

  void _removeCard(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void addCard() {
    setState(() {
      if (textEditingController.text.isNotEmpty) {
        _tasks.add(textEditingController.text);
        textEditingController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text(
              "To Do List",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            centerTitle: true,
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 400,
            child: TextField(
              controller: textEditingController,
              style: const TextStyle(color: Color.fromRGBO(1, 1, 1, 1)),
              decoration: const InputDecoration(
                hintText: "Add A Task",
                fillColor: Color.fromRGBO(137, 136, 109, 1),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              onPressed: addCard,
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 185, 165, 94),
                ),
              ),
              child: const Icon(
                Icons.add_box_sharp,
                size: 40,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("Pending Tasks"),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_tasks[index]),
                    trailing: Radio(
                      value: index,
                      groupValue: null,
                      onChanged: (value) {
                        _removeCard(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget taskCard(String task, int index, void Function(int) onDelete) {
  return Card(
    child: ListTile(
      title: Text(task),
      trailing: Radio(
        value: index,
        groupValue: null,
        onChanged: (value) => onDelete(index),
      ),
    ),
  );
}
