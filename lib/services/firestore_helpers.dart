import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_manager/models/event.dart';
import 'package:events_manager/models/user_dm.dart';

Future<void> addNewUser({required UserDM user}) async {
  var db = FirebaseFirestore.instance;
  var collectionRef = db.collection("users");
  var docRef = await collectionRef.doc(user.id);
  docRef.set(user.toJson());

  UserDM.currentUser = user;
  print(docRef.id);
  print(docRef.parent.parameters);
}

Future<void> getUser(String id) async {}

Future<void> addNewEvent(Event event) async {}

Future<void> getEvent(String id) async {}

Future<void> updateEvent(Event event) async {}
