import 'package:flutter/material.dart';
import 'package:sqflite_practice/add_contact.dart';
import 'package:sqflite_practice/db_helper.dart';
import 'package:sqflite_practice/update_contact.dart';

import 'contact.dart';

class Home extends StatefulWidget {
  // const Home({super.key});
  Contact ?contact;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),centerTitle: true,),
      body: FutureBuilder(
          future: DbHelper.readContact(), builder: (BuildContext context,AsyncSnapshot<List<Contact>> snapshot){
           if(!snapshot.hasData){
             return Center(
               child: Column(
                 children: [
                   CircularProgressIndicator(
                   ),
                   Text('Loading')
                 ],
               ),
             );
           }
           return snapshot.data!.isEmpty? Center(
             child: Text("data nai"),
           ):ListView(
             children: snapshot.data!.map((e) => Center(
               child: ListTile(
                 title: Text(e.name,style: TextStyle(color: Colors.black),),
                 subtitle: Text(e.phone),
                 trailing: Container(
                   width: 100,
                   child: Row(
                     children: [
                       IconButton(onPressed: ()async{

                        final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateContact(
                           contact: e,

                         ),));
                        if(result==true){
                          setState(() {

                          });
                        }
                       }, icon: Icon(Icons.edit)),
                       IconButton(onPressed: ()async{
                        await DbHelper.deleteContact(e.id!);
                        setState(() {

                        });
                       }, icon: Icon(Icons.delete)),
                     ],
                   ),
                 ),
               ),
             ),).toList(),
           );
      }),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
      final refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddContact(

        ),));
        if(refresh == true){
          setState(() {

          });
        }
      },child: Icon(Icons.add),),
    );
  }
}
