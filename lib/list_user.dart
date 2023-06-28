import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/user_cotroller.dart';
import 'package:getx_test/model/user_model.dart';

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
              onTap: () {
                userController.updateUser(
                    index,
                    UserModel(
                        id: userController.users[index].id,
                        name: 'namefghjkl'));
              },
              title: Text(userController.users[index].name),
              trailing: IconButton(
                  onPressed: () {
                    userController.deleteUser(index);
                  },
                  icon: Icon(Icons.delete)),
            ),
          ),
        ),
      );
    });
  }
}
