import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssams/providers/auth_provider.dart';
import 'package:nssams/utils/custom_color_scheme.dart';
import 'package:nssams/utils/screen_size.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nssidController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Row(
        children: [
          //form container
          Flexible(
            flex: 4,
            child: Form(
              key: _formKey,
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
                        controller: _nssidController,
                        style: GoogleFonts.poppins(),
                        decoration: const InputDecoration(
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter NSS ID' : null,
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
                        controller: _passwordController,
                        style: GoogleFonts.poppins(),
                        decoration: const InputDecoration(
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Please check your password";
                          }
                        },
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authProvider.signIn(
                              context,
                              _nssidController.text.toUpperCase(),
                              _passwordController.text.trim(),
                            );
                          }
                        },
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
                        child: (authProvider.isLoading)
                            ? const CircularProgressIndicator(
                                color: CustomColorScheme.mainColorAccent,
                              )
                            : Text(
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
        ],
      ),
    );
  }
}
