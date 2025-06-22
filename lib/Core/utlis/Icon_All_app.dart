import 'package:flutter/widgets.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class IconApp extends StatelessWidget {
  const IconApp({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.logopark,
      width: width * 0.2,
    );
  }
}
