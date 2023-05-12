import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_to_speech/controller/chat_list_cubit.dart';
import 'package:text_to_speech/models/chat_model.dart';
import 'package:text_to_speech/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/chat_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          //  ============ What was your best trip so far?
          BlocProvider(
            create: (context) => ChatListCubit(
              [
                ChatModel(
                  message: 'Ask me about Monsha\'at\'s support, programs, and initiatives. I\'m here to help!',
                  isHuman: false,
                )
              ],
            ),
          ),
          BlocProvider(
            create: (context) => ChatCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: const Color(0xff17a380),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
