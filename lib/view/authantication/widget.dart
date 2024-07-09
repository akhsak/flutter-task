import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/authantication_controller.dart';

class SnackBarWidget {
  void showSuccessSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color(0xFF00246B),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showErrorSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

alertSheet(BuildContext context,
    {onPressed, alertMessage, confirmButtonLabel}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          children: [
            textPoppins(
                name: alertMessage, fontweight: FontWeight.w600, fontsize: 15),
          ],
        ),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 4, 5, 5)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: textPoppins(name: 'CANCEL', color: Colors.white)),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 1, 1, 1))),
              onPressed: onPressed,
              child:
                  textPoppins(name: confirmButtonLabel, color: Colors.white)),
        ],
      );
    },
  );
}

Widget textPoppins({name, color, fontweight, double? fontsize}) {
  return Text(name!,
      style: GoogleFonts.poppins(
          color: color, fontWeight: fontweight, fontSize: fontsize));
}

Widget textAbel({name, color, fontweight, double? fontsize}) {
  return Text(name,
      style: GoogleFonts.abel(
          color: color, fontWeight: fontweight, fontSize: fontsize));
}

class TextWidget {
  text({data, size, weight, color, align, style}) {
    return Text(
      data,
      style: GoogleFonts.aBeeZee(
        fontSize: size,
        fontWeight: weight,
        color: color,
        fontStyle: style,
      ),
      textAlign: align,
      overflow: TextOverflow.ellipsis,
    );
  }
}

Widget phoneTextFormField(context) {
  final authProvider = Provider.of<AuthController>(context, listen: false);
  return Consumer<AuthController>(
    builder: (context, value, child) => TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'enter a phone number';
        } else {
          return null;
        }
      },
      // maxLength: 10,
      controller: authProvider.createAgeController,
      onChanged: (value) {},
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        // prefixIcon: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 12),
        //   child: InkWell(
        //     onTap: (){
        //       showCountryPicker(context: context,
        //       countryListTheme: CountryListThemeData(
        //        bottomSheetHeight: 500,
        //       ),
        //       onSelect: (value) {
        //        authProvider .selectCountry=value;
        //       },);
        //     },
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Text(value.selectCountry.flagEmoji,style: TextStyle(fontSize: 20),),
        //         SizedBox(width: 20,),
        //         Text("+${value.selectCountry.phoneCode}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        //       ],
        //     ),
        //   ),
        // ),
        suffixIcon: Icon(Icons.phone_android_outlined),
        labelText: 'phone number',
        labelStyle: TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
      ),
    ),
  );
}

Widget otpTextFormField(context) {
  final authProvider = Provider.of<AuthController>(context, listen: false);
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'otp is empty';
      } else {
        return null;
      }
    },
    maxLength: 6,
    controller: authProvider.otpController,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
    ],
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      suffixIcon: Icon(Icons.phone_android_outlined),
      labelText: 'Enter otp',
      labelStyle: TextStyle(color: Colors.black),
      fillColor: Colors.white,
      filled: true,
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF00246B)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF00246B)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF00246B)),
      ),
    ),
  );
}
