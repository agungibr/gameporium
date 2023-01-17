import 'package:flutter/material.dart';
import 'package:gameporium/services/textStyle.dart';

class Entertainment extends StatelessWidget {
  final List _vouchers = [
    [
      'Vidio',
      'https://assets.lapakgaming.com/images/tr:n-icon_category/vidio.jpg'
    ],
  ];

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
          itemCount: _vouchers.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(_vouchers[index][1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _vouchers[index][0],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.text(14, FontWeight.normal),
                    ),
                  ],
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
