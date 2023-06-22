import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/user_cotroller.dart';

class ListUser extends StatelessWidget {
  ListUser({super.key});
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('User'),
        ),
        body: ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) => Card(
            elevation: 0,
            child: ListTile(
              title: Text(userController.users[index].name),
            ),
          ),
        ),
      );
    });
  }
}
