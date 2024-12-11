import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssams/utils/custom_color_scheme.dart';
import 'package:nssams/utils/screen_size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //form container
          Flexible(
            flex: 4,
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight(context) * 0.08,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight(context) * 0.08,
                            child: Image.network(
                              "https://raw.githubusercontent.com/angeloseby/nssams/refs/heads/main/assets/nsslogo.png",
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(context) * 0.08,
                            child: Image.network(
                              "https://raw.githubusercontent.com/angeloseby/nssams/refs/heads/main/assets/bmclogo.png",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.02,
                      ),
                      Text(
                        "BHARATA MATA COLLEGE\nATTENDENCE MANAGEMENT SYSTEM",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: screenWidth(context) * 0.06,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      Row(
                        children: [
                          Text(
                            "NSS ID",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.01,
                      ),
                      TextFormField(
                        style: GoogleFonts.poppins(),
                        decoration: const InputDecoration(
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      Row(
                        children: [
                          Text(
                            "Password",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: GoogleFonts.poppins(),
                        decoration: const InputDecoration(
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), // Adjust the radius as needed
                          ),
                          backgroundColor: CustomColorScheme.mainColor,
                          minimumSize: const Size(
                            double.maxFinite,
                            60,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "\"NOT ME BUT YOU\"",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: CustomColorScheme.mainColor,
                          fontSize: screenWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //name banner container
        ],
      ),
    );
  }
}
