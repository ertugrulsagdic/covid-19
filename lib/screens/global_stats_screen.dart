import 'package:covid_19/config/palette.dart';
import 'package:covid_19/data/covid_stats.dart';
import 'package:covid_19/data/global_model.dart';
import 'package:covid_19/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GlobalStats extends StatefulWidget {
  @override
  _GlobalStatsState createState() => _GlobalStatsState();
}

class _GlobalStatsState extends State<GlobalStats> {

  GlobalModel globalStats = new GlobalModel();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getGlobalStats();
  }

  getGlobalStats() async {
    CovidStats globalStats = CovidStats();
    await globalStats.getGlobalStats();
    this.globalStats = globalStats.globalStats;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            _buildHeader(screenHeight),
            _buildGlobalStatsGrid(screenHeight),
            _buildWorldMap()
          ],
        )
    );
  }

  SliverPadding _buildHeader(double screenHeight){
    return SliverPadding(
        padding: EdgeInsets.all(20.0),
        sliver: SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Global Statistics',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12.0,
                          child: Image.asset(
                              'assets/images/earth.png'
                          ),
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          'WW',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }

  SliverToBoxAdapter _buildGlobalStatsGrid(double screenHeight){
    return  SliverToBoxAdapter(
        child: _loading
            ? Container(
          height: screenHeight / 2 - 15 ,
          child: Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ),
        )
        : Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Wrap(
            runSpacing: 20,
            spacing: 20,
            children: <Widget>[
              InfoCard(
                title: "New Cases",
                iconColor: Color(0xFF5856D6),
                effectedNum: globalStats.newConfirmed,
              ),
              InfoCard(
                title: "Total Confirmed",
                iconColor: Color(0xFFFF8C00),
                effectedNum: globalStats.totalConfirmed,
              ),
              InfoCard(
                title: "Total Recovered",
                iconColor: Color(0xFF50E3C2),
                effectedNum: globalStats.totalRecovered,
              ),

              InfoCard(
                title: "Total Deaths",
                iconColor: Color(0xFFFF2D55),
                effectedNum: globalStats.totalDeaths,
              ),
            ],
          ),
        )
      );
  }

  SliverToBoxAdapter _buildWorldMap(){
    return SliverToBoxAdapter(
        child: Container(
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)
              )
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'World Map',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/map.svg")
            ],
          ),
        )
    );
  }
}

