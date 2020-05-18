import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/animatedTabBar.dart';
import 'package:newsapp/components/customMediaQuery.dart';
import 'package:newsapp/components/customNoDataFound.dart';
import 'package:newsapp/components/customText.dart';
import 'package:newsapp/components/loadingWidget.dart';
import 'package:newsapp/components/sourceLayer.dart';
import 'package:newsapp/components/verticalSpacing.dart';
import 'package:newsapp/constants/palette.dart';
import 'package:newsapp/models/newsModel.dart';
import 'package:newsapp/screens/detailsPage/detailsPage.dart';
import 'package:newsapp/services/services.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  static const String route = '/dashboardPage';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  NewsModel model;
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  final _newsList = GlobalKey<AnimatedListState>();
  ScrollController scrollController = ScrollController();
  int _selectedIndex = 0;
  bool isError = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          loading = true;
        });
      }
    });
  }

  void getNews() async {
    try {
      var response = await Provider.of<Services>(context, listen: false)
          .getNews('us', 'business', 'Bearer f4e8d206d0874868b6622b64327409c5');
      if (response.statusCode == 200) {
        if (!mounted) return;
        setState(() {
          model = NewsModel.fromMap(response.body);
          model.articles.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
        });
      } else {
        setState(() {
          isError = true;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = CustomSize.height(context);
    // final double width = CustomSize.width(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        title: CustomText(
          text: 'SL Break',
          textColor: Palette.defaultColor,
        ),
      ),
      body: model != null
          ? model.articles.length != 0
              ? AnimatedList(
                  key: _newsList,
                  controller: scrollController,
                  initialItemCount: model.articles.length,
                  itemBuilder: (BuildContext context, int index, animated) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: OpenContainer(
                        transitionType: _transitionType,
                        transitionDuration: Duration(seconds: 1),
                        openBuilder:
                            (BuildContext _, VoidCallback openContainer) {
                          return DetailsPage(article: model.articles[index]);
                        },
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        closedElevation: 0.0,
                        closedBuilder:
                            (BuildContext _, VoidCallback openContainer) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.black.withOpacity(.2),
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                SourceLayer(article: model.articles[index]),
                                VerticalSpacing(height: 1),
                                CustomText(
                                  text: model.articles[index].title,
                                  fontWeight: FontWeight.bold,
                                  maxLines: 2,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.1)),
                                  padding: EdgeInsets.all(4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            Container(
                                          height: height > 1000 ? 220 : 120,
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Palette.defaultColor),
                                          ),
                                        ),
//                            height: height > 1000 ? 220 : 120,
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          height: height > 1000 ? 220 : 120,
                                          alignment: Alignment.center,
                                          child: CustomText(
                                              text: 'Image cannot load'),
                                        ),
                                        imageUrl:
                                            model.articles[index].urlToImage,
                                        fit: BoxFit.cover,
                                      ),
                                      CustomText(
                                        text: model.articles[index].content,
                                        maxLines: 5,
                                        textOverflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  })
              : CustomNoDataFound()
          : LoadingWidget(),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
              icon: Icon(Icons.refresh),
              title: CustomText(text: 'For You'),
              activeColor: Palette.defaultColor4,
              inactiveColor: Palette.defaultColor4.withOpacity(.5)),
          FlashyTabBarItem(
              icon: Icon(Icons.data_usage),
              title: CustomText(text: 'Coronavirus'),
              activeColor: Palette.defaultColor4,
              inactiveColor: Palette.defaultColor4.withOpacity(.5)),
          FlashyTabBarItem(
              icon: Icon(Icons.highlight),
              title: CustomText(text: 'Local'),
              activeColor: Palette.defaultColor4,
              inactiveColor: Palette.defaultColor4.withOpacity(.5)),
          FlashyTabBarItem(
              icon: Icon(Icons.accessibility_new),
              title: CustomText(text: 'Headlines'),
              activeColor: Palette.defaultColor4,
              inactiveColor: Palette.defaultColor4.withOpacity(.5)),
          FlashyTabBarItem(
              icon: Icon(Icons.settings),
              title: CustomText(text: 'Me'),
              activeColor: Palette.defaultColor4,
              inactiveColor: Palette.defaultColor4.withOpacity(.5)),
        ],
      ),
    );
  }
}
