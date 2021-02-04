import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ObjectsAI/realtime/live_camera.dart';
import 'package:ObjectsAI/static/static.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:velocity_x/velocity_x.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // running the app
  runApp(MaterialApp(
    title: "ObectAI",
    home: Welcome(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.purple[50],
        accentColor: Colors.purple[50],
        brightness: Brightness.light),
  ));
}

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 260,
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Image(
                  image: CachedNetworkImageProvider(
                      "https://image.freepik.com/free-vector/dialog-with-chatbot-artificial-intelligence-reply-question-tech-support-instant-messaging-hotline-operator-ai-assistant-client-bot-consultant-vector-isolated-concept-metaphor-illustration_335657-4298.jpg")),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                'Get Started ',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            // const SizedBox(height:45),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                'ObjectAI in A Tensor Flow Application tha allows one detet objects , name these objects. You can scan anf identity objects. This is a demo Application for shopping anf kids learning',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 45),
            Container(
              // width: double.infinity,
              width: MediaQuery.of(context).size.width / 3,
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFe0bafc), Color(0xffb960fa)],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft),
              ),
              child: FlatButton(
                color: Colors.transparent,
                textColor: Colors.white,
                child: Text('Start Start Scanning Things'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
