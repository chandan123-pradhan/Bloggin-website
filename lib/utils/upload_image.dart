import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadImageToFirebase(File imageFile) async {
    
    try{
      Reference storageReference =
        FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');

    UploadTask uploadTask = storageReference.putFile(imageFile);

    await uploadTask.whenComplete(() => print('Image uploaded to Firebase'));
// debugger();
    // Retrieve the download URL
    String downloadURL = await storageReference.getDownloadURL();
// debugger();
return downloadURL;
    }
    catch(e){
print(e);
return '';
    }
  }