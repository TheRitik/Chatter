import 'package:flutter/material.dart';
import 'Chatroom.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}
class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select friend'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: ))
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const chatroom()),
              );
            },
            leading: Icon(Icons.account_box_rounded, color: Colors.black,),
            title: Text('Friend 1',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            ),
            subtitle: Text('come for chat'),
            trailing: Icon(Icons.chat, color: Colors.black,),
          )
        ],
      ),
    );
  }
}
