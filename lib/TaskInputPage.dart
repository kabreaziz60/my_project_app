import 'package:flutter/material.dart';


class TaskInputPage extends StatelessWidget {
  final Function(String) addTask;
  final TextEditingController taskController = TextEditingController();

  TaskInputPage(this.addTask, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une tâche', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                // color: Colors.grey[200],
              ),
              child: TextFormField(
                controller: taskController,
                decoration: InputDecoration(
                  labelText: "Entrer une tâche",
                  hintText: "Entrer le titre de la tâche",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  contentPadding: const EdgeInsets.all(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (taskController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Veuillez entrer une tâche.'),
                        backgroundColor: Colors.red,
                      ),
                      
                    );
                  } else {
                    addTask(taskController.text);
                    Navigator.pop(context);
                  }
                },
                style:  ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child:
                    const Text('Enregistrer', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
