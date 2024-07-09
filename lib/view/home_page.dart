// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/controller/cart_controller.dart';
// import 'package:task/controller/home_provider.dart';
// import 'package:task/model/product_model.dart';
// import 'package:task/view/cart_page.dart';
// import 'package:task/view/navbar_widget.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final future =
//         Provider.of<HomePageProvider>(context, listen: false).getCategorie();
//     final pro = Provider.of<CartController>(context, listen: false);

//     return Scaffold(
//       drawer: NavBar(),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const TextField(
//           decoration: InputDecoration(
//             hintText: 'Search Dish',
//             border: InputBorder.none,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: FutureBuilder<void>(
//         future: future,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           } else {
//             return Consumer<HomePageProvider>(
//               builder: (context, provider, child) {
//                 return LayoutBuilder(
//                   builder: (context, constraints) {
//                     double width = constraints.maxWidth;
//                     bool isWideScreen = width > 600;

//                     return ListView(
//                       padding: const EdgeInsets.all(16.0),
//                       children: [
//                         const RestaurantInfo(),
//                         const SizedBox(height: 16.0),
//                         isWideScreen
//                             ? const MenuTabsHorizontal()
//                             : const MenuTabs(),
//                         const SizedBox(height: 16.0),
//                         const CategoryFilter(),
//                         const SizedBox(height: 16.0),
//                         ...provider.categories.map((category) {
//                           return MenuSection(
//                             title: category.name,
//                             items: category.products
//                                 .map((product) => MenuItem(
//                                       title: product.name,
//                                       originalPrice: product.mrp.toInt(),
//                                       discountedPrice: product.price.toInt(),
//                                       quantity: product.minQty,
//                                       imageUrl:
//                                           'https://via.placeholder.com/100',
//                                       productId: product.id, // Pass productId
//                                     ))
//                                 .toList(),
//                           );
//                         }).toList(),
//                       ],
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Consumer<HomePageProvider>(
//                   builder: (context, value, child) =>
//                       Text('${value.productQuantities.length} items')),
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => CartScreen()));
//               },
//               child: const Text('Add to Cart'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RestaurantInfo extends StatelessWidget {
//   const RestaurantInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             const CircleAvatar(
//               backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//               radius: 30,
//             ),
//             const SizedBox(width: 8.0),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Taza Kitchen',
//                     style:
//                         TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
//                 Text('From Peyad', style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//             const Spacer(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text('Follow'),
//                 ),
//                 const Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.amber, size: 16.0),
//                     Text('4.6'),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 16.0),
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text('14 Posts'),
//             Text('37 Followers'),
//           ],
//         ),
//         const SizedBox(height: 16.0),
//       ],
//     );
//   }
// }

// class MenuTabs extends StatelessWidget {
//   const MenuTabs({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         MenuTabItem(icon: Icons.menu, label: 'Menu'),
//         MenuTabItem(icon: Icons.video_library, label: 'Videos'),
//         MenuTabItem(icon: Icons.star, label: 'Reviews'),
//         MenuTabItem(icon: Icons.article, label: 'Blog'),
//       ],
//     );
//   }
// }

// class MenuTabsHorizontal extends StatelessWidget {
//   const MenuTabsHorizontal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Expanded(
//           child: MenuTabItem(icon: Icons.menu, label: 'Menu'),
//         ),
//         Expanded(
//           child: MenuTabItem(icon: Icons.video_library, label: 'Videos'),
//         ),
//         Expanded(
//           child: MenuTabItem(icon: Icons.star, label: 'Reviews'),
//         ),
//         Expanded(
//           child: MenuTabItem(icon: Icons.article, label: 'Blog'),
//         ),
//       ],
//     );
//   }
// }

// class MenuTabItem extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const MenuTabItem({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(icon, color: Colors.grey),
//         const SizedBox(height: 4.0),
//         Text(label, style: const TextStyle(color: Colors.grey)),
//       ],
//     );
//   }
// }

