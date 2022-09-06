import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'Day.png' : 'Night.png' ;
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[900] ;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              children: <Widget>[
                IconButton(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    // child: Text(
                    //   'Edit Location',
                    //   style: TextStyle(
                    //     color: Colors.grey[600],
                    // )
                    // )
                ),
                SizedBox(height: 210.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.grey,
                  )
                )

              ],
            ),
          ),
        )
      ),
    );
  }
}
