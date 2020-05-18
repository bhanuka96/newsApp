import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/constants/palette.dart';
import 'package:newsapp/models/newsModel.dart';

import 'customText.dart';

class ImageLayer extends StatelessWidget{
  final Article article;
  final double height;
  ImageLayer({this.article,this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Container(
        height: height > 1000 ? 220 : 120,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Palette.defaultColor),
        ),
      ),
//                            height: height > 1000 ? 220 : 120,
      errorWidget: (context, url, error) => Container(
        height: height > 1000 ? 220 : 120,
        alignment: Alignment.center,
        child: CustomText(text: 'Image cannot load'),
      ),
      imageUrl: article.urlToImage,
      fit: BoxFit.cover,
    );
  }
}