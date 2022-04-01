// ignore_for_file: non_constant_identifier_names, must_be_immutable, unnecessary_brace_in_string_interps, unused_element, unused_local_variable, import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../ipconfig.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

class SelectHistoryScreen extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  String place_id;
  String name;
  SelectHistoryScreen({required this.place_id, required this.name});

  @override
  State<SelectHistoryScreen> createState() => _SelectHistoryScreenState();
}

class _SelectHistoryScreenState extends State<SelectHistoryScreen> {
  int activeIndex = 0;
  @override
  void initState() {
    select_data();
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));

    super.initState();
  }

  List dataList = [];
  Future select_data() async {
    final response = await http.get(Uri.parse(
        "http://${ipcon}/mapjs/select_data.php?place_id=${widget.place_id}"));
    var data = json.decode(response.body);
    setState(() {
      dataList = data;
    });
    print(dataList);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.map_outlined),
              color: Colors.white,
              onPressed: () async {
                await widget.browser.open(
                    url: Uri.parse(
                        "http://$ipcon/mapjs/select_map.php?place_id=${widget.place_id}"),
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(
                            addDefaultShareMenuItem: false),
                        ios: IOSSafariOptions(barCollapsingEnabled: true)));
              },
            ),
          ],
          backgroundColor: Colors.black,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: 300,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false),
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'http://${ipcon}/mapjs/img/${dataList[index]['img']}',
                          fit: BoxFit.cover,
                        ),
                      ));
                },
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  // color: Colors.red,
                  width: double.infinity,
                  child: Text(widget.name,
                      style: GoogleFonts.prompt(
                          textStyle: TextStyle(fontSize: 24))),
                ),
              )
            ],
          ),
        ));
  }
}
