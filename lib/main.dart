import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'weather_data.dart';
import 'co2_sensor.dart';
import 'CPS_Lab.dart';
import 'LED_Experiment.dart';
import 'lis3dh_experiment.dart';
import 'ContactUS.dart';
import 'SHT40_Experiment.dart';
import 'stts751.dart';
import 'LCD_exp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/weather': (context) => WeatherData(),
        '/co2Sensor': (context) => Co2Sensor(),
        '/cpsLab': (context) => CPSlab(),
        '/LED_Button': (context) => LEDexperiment(),
        '/SHT40_Experiment': (context) => SHT40_Experiment(),
        '/STTS751_exp': (context) => STTS751(),
        '/lis3dh': (context) => LIS3DH(),
        '/ContactUS': (context) => Contact(),
        '/LCD_exp': (context) => LCDExp(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: '75SaySGDMoA',
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                './../assets/assets/images/awadh_logo.jpeg',
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              "Home",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/products');
            },
            child: Text(
              "Products",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/aboutUs');
            },
            child: Text(
              "About Us",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cpsLab');
            },
            child: Text(
              "CPS Lab Tutorial",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./../assets/assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Agriculture & Water Technology Development Hub (AWaDH)',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 450,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: [
                        'farmer_input.jpg',
                        'weather_data.jpg',
                        'iitropar_logo.png',
                      ].map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      './../assets/assets/images/$image'),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Container(
                      width: 800,
                      height: 450,
                      child: YoutubePlayer(
                        controller: _controller,
                        aspectRatio: 16 / 9,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCardWithImage(
                          context,
                          'Weather Sensor',
                          'assets/images/weather_data.jpg',
                          () {
                            Navigator.pushNamed(context, '/weather');
                          },
                        ),
                        SizedBox(width: 10),
                        buildCardWithImage(
                          context,
                          'CO2 Sensor',
                          'assets/images/mist.png',
                          () {
                            Navigator.pushNamed(context, '/co2Sensor');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //   SingleChildScrollView(
      //     physics: AlwaysScrollableScrollPhysics(),
      //     scrollDirection: Axis.vertical,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Container(
      //           width: double.infinity,
      //           height: 690,
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage('./../assets/assets/images/background.png'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               SizedBox(height: 50),
      //               Text(
      //                 'Agriculture & Water Technology Development Hub (AWaDH)',
      //                 style: TextStyle(
      //                   fontSize: 35,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //               SizedBox(height: 50),
      //               CarouselSlider(
      //                 options: CarouselOptions(
      //                   height: 450,
      //                   aspectRatio: 16 / 9,
      //                   autoPlay: true,
      //                   enlargeCenterPage: true,
      //                 ),
      //                 items: [
      //                   'farmer_input.jpg',
      //                   'weather_data.jpg',
      //                   'iitropar_logo.png',
      //                 ].map((image) {
      //                   return Builder(
      //                     builder: (BuildContext context) {
      //                       return Container(
      //                         width: MediaQuery.of(context).size.width,
      //                         margin: EdgeInsets.symmetric(horizontal: 5.0),
      //                         decoration: BoxDecoration(
      //                           image: DecorationImage(
      //                             image: AssetImage(
      //                                 './../assets/assets/images/$image'),
      //                           ),
      //                         ),
      //                       );
      //                     },
      //                   );
      //                 }).toList(),
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(height: 50),
      //         Container(
      //           width: MediaQuery.of(context).size.width,
      //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      //           child: Column(
      //             children: [
      //               Container(
      //                 width: 800,
      //                 height: 450,
      //                 child: YoutubePlayer(
      //                   controller: _controller,
      //                   aspectRatio: 16 / 9,
      //                 ),
      //               ),
      //               SizedBox(height: 20),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   ElevatedButton(
      //                     onPressed: () {
      //                       Navigator.pushNamed(context, '/weather');
      //                     },
      //                     style: ElevatedButton.styleFrom(
      //                       padding: EdgeInsets.symmetric(
      //                           horizontal: 20, vertical: 16),
      //                       textStyle: TextStyle(fontSize: 18),
      //                       primary: Colors.white,
      //                       side: BorderSide(color: Colors.red, width: 2.0),
      //                     ),
      //                     child: Text('Weather Data'),
      //                   ),
      //                   SizedBox(width: 10),
      //                   ElevatedButton(
      //                     onPressed: () {
      //                       Navigator.pushNamed(context, '/co2Sensor');
      //                     },
      //                     style: ElevatedButton.styleFrom(
      //                       padding: EdgeInsets.symmetric(
      //                           horizontal: 20, vertical: 16),
      //                       textStyle: TextStyle(fontSize: 18),
      //                       primary: Colors.white,
      //                       side: BorderSide(color: Colors.red, width: 2.0),
      //                     ),
      //                     child: Text('CO2 Sensor Data'),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
    );
  }

  Widget buildCardWithImage(BuildContext context, String buttonText,
      String imagePath, Function() onPressed) {
    return InkWell(
      child: Container(
        height: 250, // Adjust card height as needed
        width: 250, // Adjust card width as needed
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 140, // Adjust image height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.blue,
              ),
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
