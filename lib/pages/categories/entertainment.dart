import 'package:flutter/material.dart';
import 'package:gameporium/pages/orders/vidio.dart';
import 'package:gameporium/services/dataList.dart';
import 'package:gameporium/services/textStyle.dart';
import 'package:page_transition/page_transition.dart';

class Entertainment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 4,
                    ),
                  ),
                ),
                child: Text(
                  'Entertainment',
                  style: CustomTextStyle.text(18, FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.8,
          ),
          itemCount: DataList.entertainments.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: Vidio(
                        name: DataList.entertainments[index][0],
                        image: DataList.entertainments[index][1],
                      ),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image:
                                AssetImage(DataList.entertainments[index][1]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        DataList.entertainments[index][0],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.text(14, FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
