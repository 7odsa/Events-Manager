import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_manager/models/event.dart';
import 'package:events_manager/models/user_dm.dart';

Future<void> addNewUser({required UserDM user}) async {
  var db = FirebaseFirestore.instance;

  var collectionRef = db.collection("users");

  var docRef = await collectionRef.doc(user.id);

  docRef.set(user.toJson());

  UserDM.currentUser = user;
}

Future<void> getUser(String id) async {
  var db = FirebaseFirestore.instance;

  var collectionRef = db.collection("users");

  var docRef = collectionRef.doc(id);

  var data = await docRef.get();

  UserDM.currentUser = UserDM.fromJson(id: id, data: data.data()!);
}

Future<void> addNewEvent(Event event) async {
  var db = FirebaseFirestore.instance;

  var collectionRef = db.collection("events");

  await collectionRef.add(event.toJson());
}

Future<void> getEvent(String id) async {}

Future<void> updateEvent(Event event) async {}

Stream<List<Event>> getAllEvents() {
  // ! NEED TO FIX (NOT WORKING)
  var db = FirebaseFirestore.instance;

  var collectionRef = db.collection("events");

  final Stream<List<Event>> e = collectionRef.snapshots().map(
    (snapshot) =>
        snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList(),
  );
  return e;
}
