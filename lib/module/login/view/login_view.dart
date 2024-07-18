import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import 'package:mvc_demo/shared/widget/textfield/textfield.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  get context => null;

  Widget build(context, LoginController controller) {
    controller.view = this;

    // final TextEditingController usernameController = TextEditingController();
    //final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blue,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                "lib/shared/util/assets/images/LogiWatch.png",
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 100.0),
              const Text(
                "PT XXX INDONESIA",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QTextField(
                        label: "Email",
                        // validator: Validator.email,
                        suffixIcon: Icons.email,
                        value: null,
                        onChanged: (value) {
                          controller.email = value;
                        },
                      ),
                      QTextField(
                        label: "Password",
                        obscure: true,
                        //validator: Validator.required,
                        suffixIcon: Icons.password,
                        value: null,
                        onChanged: (value) {
                          controller.password = value;
                        },
                      ),
                      const Divider(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 42.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => controller.doEmailLogin(),
                          child: const Text("Login"),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 42.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => controller.doGoogleLogin(),
                          //child: const Text("Google Login"),
                          icon: const Icon(Icons
                              .account_circle), // Replace with the Google icon
                          label: const Text("Google Account"),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 42.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => controller.doAnonymousLogin(),
                          //child: const Text("Google Login"),
                          icon: const Icon(
                              Icons.analytics), // Replace with the Google icon
                          label: const Text("Anonymous Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /* TextFormField(
                initialValue: 'admin@gmail.com',
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your email address',
                ),
                onChanged: (value) {},
              ),
              TextFormField(
                initialValue: '123456',
                maxLength: 20,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.password,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: 'Enter your password',
                ),
                onChanged: (value) {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => controller.doLogin(),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
