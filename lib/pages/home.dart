import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          buildCard(
            'assets/images/card1.png',
            'Common Button',
            'Clickable block to start a action.',
          ),
          const SizedBox(width: 16),
          buildCard(
            'assets/images/card2.png',
            'FloatingActionButton',
            'Clickable button with a image',
          ),
        ],
      ),
    );
  }

  Expanded buildCard(String image, String heading, String desc) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                heading,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Malleable',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/arrow-small-left-solid.svg',
            height: 25,
            width: 25,
          ),
          decoration: BoxDecoration(
              color: Color(0xf2f6f6f6),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            width: 33,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/adjustments-horizontal.svg',
              height: 25,
              width: 25,
            ),
            decoration: BoxDecoration(
                color: Color(0xf2f6f6f6),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
