import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(BuildContext context, String? url) async {
  if (url != null && url.isNotEmpty) {
    Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // هنا أضفنا المود
        );
      } else {
        CustomScaffoldMessenger(
          context,
          'Cannot launch $url',
          FontAwesomeIcons.circleXmark,
        );
      }
    } catch (e) {
      CustomScaffoldMessenger(
        context,
        'An error occurred: $e',
        FontAwesomeIcons.circleXmark,
      );
      print('an error occurred $e');
    }
  } else {
    CustomScaffoldMessenger(
        context, 'URL is invalid', FontAwesomeIcons.circleXmark);
  }
}
