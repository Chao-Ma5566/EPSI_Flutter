import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: 80,
      height: 50,
    );
  }
}

class ImageProduit extends StatelessWidget {
  const ImageProduit({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: 320,
      height: 200,
    );
  }
}
