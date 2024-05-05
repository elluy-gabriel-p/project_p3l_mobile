import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/client/KaryawanClient.dart';
import 'package:project_p3l_mobile/client/UserClient.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';
import 'package:project_p3l_mobile/data/User.dart';
import 'package:project_p3l_mobile/view/dashboard.dart';
import 'package:project_p3l_mobile/view/home.dart';
import 'package:project_p3l_mobile/component/form_component.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  final Map? data;
  const LoginView({super.key, this.data});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nama_karyawanController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSecurePassword = true;

  List<Map<String, dynamic>> employee = [];
  void refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<User?> login() async {
      try {
        User loggedIn = await userClient.Login(
            nama_karyawanController.text, passwordController.text);
        // final Uint8List imageBytes =
        //     loggedIn.profilePicture!.buffer.asUint8List();
        // final Uint8List compressedImage = await compressImage(imageBytes);
        // loggedIn.profilePicture = compressedImage;
        showSnackbar(context, "Berhasil Login", Colors.green);
        return loggedIn;
      } catch (e) {
        return null;
      }
    }

    Future<Karyawan?> loginAdmin() async {
      try {
        Karyawan loggedInAdmin = await karyawanClient.Login(
            nama_karyawanController.text, passwordController.text);
        // final Uint8List imageBytes =
        //     loggedIn.profilePicture!.buffer.asUint8List();
        // final Uint8List compressedImage = await compressImage(imageBytes);
        // loggedIn.profilePicture = compressedImage;
        showSnackbar(context, "Berhasil Login", Colors.green);
        return loggedInAdmin;
      } catch (e) {
        return null;
      }
    }

    // ignore: unused_local_variable
    Map? dataForm = widget.data;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  CircleAvatar(
                    radius: 60,
                    // backgroundImage: AssetImage('image/globalHotelLogo.png'),
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Username Text Field
                        TextFormField(
                          controller: nama_karyawanController,
                          decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username tidak boleh kosong";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Password Text Field
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isSecurePassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isSecurePassword = !_isSecurePassword;
                                });
                              },
                              icon: Icon(
                                _isSecurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong !";
                            } else if (value.length < 8) {
                              return 'Password Minimal 8 karakter';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Login Button
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // User? loggedIn = await login();
                              // if (loggedIn != null) {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               HomeView(loggedIn: loggedIn)));
                              // } else {
                              Karyawan? loggedInAdmin = await loginAdmin();
                              if (loggedInAdmin != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardView(
                                            loggedInAdmin: loggedInAdmin)));
                              } else {
                                showSnackbar(context,
                                    "Username atau Password Salah", Colors.red);
                              }
                              // }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 65, 64, 64)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        SizedBox(height: 20),

                        // Forgot Password Button
                        TextButton(
                          onPressed: () {
                            // Implement forgot password functionality
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
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
      ),
    );
  }

  void showSnackbar(BuildContext context, String msg, Color bg) {
    final Scaffold = ScaffoldMessenger.of(context);
    Scaffold.showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: bg,
      action: SnackBarAction(
        label: 'hide',
        onPressed: Scaffold.hideCurrentSnackBar,
      ),
    ));
  }
}
