import 'package:flutter/material.dart';
import 'package:flutter_todo/gradient_button.dart';
import 'package:flutter_todo/register.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage('assets/reading-person.png')),
          const SizedBox(height: 40),
          Column(
            children: <Widget>[
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ToDo List App',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  'This productive tool is designed to help you better manage your time and tasks.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              GradientButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage())),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 32,
                    ),
                    Text("Let's Start",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
