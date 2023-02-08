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
      builder: (context, child)=>
          MultiBlocProvider(

            providers: [
              BlocProvider(create: (context)=> ChatListCubit([ChatModel(message: 'What was your best trip so far?', isHuman: false)]),),
              BlocProvider(create: (context)=> ChatCubit(),),

            ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            useMaterial3: true,
            colorSchemeSeed : Color(0xff17a380),
          ),
          home: HomeScreen(),
        ),
    ),
    );
  }
}

