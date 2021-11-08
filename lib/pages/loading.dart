
import 'package:flutter/material.dart';
import 'package:word_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="loding";
    void setupWordtime() async{
      WorldTime instance =WorldTime(location: 'Tunis', flag: 'tunis.png', url: 'Africa/Tunis');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location' :instance.location,
        'flag' :instance.flag,
        'time' :instance.time,
        'isDatime':instance.isDaytime,
      });

    }

  @override
  void initState() {
    super.initState();
    setupWordtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

