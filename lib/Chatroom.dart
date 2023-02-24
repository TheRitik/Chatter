import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:string_scanner/string_scanner.dart';
class chatroom extends StatefulWidget {
  const chatroom({Key? key}) : super(key: key);
  @override
  State<chatroom> createState() => _chatroomState();
}
class _chatroomState extends State<chatroom> {
  final TextEditingController _chat = TextEditingController();
  final Map<String,dynamic>userMap = {};
  final String chatId  = "" ;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size);
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend 1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height/1.2,
              child: StreamBuilder<QuerySnapshot>(
                builder: (BuildContext context ,
                    AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.data != null){
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context , index){
                        return Text(snapshot.data?.docs[index]['message']);
                        }
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height/10,
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: size.width/1.05,
          height: size.height/12,
          child: Row(
            children: <Widget>[
              Container(
                width: size.width/1.199,
                height: size.height/12,
                child: TextField(
                  controller: _chat ,
                  decoration: InputDecoration(
                    hintText: 'Write your message here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon : Icon(Icons.send) , color: Colors.black,
                onPressed: () {
                }, ),
            ],
          ),
        ),
      ),
    );
  }
}
