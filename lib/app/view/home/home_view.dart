import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/common/component/main_button.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/controller/home_controller.dart';
import 'package:whoever/app/data/model/user/test_user.dart';
import 'package:whoever/app/data/model/user/user_model.dart';
import 'package:whoever/app/service/firebase_service.dart';
import 'package:whoever/app/service/firestore_service.dart';
import 'package:whoever/app/service/hive_service.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final token;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          controller.obx(
            (state) => _container('${controller.text}'),
            onError: (error) => _container('Error'),
            onEmpty: _container('Empty'),
            onLoading: const Center(child: CircularProgressIndicator()),
          ),
          MainButton.active(
            '확인',
            onPressed: () {},
          ),
          ElevatedButton(
            onPressed: () async {
              final testUser2 = _field(
                uuid: 'testUser2',
                name: 'testtestUser2',
                createdAt: DateTime.now(),
              );
              final db = FireStoreService.db;
              final doc = FireStoreService.add(testUser2, db.collection('user'))
                  .then((value) => Log('add OK'));
              // final ref = db
              //     .collection('test-user')
              //     .withConverter(
              //       fromFirestore: TestUser.fromFirestore,
              //       toFirestore: (TestUser user, options) => user.toFireStore(),
              //     )
              //     .doc('test-user-doc');

              // await ref
              //     .set(testUser, SetOptions(merge: true))
              //     .then((value) => Log('test-user-ok'));

              // controller.getRdNum();
              // await FirebaseService.getToken().then((value) => Log(value));
              // final v = await HiveService.add({
              //   'uuid': 'dfhjklhlcve123',
              //   'name': 'nini',
              //   'age': 30,
              // }).then((value) => Log('aDD ok'));

              // await HiveService.getAll().then((value) => Log(value));

              // final user = await FireStoreService.createCollection('user');
              // final userDoc = await FireStoreService.createDoc('userDoc', user);

              // db
              //     .collection('test-collection-1')
              //     .doc('test-doc1')
              //     .collection('test-collection-2')
              //     .doc('test-doc2')
              //     .set(
              //       _field(
              //         uuid: 'efef',
              //         name: 'ee',
              //         createdAt: DateTime.now(),
              //       ),
              //     );

              // final batch = db.batch();
              // user
              //     .add(
              //       UserModel(
              //         uuid: 'Jusdfbn39dmfnadf',
              //         email: 'test@email.com',
              //         createdAt: DateTime.now(),
              //       ),
              //     )
              //     .then((DocumentReference doc) => Log(doc.id));
              // user
              //     .add(
              //       _field(
              //         uuid: 'dffdfecvasd',
              //         name: 'testtest',
              //         createdAt: DateTime.now(),
              //       ),
              //     )
              //     .then((DocumentReference doc) => Log(doc.id));
              // batch.set(
              //   userDoc,
              //   {
              //     'uuid': '5525351dfsgfgadfdf',
              //     'email': 'test@email.com',
              //     'createdAt': DateTime.now().toString(),
              //   },
              //   SetOptions(
              //     merge: false,
              //   ),
              // );
              // batch.commit().then((value) => Log('OK'));
              // user.add(data)
            },
            child: Text('Enter'),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _field({
    required uuid,
    required name,
    required createdAt,
  }) {
    return {
      'uuid': uuid,
      'name': name,
      'createdAt': createdAt,
    };
  }

  Widget _container(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
