import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/counter_controller.dart';
import 'package:getx_test/controller/user_cotroller.dart';
import 'package:getx_test/list_user.dart';
import 'package:getx_test/model/user_model.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userController = Get.put(UserController());
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: userController,
        builder: (contexts) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -12),
                  showBadge: userController.users.isEmpty ? false : true,
                  ignorePointer: false,
                  onTap: () {
                    Get.to(() => ListUser());
                  },
                  badgeContent: Text(userController.users.length.toString()),
                  child: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter name'),
                  ),
                )
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () => clearText(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.clear),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    if (nameController.text.isNotEmpty) {
                      userController.addUser(UserModel(
                          id: DateTime.now().microsecondsSinceEpoch,
                          name: nameController.text));
                      clearText();
                    }
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.done),
                ),
              ],
            ),
          );
        });
  }

  void clearText() {
    setState(() {
      nameController.text = '';
    });
  }
}
