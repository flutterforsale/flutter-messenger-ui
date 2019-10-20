import 'package:flutter/cupertino.dart';

class AppBarNetworkRoundedImage extends StatelessWidget {
  final String imageUrl;

  AppBarNetworkRoundedImage({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
