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
                  var isLoaded = false;

                  return FutureBuilder<AppModel>(
                    future: isLoaded || appItem.appStore!.isEmpty
                        ? null
                        : getAppStoreData(appItem),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        isLoaded = true;
                        return AppWithShowcase(appItem: snapshot.data!);
                      } else {
                        if (appItem.appStore!.isNotEmpty && !isLoaded) {
                          return const AppLoading();
                        } else {
                          return AppWithoutShowcase(appItem: appItem);
                        }
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );

  Future<AppModel> getAppStoreData(AppModel appItem) async {
    late AppModel item;

    final appId = RegExp('id[0-9]+')
        .allMatches(appItem.appStore!)
        .elementAt(0)
        .group(0)!
        .substring(2);

    try {
      final response = await http.get(
        Uri.parse('https://flutter-company-listing-api.vercel.app/app/$appId'),
      );

      final appStoreItem =
          AppStoreModel.fromJson(json.decode(response.body)['results'][0]);

      item = appItem.copyWith(
        imageUrl: appStoreItem.artworkUrl100,
        screenshots: appStoreItem.screenshotUrls,
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      //cannot decode json
      item = appItem.copyWith(screenshots: []);
    }

    return item;
  }
}

class AppWithoutShowcase extends StatelessWidget {
  const AppWithoutShowcase({
    required this.appItem,
    Key? key,
  }) : super(key: key);

  final AppModel appItem;

  @override
  Widget build(BuildContext context) => Card(
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
                  padding: const EdgeInsets.only(right: 10),
                  child: WebsiteButton(
                    website: appItem.website!,
                  ),
                ),
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
      );
}

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
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

class AppWithShowcase extends StatelessWidget {
  const AppWithShowcase({
    required this.appItem,
    Key? key,
  }) : super(key: key);

  final AppModel appItem;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (appItem.imageUrl!.isNotEmpty)
                    AppLogo(
                      imageUrl: appItem.imageUrl!,
                    ),
                  const SizedBox(width: 20),
                  AppTitle(appItem: appItem),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: WebsiteButton(
                      website: appItem.website!,
                    ),
                  ),
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
            if (appItem.screenshots!.isNotEmpty)
              AppScreenShots(
                screenshots: appItem.screenshots!,
              ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      );
}

class AppTitle extends StatelessWidget {
  const AppTitle({
    required this.appItem,
    Key? key,
  }) : super(key: key);

  final AppModel appItem;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appItem.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              if (appItem.description!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(appItem.description!),
                ),
            ],
          ),
        ),
      );
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
