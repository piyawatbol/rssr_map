// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/2door/mappage1.dart';
import 'package:project01/2door/mappage2.dart';

class selectdoor2 extends StatefulWidget {
  @override
  _selectdoor2State createState() => _selectdoor2State();
}

class _selectdoor2State extends State<selectdoor2> {
  Widget showlogo() {
    return Container(
        width: 350, height: 260, child: Image.network('https://imgz.io/images/2022/03/16/monumentsunandha.jpg'));
  }

  Widget showlogo1() {
    return Container(
        width: 330, height: 220, child: Image.network('https://imgz.io/images/2022/03/16/door2.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'เดินชม 2 ชั่วโมง',
          style: GoogleFonts.prompt(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: 5),
            Container(
              child: Text(
                'กรุณาเลือกประตู',
                style: GoogleFonts.prompt(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Container(child: showlogo()),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text('ประตูหน้า',
                          style: GoogleFonts.prompt(fontSize: 18))),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      child: ElevatedButton(
                        child: Text('GO',
                            style: GoogleFonts.prompt(
                                color: Colors.black, fontSize: 13)),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          primary: Colors.grey[350],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage2door1()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(child: showlogo1()),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text('ประตูหลัง',
                          style: GoogleFonts.prompt(fontSize: 18))),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      child: ElevatedButton(
                        child: Text('GO',
                            style: GoogleFonts.prompt(
                                color: Colors.black, fontSize: 13)),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          primary: Colors.grey[350],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage2door2()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
