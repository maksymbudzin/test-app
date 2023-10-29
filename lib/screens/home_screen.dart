import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [];
  final double itemAspectRatio = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 8),
              const Text('Markup Test'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    items.add('Item ${items.length + 1}');
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (items.isNotEmpty) {
                      items.removeLast();
                    }
                  });
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              const logoMaxWidth = 375.0;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Hero(
                        tag: 'logo',
                        child: SvgPicture.asset(
                          'assets/olearis_logo.svg',
                          width: logoMaxWidth,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: itemAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
