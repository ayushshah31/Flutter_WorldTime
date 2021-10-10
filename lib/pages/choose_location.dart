import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'asia/kolkata',location: 'Mumbai',flag: 'India.png'),
    WorldTime(url: 'europe/london',location: 'London',flag: 'UK.png'),
    WorldTime(url: 'australia/sydney',location: 'Sydney',flag: 'Australia.png'),
    WorldTime(url: 'asia/jakarta',location: 'Jakarta',flag: 'Indonesia.png'),
    WorldTime(url: 'europe/paris',location: 'Paris',flag: 'France.png'),
    WorldTime(url: 'america/new_york',location: 'New York',flag: 'US.png'),
    WorldTime(url: 'indian/maldives',location: 'Maldives',flag: 'ROM.png'),
    WorldTime(url: 'asia/tokyo',location: 'Tokya',flag: 'Japan.png'),
    WorldTime(url: 'america/chicago',location: 'Chicago',flag: 'US.png'),
  ];

  void updateTime(index) async {

    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location ,
      'flag': instance.flag ,
      'time': instance.time ,
      'isDaytime': instance.isDaytime ,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              color: Colors.grey[300],
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}')
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
