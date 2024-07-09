import 'package:flutter/material.dart';
import 'package:task/view/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<LoginProvider>(context, listen: false);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Form(
            // key: authProvider.formKey,
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
                // Text(
                //   'Welcome to Discover',
                //   style: TextStyle(
                //     fontSize: screenHeight * 0.03,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Text(
                //   'Please choose your login option below',
                //   style: TextStyle(
                //     fontSize: screenHeight * 0.02,
                //     color: Colors.black,
                //   ),
                // ),
                SizedBox(height: screenHeight * 0.05),
                // Column(
                //   children: [
                //     TextFormField(
                //       keyboardType: TextInputType.emailAddress,
                //       controller: authProvider.loginEmailController,
                //       decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.email),
                //         labelText: 'Email',
                //         hintText: 'Enter your email address',
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         errorText: authProvider.emailError,
                //       ),
                //       onChanged: authProvider.validateEmail,
                //     ),
                //     SizedBox(height: screenHeight * 0.02),
                //     Consumer<LoginProvider>(
                //       builder: (context, value, child) => TextFormField(
                //         controller: authProvider.loginPasswordController,
                //         obscureText: value.loginObscureText,
                //         decoration: InputDecoration(
                //           prefixIcon: Icon(Icons.lock),
                //           labelText: 'Password',
                //           hintText: 'Enter your password',
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           suffixIcon: IconButton(
                //               onPressed: () {
                //                 value.loginObscureTextchange();
                //               },
                //               icon: Icon(value.loginObscureText
                //                   ? Icons.visibility_off
                //                   : Icons.visibility)),
                //           errorText: authProvider.passwordError,
                //         ),
                //         onChanged: authProvider.validatePassword,
                //       ),
                //     ),
                //   ],
                // ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => ForgotPasswordScreen(),
                //         ),
                //       );
                //     },
                //     child: Text(
                //       'Forgot password?',
                //       style: TextStyle(
                //         color: Color.fromARGB(255, 9, 122, 215),
                //         decoration: TextDecoration.underline,
                //         decorationColor: Color.fromARGB(255, 9, 122, 215),
                //       ),
                //     ),
                //   ),

                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        //authProvider.formKey.currentState!.validate()

                        {
                          // authProvider.adminKey(context, SnackBarWidget
                          ();
                          //  message: 'Incorrect email or password');
                          // try {
                          //     await authProvider.loginWithEmail(
                          //         authProvider.loginEmailController.text,
                          //         authProvider.loginPasswordController.text);

                          //     Navigator.pushAndRemoveUntil(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => UserBottomScreen()),
                          //         (route) => false);
                          //     SnackBarWidget()
                          //         .showSuccessSnackbar(context, 'login successfull');
                          //     authProvider.clearLoginControllers();
                          //   } catch (e) {
                          //     SnackBarWidget().showErrorSnackbar(
                          //         context, 'Email or Password is incorrect');
                          //   }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.4,
                          vertical: screenHeight * 0.025,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                const Row(
                  children: [],
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    // authProvider.clearLoginControllers();

                    //  authProvider.googleSignIn(context);
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
                        MaterialPageRoute(builder: (context) => HomePage()));
                    // authProvider.clearLoginControllers();

                    //  authProvider.googleSignIn(context);
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
