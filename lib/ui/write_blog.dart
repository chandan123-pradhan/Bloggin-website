import 'dart:developer';
import 'dart:io';

import 'package:blog_web/commot_widgets/image_box.dart';
import 'package:blog_web/controllers/write_blog_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';

class WriteBlog extends StatefulWidget {
  const WriteBlog({super.key});

  @override
  State<WriteBlog> createState() => _WriteBlogState();
}

class _WriteBlogState extends State<WriteBlog> {
  List<Widget> widgetsList = [];
  List<TextEditingController> controllersList = [];
  // List<TextEditingController>_textEditingController=[];
var writeBlogController=Get.put(WriteBlogController());
int currentTextFieldindex=0;
  @override
  void initState() {
    
    TextEditingController _titleController = new TextEditingController();
    controllersList.add(_titleController);
widgetsList.add(_titleWidget());
    // TODO: implement initState
    super.initState();
  }

  void addWidget() {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        body: GetBuilder<WriteBlogController>(
          init: WriteBlogController(),
          builder: (controller) {
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/png/logo.png',
                                  // height: ,/
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {}, child: _addWidget()),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < widgetsList.length; i++)
                              widgetsList[i],
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        print(widgetsList);
                       // debugger();
                         int j=0;
                          int k=0;
                        for (int i = 0; i < widgetsList.length; i++) {
                         
                          if (widgetsList[i] is Divider) {
                            controller.addBlogList(type: 'divider',value: '');
                            print("index ${i + 1} is Divider");
                          } else if (widgetsList[i] is ImageBox) {
                             controller.addBlogList(type: 'image',value: controller.uploadedImageUrls[j]);
                             j=j+1;
                            
                            print("index ${i + 1} is imageBox");
                          } else {
                            controller.addBlogList(type: 'text',value: controllersList[k].text);
                             k=k+1;
                           
                            print("index ${i + 1} is textfield");
                          }
                        }
                        controller.publish(context);
                        // debugger();
                        // print(controller.blogsList);
                        // // Navigator.pushNamed(context, '/write_blog');
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green[900]),
                        alignment: Alignment.center,
                        child: Text(
                          "Publish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return  TextField(
      controller: controllersList[0],
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          hintText: 'Title.........',
          hintStyle: TextStyle(color: Colors.black38, fontSize: 30)),
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    );
  }

  Widget _descriptionWidget(index) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
       controller: controllersList[index],
        // maxLines: 20,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Tell Your Story.........',
            hintStyle: TextStyle(color: Colors.black38, fontSize: 20)),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _addWidget() {
    return PopupMenuButton(
        child: Row(
          children: const [
            Icon(Icons.add, size: 22),
            SizedBox(
              width: 10,
            ),
            Text(
              "Add Widgets",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        onSelected: (value) {
          // your logic

          if (value == 'divider') {
            widgetsList.add(Divider());
          } else if (value == 'textfield') {
            TextEditingController t = new TextEditingController();
            controllersList.add(t);
   currentTextFieldindex++;
   setState(() {
     
   });
            widgetsList.add(_descriptionWidget(currentTextFieldindex));
          } else if (value == 'imagebox') {
            widgetsList.add(ImageBox());
          }
          setState(() {});
        },
        itemBuilder: (BuildContext bc) {
          return const [
            PopupMenuItem(
              child: Text("Textfield"),
              value: 'textfield',
            ),
            PopupMenuItem(
              child: Text("Imagebox"),
              value: 'imagebox',
            ),
            PopupMenuItem(
              child: Text("Divider"),
              value: 'divider',
            )
          ];
        });
  }



}
