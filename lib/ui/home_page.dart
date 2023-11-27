import 'dart:developer';

import 'package:blog_web/controllers/home_controller.dart';
import 'package:blog_web/ui/write_blog.dart';
import 'package:blog_web/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.put(HomeController());

  @override
  void initState() {
    controller.fetchAllBlogs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://github.com/chandan123-pradhan'));
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "Github",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 0,
                                  ),
                                  Icon(Icons.navigate_next_sharp, size: 22)
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Text(
                                    "My Portfolio",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 0,
                                  ),
                                  Icon(Icons.navigate_next_sharp, size: 22)
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.restorablePushNamed(context, '/write_blog');
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red[900]),
                        alignment: Alignment.center,
                        child: const Text(
                          "Start a project",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
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
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) {
                    return controller.blogList.isEmpty
                        ? Lottie.asset(
  'assets/lottie/loading.json',
  // width: 200,
  // height: 200,
  fit: BoxFit.fill,
)
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 20 / 20,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: controller.blogList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    var v=controller.blogList[index];
                                  
                                 controller.navigateToBlogDetails(context,controller.blogList[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[200],
                                      border:
                                          Border.all(color: Colors.grey[500]!),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://blog.logrocket.com/wp-content/uploads/2022/05/adaptive-icons-flutter-launcher-icons.png'),
                                                  fit: BoxFit.fill)),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3.5,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: SizedBox(
                                              child: Text(
                                                "${index + 1}- ${controller.blogList[index]['listField'][0]['value']}",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
