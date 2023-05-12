import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:text_to_speech/controller/chat_cubit.dart';
import 'package:text_to_speech/controller/chat_list_cubit.dart';
import 'package:text_to_speech/models/chat_model.dart';
import 'package:text_to_speech/repo/logo_urls.dart';
import 'package:text_to_speech/screens/widgets/chat_card.dart';
import 'package:text_to_speech/screens/widgets/my_text_field.dart';

import '../app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterTts flutterTts = FlutterTts();

  final TextEditingController controller = TextEditingController();

  ScrollController scrollController = ScrollController();

  SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';
  stt.SpeechToText speech = stt.SpeechToText();

  addToList(){
    if (controller.text.isNotEmpty) {
      print('================== in condition');


      tempList = context
          .read<ChatListCubit>()
          .state;
      tempList.add(ChatModel(message: controller.text.trim(), isHuman: true));
      context.read<ChatListCubit>().getList(list: tempList);
      context.read<ChatCubit>().getMessage(message: controller.text);
      controller.clear();

    }

  }
  void _startListening() async {
    bool available = await speech.initialize(
        onStatus: (statsu) {}, onError: (stat) {});

    print('==========  thsi is ${available}');
    if (await _speechToText.hasPermission) {
      print('=============== has permission');


      await _speechToText.listen(onResult: _onSpeechResult).whenComplete(() {
      //  addToList();
      });

      setState(() {});
    } else {
      print('=============== no permission');
    }
  }

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 1)).then((value) =>{
    _speak(text: 'Ask me about Monsha\'at\'s support, programs, and initiatives. I\'m here to help!')
    });
    // TODO: implement initState
    super.initState();
  }
  void _onSpeechResult(result) {
    setState(() {
      _lastWords = result.recognizedWords;
      controller.text = _lastWords;
    });
    print('====== hello');
  }

  void _stopListening() async {
    print('================== before');
    await _speechToText.stop();

    print('================== after');

    addToList();

  }

  List<ChatModel> tempList = [];

  bool isListening = false;

  testitn(){
    var lang = flutterTts.getLanguages;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () async {


            await flutterTts.stop();
          }, icon: const Icon(CupertinoIcons.speaker,color: Colors.white,))
        ],
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text('Chatbot', style: GoogleFonts.raleway(
            color: Colors.white
        ),),

      ),


      // extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AvatarGlow(

        endRadius: 50.sp,
        animate: isListening,
        showTwoGlows: true,
        glowColor: AppColors.primaryColor,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTapDown: (details) {
            setState(() {
              isListening = true;
              _startListening();
            });
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
              _stopListening();
            });
          },
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 25,
            child: Center(child: Icon(isListening ? Icons.mic : Icons.mic_off),
            ),
          ),
        ),
      ),



      bottomNavigationBar: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {



          if(state is ChatLoading){
            controller.clear();
            return              Container(
              height: 90.sp,
              child:  Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40.sp,
                  child: LoadingAnimationWidget.stretchedDots(

                    size: 80, color: AppColors.primaryColor,
                  ),
                ),
              ),
            );

          }else{
            return MyTextField(controller: controller);

          }
        },
      ),
      backgroundColor: AppColors.blackColor,

      body: BlocBuilder<ChatListCubit, List<ChatModel>>(
        builder: (context, list) {
          return BlocListener<ChatCubit, ChatState>(

            listener: (context, state) async {
              if(state is ChatError){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage,style: GoogleFonts.mulish(
                  color: Colors.white
                ),)));
              }
              if (state is ChatLoaded) {

                tempList = list;

                tempList.add(
                    ChatModel(message: state.message, isHuman: false));

                context.read<ChatListCubit>().getList(list: tempList);
                _speak(text: state.message);
                  scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 400), curve: Curves.easeIn);


                setState(() {

                });
              }
              // TODO: implement listener
            },
            child: Padding(

              padding: EdgeInsets.only(top: 8.sp,bottom: 30.sp),

              child: Column(
                children: [
                  Expanded(child: Image.network(organizationLogo),),
                  Expanded(
                    flex: 6,
                    child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller:scrollController,

                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      var chat = list[index];
                      return ChatCard(chat: chat,);
                    },
                  ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Future _speak({required String text}) async {
    var result = await flutterTts.speak(text);


    print('=============result $result ');
  }
}


