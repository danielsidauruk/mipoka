import 'package:flutter/material.dart';
import 'package:mipoka/core/routes.dart';

class WebLoginPage extends StatelessWidget {
  const WebLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'MIPOKA',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 1.0,
          ),
        ),
      ),

      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Container(
                color: Colors.grey,
                height: 600,
                width: 600,
              )
            ),
          ),

          SizedBox(
            height: double.infinity,
            width: 1.0,
            child: Container(
              color: Colors.grey,
            ),
          ),


          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.displaySmall,
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  height: 60,
                  width: 450,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
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
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: true,
                    onChanged: (query) {},
                    style: const TextStyle(),
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                InkWell(
                  onTap: () => Navigator.pushNamed(context, webPenggunaBerandaRoute),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 60,
                    width: 450,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Theme.of(context).accentColor)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),

                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 8.0),

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
        ],
      ),
    );
  }
}
