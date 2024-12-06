import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssams/utils/custom_color_scheme.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Image.network(
                      "https://raw.githubusercontent.com/angeloseby/nssams/refs/heads/main/assets/nsslogo.png",
                      height: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "BHARATA MATA COLLEGE\nATTENDENCE MANAGEMENT SYSTEM",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 34,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                    const SizedBox(
                      height: 40,
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
                    const SizedBox(
                      height: 40,
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
                  ],
                ),
              ),
            ),
          ),
          //name banner container
          Flexible(
            flex: 5,
            child: Container(
              color: CustomColorScheme.mainColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.network(
                            "https://raw.githubusercontent.com/angeloseby/nssams/refs/heads/main/assets/nsslogo.png",
                            height: 150,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Image.network(
                            "https://raw.githubusercontent.com/angeloseby/nssams/refs/heads/main/assets/bmclogo.png",
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "National Service Scheme",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Bharata Mata College (Autonomous), Thrikkakara",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Unit No: 06",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "\"NOT ME BUT YOU\"",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
