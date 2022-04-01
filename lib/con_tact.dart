import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contect extends StatelessWidget {
  const Contect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'ติดต่อ',
          style: GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: const <Widget>[
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('เบอร์โทรศัพย์โทร : 0xx-xxx-xxxx'),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('อีเมล : support@gmail.com'),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('เบอร์ฉุกเฉินโทร : 1669'),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
