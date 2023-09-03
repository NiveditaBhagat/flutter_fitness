import 'dart:convert';
import 'dart:math';
import 'package:flutter_exercise/exercise_provider.dart';
import 'package:flutter_exercise/screens/steps_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_exercise/colors.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../model/qoutes_model.dart';
class CountDown extends StatefulWidget {
  final AudioPlayer player;
   CountDown({
   required this.player,
    });

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
CountDownController _controller = CountDownController();
late List<Quote> quotes;

  @override
  void initState() {
    super.initState();
    quotes = [];
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/quotes')); // Replace with your API endpoint

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['quotes'];
      final List<Quote> parsedQuotes = data.map((quoteJson) => Quote.fromJson(quoteJson)).toList();
      setState(() {
        quotes = parsedQuotes;
      });
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  Quote? getRandomQuote() {
    if (quotes.isEmpty) {
      return null; // Return null if the quotes list is empty
    }
    final random = Random();
    final randomIndex = random.nextInt(quotes.length);
    return quotes[randomIndex];
  }

 

  bool _isPause = false;
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
             Padding(
              padding:  EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
               child: Text(
               '${getRandomQuote()?.quote ?? 'Quote not available'}',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp),
                  ),
             ),
                 SizedBox(height: 20.h),
              Text(
              '- ${getRandomQuote()?.author ?? 'Author not available'}',
               style: TextStyle(
                color: textGrey,
                fontSize: 16.sp),
             ),
                  
                Center(
                  child: CircularCountDownTimer(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      duration: 240,
                      fillColor: primaryColor,
                     
                    controller: _controller,
                    backgroundColor: Colors.white54,
                    strokeWidth: 10.0,
                    strokeCap: StrokeCap.round,
                    isTimerTextShown: true,
                    isReverse: false,
                    onComplete: (){
                     widget.player.stop();
                   
                        Alert(
                            context: context,
                            title: 'Finished!',
                          style: AlertStyle(
                            isCloseButton: true,
                            isButtonVisible: false,
                            titleStyle: TextStyle(
                              color: primaryColor,
                              fontSize: 30.0,
                            ),
                          ),
                          type: AlertType.success
                        ).show();
                    },
                    textStyle: TextStyle(fontSize: 50.0,color: Colors.black), ringColor: Color.fromARGB(255, 203, 189, 245),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
            onPressed: (){
              setState(() {
                if(_isPause){
                  _isPause = false;
                  _controller.resume();
                  widget.player.resume();
                }else{
                  _isPause = true;
                  _controller.pause();
                   widget.player.pause();
                }
              });
            },
            icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
            label: Text(_isPause ? 'Resume' : 'Pause'),
        ),
        
      ),
    );
  }
}