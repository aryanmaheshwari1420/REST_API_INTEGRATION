import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:postapi/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> userlist = [];

  Future<List<UserModel>> getuserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User mode"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getuserApi(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ReusableRow(
                              title: 'Name',
                              value: snapshot.data![index].name.toString()),
                          ReusableRow(
                              title: 'username',
                              value: snapshot.data![index].username.toString()),
                          ReusableRow(
                              title: 'email',
                              value: snapshot.data![index].email.toString()),
                          ReusableRow(
                              title: 'Address',
                              value: snapshot.data![index].address.city.toString()),
                          ReusableRow(
                              title: 'geo',
                              value: snapshot.data![index].address.geo.lat.toString())    
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
