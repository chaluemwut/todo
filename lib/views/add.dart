import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/controllers/add_controller.dart';

class Add extends GetView<AddController> {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Form(
          child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  TextField(
                      key: const Key('title'),
                      controller: controller.title,
                      decoration: const InputDecoration(
                        hintText: 'title',
                      )),
                  Obx(() {
                    if (controller.isError.value) {
                      return const Text('Please fill title',
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 10));
                    } else {
                      return Container();
                    }
                  }),
                  TextField(
                    key: const Key('description'),
                    controller: controller.description,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 5,
                    decoration: const InputDecoration(hintText: 'description'),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        controller.image = image;
                        controller.imagePath(image!.path);
                        controller.imagePath.refresh();
                      },
                      child: const Text('Chose imag')),
                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Status'),
                        RadioListTile(
                            title: const Text('IN_PROGRESS'),
                            value: 'IN_PROGRESS',
                            groupValue: controller.statusValue.value,
                            onChanged: (value) {
                              controller.statusValue(value.toString());
                              controller.statusValue.refresh();
                            }),
                        RadioListTile(
                            title: const Text('COMPLETE'),
                            value: 'COMPLETE',
                            groupValue: controller.statusValue.value,
                            onChanged: (value) {
                              controller.statusValue(value.toString());
                              controller.statusValue.refresh();
                            }),
                      ],
                    );
                  }),
                  Obx(() {
                    if (controller.imagePath == '') {
                      return Container();
                    } else {
                      return SizedBox(
                          height: 200,
                          child: Image.file(File(controller.imagePath.value)));
                    }
                  }),
                ],
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  key: const Key('save_btn'),
                  onPressed: () => controller.onSaveTodo(),
                  child: const Text('Save')))
        ],
      )),
    );
  }
}
