import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_company_listing/model/app_model.dart';
import 'package:flutter_company_listing/model/appstore_model.dart';
import 'package:flutter_company_listing/model/company_model.dart';
import 'package:octo_image/octo_image.dart';
import 'package:http/http.dart' as http;

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
  final String corsUnlocker = 'https://cors-anywhere.herokuapp.com';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.item.name),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.item.apps!.length,
                  itemBuilder: (context, index) {
                    final appItem = widget.item.apps![index];
                    return FutureBuilder<AppModel>(
                      future: appItem.appStore!.isEmpty
                          ? null
                          : getAppStoreData(appItem),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: OctoImage(
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                      errorBuilder: OctoError.icon(
                                          color: Colors.redAccent),
                                      placeholderBuilder: (context) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      image: NetworkImage(
                                        '$corsUnlocker/${appItem.imageUrl!}',
                                        headers: {
                                          'access-control-allow-origin': '*',
                                          'origin': 'https://adem68.github.io'
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(appItem.name),
                                      Text(appItem.description!),
                                    ],
                                  ),
                                ],
                              ),
                              CarouselSlider(
                                options: CarouselOptions(),
                                items: appItem.screenshots!
                                    .map((item) => Center(
                                          child: Image.network(
                                            item,
                                            fit: BoxFit.cover,
                                            //width: 1000,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: Text('AppStore link not found'),
                          );
                          //const Center(child: CircularProgressIndicator())
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
      Uri.parse('$corsUnlocker/https://itunes.apple.com/lookup?id=$appId'),
      headers: {
        'access-control-allow-origin': '*',
        'origin': 'https://adem68.github.io'
      },
    );

    final appStoreItem =
        AppStoreModel.fromJson(json.decode(res.body)['results'][0]);

    return appItem.copyWith(
      screenshots: appStoreItem.screenshotUrls,
      imageUrl: appStoreItem.artworkUrl100,
      description: appStoreItem.description,
    );
  }
}
