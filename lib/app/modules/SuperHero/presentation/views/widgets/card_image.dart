import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  String? urlImage;
  double? width;
  double? height;
  CardImage({Key? key, @required this.urlImage, @required this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: urlImage != null
            ? decorationImageNetwork(urlImage ?? "")
            : decorationImageAsset,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey,
            offset: Offset(1.0, 5.0)
          ),
        ]
      ),
    );
  }

  var decorationImageAsset = DecorationImage(
     fit: BoxFit.cover,
    image: AssetImage("assets/null.png"),
  );
  decorationImageNetwork(String urlImage) => DecorationImage(
    fit: BoxFit.cover,
        image: NetworkImage(urlImage),
      );
}
