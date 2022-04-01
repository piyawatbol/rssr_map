import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/1door/mappage1.dart';
import 'ipconfig.dart';

class MapPage extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "แผนที่",
            style:
                GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          height: 600,
          width: 700,
          child: ElevatedButton(
            onPressed: () async {
              await widget.browser.open(
                  url: Uri.parse("http://$ipcon/mapjs/map.php"),
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
            },
            child: Text(
              "ไปยังหน้าแผนที่",
              style: GoogleFonts.prompt(fontSize: 22, color: Colors.black),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
              fixedSize: MaterialStateProperty.all<Size>(
                Size.fromHeight(70),
              ),
            ),
          ),
        ));
  }
}