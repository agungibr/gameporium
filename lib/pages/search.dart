import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gameporium/pages/orders/game.dart';
import 'package:gameporium/pages/orders/sw.dart';
import 'package:gameporium/pages/orders/vidio.dart';

class Search extends StatelessWidget {
  List<String> itemList;
  Search({super.key, required this.itemList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // autocomplete search appbar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          primary: false,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Autocomplete<String>(
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                autofocus: true,
                controller: textEditingController,
                focusNode: focusNode,
                onSubmitted: (String value) {
                  onFieldSubmitted();
                },
              );
            },
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return itemList.where((String option) {
                return option
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              Navigator.pop(context);
              Navigator.push(
                context,
                PageTransition(
                  child: Game(
                    name: selection,
                    image: '',
                  ),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
          ),
        ),

        body: Container(
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
