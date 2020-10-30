import 'package:covid_19/config/palette.dart';
import 'package:covid_19/widgets/prevent_card.dart';
import 'package:covid_19/widgets/symtom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildSymtoms(screenHeight),
          _buildPreventionTips(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you feeling sick?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'If you feel sick with any COVID-19 symptoms, please contact immediately for help',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),

          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prevention Tips",
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            PreventCard(
              text:
              "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
              image: "assets/images/wear_mask.png",
              title: "Wear face mask",
            ),
            PreventCard(
              text:
              "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
              image: "assets/images/wash_hands.png",
              title: "Wash your hands",
            ),

          ],
        ),
      ),
    );
  }
}

SliverToBoxAdapter _buildSymtoms(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Symptoms",
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SymptomCard(
                image: "assets/images/headache.png",
                title: "Headache",
                isActive: true,
              ),
              SymptomCard(
                image: "assets/images/caugh.png",
                title: "Caugh",
                isActive: true,
              ),
              SymptomCard(
                image: "assets/images/fever.png",
                title: "Fever",
                isActive: true,
              ),
            ],
          ),

        ],
      ),
    ),
  );
}



