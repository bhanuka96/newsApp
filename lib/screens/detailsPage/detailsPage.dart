import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/components/customMediaQuery.dart';
import 'package:newsapp/components/customText.dart';
import 'package:newsapp/components/sourceLayer.dart';
import 'package:newsapp/components/verticalSpacing.dart';
import 'package:newsapp/constants/palette.dart';
import 'package:newsapp/models/newsModel.dart';

class DetailsPage extends StatelessWidget {
  static const String route = '/detailsPage';
  final Article article;

  const DetailsPage({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = CustomSize.height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Palette.defaultColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actionsIconTheme: IconThemeData(color: Palette.defaultColor),
        title: CustomText(
          text: article.source.name,
          textColor: Palette.defaultColor,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SourceLayer(article: article),
            CustomText(text: article.title, fontWeight: FontWeight.bold),
            VerticalSpacing(height: 10),
            CustomText(
              text:
                  'Published ${DateFormat('dd MMM, yyyy - H mm aaa').format(article.publishedAt)}',
              textSize: 13,
              textColor: Palette.silverText,
            ),
            VerticalSpacing(height: 10),
            Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.1)),
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      height: height > 1000 ? 220 : 120,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Palette.defaultColor),
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
                  ),
                  CustomText(text: article.content)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
