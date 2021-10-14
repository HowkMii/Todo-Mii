import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);
  final String payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  String _payload='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _payload=widget.payload;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        
        centerTitle: true,
        title: Text(
          _payload.toString().split('|')[1],
          style: TextStyle(color:Get.isDarkMode? Colors.white:darkGreyClr),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 10,),
                Text('Hello , Ma Fucking Guy',style:TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color:Get.isDarkMode?Colors.white:darkGreyClr, ),),
                const SizedBox(height: 10,),
                Text('You have a new reminder',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color:Get.isDarkMode?Colors.grey[100]:darkGreyClr, ),),
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 30,right: 30),
                margin: const EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:primaryClr,
                ),
                child: SingleChildScrollView(
                  child:Column(
                    children: [
                      const SizedBox(height: 20,),
                      Row(
                        children: const [
                          Icon(Icons.text_format, size: 35,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('title',
                           // _payload.toString().split('|')[1],
                            style:TextStyle(color:Colors.white,fontSize: 30)
                          ),
                         
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(_payload.toString().split('|')[0],style:TextStyle(color:Colors.black ,fontSize: 20)),
                      Row(
                        children: const [
                          Icon(Icons.description, size: 35,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('Descrption',
                           // _payload.toString().split('|')[1],
                            style:TextStyle(color:Colors.white,fontSize: 30)
                          )
                         
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(_payload.toString().split('|')[1],style:const TextStyle(color:Colors.black ,fontSize: 20),textAlign: TextAlign.justify,),
                      Row(
                        children: const [
                          Icon(Icons.calendar_today_outlined, size: 35,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('Date',
                           // _payload.toString().split('|')[1],
                            style:TextStyle(color:Colors.white,fontSize: 30)
                          ),
                         
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(_payload.toString().split('|')[2],style:const TextStyle(color:Colors.white ,fontSize: 20),textAlign: TextAlign.justify,),

                    ],
                  ) ,),
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
//not 1
