import 'package:cloud_firestore/cloud_firestore.dart';

class TestUser {
  final String? name;
  final String? email;
  final DateTime? createdAt;

  TestUser({
    this.name,
    this.email,
    this.createdAt,
  });

  // Map<String, dynamic>TestUser.toJson()

  factory TestUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TestUser(
      name: data?['name'],
      email: data?['email'],
      createdAt: data?['createdAt'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "name": name,
      "email": email,
      "createdAt": createdAt,
    };
  }
}
