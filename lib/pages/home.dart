import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:gameporium/pages/categories/entertainment.dart';
import 'package:gameporium/pages/categories/games.dart';
import 'package:gameporium/pages/categories/vouchers.dart';
import 'package:gameporium/pages/search.dart';
import 'package:gameporium/services/darkThemeProvider.dart';
import 'package:gameporium/services/dataList.dart';
import 'package:gameporium/services/textStyle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _categories = [
    'Games',
    'Vouchers',
    'Entertainment',
  ];

  final List<String> _games = <String>[
    'Mobile Legends',
    'Free Fire',
    'PUBG Mobile',
    'Call of Duty Mobile',
    'Valorant',
    'Genshin Impact',
    'Arena of Valor',
    'Apex Legends',
  ];

  int? _selectedIndex;
  List<Widget>? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          // surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).colorScheme.background,
          scrolledUnderElevation: 0,
          title: Text(
            'Gameporium',
            style: CustomTextStyle.text(20, FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: Search(
                        itemList: _games,
                      ),
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 10),
                    ),
                  );
                },
                icon: const Icon(Icons.search_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: IconButton(
                onPressed: () {
                  themeChange.darkTheme = !themeChange.darkTheme;
                },
                icon: Icon(themeChange.darkTheme
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            // list of categories
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      label: Text(
                        _categories[index],
                        style: CustomTextStyle.text(14, FontWeight.normal),
                      ),
                      selected: _selectedIndex == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedIndex = selected ? index : null;
                          if (_selectedIndex == 0) {
                            _selectedCategory = [Games()];
                          } else if (_selectedIndex == 1) {
                            _selectedCategory = [Vouchers()];
                          } else if (_selectedIndex == 2) {
                            _selectedCategory = [Entertainment()];
                          } else {
                            _selectedCategory = null;
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Column(
                  children: _selectedCategory ??
                      [
                        Games(),
                        Vouchers(),
                        Entertainment(),
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
