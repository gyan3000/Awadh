import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'weather_data.dart';
import 'co2_sensor.dart';
import 'CPS_Lab.dart';
import 'LED_Experiment.dart';
import 'lis3dh_experiment.dart';
import 'ContactUS.dart';
import 'SHT40_Experiment.dart';
import 'stts751.dart';
import 'LCD_exp.dart';
import 'button_exp.dart';
import 'CPS_lab_hardware.dart';
import 'about_us.dart';

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
        '/LED_exp': (context) => LEDexperiment(),
        '/Button_exp': (context) => ButtonExp(),
        '/SHT40_Experiment': (context) => SHT40_Experiment(),
        '/STTS751_exp': (context) => STTS751(),
        '/lis3dh': (context) => LIS3DH(),
        '/ContactUS': (context) => Contact(),
        '/LCD_exp': (context) => LCDExp(),
        '/cps_lab_hardware': (context) => CPSLabSetupPage(),
        '/aboutUs': (context) => AboutUsPage(),
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
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/videos/nRF5_SDK_home.mp4',
    );
    _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: true,
      aspectRatio: 16 / 9,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage!,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              title: Text('CPS Lab Hardwares'),
              onTap: () {
                Navigator.pushNamed(context, '/cps_lab_hardware');
              },
            ),
            ListTile(
              title: Text('CPS Lab Tutorial'),
              onTap: () {
                Navigator.pushNamed(context, '/cpsLab');
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/aboutUs');
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./../assets/assets/images/wall1.webp'),
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
                margin: EdgeInsets.only(left: 20, right: 20),
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
                        'iot_lab.png',
                        'awadh_banner.jpeg',
                        // 'Activity_Monitor_Kit.jpg',
                        // 'BLE_Gateway.jpg',
                        // 'Solar_Charging_and_Discharging_Module.jpg',
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
              SizedBox(height: 100),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Text(
                      'nRF5 SDK - Tutorial for Beginners - Install & Test nRF ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 800,
                      height: 450,
                      child: Chewie(
                        controller: _chewieController,
                      ),
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCardWithImage(
                          context,
                          'Weather Sensor',
                          'assets/images/Weather_sensor.jpg',
                          () {
                            Navigator.pushNamed(context, '/weather');
                          },
                        ),
                        SizedBox(width: 10),
                        buildCardWithImage(
                          context,
                          'CO2 Sensor',
                          'assets/images/Co2_sensor.jpg',
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
                backgroundColor: Colors.blue,
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
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
