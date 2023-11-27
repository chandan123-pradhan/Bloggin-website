import 'dart:developer';

import 'package:blog_web/models/blog_body_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  CollectionReference<Map<String, dynamic>> documentRef =
      FirebaseFirestore.instance.collection('blog_list');

  List<Map<String, dynamic>> blogList = [];

  void fetchAllBlogs() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await documentRef.get();

      List<Map<String, dynamic>> blog = querySnapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList();
      for (int i = 0; i < blog.length; i++) {
        blogList.add(blog[i]);
      }
      // debugger();
      // print(blogList);
      update();
    } catch (e) {
      print('Error fetching List data from the document: $e');
      // return [];
    }
  }

  void navigateToBlogDetails(context,Map data){
      Navigator.pushNamed(
                                        context, '/blog_details',
                                        arguments: data);
  }
}
