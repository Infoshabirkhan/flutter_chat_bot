import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  const MyTextField({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 10.sp),

      height: 100.sp,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 45.sp,
          child: TextField(
            enabled: false,
            decoration: InputDecoration(

                hintText: '       Hold the button to start speaking',
                hintStyle: TextStyle(
                    color: Colors.grey[400]
                )
            ),
            controller: controller,
            style: const TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
