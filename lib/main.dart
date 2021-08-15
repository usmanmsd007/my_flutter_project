import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = 'no name';
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // controller.text = 'zeeshan ';
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFields'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextFields(
                  controller: nameController,
                  labelText: 'Please Enter Your Name',
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextFields(
                  controller: phoneController,
                  labelText: 'Please Enter Your Phone No',
                  type: TextInputType.phone,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      name = '${nameController.text}  ${phoneController.text}';
                    });
                  },
                  child: Text(
                    'Submit',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('$name'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextFields extends StatelessWidget {
  const MyTextFields({
    required this.type,
    required this.labelText,
    Key? key,
    required this.controller,
  }) : super(key: key);
  final String labelText;
  final TextInputType type;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        labelText: labelText,
        // focusedBorder:
        labelStyle: TextStyle(color: Colors.red, fontSize: 30),
        border: OutlineInputBorder(),
      ),
      controller: controller,
      keyboardType: type,
      // obscureText: true,
      // it is used for passwords
      cursorColor: Colors.red,
      // the below style is for the text inside the text field
      style: TextStyle(color: Colors.red),
      textAlign: TextAlign.center,
    );
  }
}
