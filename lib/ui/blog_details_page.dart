import 'package:blog_web/models/blog_body_model.dart';
import 'package:blog_web/ui/bottom_widget.dart';
import 'package:blog_web/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BlogDetailsPage extends StatefulWidget {
 
  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  static const routeName = '/blog_details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
print(args);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width/7
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 12,
            //  width: MediaQuery.of(context).size.width / 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Container(
                   // width: MediaQuery.of(context).size.width/1.3,
                    child: Text(args['listField'][0]['value'].toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,fontWeight: FontWeight.w600
                    ),
                    
                    ),
                    
                  ),
                  Icon(Icons.more_horiz_sharp,size:30,color: Colors.black,)
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
      
      Expanded(child: 
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 40),
        child:   SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(int i=1;i<args['listField'].length;i++)
          args['listField'][i]['type']=='text'?Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: SelectableText(
              args['listField'][i]['value'],
              style: TextStyle(
                    color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400
              ),
              
              
            ),
          ):
          args['listField'][i]['type']=='image'?Container(
        child: Padding(
          padding:  const EdgeInsets.only(bottom:20.0),
          child: Image.network(
            
            
            args['listField'][i]['value'],
            
          //  fit: BoxFit.fill, // Adjust this to fit your UI requirements
      // width: MediaQuery.of(context).size.width, // Set width dynamically
      // height: MediaQuery.of(context).size.height,
            ),
        ),
          ):
          
          Padding(
            padding:  const EdgeInsets.only(bottom:20.0),
            child: Divider(),
          ),



           BottomBarScreenWidget()
        ],
          ),

         
        ),
      )
      
      )
      
          ],
        ),
      ),
    );
  }





}