// class CategoryFilter extends StatelessWidget {
//   const CategoryFilter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           FilterChip(
//             label: const Text('Veg'),
//             onSelected: (selected) {},
//           ),
//           const SizedBox(width: 8.0),
//           FilterChip(
//             label: const Text('Non Veg'),
//             onSelected: (selected) {},
//           ),
//           const SizedBox(width: 8.0),
//           FilterChip(
//             label: const Text('All'),
//             onSelected: (selected) {},
//           ),
//           const SizedBox(width: 8.0),
//           FilterChip(
//             label: const Text('Buy Now'),
//             onSelected: (selected) {},
//           ),
//           const SizedBox(width: 8.0),
//           FilterChip(
//             label: const Text('Pre Order'),
//             onSelected: (selected) {},
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MenuSection extends StatelessWidget {
//   final String title;
//   final List<MenuItem> items;

//   const MenuSection({super.key, required this.title, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: Text(title),
//       children: items.isEmpty
//           ? [
//               const Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text('No items available'))
//             ]
//           : items,
//     );
//   }
// }

// class MenuItem extends StatelessWidget {
//   final String title;
//   final int originalPrice;
//   final int discountedPrice;
//   final int quantity;
//   final String imageUrl;
//   final int productId;

//   const MenuItem({
//     super.key,
//     required this.title,
//     required this.originalPrice,
//     required this.discountedPrice,
//     required this.quantity,
//     required this.imageUrl,
//     required this.productId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<HomePageProvider>(context, listen: false);
//     return ListTile(
//       leading:
//           Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
//       title: Text(title),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('($quantity min qty)'),
//           Row(
//             children: [
//               Text('₹$originalPrice',
//                   style:
//                       const TextStyle(decoration: TextDecoration.lineThrough)),
//               const SizedBox(width: 8.0),
//               Text('₹$discountedPrice',
//                   style: const TextStyle(color: Colors.red)),
//             ],
//           ),
//         ],
//       ),
//       trailing: Consumer<HomePageProvider>(
//         builder: (context, value, child) {
//           int currentQuantity = value.productQuantities[productId] ?? quantity;
//           return Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: () {
//                     Provider.of<CartController>(context, listen: false).addItem(
//                         Product(
//                             id: productId,
//                             name: title,
//                             minQty: quantity,
//                             discount: discountedPrice,
//                             mrp: originalPrice.toDouble(),
//                             price: originalPrice.toDouble()));

//                     value.decrementQuantity(productId);
//                   }),
//               Text(currentQuantity.toString()),
//               IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () {
//                     value.incrementQuantity(productId);
//                   }),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/cart_controller.dart';
import 'package:task/controller/home_provider.dart';
import 'package:task/model/product_model.dart';
import 'package:task/view/cart_page.dart';
import 'package:task/view/navbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final future =
        Provider.of<HomePageProvider>(context, listen: false).getCategorie();
    final pro = Provider.of<CartController>(context, listen: false);

    return Scaffold(
      drawer: const NavBar(), // Ensure NavBar is properly included
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search Dish',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    bool isWideScreen = width > 600;

                    return ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        const RestaurantInfo(),
                        const SizedBox(height: 16.0),
                        isWideScreen
                            ? const MenuTabsHorizontal()
                            : const MenuTabs(),
                        const SizedBox(height: 16.0),
                        const CategoryFilter(),
                        const SizedBox(height: 16.0),
                        ...provider.categories.map((category) {
                          return MenuSection(
                            title: category.name,
                            items: category.products
                                .map((product) => MenuItem(
                                      title: product.name,
                                      originalPrice: product.mrp.toInt(),
                                      discountedPrice: product.price.toInt(),
                                      quantity: product.minQty,
                                      imageUrl:
                                          'https://via.placeholder.com/100',
                                      productId: product.id,
                                    ))
                                .toList(),
                          );
                        }).toList(),
                      ],
                    );
                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<HomePageProvider>(
                  builder: (context, value, child) =>
                      Text('${value.productQuantities.length} items')),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              radius: 30,
            ),
            const SizedBox(width: 8.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Taza Kitchen',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text('From Peyad', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Follow'),
                ),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16.0),
                    Text('4.6'),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('14 Posts'),
            Text('37 Followers'),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

class MenuTabs extends StatelessWidget {
  const MenuTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MenuTabItem(icon: Icons.menu, label: 'Menu'),
        MenuTabItem(icon: Icons.video_library, label: 'Videos'),
        MenuTabItem(icon: Icons.star, label: 'Reviews'),
        MenuTabItem(icon: Icons.article, label: 'Blog'),
      ],
    );
  }
}

class MenuTabsHorizontal extends StatelessWidget {
  const MenuTabsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: MenuTabItem(icon: Icons.menu, label: 'Menu'),
        ),
        Expanded(
          child: MenuTabItem(icon: Icons.video_library, label: 'Videos'),
        ),
        Expanded(
          child: MenuTabItem(icon: Icons.star, label: 'Reviews'),
        ),
        Expanded(
          child: MenuTabItem(icon: Icons.article, label: 'Blog'),
        ),
      ],
    );
  }
}

class MenuTabItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuTabItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(height: 4.0),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: const Text('Veg'),
            onSelected: (selected) {},
          ),
          const SizedBox(width: 8.0),
          FilterChip(
            label: const Text('Non Veg'),
            onSelected: (selected) {},
          ),
          const SizedBox(width: 8.0),
          FilterChip(
            label: const Text('All'),
            onSelected: (selected) {},
          ),
          const SizedBox(width: 8.0),
          FilterChip(
            label: const Text('Buy Now'),
            onSelected: (selected) {},
          ),
          const SizedBox(width: 8.0),
          FilterChip(
            label: const Text('Pre Order'),
            onSelected: (selected) {},
          ),
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  final String title;
  final List<MenuItem> items;

  const MenuSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: items.isEmpty
          ? [
              const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No items available'))
            ]
          : items,
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final int originalPrice;
  final int discountedPrice;
  final int quantity;
  final String imageUrl;
  final int productId;

  const MenuItem({
    super.key,
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
    required this.quantity,
    required this.imageUrl,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context, listen: false);
    return ListTile(
      leading:
          Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('($quantity min qty)'),
          Row(
            children: [
              Text('₹$originalPrice',
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough)),
              const SizedBox(width: 8.0),
              Text('₹$discountedPrice',
                  style: const TextStyle(color: Colors.red)),
            ],
          ),
        ],
      ),
      trailing: Consumer<HomePageProvider>(
        builder: (context, value, child) {
          int currentQuantity = value.productQuantities[productId] ?? quantity;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    Provider.of<CartController>(context, listen: false).addItem(
                        Product(
                            id: productId,
                            name: title,
                            minQty: quantity,
                            discount: discountedPrice,
                            mrp: originalPrice.toDouble(),
                            price: originalPrice.toDouble()));
                    provider.incrementQuantity(productId);
                  }),
              Text('$currentQuantity'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Provider.of<CartController>(context, listen: false).addItem(
                      Product(
                          id: productId,
                          name: title,
                          minQty: quantity,
                          discount: discountedPrice,
                          mrp: originalPrice.toDouble(),
                          price: originalPrice.toDouble()));
                  provider.decrementQuantity(productId);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
