
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sample/feature/main/domain/entities/login/state/login_state.dart';
import 'package:simple_sample/feature/main/presentation/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'App'),
      ),
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Please login before entering:',
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please Enter Email'
                        : null;
                  },
                  decoration: inputDecoration('E-mail', Icons.person),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please Enter Password'
                        : null;
                  },
                  controller: _passwordController,
                  decoration: inputDecoration('Password', Icons.lock),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    await controller.loginUser(_emailController.text, _passwordController.text);
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(
                height: 8,
              ),
              Obx(() =>
              controller.loginState is LoginLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox()
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText, IconData iconData,
      {String? prefix, String? helperText}) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      helperText: helperText,
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey),
      fillColor: Colors.grey.shade200,
      filled: true,
      prefixText: prefix,
      prefixIcon: Icon(
        iconData,
        size: 20,
      ),
      prefixIconConstraints: BoxConstraints(minWidth: 60),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black)),
    );
  }
}