import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/contact_background.jpg', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: 400, // Increased width of the contact card
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactCard(
                    name: 'Desh Raj',
                    phoneNumber: '+91 9041756096',
                    email: 'deshraj23raj@gmail.com',
                    imageUrl: 'assets/assets/images/deshraj_sir.png',
                  ),
                  SizedBox(height: 20),
                  ContactCard(
                    name: 'Kamaljeet Singh',
                    phoneNumber: '+91 9459646780',
                    email: 'kamaljeets@iitrpr.ac.in',
                    imageUrl: 'assets/assets/images/person.jpg',
                  ),
                  SizedBox(height: 20),
                  ContactCard(
                    name: 'Gyaneshwar',
                    phoneNumber: '+91 7830523000',
                    email: 'gyaneshwar494@gmail.com',
                    imageUrl: 'assets/assets/images/person.jpg',
                  ),
                  SizedBox(height: 20),
                  ContactCard(
                    name: 'Jasmeen Kaur',
                    phoneNumber: '+91 6283053818',
                    email: 'jasmeensohi001@gmail.com',
                    imageUrl: 'assets/assets/images/person.jpg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String imageUrl;
  final Key? key;

  const ContactCard({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.imageUrl,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:
            Color.fromRGBO(255, 255, 255, 0.5), // Set transparent white color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: $name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Phone: $phoneNumber',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Email: $email',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
