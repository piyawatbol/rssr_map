// ignore_for_file: non_constant_identifier_names, unused_import, unnecessary_brace_in_string_interps
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ipconfig.dart';
import 'select_history_screen.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

final header_text =
    'วังสวนสุนันทาในอดีตนั้นมีตำหนักซึ่งเคยเป็นที่ประทับของเจ้านายฝ่ายในหลายพระองค์และเมื่อเวลาผ่านไป บางตำหนักได้ชำรุดทรุดโทรมเกินกว่าจะเยียวยาจำเป็นต้องรื้อถอนและสร้างใหม่ ในขณะที่บางตำหนักยังสามารถรักษาไว้ได้รอเพียงการบูรณะขึ้นมาอนุรักษ์ไว้โดยมีสถานที่สำคัญอันควรบันทึกไว้ 6 ตำหนักได้แก่';

class _HistoryPageState extends State<HistoryPage> {
  List dataList = [];
  Future get_data() async {
    final response =
        await http.get(Uri.parse("http://${ipcon}/mapjs/get_data.php"));
    var data = json.decode(response.body);
    setState(() {
      dataList = data;
    });
  }

  @override
  void initState() {
    get_data();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "ประวัติ",
            style:
                GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: Container(
              //    color: Colors.red,
              height: 1290,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      'ข้อมูลตำหนักสวนสุนันทา',
                      style: GoogleFonts.prompt(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "   ${header_text}",
                        style: GoogleFonts.prompt(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      height: 1000,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: dataList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return SelectHistoryScreen(
                                      place_id: dataList[index]['place_id'],
                                      name: dataList[index]['place_name']);
                                }));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2,
                                        offset: Offset(4, 3), // Shadow position
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                "http://${ipcon}/mapjs/img/${dataList[index]['place_pic']}"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 190,
                                        child: Text(
                                          dataList[index]['place_name'],
                                          style: GoogleFonts.prompt(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
