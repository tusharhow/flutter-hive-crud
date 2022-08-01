import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../components/add_new_user.dart';
import '../components/delete_user.dart';
import '../components/update_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box<String>? userBox;

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userBox = Hive.box<String>("users");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hive DB"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: userBox!.listenable(),
              builder: (context, Box<String> users, _) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final key = users.keys.toList()[index];
                    final value = users.get(key);

                    return ListTile(
                      title: Text(
                        value!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      subtitle: Text(key,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    );
                  },
                  separatorBuilder: (_, index) => const Divider(),
                  itemCount: users.keys.toList().length,
                );
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AddNewUser(
                    idController: idController,
                    nameController: nameController,
                    userBox: userBox),
                UpdateUser(
                    idController: idController,
                    nameController: nameController,
                    userBox: userBox),
                DeleteUser(idController: idController, userBox: userBox),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
