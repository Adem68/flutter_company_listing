import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdi/mdi.dart';
import 'package:url_launcher/url_launcher.dart';

// models
import 'package:flutter_company_listing/model/company_model.dart';

// widgets
import 'package:flutter_company_listing/widgets/company_card.dart';

// providers
import 'package:provider/provider.dart';
import 'package:flutter_company_listing/model/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  final String githubUrl = 'https://github.com/Adem68/flutter_company_listing/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var isLightMode = themeProvider.isLightTheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Company Listing',
          style: TextStyle(
            color: themeProvider.isLightTheme ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              if (await canLaunch(githubUrl)) {
                await launch(githubUrl);
              }
            },
            icon: Icon(
              Mdi.github,
              color: themeProvider.isLightTheme ? Colors.white : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () async {
              isLightMode = !isLightMode;
              themeProvider.setThemeData(val: isLightMode);
            },
            icon: Icon(
              themeProvider.isLightTheme
                  ? Mdi.moonWaningCrescent
                  : Mdi.whiteBalanceSunny,
              color: themeProvider.isLightTheme ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<List<CompanyModel>>(
            future: isLoaded ? null : loadData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: calculateCrossAxisCount(screenSize.width),
                      childAspectRatio: calculateAscpectRatio(screenSize.width),
                    ),
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return CompanyCard(item);
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<CompanyModel>> loadData() async {
    final jsonData = await rootBundle.loadString('assets/companies.json');
    final companies = companyModelFromJson(jsonData);
    // ignore: cascade_invocations
    companies.shuffle();
    isLoaded = true;
    return companies;
  }

  double calculateAscpectRatio(double width) {
    var ratio = 0.0;
    if (width >= 1200) {
      ratio = (width / 3) / 144;
    } else if (width >= 1000) {
      ratio = width / 220;
    } else {
      ratio = width / 144;
    }

    return ratio;
  }

  int calculateCrossAxisCount(double width) {
    var crossAxisCount = 0;
    if (width >= 1200) {
      crossAxisCount = 3;
    } else if (width >= 1000) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    return crossAxisCount;
  }
}
