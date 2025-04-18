import 'package:basics_project_flutter/database/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccess{
  static CollectionReference<User>getUsersCollection(){
   return FirebaseFirestore.instance.collection('users')
      .withConverter<User>(
      fromFirestore: (snapshot,options)=>User.fromFirestore(snapshot.data()),
      toFirestore: (user,options)=>user.toFirestore(),);
  }
  static Future<void> addUser(User user){
    var userCollection = getUsersCollection();
    var doc = userCollection.doc(user.id);
    return doc.set(user);
  }
  static Future <User?>getUser(String uid)async {
    var userCollection = getUsersCollection();
    var doc = userCollection.doc(uid);
    var docSnaphot = await doc.get();
    return docSnaphot.data();
  }
}