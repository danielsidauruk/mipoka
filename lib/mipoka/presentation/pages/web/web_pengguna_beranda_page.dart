import 'package:flutter/material.dart';

class WebPenggunaBerandaPage extends StatelessWidget {
  const WebPenggunaBerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'MIPOKA',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 1.0,
            color: Theme.of(context).accentColor,
          ),
        ),

        actions: [
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),

          const SizedBox(
            width: 600,
          ),

          InkWell(
            onTap: () {},
            child: Text(
              'Daniel Hamonangan Sidauruk',
            ),
          ),

          const SizedBox(width: 40),

          InkWell(
            onTap: () {},
            child: const Icon(Icons.brightness_6),
          ),

          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
