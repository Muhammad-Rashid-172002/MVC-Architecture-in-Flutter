import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practics/widgets/round_button.dart';

class LogiWithPhoneNo extends StatefulWidget {
  const LogiWithPhoneNo({super.key});

  @override
  State<LogiWithPhoneNo> createState() => _LogiWithPhoneNoState();
}

class _LogiWithPhoneNoState extends State<LogiWithPhoneNo> {
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: GoogleFonts.aBeeZee(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: '+1 213 4567865',

                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            RoundButton(title: 'Login', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
