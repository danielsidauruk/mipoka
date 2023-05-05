import 'package:flutter/material.dart';
import 'package:mipoka/core/theme.dart';

class MobilePenggunaBerandaPage extends StatefulWidget {
  const MobilePenggunaBerandaPage({super.key});

  @override
  State<MobilePenggunaBerandaPage> createState() => _MobilePenggunaBerandaPageState();
}

class _MobilePenggunaBerandaPageState extends State<MobilePenggunaBerandaPage> {
  bool isHovered = false;
  int selectedOptionIndex = -1;
  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
    'Option 6',
    'Option 5',
    'Option 3',
    'Option 2',
    'Option 11',
    'Option 5',
    'Option 6',
    'Option 7',
    'Option 8',
    'Option 9',
    'Option 10',
    'Option 9',
    'Option 10',
    'Option 5',
    'Option 6',
    'Option 7',
    'Option 8',
    'Option 9',
    'Option 10',
  ];

  final List<String> _menuItems = [
  'Option 1',
  'Option 2',
  'Option 3',
  'Option 4',
  'Option 5',
  'Option 6',
  ];

  List<String> _dropdownItems = [
    'Dropdown Option 1',
    'Dropdown Option 2',
    'Dropdown Option 3',
  ];

  String _selectedOption = 'Dropdown Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'MIPOKA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 0.5,
            color: Colors.white,
          ),
        ),
      ),

      drawer: SafeArea(
        child: Drawer(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text(
                'MIPOKA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      onChanged: (query) {},
                      style: const TextStyle(),
                      decoration: null,
                    ),
                  ),

                  const SizedBox(height: 8.0),

                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),

                  Row(
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

                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() => selectedOptionIndex = index);
                          },
                          onHover: (value) {
                            if (value) {
                              setState(() => selectedOptionIndex = index);
                            }
                          },
                          child: index != 4 ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            color: selectedOptionIndex == index ? Colors.white : Colors.black,
                            child: Text(
                              options[index],
                              style: TextStyle(
                                color: selectedOptionIndex == index ? Colors.black : Colors.white,
                                fontWeight: selectedOptionIndex == index ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ) :
                          ExpansionTile(
                            backgroundColor: selectedOptionIndex == index ? Colors.white : Colors.black,
                            textColor: selectedOptionIndex == index ? Colors.black : Colors.white,
                            title: Text(
                              options[index],
                              style: TextStyle(
                                color: selectedOptionIndex == index ? Colors.black : Colors.white,
                                fontWeight: selectedOptionIndex == index ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            children: _dropdownItems
                                .map((item) => ListTile(
                              title: Text(item),
                              onTap: () {
                                // Handle dropdown item click here
                                setState(() {
                                  _selectedOption = item;
                                });
                              },

                            )).toList(),
                          ),
                        );
                      },
                    ),
                  ),

                  // ListTile(
                  //   title: Text(_menuItems[0]),
                  //   onTap: () {
                  //     // Handle menu item click here
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text(_menuItems[1]),
                  //   onTap: () {
                  //     // Handle menu item click here
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text(_menuItems[2]),
                  //   onTap: () {
                  //     // Handle menu item click here
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text(_menuItems[3]),
                  //   onTap: () {
                  //     // Handle menu item click here
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ExpansionTile(
                  //   title: Text(
                  //     _menuItems[4],
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   children: _dropdownItems
                  //       .map((item) => ListTile(
                  //     title: Text(item),
                  //     onTap: () {
                  //       // Handle dropdown item click here
                  //       setState(() {
                  //         _selectedOption = item;
                  //       });
                  //       Navigator.pop(context);
                  //     },
                  //   ))
                  //       .toList(),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}