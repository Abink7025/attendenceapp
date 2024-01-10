import 'package:attendenceapp/controller/auth_controller.dart';
import 'package:attendenceapp/screens/home_screen.dart';
import 'package:attendenceapp/widgets/bottom_cornner.dart';
import 'package:attendenceapp/widgets/color_widgets.dart';
import 'package:attendenceapp/widgets/textfield_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              CornnerImage(),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 107),
                child: Container(
                  width: 301.97,
                  height: 208.14,
                  child: Image.asset('images/login 1.png'),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(
                top: 55.86,
              ),
              child: SizedBox(
                  width: 276,
                  height: 26,
                  child: Center(
                      child: Text(
                    'Admin Login',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ))),
            ),
            SizedBox(
              height: 20,
            ),
            Textwidget(
                text: 'Enter your email',
                textEditingController: _emailController),
            Textwidget(
                text: 'Confirm Password',
                textEditingController: _passwordController),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () async {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  try {
                    setState(() {
                      load = true;
                    });
                    await LoginService().loginpage(_emailController.text,
                        _passwordController.text, context);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false);
                    setState(() {
                      load = false;
                    });
                  } catch (e) {
                    setState(() {
                      load = false;
                    });
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Invalid name or phone number!'),
                  ));
                }
              },
              child: Container(
                width: 314,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(27, 182, 182, 1)),
                child: Center(
                    child: load
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: ColorWidgets.kWhiteColor),
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 80,
                  height: 84,
                  child: BottomCornner(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
