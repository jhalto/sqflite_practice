import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Contact"),),
      body: Column(
        children: [
          TextField(),
        ],
      ),
    );
  }
}
