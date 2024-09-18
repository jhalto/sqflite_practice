import 'package:flutter/material.dart';
import 'package:sqflite_practice/contact.dart';
import 'package:sqflite_practice/db_helper.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Contact"),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'name'
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: 'phone'
              ),
            ),
            MaterialButton(onPressed: ()async{

             await DbHelper.createContact(
                 Contact(name: nameController.text, phone: phoneController.text));
             Navigator.pop(context,true);
            },child: Text("save"),)
          ],
        ),
      ),
    );
  }
}
