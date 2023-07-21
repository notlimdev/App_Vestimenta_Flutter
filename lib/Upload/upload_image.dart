import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File image) async {
  final String namefile = image.path.split("/").last;

  Reference ref = storage.ref().child("perfil").child(namefile);
  final UploadTask uploadTask = ref.putFile(image);

  final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => true);

  //final String url = await taskSnapshot.ref.getDownloadURL();

  if (taskSnapshot.state == TaskState.success) {
    return true;
  } else {
    return false;
  }
}
