import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final CollectionReference keepCollection = FirebaseFirestore.instance.collection("keeps");


}