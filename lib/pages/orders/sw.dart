import 'package:flutter/material.dart';
import 'package:gameporium/services/textStyle.dart';
import 'package:gameporium/services/dataList.dart';
import 'package:gameporium/services/helper.dart';

class Sw extends StatefulWidget {
  String names;
  String images;
  Sw({super.key, required this.names, required this.images});

  @override
  State<Sw> createState() => SwState();
}

class SwState extends State<Sw> {
  final List _swList = DataList.swList;
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
            widget.names,
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
                    'Cara Melakukan Top Up',
                    '1. Masukan Email.\n2. Pilih jumlah yang diinginkan.\n3. Pilih metode pembayaran.\n4. Jika sudah, klik tombol top up.',
                    'OK',
                  );
                },
              ),
            ),
          ],
        ),
        body: widget.names != 'Steam Wallet'
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
                              'Email',
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
                                  labelText: 'Input Email',
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
                            itemCount: _swList.length,
                            itemBuilder: (context, index) {
                              return ChoiceChip(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .background,
                                label: Container(
                                  width: double.infinity,
                                  child: Text(
                                    _swList[index][0],
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
                                        image: AssetImage(
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
                                          : _swList[
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
                                          _swList[
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
