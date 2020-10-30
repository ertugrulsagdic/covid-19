import 'package:covid_19/data/country_model.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  final CountryModel countryStats;
  final int tabIndex;

  StatsGrid(this.countryStats, this.tabIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: MediaQuery.of(context).size.height * 0.25,
      child: tabStats()
    );
  }

  Column tabStats(){
    if(tabIndex == 0){
      return Column(
        children: [
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('Total Cases', countryStats.totalCases, Colors.orange),
                  _buildStatCard('Deaths', countryStats.deaths, Colors.red)
                ],
              )
          ),
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('Recovered', countryStats.recovered, Colors.green),
                  _buildStatCard('Active', countryStats.active, Colors.lightBlue),
                  _buildStatCard('Critical', countryStats.critical, Colors.purple),
                ],
              )
          )
        ],
      );
    }
    else if(tabIndex == 1){
      return Column(
        children: [
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('New Cases', countryStats.tNewCases, Colors.orange),
                  _buildStatCard('Deaths', countryStats.tDeaths, Colors.red)
                ],
              )
          ),
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('Recovered', countryStats.tRecovered, Colors.green),
                  _buildStatCard('Active', countryStats.tActive, Colors.lightBlue),
                  _buildStatCard('Critical', countryStats.tCritical == 'null' ? 'N/A' : countryStats.tCritical, Colors.purple),
                ],
              )
          )
        ],
      );
    }
    else if (tabIndex == 2){
      return Column(
        children: [
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('New Cases', countryStats.yNewCases, Colors.orange),
                  _buildStatCard('Deaths', countryStats.yDeaths, Colors.red)
                ],
              )
          ),
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('Recovered', countryStats.yRecovered, Colors.green),
                  _buildStatCard('Active', countryStats.yActive, Colors.lightBlue),
                  _buildStatCard('Critical', countryStats.yCritical == 'null' ? 'N/A' : countryStats.yCritical, Colors.purple),
                ],
              )
          )
        ],
      );
    }

  }

  Expanded _buildStatCard(String title, String count, MaterialColor color){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              count,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
