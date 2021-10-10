import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location ; //Location name for the UI
  late String time ; //Time for that location
  String flag; //url to an asset flag icon
  String url;
  late bool isDaytime ;


  WorldTime({ required this.location , required this.flag , required this.url});

  Future<void> getTime() async {

    try{
      //make request
      var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data.toString());

      //get properties from data
      String datetime = data['datetime'];
      String offset_hour = data['utc_offset'].substring(1,3);
      String offset_minute = data['utc_offset'].substring(4,6);
      // print(datetime);
      // print(offset_hour);
      // print(offset_minute);

      // create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset_hour) , minutes: int.parse(offset_minute) ));
      //print(now);

      //set the time property
      isDaytime = now.hour>=5 && now.hour<=19 ? true : false ;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      print('Caught Error, $e');
      time = 'Error occurred';
    }
  }
}