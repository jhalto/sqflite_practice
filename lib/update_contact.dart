import 'package:flutter/material.dart';
import 'package:sqflite_practice/db_helper.dart';
import 'package:sqflite_practice/home.dart';

import 'contact.dart';

class UpdateContact extends StatefulWidget {
  final Contact contact;
  UpdateContact({required this.contact});

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
   late TextEditingController nameUpdate;
   late TextEditingController phoneUpdate;
  @override
  void initState() {
    nameUpdate = TextEditingController(text: widget.contact!.name);
    phoneUpdate = TextEditingController(text: widget.contact!.phone);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
           TextField(
             controller: nameUpdate,
             decoration: InputDecoration(
             ),
           ),
           TextField(
             controller: phoneUpdate,
           ),
            MaterialButton(onPressed: (){
              DbHelper.updateContact(Contact(
                  id: widget.contact.id,
                  name: nameUpdate.text, phone: phoneUpdate.text));

              Navigator.pop(context,true);
            },child: Text("update"),)
          ],
        ),
      ),
    );
  }
}
