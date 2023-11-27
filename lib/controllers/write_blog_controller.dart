import 'dart:developer';

import 'package:blog_web/dialgos/uploaded_successfully_dialog.dart';
import 'package:blog_web/models/blog_body_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WriteBlogController extends GetxController {
  List<String> uploadedImageUrls = [];
  List<BlogModel> blogsList = [];
  
  void setUploadedImageUrl({required String value}) {
    uploadedImageUrls.add(value);
    update();
  }

  void addBlogList({required String type, required String value}) {
    blogsList.add(BlogModel(type: type, value: value));
    update();
  }

  Future<void> publish(context) async {
    List<Map<String, dynamic>> blogData = [];
    try {
      DocumentReference<Map<String, dynamic>> documentRef =
    FirebaseFirestore.instance.collection('blog_list').doc();
      // Map<String, dynamic> mapData = {
      //   'key1': 'value1',
      //   'key2': 'value2',
      //   // Add more key-value pairs as needed
      // };
      for (int i = 0; i < blogsList.length; i++) {
        blogData.add({'type': blogsList[i].type, 'value': blogsList[i].value});
      }
      //debugger();
      print(blogData);
      await documentRef.set({'listField': blogData});
      print('Map data uploaded successfully');
      showSuccessDialog(context);

    } catch (e) {
      print('Error uploading map data: $e');
    }
  }




  void showSuccessDialog(context){
    showUploadSuccessDialog(context);
  }
}
