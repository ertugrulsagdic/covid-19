import 'package:covid_19/config/palette.dart';
import 'package:covid_19/data/article_model.dart';
import 'package:covid_19/data/news.dart';
import 'package:covid_19/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CovidNews extends StatefulWidget {
  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {
  List<ArticleModel> news = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News news = News(this._country);
    await news.getNews();
    this.news = news.news;
    setState(() {
      _loading = false;
    });
  }

  String _country = 'TR';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            _buildHeader(screenHeight),
            _buildNews(),
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
                    'Covid News',
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
                      getNews(),
                      _loading = true
                    }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  SliverPadding _buildNews() {
    final screenHeight = MediaQuery.of(context).size.height;
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      sliver: SliverToBoxAdapter(
        child: _loading
            ? Container(
              height: screenHeight / 3 * 2,
              child: Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                ),
            )
            : Column(
          children: news.asMap()
              .map((key, value) => MapEntry(
            key,
            NewsTile(
                imageUrl: news[key].urlToImage,
                title: news[key].title,
                desc: news[key].description
            ),
          ))
              .values
              .toList(),
        )
        )
        );
  }
}
