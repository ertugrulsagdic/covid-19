import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String) onChanged;

  CountryDropdown({
    @required this.countries,
    @required this.country,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countries.map(
              (e) => DropdownMenuItem(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12.0,
                      child: Image.asset(
                        'assets/images/${e.toLowerCase()}_flag.png'
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Text(
                      e,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
                value: e,
              )).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
