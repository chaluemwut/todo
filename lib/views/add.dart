import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/add_controller.dart';
import 'package:todo/routes/app_pages.dart';

class Add extends GetView<AddController> {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final description = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(hintText: 'title'),
              ),
              TextField(
                controller: description,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 10,
                decoration: InputDecoration(hintText: 'description'),
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () => controller.onSaveTodo(title, description),
                  child: Text('Save')))
        ],
      ),
    );
  }
}
