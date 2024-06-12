import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final Widget child; // Widget to be displayed inside the container

  const WhiteContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Align(
              alignment: Alignment.center,
              // Align both containers from the top
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 108),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.869,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                          ),
                          child: child, // Display the provided child widget inside the container
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
