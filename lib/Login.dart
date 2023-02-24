import 'package:chatter/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:chatter/check_data.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false ;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size);
    return isLoading? Center(
      child: Container(
        height: 30,
        width: 25,
        child: CircularProgressIndicator(

        ),
      ),
    ): Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chatter'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0 , 0),
            child: Container(
              width: 300,
              child: Text('Welcome !',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,0 , 0 ,0 ),
            child: Container(
              width: 300,
              child: Text(
                'Login to your account ' ,
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              height:  50,
              width: 350,
              alignment: Alignment.center,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.account_box),
                  hintStyle: TextStyle(color: Colors.grey[800],
                  fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 45,
            width: 350,
            alignment: Alignment.center,
            child: TextField(
              controller: password ,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 19,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if(email.text.isNotEmpty && password.text.isNotEmpty){
                  setState(() {
                    isLoading = true;
                  });
                  signIn(email: email.text, password: password.text).then((user){
                    if(user != null){
                      print("Login seuccessfully");
                      setState(() {
                        isLoading = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const homescreen()),
                      );
                    }
                    else{
                      print("Login Failed");
                      setState(() {
                        isLoading = false ;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    }
                  }
                  );
                }
                else{
                  print('please fill the fields');
                }
                // login(email, passwprd)
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


