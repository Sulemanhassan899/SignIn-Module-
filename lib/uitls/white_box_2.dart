import 'package:flutter/material.dart';

class WhiteContainerDashboard extends StatelessWidget {
  final Widget? child; // Widget to be displayed inside the container

  const WhiteContainerDashboard({Key? key, required this.child}) : super(key: key);

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
                      padding: const EdgeInsets.only(top: 150, left: 16, right: 16,),
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.812 ,
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
                        padding: const EdgeInsets.only(top: 160),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.812,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                          ),
                          child: child,
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
