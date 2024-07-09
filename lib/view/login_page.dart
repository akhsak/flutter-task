import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/authantication_controller.dart';
import 'package:task/view/authantication/phone_page.dart';
import 'package:task/view/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(
                  child: Image.asset(
                    'assets/firebase-.png',
                    height: screenHeight * 0.12,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                SizedBox(height: screenHeight * 0.01),
                Row(),
                SizedBox(height: screenHeight * 0.02),
                const Row(
                  children: [],
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton.icon(
                  onPressed: () {
                    authController.googleSignIn(context);
                  },
                  icon: Image.asset(
                    'assets/Google.png',
                    height: screenHeight * 0.025,
                  ),
                  label: const Text('   Google   '),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.09,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                //  SizedBox(width: screenWidth * 0.04),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhoneScreen()));
                    // authProvider.clearLoginControllers();
                  },
                  icon: Image.asset(
                    'assets/phone-.png',
                    height: screenHeight * 0.025,
                  ),
                  label: const Text('Phone'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.09,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),

                SizedBox(height: screenHeight * 0.07),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Doesn't have an account on Discover?",
                        style: TextStyle(fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          //   Navigator.pushAndRemoveUntil(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => CreateAccount()),
                          //       (route) => false);
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
