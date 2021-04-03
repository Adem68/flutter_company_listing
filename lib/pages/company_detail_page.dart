import 'dart:convert';

//packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_company_listing/model/app_model.dart';
import 'package:flutter_company_listing/model/appstore_model.dart';
import 'package:flutter_company_listing/model/company_model.dart';
import 'package:mdi/mdi.dart';
import 'package:octo_image/octo_image.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CompanyDetailPage extends StatefulWidget {
  const CompanyDetailPage({
    required this.item,
    Key? key,
  }) : super(key: key);

  final CompanyModel item;

  @override
  _CompanyDetailPageState createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  late List<AppModel> apps;

  @override
  void initState() {
    super.initState();
    apps = widget.item.apps!;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.item.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.item.apps!.length,
                  itemBuilder: (context, index) {
                    final appItem = apps[index];
                    return FutureBuilder<AppModel>(
                      future: appItem.appStore!.isEmpty
                          ? null
                          : getAppStoreData(appItem),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (snapshot.data!.imageUrl!.isNotEmpty)
                                        AppLogo(
                                          imageUrl: snapshot.data!.imageUrl!,
                                        ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                appItem.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                              ),
                                              if (appItem
                                                  .description!.isNotEmpty)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 10,
                                                  ),
                                                  child: Text(
                                                      appItem.description!),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (appItem.website!.isNotEmpty)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: WebsiteButton(
                                            website: appItem.website!,
                                          ),
                                        ),
                                      if (appItem.playStore!.isNotEmpty)
                                        StoreButton(
                                          type: 0,
                                          storeUrl: appItem.playStore!,
                                        ),
                                      StoreButton(
                                        type: 1,
                                        storeUrl: appItem.appStore!,
                                      ),
                                    ],
                                  ),
                                ),
                                if (snapshot.data!.screenshots!.isNotEmpty)
                                  AppScreenShots(
                                    screenshots: snapshot.data!.screenshots!,
                                  ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          );
                        } else {
                          if (appItem.appStore!.isNotEmpty) {
                            return Center(
                              child: Column(
                                children: const [
                                  SizedBox(height: 20),
                                  Text('Data getting from App Store'),
                                  SizedBox(height: 20),
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          }
                          if (appItem.appStore!.isEmpty &&
                              appItem.playStore!.isNotEmpty) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Text(appItem.name),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    if (appItem.website!.isNotEmpty)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: WebsiteButton(
                                          website: appItem.website!,
                                        ),
                                      ),
                                    StoreButton(
                                      type: 0,
                                      storeUrl: appItem.playStore!,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const Center(
                            child: Text('Store link not found'),
                          );
                        }
                      },
                    );
                  }),
            ),
          ],
        ),
      );

  Future<AppModel> getAppStoreData(AppModel appItem) async {
    final appId = RegExp('id[0-9]+')
        .allMatches(appItem.appStore!)
        .elementAt(0)
        .group(0)!
        .substring(2);

    final res = await http.get(
      Uri.parse('https://flutter-company-listing-api.vercel.app/app/$appId'),
    );

    final appStoreItem =
        AppStoreModel.fromJson(json.decode(res.body)['results'][0]);

    return appItem.copyWith(
      imageUrl: appStoreItem.artworkUrl100,
      screenshots: appStoreItem.screenshotUrls,
    );
  }
}

class AppScreenShots extends StatelessWidget {
  const AppScreenShots({
    required this.screenshots,
    Key? key,
  }) : super(key: key);

  final List<String> screenshots;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 696,
            autoPlay: true,
            viewportFraction:
                calculateViewportFraction(MediaQuery.of(context).size.width),
            pauseAutoPlayOnTouch: true,
          ),
          items: screenshots
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item,
                      fit: BoxFit.fill,
                      height: 696,
                      width: 392,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );

  double calculateViewportFraction(double width) {
    var viewportFraction = 0.0;
    if (width >= 1600) {
      viewportFraction = 0.25;
    } else if (width >= 1400) {
      viewportFraction = 0.3;
    } else if (width >= 1200) {
      viewportFraction = 0.4;
    } else if (width >= 1000) {
      viewportFraction = 0.5;
    } else {
      viewportFraction = 1;
    }

    return viewportFraction;
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: OctoImage(
          fit: BoxFit.cover,
          height: 100,
          width: 100,
          errorBuilder: OctoError.icon(color: Colors.redAccent),
          placeholderBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          image: CachedNetworkImageProvider(
            imageUrl,
          ),
        ),
      );
}

class StoreButton extends StatelessWidget {
  const StoreButton({
    required this.type,
    required this.storeUrl,
    Key? key,
  }) : super(key: key);

  final int type;
  final String storeUrl;

  @override
  Widget build(BuildContext context) => IconButton(
        splashRadius: 24,
        onPressed: () async {
          if (await canLaunch(storeUrl)) {
            await launch(storeUrl);
          }
        },
        icon: Icon(type == 0 ? Mdi.google : Mdi.apple),
      );
}

class WebsiteButton extends StatelessWidget {
  const WebsiteButton({
    required this.website,
    Key? key,
  }) : super(key: key);

  final String website;

  @override
  Widget build(BuildContext context) => IconButton(
        splashRadius: 24,
        onPressed: () async {
          if (await canLaunch(website)) {
            await launch(website);
          }
        },
        icon: const Icon(Mdi.web),
      );
}
