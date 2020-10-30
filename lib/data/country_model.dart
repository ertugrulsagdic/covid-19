class CountryModel {
  String totalCases;
  String deaths;
  String recovered;
  String active;
  String critical;

  String tNewCases;
  String tDeaths;
  String tRecovered;
  String tActive;
  String tCritical;

  String yNewCases;
  String yDeaths;
  String yRecovered;
  String yActive;
  String yCritical;

  CountryModel(
      {
        this.totalCases,
        this.deaths,
        this.recovered,
        this.active,
        this.critical,
        this.tNewCases,
        this.tDeaths,
        this.tRecovered,
        this.tActive,
        this.tCritical,
        this.yNewCases,
        this.yDeaths,
        this.yRecovered,
        this.yActive,
        this.yCritical
      }
   );

}