import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardIconPerson extends StatelessWidget {
  IconData? icon;
  String? title;
  String? subtitle;
   CardIconPerson({
    Key? key,
    this.icon,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title ?? "", style: GoogleFonts.ptSans(color: Colors.blue.shade700, fontWeight: FontWeight.bold, fontSize: 18 )),
          SizedBox(height: 10,),
          Text(subtitle ?? "", style: GoogleFonts.ptSans(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16 )),
        ],
      ),
    );
  }
}
