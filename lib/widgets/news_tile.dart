import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc;

  NewsTile({this.imageUrl, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(imageUrl)),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            desc,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 17,
            ),
          ),
          SizedBox(height: 8.0),
           Divider(
            thickness: 5,
          ),
        ],
      ),
    );
  }
}
