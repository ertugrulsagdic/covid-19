import 'dart:convert';
import 'package:covid_19/data/country_model.dart';
import 'package:covid_19/data/global_model.dart';
import 'package:http/http.dart' as http;

class CovidStats {

  GlobalModel globalStats;
  CountryModel countryStats;

  Future<void> getGlobalStats() async {
    String url = 'https://api.covid19api.com/summary';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData != null) {
      globalStats = new GlobalModel(
          newConfirmed: jsonData['Global']['NewConfirmed'].toString(),
          totalConfirmed: jsonData['Global']['TotalConfirmed'].toString(),
          totalDeaths: jsonData['Global']['TotalDeaths'].toString(),
          totalRecovered: jsonData['Global']['TotalRecovered'].toString()
      );
    }

  }
    Future<void> getCountryTotalStats(String country) async {
        if(country == 'UK'){
          country = 'gb';
        }
        else if (country == 'USA'){
          country = 'us';
        }
        String url = 'https://corona-api.com/countries/$country';

        var response = await http.get(url);

        var jsonData = jsonDecode(response.body);

        if (jsonData != null) {

          countryStats = CountryModel(
              totalCases: jsonData['data']["latest_data"]['confirmed'].toString(),
              deaths: jsonData['data']["latest_data"]['deaths'].toString(),
              recovered: jsonData['data']["latest_data"]['recovered'].toString(),
              active: jsonData['data']["timeline"][0]['active'].toString(),
              critical: jsonData['data']["latest_data"]['critical'].toString(),

              tNewCases: jsonData['data']["timeline"][0]['new_confirmed'].toString(),
              tDeaths: jsonData['data']["timeline"][0]['new_deaths'].toString(),
              tRecovered: jsonData['data']["timeline"][0]['new_recovered'].toString(),
              tActive: jsonData['data']["timeline"][0]['active'].toString(),
              tCritical: jsonData['data']["timeline"][0]['critical'].toString(),

              yNewCases: jsonData['data']["timeline"][1]['new_confirmed'].toString(),
              yDeaths: jsonData['data']["timeline"][1]['new_deaths'].toString(),
              yRecovered: jsonData['data']["timeline"][1]['new_recovered'].toString(),
              yActive: jsonData['data']["timeline"][1]['active'].toString(),
              yCritical: jsonData['data']["timeline"][1]['critical'].toString(),
          );
        }
      }
}