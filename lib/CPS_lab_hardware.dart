import 'package:flutter/material.dart';

class CPSLabSetupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPS Lab Hardware Setup'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.minWidth,
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HardwareDescriptionTile(
                    title: 'BLE Gateway',
                    description:
                        'The Bluetooth Gateway is a system architecture that allows '
                        'communication between a central device and multiple '
                        'Bluetooth nodes. This architecture is commonly used in '
                        'applications such as IoT (Internet of Things) networks, '
                        'smart home systems, and industrial monitoring.',
                    imagePath: 'assets/images/BLE_Gateway.jpg',
                  ),
                  HardwareDescriptionTile(
                    title: 'Low Power Camera Module',
                    description:
                        'CPS Camera Module involve a lot of image analytics. Low '
                        'power camera module is equipped with Camera, and '
                        'microcontroller. It is designed to learn how to capture the '
                        'image, store locally and/or send to the cloud.',
                    imagePath: 'assets/images/Low_power_camera_module.png',
                  ),
                  HardwareDescriptionTile(
                    title: 'BLE Development Kit',
                    description:
                        'It is a single-board development kit (DK) for Bluetooth '
                        'Low Energy.',
                    imagePath: 'assets/images/BLE_developement_kit.png',
                  ),
                  HardwareDescriptionTile(
                    title: 'BLE Node',
                    description:
                        'The BLE nodes are peripheral devices equipped with '
                        'NRF52 SoC. These nodes are equipped with temperature/ '
                        'Humidity and accelerometer sensor and external flash '
                        'memory. Each BLE node is capable of transmitting data to '
                        'the gateway.',
                    imagePath: 'assets/images/BLE_node.png',
                  ),
                  HardwareDescriptionTile(
                    title: 'Solar Charging and Discharging Module',
                    description:
                        'This module is designed to learn how to charge and '
                        'discharge the battery through Solar and calculation of '
                        'battery time, monitor the battery etc.',
                    imagePath:
                        'assets/images/Solar_Charging_and_Discharging_Module.jpg',
                  ),
                  HardwareDescriptionTile(
                    title: '4G/5G Kit with BLE',
                    description:
                        'The 4G/5G kit is equipped with 4G/5G module and a '
                        'microcontroller. This board also supports the external flash '
                        'memory and few sensors.',
                    imagePath: 'assets/images/4G_5G_kit.png',
                  ),
                  HardwareDescriptionTile(
                    title:
                        'Sensors/Weather monitoring system/Activity monitor System/Environment monitoring System',
                    description:
                        'Sensors come in the breakout boards. They have pins on '
                        'them, which are used for supplying the power, providing '
                        'ground, receiving inputs, and sending outputs. Breakout '
                        'boards, in a nutshell, make using a single electrical '
                        'component, sensor, or chip simple and easy. Different '
                        'types of sensors are available with the kit like '
                        'Temperature, Humidity, Accelerometer, Relay, Memory '
                        'Unit ,co2, Lux etc.',
                    imagePath: 'assets/images/Weather_sensor.jpg',
                  ),
                  HardwareDescriptionTile(
                    title: 'UART to USB Converter',
                    description:
                        'An UART to USB converter is a type of protocol converter '
                        'that is used for converting UART signal to USB data '
                        'signals.',
                    imagePath: 'assets/images/UART_to_USB.png',
                  ),
                  HardwareDescriptionTile(
                    title: 'Grove Shield',
                    description:
                        'Grove shield is a modular, simple-to-use system designed '
                        'to easily connect a BLE development kit to a wide range of '
                        '“modules” such as sensors, motors, and inputs.',
                    imagePath: 'assets/images/grove_shield.png',
                  ),
                  HardwareDescriptionTile(
                    title: 'Power Profiler Kit',
                    description:
                        'It is important to optimize the power consumption of the '
                        'CPS system. This system helps in measure the power '
                        'consumption of the same.',
                    imagePath: 'assets/images/power_profiler.png',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HardwareDescriptionTile extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const HardwareDescriptionTile({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 2.0,
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(description),
                SizedBox(height: 16.0),
                Image.asset(
                  imagePath,
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
