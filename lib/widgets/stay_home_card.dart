import 'package:covid_19/config/palette.dart';
import 'package:flutter/material.dart';

class StayHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.all(10.0),
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFAD9FE4), Palette.primaryColor],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset('assets/images/own_test.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Stay home!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Staying home as much as \npossible is the best prevention.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                maxLines: 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
