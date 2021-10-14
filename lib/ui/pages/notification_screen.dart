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
        title: Text(
          _payload.toString().split('|')[1],
          style: TextStyle(color:Get.isDarkMode? Colors.white:darkGreyClr),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('hohoh',style:TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color:Get.isDarkMode?Colors.white:darkGreyClr, ),),
            const SizedBox(height: 10,),
            Text('hohohhohohhohoh',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color:Get.isDarkMode?Colors.grey[100]:darkGreyClr, ),),


          ],
        ),
      ),
    );
  }
}
//
