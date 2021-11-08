import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;//location of the place
  late String time;//current time there
  late String flag;//flag icon
  late String url;//
  late bool isDaytime;
  WorldTime({required this.location,required this.flag,required this.url});
  Future<void> getTime() async{
    try{

      Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data =jsonDecode(response.body);
      print (data);
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);
      //Create date Time Object
      DateTime now=DateTime.parse(datetime);
      now = now.add(Duration(hours :int.parse(offset)));
      time=now.toString();
      //time property
      isDaytime =now.hour > 6 && now.hour<20 ? true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print("caught error : $e");
      time="could not get time data";
    }

  }
}
