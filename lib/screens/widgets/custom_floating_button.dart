// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomFloatingButton extends StatefulWidget {
//   const CustomFloatingButton({Key? key}) : super(key: key);
//
//   @override
//   State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
// }
//
// class _CustomFloatingButtonState extends State<CustomFloatingButton> {
//   @override
//   Widget build(BuildContext context) {
//     return AvatarGlow(
//
//       endRadius: 50.sp,
//       animate: isListening,
//       showTwoGlows: true,
//       glowColor: AppColors.primaryColor,
//       child: InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTapDown: (details) {
//           setState(() {
//             isListening = true;
//             _startListening();
//           });
//         },
//         onTapUp: (details) {
//           setState(() {
//             isListening = false;
//             _stopListening();
//           });
//         },
//         child: CircleAvatar(
//           backgroundColor: AppColors.primaryColor,
//           radius: 25,
//           child: Center(child: Icon(isListening ? Icons.mic : Icons.mic_off),
//           ),
//         ),
//       ),
//     );
//   }
// }
