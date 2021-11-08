import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  String bgImage="";

  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    if(data['isDaytime']==true)
      bgImage='day.jpg';
    else
      bgImage='night.jpg';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,//cover all the sscreen
          )
        ),
        child: SafeArea(
            child :Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: ()async{
                      dynamic result=await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                           'flag':result['flag'],
                        };
                      });
                    },
                    icon:Icon(Icons.edit_location),
                    color: Colors.grey[300],
                    label:Text(
                        'Edit location',
                         style: TextStyle(
                           color :Colors.black,
                         )),
                  ),
                  SizedBox(height :20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                      style :TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ))
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),)
                ],
              ),
            )),
      ),
    );
  }
}
