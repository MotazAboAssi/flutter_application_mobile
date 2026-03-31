import 'package:flutter/material.dart';
import 'package:store_app/actions/handel_network_image.dart';

class FloatingImage extends StatelessWidget {
  final double widthParent, heightParent;
  final String urlImage;

  const FloatingImage({
    super.key,
    required this.widthParent,
    required this.heightParent,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: heightParent * 0.75,
      left: widthParent * 0.3,
      child: SizedBox(
        width: widthParent * 0.6,
        height: heightParent * 0.5,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: loadNetworkImage("urlImage"),
        ),
      ),
    );
  }
}
