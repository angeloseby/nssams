import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssams/providers/auth_provider.dart';
import 'package:nssams/utils/custom_color_scheme.dart';
import 'package:nssams/utils/screen_size.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nssidController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _positionController = TextEditingController(text: "Volunteer");
  final _yearController = TextEditingController();
  final _departmentController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  final _nssJoinYearController = TextEditingController();
  final _dobController = TextEditingController();

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
                      TextFormField(
                        controller: _nssidController,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          labelText: "NSS ID",
                          labelStyle: GoogleFonts.poppins(),
                          floatingLabelStyle: GoogleFonts.poppins(),
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter NSS ID' : null,
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: GoogleFonts.poppins(),
                          floatingLabelStyle: GoogleFonts.poppins(),
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Please check your password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      TextFormField(
                        controller: _positionController,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          labelText: "Position",
                          enabled: false,
                          labelStyle: GoogleFonts.poppins(),
                          floatingLabelStyle: GoogleFonts.poppins(),
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        validator: (value) {
                          return;
                        },
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      TextFormField(
                        controller: _yearController,
                        style: GoogleFonts.poppins(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Study Year",
                          labelStyle: GoogleFonts.poppins(),
                          floatingLabelStyle: GoogleFonts.poppins(),
                          fillColor: CustomColorScheme.mainColorAccent,
                          filled: true,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        validator: (value) {
                          // if (value! > 0 && value <= 5) {}

                          // if (enteredYear < 0 && enteredYear > 5) {
                          //   return "Enter correct year";
                          // }
                        },
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authProvider.fetchUserDetails(
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
