import 'package:flutter/material.dart';
import 'package:gameporium/services/textStyle.dart';
import 'package:gameporium/services/dataList.dart';
import 'package:gameporium/services/helper.dart';

class Game extends StatefulWidget {
  String name;
  String image;
  Game({super.key, required this.name, required this.image});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final List _mlDiamondsList = DataList.mlDiamondsList;
  final List _ewalletList = DataList.ewalletList;

  int? _selectedAmount;
  int? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          primary: false,
          scrolledUnderElevation: 0,
          title: Text(
            widget.name,
            style: CustomTextStyle.text(20, FontWeight.w700),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: IconButton(
                icon: const Icon(Icons.help_outline_rounded),
                onPressed: () {
                  Helper.showHelpDialog(
                    context,
                    'How to top up?',
                    '1. Input your ID.\n2. Select the amount you want to top up.\n3. Select the payment method.\n4. Click the "Top Up" button.',
                    'OK',
                  );
                },
              ),
            ),
          ],
        ),
        body: widget.name != 'Mobile Legends'
            ? Container(color: Theme.of(context).colorScheme.background)
            : Container(
                color: Theme.of(context).colorScheme.background,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Input ID
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Input ID',
                                style:
                                    CustomTextStyle.text(20, FontWeight.w500),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'User ID',
                                    labelStyle: CustomTextStyle.text(
                                        14, FontWeight.normal),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),

                              // zone id
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Zone ID',
                                    labelStyle: CustomTextStyle.text(
                                        14, FontWeight.normal),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),

                      const SizedBox(height: 8),

                      // Top Up Amount
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Top Up Amount',
                                  style:
                                      CustomTextStyle.text(20, FontWeight.w500),
                                ),
                                const SizedBox(height: 8),
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 3,
                                  ),
                                  itemCount: _mlDiamondsList.length,
                                  itemBuilder: (context, index) {
                                    return ChoiceChip(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      label: Container(
                                        width: double.infinity,
                                        child: Text(
                                          _mlDiamondsList[index][0],
                                          style: CustomTextStyle.text(
                                              14, FontWeight.normal),
                                        ),
                                      ),
                                      selected: _selectedAmount == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _selectedAmount =
                                              index == _selectedAmount
                                                  ? null
                                                  : index;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Payment Method
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Method',
                                  style:
                                      CustomTextStyle.text(20, FontWeight.w500),
                                ),
                                const SizedBox(height: 8),
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 5,
                                  ),
                                  itemCount: _ewalletList.length,
                                  itemBuilder: (context, index) {
                                    return ChoiceChip(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      label: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        width: double.infinity,
                                        height: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  _ewalletList[index][1]),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      selected: _selectedPaymentMethod == index,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          _selectedPaymentMethod =
                                              index == _selectedPaymentMethod
                                                  ? null
                                                  : index;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Total Amount
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Amount',
                                  style:
                                      CustomTextStyle.text(20, FontWeight.w500),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Item',
                                            style: CustomTextStyle.text(
                                                14, FontWeight.normal),
                                          ),
                                          Text(
                                            _selectedAmount == null
                                                ? '-'
                                                : _mlDiamondsList[
                                                    _selectedAmount!][0],
                                            style: CustomTextStyle.text(
                                                14, FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Payment Method',
                                            style: CustomTextStyle.text(
                                                14, FontWeight.normal),
                                          ),
                                          Text(
                                            _selectedPaymentMethod == null
                                                ? '-'
                                                : _ewalletList[
                                                    _selectedPaymentMethod!][0],
                                            style: CustomTextStyle.text(
                                                14, FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: CustomTextStyle.text(
                                                14, FontWeight.normal),
                                          ),
                                          Text(
                                            _selectedAmount == null
                                                ? '0'
                                                : Helper.convertToIdr(
                                                    _mlDiamondsList[
                                                        _selectedAmount!][1],
                                                    2),
                                            style: CustomTextStyle.text(
                                                14, FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 70),

                      // Button Order
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (_selectedAmount == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select top up amount'),
                                ),
                              );
                            } else if (_selectedPaymentMethod == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select payment method'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Order Success'),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Top Up',
                              style: CustomTextStyle.text(18, FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
