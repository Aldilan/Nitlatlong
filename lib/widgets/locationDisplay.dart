import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationDisplay extends StatelessWidget {
  const LocationDisplay(
      {super.key, required this.title, required this.content});
  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              title! != 'Location'
                  ? FontAwesomeIcons.mapPin
                  : FontAwesomeIcons.mapLocationDot,
              size: 20,
              color: Colors.blue[800],
            ),
            SizedBox(
              width: title! == 'Location' ? 8.0 : 0.0,
            ),
            Text(
              title!,
              style: TextStyle(
                  fontFamily: 'Nunito800',
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          content!,
          style: TextStyle(
            color: Colors.black38,
            fontSize: title == 'Location' ? 15 : 20,
          ),
          textAlign: TextAlign.center,
        ),
        title == 'Location'
            ? Container()
            : SizedBox(
                height: 10,
              )
      ],
    );
  }
}
