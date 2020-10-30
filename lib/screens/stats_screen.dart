import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid_19/config/palette.dart';
import 'package:covid_19/config/styles.dart';
import 'package:covid_19/data/country_model.dart';
import 'package:covid_19/data/covid_stats.dart';
import 'package:covid_19/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  CountryModel countryStats;

  int _tabIndex = 0;

  String _country = 'TR';

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCountryTotalStats();
  }

  getCountryTotalStats() async {
    CovidStats countryStats = CovidStats();
    await countryStats.getCountryTotalStats(_country);
    this.countryStats = countryStats.countryStats;
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
            _buildStatsTabBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              sliver: SliverToBoxAdapter(
                child: _loading
                    ? Container(
                        height: screenHeight / 3 - 50,
                        child: Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : StatsGrid(countryStats, _tabIndex),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10.0),
              sliver: SliverToBoxAdapter(
                child: CovidBarChart(),
              ),
            )
          ],
        ));
  }

  SliverPadding _buildHeader(double screenHeight) {
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
                    'Statistics',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CountryDropdown(
                    countries: ['TR', 'CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                    country: _country,
                    onChanged: (val) => setState(() => {
                      _country = val,
                      getCountryTotalStats(),
                      _loading = true,
                    }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  SliverToBoxAdapter _buildStatsTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
          length: 3,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(25.0)),
            child: TabBar(
              indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorHeight: 40.0,
                indicatorColor: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle: Styles.tabTextStyle,
              unselectedLabelColor: Colors.white,
              tabs: [
                Text('Total'),
                Text('Today'),
                Text('Yesterday'),
              ],
              onTap: (index) {
                setState(() {
                  _tabIndex = index;
                });
              },
            ),
          )),
    );
  }
}
