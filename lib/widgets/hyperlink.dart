import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class hyperlinkSocialMedia extends StatelessWidget {
  const hyperlinkSocialMedia(
      {Key? key, required this.icon, required this.title, required this.url})
      : super(key: key);
  final String? icon;
  final String? title;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url!)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
              title! == 'GitHub'
                  ? FontAwesomeIcons.github
                  : title! == 'Linkedin'
                      ? FontAwesomeIcons.linkedin
                      : FontAwesomeIcons.envelope,
              color: Colors.white,
              size: 16.0),
          SizedBox(
            width: 3,
          ),
          Text(
            title!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
