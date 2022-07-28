import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:random_password_generator/random_password_generator.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({Key? key}) : super(key: key);

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  bool _isWithLetters = true;
  bool _isWithUppercase = false;
  bool _isWithNumbers = false;
  bool _isWithSpecial = false;
  double _numberCharPassword = 8;
  String newPassword = '';
  Color _color = Colors.blue;
  String isOk = '';
  TextEditingController _passwordLength = TextEditingController();
  final password = RandomPasswordGenerator();
  @override
  void initState() {
    super.initState();
  }

  // Widget _checkBox(String name, Function onTap, bool value) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text(name),
  //       Checkbox(
  //         value: value,
  //         onChanged: (value) => () {
  //           setState(() {
  //             setState(() {
  //               value = value!;
  //             });
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Password Generator'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Numbers'),
                        Checkbox(
                          value: _isWithNumbers,
                          onChanged: (value) => {
                            setState(() {
                              _isWithNumbers = value!;
                            })
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Special Characters'),
                        Checkbox(
                          value: _isWithSpecial,
                          onChanged: (value) => {
                            setState(
                              () {
                                _isWithSpecial = value!;
                              },
                            ),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Lower Case'),
                        Checkbox(
                          value: _isWithLetters,
                          onChanged: (value) => {
                            setState(() {
                              _isWithLetters = value!;
                            })
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Upper Case'),
                        Checkbox(
                          value: _isWithUppercase,
                          onChanged: (value) => {
                            setState(() {
                              _isWithUppercase = value!;
                            })
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: _passwordLength,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      labelText: 'Enter Length',
                      labelStyle: const TextStyle(color: Colors.blue),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    if (_passwordLength.text.trim().isNotEmpty) {
                      _numberCharPassword =
                          double.parse(_passwordLength.text.trim());
                    } else if (_passwordLength.text.trim().length < 8) {
                      _numberCharPassword = 8;
                    }

                    newPassword = password.randomPassword(
                      letters: _isWithLetters,
                      numbers: _isWithNumbers,
                      passwordLength: _numberCharPassword,
                      specialChar: _isWithSpecial,
                      uppercase: _isWithUppercase,
                    );
                    double passwordstrength =
                        password.checkPassword(password: newPassword);
                    if (passwordstrength < 0.3) {
                      _color = Colors.red;
                      isOk = 'This password is weak!';
                    } else if (passwordstrength < 0.7) {
                      _color = Colors.blue;
                      isOk = 'This password is Good';
                    } else {
                      _color = Colors.green;
                      isOk = 'This password is Strong';
                    }
                    if (newPassword.length < 8 ||
                        newPassword.isEmpty ||
                        newPassword.length > 50) {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: const Text(
                                  "Password Length provided is not OK!"),
                              content: const Text(
                                  "Minimum password that can be entered is 8 and at max 50"),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(ctx).pop(false);
                                  },
                                ),
                              ],
                            );
                          });
                    }
                    setState(() {});
                  },
                  child: const Card(
                    elevation: 1,
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Generate the password',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (newPassword.isNotEmpty && newPassword.length >= 8)
                  Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          isOk,
                          style: TextStyle(color: _color, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                if (newPassword.isNotEmpty && newPassword.length >= 8)
                  Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: SelectableText(
                            newPassword,
                            style: TextStyle(color: _color, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (newPassword.isNotEmpty && newPassword.length >= 8)
                  Visibility(
                    visible: newPassword.isNotEmpty,
                    child: ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: newPassword));
                      },
                      child: const Text("Copy Password"),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
