import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
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

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(MaterialApp(home: MapPage30door2()));
}

class MapPage30door2 extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();

  @override
  _MapPage30door2State createState() => new _MapPage30door2State();
}

class _MapPage30door2State extends State<MapPage30door2> {
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
        backgroundColor: Colors.black,
        title: Text(
          'เดินชม 30 นาที ประตูหลัง',
          style: GoogleFonts.prompt(fontSize: 22, color: Colors.white),
        ),
      ),
      body:Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sdu.jpg"),
            fit: BoxFit.cover,
          ),
        ), 
        child:Center(
         child:ElevatedButton(
          onPressed: () async {
            await widget.browser.open(
                url: Uri.parse("http://$ipcon/mapjs/door/map30door2.php"),
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
      ),
       ),
    );
  }
}
