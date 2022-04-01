// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unused_local_variable



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/30door/selectdoor30.dart';
import 'package:project01/1door/selectdoor1.dart';
import 'package:project01/2door/selectdoor2.dart';



class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'เส้นทาง',
          style: GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(height: 60),
        Container(child: Image.asset('assets/logo.jpg')),
        SizedBox(height: 60),
        Container(
          child: Text(
            'กรุณาเลือกเวลา',
            style:
                GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text('เดินชม 30 นาที',
                    style: GoogleFonts.prompt(fontSize: 18))),
            Container(
              padding: EdgeInsets.only(left: 60),
              child: ElevatedButton(
                child: Text('GO',
                    style:
                        GoogleFonts.prompt(color: Colors.black, fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  primary: Colors.grey[350],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => selectdoor30()));
                },
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text('เดินชม 1 ชั่วโมง',
                    style: GoogleFonts.prompt(fontSize: 18))),
            Container(
              padding: EdgeInsets.only(left: 60),
              child: ElevatedButton(
                child: Text('GO',
                    style:
                        GoogleFonts.prompt(color: Colors.black, fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  primary: Colors.grey[350],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => selectdoor1()));
                },
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text('เดินชม 2 ชั่วโมง',
                    style: GoogleFonts.prompt(fontSize: 18))),
            Container(
              padding: EdgeInsets.only(left: 60),
              child: ElevatedButton(
                child: Text('GO',
                    style:
                        GoogleFonts.prompt(color: Colors.black, fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  primary: Colors.grey[350],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => selectdoor2()));
                },
              ),
            )
          ],
        ),
      ]),
    );
  }
}
