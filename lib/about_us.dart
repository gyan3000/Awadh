import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/wall1.webp'), // Replace with your background image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Preamble',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'About iHub-AWaDH',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'iHub-AWaDH, which stands for Innovation Hub for Agriculture and Water Technology Development Hub, is a dedicated initiative hosted at IIT Ropar Technology and Innovation Foundation established under National Mission on Interdisciplinary Cyber Physical Systems by Department of Science and Technology, Government of India. It aims to foster and promote deep tech innovation in the domains of Agriculture and Water, leveraging cutting-edge technologies like Cyber Physical Systems (CPS), Internet of Things (IoT), Artificial Intelligence (AI), and more. The iHub-AWaDH plays a pivotal role in accelerating the growth of startups, driving research, and building a strong ecosystem to address critical challenges in the agricultural and water sectors. Through strategic partnerships, incubation support, and collaborative programs, iHub-AWaDH aims to bring positive transformation and sustainable solutions for a better future.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'CPS Lab Proposal',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Introduction',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Cyber-physical systems (CPS) play a pivotal role in shaping the future of various industries and societal domains. Their importance lies in their ability to bridge the gap between the digital world of computing and the physical world of machinery and processes. CPS serves as the foundation for Internet of Things (IoT), providing the necessary hardware and software infrastructure to connect and control the physical devices in the IoT ecosystem. The data collected from IoT devices is often processed and analyzed by CPS to make real-time decisions and trigger appropriate actions. The IoT lab is one of the crucial elements of the CPS lab.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Objectives',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ObjectiveListItem(
                              number: '1',
                              text:
                                  'Education and Training: To provide professionals, researchers, and students with real-world knowledge and abilities in IoT-related smart technologies.'),
                          ObjectiveListItem(
                              number: '2',
                              text:
                                  'Research and Development: To promote and aid in the research activities in the IoT sector, examining fresh concepts and creating ground-breaking solutions.'),
                          ObjectiveListItem(
                              number: '3',
                              text:
                                  'Prototyping and Testing: To offer a platform for the prototyping and testing of IoT gadgets, sensors, and smart solutions software.'),
                          ObjectiveListItem(
                              number: '4',
                              text:
                                  'Collaboration: Encourage students, researchers, business leaders, and other stakeholders to work together to share information and create cutting-edge IoT solutions.'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Lab Activities and Services',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabActivityListItem(
                              text:
                                  'Workshops and training sessions: Hold frequent workshops and training sessions to inform participants about IoT technologies, smart home ideas, industrial solutions and practical CPS & IoT application development.'),
                          LabActivityListItem(
                              text:
                                  'Research initiatives: Assemble research teams to work on CPS & IoT initiatives with academic institutions and business partners. This can entail investigating new sensor technologies, improving energy effectiveness, strengthening security and privacy, or creating original apps.'),
                          LabActivityListItem(
                              text:
                                  'Prototyping and Testing: Make tools and support available for prototyping and testing CPS & IoT applications and devices, enabling users to test out various configurations and situations.'),
                          LabActivityListItem(
                              text:
                                  'Consultancy: Provide advisory services to people, businesses, and organizations interested in putting smart industrial ideas into practice. This could involve system integration, architecture design, and best practices for security and privacy.'),
                          LabActivityListItem(
                              text:
                                  'Community Engagement: Host competitions, hackathons, and events to involve the neighborhood, encourage creativity, and highlight the IoT\'s possibilities for smart solutions.'),
                        ],
                      ),
                      // Add more Text widgets for other sections
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ObjectiveListItem extends StatelessWidget {
  final String number;
  final String text;

  const ObjectiveListItem({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class LabActivityListItem extends StatelessWidget {
  final String text;

  const LabActivityListItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
