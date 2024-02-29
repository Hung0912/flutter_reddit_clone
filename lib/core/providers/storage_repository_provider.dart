import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/failure.dart';
import 'package:reddit_clone/core/providers/firebase_provider.dart';
import 'package:reddit_clone/core/type_defs.dart';

final storageRepositoryProvider = Provider((ref) {
  final firebaseStorage = ref.watch(storageProvider);
  return StorageRepository(firebaseStorage: firebaseStorage);
});

class StorageRepository {
  final FirebaseStorage _firebaseStorage;

  StorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile({
    required String path,
    required String id,
    required File? file,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);

      UploadTask uploadTask;

      uploadTask = ref.putFile(file!);

      final snapshot = await uploadTask;

      final fileUrl = await snapshot.ref.getDownloadURL();

      return right(fileUrl);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
