// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/controller/cart_controller.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size.width;
//     ;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text("My Cart"),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: const Text(
//               "Clear Cart",
//               style: TextStyle(color: Colors.black),
//             ),
//           )
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: constraints.maxHeight,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Cart Item 1
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       margin: const EdgeInsets.only(bottom: 8.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Chilli Porotta'),
//                           Row(
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.remove),
//                                 onPressed: () {},
//                               ),
//                               const Text('1'),
//                               IconButton(
//                                 icon: const Icon(Icons.add),
//                                 onPressed: () {},
//                               ),
//                             ],
//                           ),
//                           const Text('₹ 110'),
//                         ],
//                       ),
//                     ),
//                     // Cart Item 2
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       margin: const EdgeInsets.only(bottom: 8.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Chicken Shavarma'),
//                           Row(
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.remove),
//                                 onPressed: () {},
//                               ),
//                               const Text('2'),
//                               IconButton(
//                                 icon: const Icon(Icons.add),
//                                 onPressed: () {},
//                               ),
//                             ],
//                           ),
//                           const Text('₹ 99'),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Divider(),
//                     // Bill Details
//                     const Text('BILL Details'),
//                     const SizedBox(height: 20),
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Item Total'),
//                               Text('₹ 308.00'),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Taxes & charges'),
//                               Text('₹ 57.40'),
//                             ],
//                           ),
//                           Divider(),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('GRAND TOTAL'),
//                               Text('₹ 302.65'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.amber, // Yellow background
//                           ),
//                           child: const Text(
//                             "Place Order",
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/cart_controller.dart';
import 'package:task/model/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> cartItems =
        Provider.of<CartController>(context, listen: false).getItems();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("My Cart"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Clear Cart",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = cartItems[index];
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.name),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {},
                                  ),
                                  Text('${item.minQty}'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Text('₹ ${item.price}'),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    // Bill Details
                    const Text('BILL Details'),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Item Total'),
                              Text('₹ 308.00'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Taxes & charges'),
                              Text('₹ 57.40'),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('GRAND TOTAL'),
                              Text('₹ 302.65'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber, // Yellow background
                          ),
                          child: const Text(
                            "Place Order",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
