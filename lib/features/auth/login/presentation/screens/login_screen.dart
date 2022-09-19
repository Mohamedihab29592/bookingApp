import 'package:booking_app/core/constants/colors.dart';
import 'package:booking_app/features/auth/widgets/google_button.dart';
import 'package:booking_app/features/auth/widgets/my_button.dart';
import 'package:booking_app/features/auth/widgets/my_text.dart';
import 'package:booking_app/features/auth/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const MyText(
                    text: "LogIn",
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(alignment: Alignment.center, child: MySignButton()),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: MyText(
                  text: "or log in with email",
                  fontSize: 20,
                  colors: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const MyText(
                  text: "Your Email", fontSize: 20, colors: Colors.grey),
              MyTextForm(
                hintText: "Entre your Email",
                validator: (value) {},
                controller: TextEditingController(),
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              const MyText(text: "Password", fontSize: 20, colors: Colors.grey),
              MyTextForm(
                hintText: "Entre your Password",
                validator: (value) {},
                controller: TextEditingController(),
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const MyText(
                    text: "Forget your password ?",
                    fontSize: 17,
                    colors: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: MyButton(
                      onPressed: () {},
                      label: "Login",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      radius: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
