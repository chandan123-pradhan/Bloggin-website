import 'package:flutter/material.dart';


class BottomBarScreenWidget extends StatefulWidget {
   BottomBarScreenWidget({super.key});

  @override
  State<BottomBarScreenWidget> createState() => _BottomBarScreenWidgetState();
}

class _BottomBarScreenWidgetState extends State<BottomBarScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height:50),
          Container(height: 10,
          width: MediaQuery.of(context).size.width/1,
          color: Colors.black12,
          ),
           SizedBox(height:50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Image.asset(
                            'assets/png/logo.png',
                            height: 80,
                            width: 200,
                            // height: ,/
                          ),
                    Text("You are reading from chandan's website.",
                    style: TextStyle(
                      color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
                    ),
                    )
                 ],
               ),
                      const SizedBox(
                        width: 20,
                      ),
Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Text("Contact Info",
    style: TextStyle(
      color: Colors.black,fontSize: 30,fontWeight: FontWeight.w600
    ),
    ),
    SizedBox(height: 20,),
    Text("Email:- chandanpradhanbxr@gmail.com",
    style: TextStyle(
      color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
    ),
    ),

 SizedBox(height: 20,),
    Text("Phone:- +91 9065974832",
    style: TextStyle(
      color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
    ),
    ),
SizedBox(height: 20,),
    Text("Github:- chandan123-pradhan",
    style: TextStyle(
      color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
    ),
    ),

  SizedBox(height: 20,),
    Text("LinkedIn:- Chandan Pradhan",
    style: TextStyle(
      color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
    ),
    ),
  ],
)


            ],
          ),
           SizedBox(height:50),
        ],
      ),
    );
  }
}