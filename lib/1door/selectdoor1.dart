// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/1door/mappage1.dart';
import 'package:project01/1door/mappage2.dart';

class selectdoor1 extends StatefulWidget {
  @override
  _selectdoor1State createState() => _selectdoor1State();
}

class _selectdoor1State extends State<selectdoor1> {
  Widget showlogo() {
    return Container(
        width: 300, height: 240, child: Image.asset('assets/behind.jpg'));
  }

  Widget showlogo1() {
    return Container(
        width: 330, height: 210, child: Image.asset('assets/fornt.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'เดินชม 1 ชั่วโมง',
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
                                  builder: (context) => MapPage1door1()));
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
                                  builder: (context) => MapPage1door2()));
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
