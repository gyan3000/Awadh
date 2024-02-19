import 'package:flutter/material.dart';

class CPSlab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPS LAB'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./../assets/assets/images/CPS_Lab.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20, // Add spacing between cards
            runSpacing: 20, // Add spacing between rows
            children: [
              buildCardWithImage(
                context,
                'LED Experiments',
                'assets/images/farmer_input.jpg',
                () {
                  Navigator.pushNamed(context, '/LED_Experiment');
                },
              ),
              buildCardWithImage(
                context,
                'Button Experiments',
                'assets/images/weather_data.jpg',
                () {
                  Navigator.pushNamed(context, '/button_experiment');
                },
              ),
              buildCardWithImage(
                context,
                'SHT40 Experiment',
                'assets/images/query.jpg',
                () {
                  Navigator.pushNamed(context, '/SHT40_Experiment');
                },
              ),
              buildCardWithImage(
                context,
                'CO2 Sensor',
                'assets/images/contact.jpg',
                () {
                  Navigator.pushNamed(context, '/co2Sensor');
                },
              ),
              buildCardWithImage(
                context,
                'Weather Sensor',
                'assets/images/contact.jpg',
                () {
                  Navigator.pushNamed(context, '/weather');
                },
              ),
              buildCardWithImage(
                context,
                'Contact Us',
                'assets/images/contact.jpg',
                () {
                  Navigator.pushNamed(context, '/ContactUS');
                },
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
}
