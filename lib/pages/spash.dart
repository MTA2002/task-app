import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 111, 87, 1.0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/stick-man-painting-on-canvas 1.png",
              width: 483,
              height: 483,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const SizedBox(
                  width: 256,
                  height: 50,
                  child: Center(
                    child: Text("Get Started",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
