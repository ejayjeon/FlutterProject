import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:whoever/app/common/util/util.dart';

class FireStoreService extends GetxService {
  static late final FirebaseFirestore db;
  Future<FireStoreService> init() async {
    db = FirebaseFirestore.instance;
    return this;
  }

  // 1-1. Collection Create
  static Future<CollectionReference> createCollection(String name) async {
    return db.collection(name);
  }

  static Future createDoc(String name, CollectionReference ref) async {
    return ref.doc(name);
  }

  // 2. add
  static Future<void> add(Object? data, CollectionReference ref) async {
    // db가 존재한다면, (doc)
    if (ref != null) {
      ref.add(data);
    }
  }
}
