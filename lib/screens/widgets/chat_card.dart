import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_to_speech/models/chat_model.dart';

import '../../app_colors.dart';

var person =
    'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133352010-stock-illustration-default-placeholder-man-and-woman.jpg';

class ChatCard extends StatelessWidget {
  final ChatModel chat;

  const ChatCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chat.isHuman? Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular( 20.sp),
            bottomLeft: Radius.circular(!chat.isHuman?20.sp:0),
            topLeft: Radius.circular(20.sp),
            bottomRight: Radius.circular(!chat.isHuman? 0 : 20.sp)
          ),
          border: Border.all(
            color: Colors.white,

            width: 1,
          ),
          color:  AppColors.darkGrey,

        ),
        padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 10.sp),
        margin: EdgeInsets.only(bottom: 14.sp,right:chat.isHuman?5.w : 30.w,left:chat.isHuman? 30.w :5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 30.sp,
                  width: 30.sp,
                  decoration:  BoxDecoration(


                    color: Colors.white,
                  ),
                  child: chat.isHuman
                      ? Image.network(person)
                      : Image.asset('assets/images/chat.jpeg'),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: SelectableText(
                  chat.message.toString(),
                  style:
                      GoogleFonts.raleway(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
