import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
  Future signIn({required String email, required String password}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    User? user = (await _auth.signInWithEmailAndPassword
      (email: email, password: password)).user;
    if(user != null){
      // await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      //   "email" : email,
      //   "status" : "Unavailable",
      // });
      return user;
    }
    else{
      print('login failed');
    }
  }
  // void signOut() {
  //   _auth.signOut();
  // }