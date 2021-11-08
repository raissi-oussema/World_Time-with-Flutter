import 'package:flutter/material.dart';
import 'package:word_time/pages/choose_location.dart';
import 'package:word_time/pages/loading.dart';
import 'pages/home.dart';
void main()=>runApp(MaterialApp(
    initialRoute: '/',
    routes: {
        '/': (contexte)=>Loading(),
        '/home':(contexte)=>Home(),
        '/location':(contexte)=>chooseLocation(),
    },
));


