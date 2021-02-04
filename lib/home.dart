import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ObjectsAI/realtime/live_camera.dart';
import 'package:ObjectsAI/static/static.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CameraDescription> cameras;
  List<String> images = [
    "https://image.freepik.com/free-vector/tiny-people-using-qr-code-online-payment-isolated-flat-illustration_74855-11136.jpg",
    "https://image.freepik.com/free-vector/tiny-people-scientists-identify-womans-emotions-from-voice-face-emotion-detection-emotional-state-recognizing-emo-sensor-technology-concept_335657-2442.jpg",
    "https://image.freepik.com/free-vector/woman-standing-mammography-machine-examination-disease-diagnosis_74855-11248.jpg"
  ];

  Future loadCams() async {
    cameras = await availableCameras();
  }

  void initState() {
    super.initState();
    loadCams();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: "ObjectAI"
            .text
            .xl2
            .bold
            .white
            .make()
            .shimmer(primaryColor: Colors.purple, secondaryColor: Colors.white),
        backgroundColor: Color(0xFFe0bafc),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            courousel(),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  color: Color(0xffb960fa),
                  textColor: Colors.white,
                  child: Text("Detect in Image"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaticImage(),
                      ),
                    );
                  },
                ),
                FlatButton(
                  color: Color(0xFFe0bafc),
                  textColor: Colors.white,
                  child: Text("Real Time Detection"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiveFeed(cameras),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget courousel() {
    return [
      VxSwiper.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final String g = images[index];
          return VxBox(child: ZStack([]))
              .clip(Clip.antiAlias)
              .bgImage(DecorationImage(
                image: NetworkImage(g),
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(
                //     Colors.black.withOpacity(0.50),
                //     BlendMode.darken)
              ))
              .withRounded(value: 14)
              .margin(EdgeInsets.fromLTRB(9, 4, 9, 20))
              .make()
              .centered();
        },
        autoPlay: true,
        height: 250.0,
        autoPlayAnimationDuration: Duration(seconds: 2),
      ),
    ].vStack();
  }
}