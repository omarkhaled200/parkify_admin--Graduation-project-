import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class Cardforparkingpricesandhour extends StatelessWidget {
  const Cardforparkingpricesandhour({
    super.key,
    required this.texttitle,
    required this.textprice,
  });
  final String texttitle;
  final String textprice;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              texttitle,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: Assets.textfamily,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              textprice,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: Assets.textfamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
