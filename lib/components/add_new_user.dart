import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNewUser extends StatelessWidget {
  const AddNewUser({
    Key? key,
    required this.idController,
    required this.nameController,
    required this.userBox,
  }) : super(key: key);

  final TextEditingController idController;
  final TextEditingController nameController;
  final Box<String>? userBox;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Add New"),
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                child: Container(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: idController,
                            decoration:const InputDecoration(
                                labelText: "ID",
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: nameController,
                            decoration:const InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder()),
                          ),
                       const   SizedBox(height: 16),
                          ElevatedButton(
                            child:const Text("Submit"),
                            onPressed: () {
                              final key = idController.text;
                              final value = nameController.text;
                              userBox!.put(key, value);
                              Navigator.pop(context);
                            },
                          )
                        ])),
              );
            });
      },
    );
  }
}