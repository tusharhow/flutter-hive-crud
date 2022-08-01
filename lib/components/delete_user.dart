import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DeleteUser extends StatelessWidget {
  const DeleteUser({
    Key? key,
    required this.idController,
    required this.userBox,
  }) : super(key: key);

  final TextEditingController idController;
  final Box<String>? userBox;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Delete"),
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                child: Container(
                    padding:const EdgeInsets.all(32),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: idController,
                            decoration:const InputDecoration(
                                labelText: "ID",
                                border: OutlineInputBorder()),
                          ),
                        const  SizedBox(height: 16),
                          ElevatedButton(
                            child:const Text("Submit"),
                            onPressed: () {
                              final key = idController.text;

                              userBox!.delete(key);
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