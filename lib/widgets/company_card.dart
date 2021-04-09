import 'package:flutter/material.dart';

// models
import 'package:flutter_company_listing/model/company_model.dart';

// packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_company_listing/pages/company_detail_page.dart';
import 'package:mdi/mdi.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyCard extends StatefulWidget {
  const CompanyCard(this.item, {Key? key}) : super(key: key);

  final CompanyModel item;

  @override
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  String websiteUrl = '';
  String imageUrl = '';
  late CompanyModel item;
  final String utmSource = '?utm_source=flutter_company_listing_github';

  @override
  void initState() {
    super.initState();
    item = widget.item;
    websiteUrl = Uri.parse(item.website).host.replaceAll('www.', '');
    imageUrl = 'https://logo.clearbit.com/$websiteUrl?size=80';
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              if (item.apps != null) {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CompanyDetailPage(item: item)));
              } else {
                if (await canLaunch(item.website + utmSource)) {
                  await launch(item.website + utmSource);
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: OctoImage(
                      fit: BoxFit.contain,
                      height: 80,
                      width: 80,
                      errorBuilder: OctoError.icon(),
                      placeholderBuilder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      image: CachedNetworkImageProvider(
                        imageUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                if (item.jobUrl.isNotEmpty || item.linkedin.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        if (item.jobUrl.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: IconButton(
                              splashRadius: 24,
                              onPressed: () async {
                                if (await canLaunch(item.jobUrl)) {
                                  await launch(item.jobUrl);
                                }
                              },
                              icon: const Icon(
                                Icons.person,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                        if (item.linkedin.isNotEmpty)
                          IconButton(
                            splashRadius: 24,
                            onPressed: () async {
                              if (await canLaunch(item.linkedin)) {
                                await launch(item.linkedin);
                              }
                            },
                            icon: const Icon(
                              Mdi.linkedin,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
