import 'package:flutter/material.dart';
import 'package:newsapp/constants/palette.dart';
import 'package:newsapp/models/newsModel.dart';

import 'customText.dart';

class SourceLayer extends ListTile{
  final Article article;
  SourceLayer({this.article}):super(
      contentPadding: EdgeInsets.all(0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
              text: article.source.name,
              textSize: 14,
              fontWeight: FontWeight.w600),
          CustomText(
            text:
            '${DateTime.now().difference(article.publishedAt).inMinutes}min',
            textSize: 10,
            textColor: Palette.silverText5,
          ),
        ],
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: Colors.blue, width: .5)),
        child: CustomText(
            text: 'Follow', textColor: Colors.blue),
      )
  );
}