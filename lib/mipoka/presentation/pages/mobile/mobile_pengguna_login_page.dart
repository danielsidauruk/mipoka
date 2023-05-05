import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';

class MobilePenggunaLoginPage extends StatelessWidget {
  const MobilePenggunaLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
            'MIPOKA',
          style: mobileAppBar,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'LOGIN',
              style: mobileLoginTitle,
            ),

            const SizedBox(height: 40),

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
              onTap: () {},
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
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const Icon(Icons.arrow_forward_ios),
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
