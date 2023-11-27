import 'dart:io';

import 'package:blog_web/controllers/write_blog_controller.dart';
import 'package:blog_web/utils/upload_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({super.key});

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  File _file = File("zz");
  Uint8List webImage = Uint8List(10);

var controller=Get.put(WriteBlogController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WriteBlogController>(
      init: WriteBlogController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () {
              uploadImage();
            },
            child: _file.path == "zz"
                ? Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black12)),
                    alignment: Alignment.center,
                    child: Text(
                      "Select Image",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : Container(
                     height: MediaQuery.of(context).size.height/1.5,
                    width: MediaQuery.of(context).size.width / 1,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(width: 1, color: Colors.black12)),
                    alignment: Alignment.center,
                    child: _file.path == "zz"
                        ? const Text(
                            "Select Image",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        : Image.memory(
                            webImage,
                            fit: BoxFit.fill,
                          ),
                  ),
          ),
        );
      }
    );
  }

//   uploadImage() async {
//     // var permissionStatus = requestPermissions();

//     // MOBILE
//     if (!kIsWeb) {
//       final ImagePicker _picker = ImagePicker();
//       XFile? image = await _picker.pickImage(source: ImageSource.gallery);

//       if (image != null) {
//         var selected = File(image.path);

//         setState(() {
//           _file = selected;
//         });
        
//       } else {
//         print("No file selected");
//       }
//     }
//     // WEB
//     else if (kIsWeb) {
//       final ImagePicker _picker = ImagePicker();
//       XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
        // var f = await image.readAsBytes();
        // setState(() {
        //   _file = File("a");
        //   webImage = f;
        // });
// String downloadUrl=await uploadImageToFirebase(File(image.path));
//         print("Download url= $downloadUrl");
// // debugger();
//       } else {
//         print("No file selected");
//       }
//     } else {
//       print("Permission not granted");
//     }
//   }


Future<String?> uploadImage() async {
 // Image? image = await ImagePickerWeb.getImageAsWidget();
  // if (image != null) {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    

    final storage = FirebaseStorage.instance;
    final storageRef = storage.ref().child('images/${DateTime.now()}.jpg');
// var f = await storageRef.readAsBytes();
        setState(() {
          _file = File("a");
          webImage = bytesFromPicker!;
        });
    final uploadTask = storageRef.putData(bytesFromPicker!);

    final storageSnapshot = await uploadTask.whenComplete(() {
      
    });

    final downloadURL = await storageSnapshot.ref.getDownloadURL();
controller.setUploadedImageUrl(value: downloadURL);
    return downloadURL.toString();
  
}
}
