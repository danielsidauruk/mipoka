import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';
import 'package:mipoka/core/theme.dart';

class MobilePenggunaLoginPage extends StatefulWidget {
  const MobilePenggunaLoginPage({super.key});

  @override
  State<MobilePenggunaLoginPage> createState() => _MobilePenggunaLoginPageState();
}

class _MobilePenggunaLoginPageState extends State<MobilePenggunaLoginPage> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
            'MIPOKA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(
              'LOGIN',
              style: mobileLoginTitle,
            ),

            SizedBox(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 60,
                    width: 450,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      onChanged: (query) {},
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        hintText: "NIM",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 60,
                    width: 450,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      onChanged: (query) {},
                      style: const TextStyle(),
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () => Navigator.pushNamed(context, mobilePenggunaBerandaRoute),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      height: 60,
                      width: 450,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Theme.of(context).accentColor)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: Text(
                          'Forget Password?',
                          style: Theme.of(context)
                              .textTheme.titleSmall?.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Switch(
                    value: darkMode,
                    onChanged: (value) {
                      setState(() => darkMode = value);
                    },
                  ),
                  
                  const Text(
                    'Dark Mode',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // InkWell(
            //   child: SizedBox(
            //     width: 450,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         Text(
            //           'Forget Password?',
            //           style: Theme.of(context)
            //               .textTheme.titleSmall?.copyWith(color: Colors.grey),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
