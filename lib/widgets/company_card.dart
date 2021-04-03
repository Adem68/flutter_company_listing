import 'package:flutter/material.dart';

// models
import 'package:flutter_company_listing/model/company_model.dart';

// packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_company_listing/pages/company_detail_page.dart';
import 'package:mdi/mdi.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard(this.item, {Key? key}) : super(key: key);

  final CompanyModel item;

  @override
  Widget build(BuildContext context) {
    final websiteUrl = Uri.parse(item.website).host.replaceAll('www.', '');

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            if (item.apps != null) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CompanyDetailPage(item: item)));
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
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                    errorBuilder: OctoError.icon(color: Colors.redAccent),
                    placeholderBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    image: CachedNetworkImageProvider(
                      'https://logo.clearbit.com/$websiteUrl?size=80',
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
}
