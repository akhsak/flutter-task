// // ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/view/login_page.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({Key? key});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(
//                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmuOP36y9V49K-07Ni5JpYMa9DsYBIAeuGDH0hiyBwExivwYz_zT7tMflEiISwk6ABxEI&usqp=CAU'),
//                   fit: BoxFit.cover),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.settings),
//                 Text(
//                   'SETTINGS',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             title: const Text('Clear Data'),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: const Text('Clear Data'),
//                     content:
//                         const Text('Are you sure you want to clear all data ?'),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('CANCEL'),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           setState(() {
//                             // Provider.of<TripProvider>(context, listen: false)
//                             //  .deleteAllTrip();
//                             //  Provider.of<ExpenseProvider>(context, listen: false)
//                             //    .deleteAllExp();
//                           });
//                           Navigator.pop(context);
//                           Navigator.pop(context);
//                         },
//                         child: const Text('CLEAR'),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             trailing: const Icon(
//               Icons.delete,
//               color: Colors.red,
//             ),
//           ),
//           ListTile(
//             title: const Text(
//               'Log Out',
//               style: TextStyle(color: Colors.red),
//             ),
//             trailing: const Icon(
//               Icons.exit_to_app,
//               color: Colors.red,
//             ),
//             onTap: () {
//               signOut(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   signOut(BuildContext ctx) async {
//     // final logoutSharedPref = await SharedPreferences.getInstance();
//     // await logoutSharedPref.clear();
//     Navigator.of(ctx).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//         (route) => false);
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/view/login_page.dart';
// Import necessary packages
import 'package:firebase_auth/firebase_auth.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmuOP36y9V49K-07Ni5JpYMa9DsYBIAeuGDH0hiyBwExivwYz_zT7tMflEiISwk6ABxEI&usqp=CAU'),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text(
                  'SETTINGS',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Clear Data'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Clear Data'),
                    content:
                        const Text('Are you sure you want to clear all data?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // Provider.of<TripProvider>(context, listen: false)
                            //  .deleteAllTrip();
                            //  Provider.of<ExpenseProvider>(context, listen: false)
                            //    .deleteAllExp();
                          });
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('CLEAR'),
                      ),
                    ],
                  );
                },
              );
            },
            trailing: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          ListTile(
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),
            trailing: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            onTap: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }

  signOut(BuildContext ctx) async {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(ctx).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text('LOGOUT'),
            ),
          ],
        );
      },
    );
  }
}
