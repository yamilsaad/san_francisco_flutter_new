import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
      accountSid: 'AC1e5a17bda8d531fe21a72a0c59f3d24b',
      authToken: '16697d316d95edbd5ecb82ee09f750ec',
      twilioNumber: '+13158475290',
    );
    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
      toNumber: '+542645748636',
      messageBody: 'Hola, este es un sms de twilio demo',
    );
  }

  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);
    await twilioFlutter.getSMS('***************************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        //automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Enviar el SMS.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}
