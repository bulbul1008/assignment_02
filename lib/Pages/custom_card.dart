import 'package:flutter/material.dart';

class LayoutPractice extends StatelessWidget {
  const LayoutPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Layout")),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Expanded(child: _leftPart()),
                //Expanded(child: _rightPart()),
                _rightPart(),
              ],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _leftPart(),
                Expanded(child: _rightPart()),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _leftPart() {
  return Container(
    width: 260,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
           alignment: Alignment.center,
          child: const Text(
            "Strawberry Pavlova",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          "Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. "
          "Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RatingStarGroup(rating: 3),
            const Text(
              "170 Reviews",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.ad_units, color: Colors.green),
                Text("PREP:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("25 min"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.punch_clock, color: Colors.green),
                Text("COOk:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _rightPart() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Image.asset(
      'assets/images/img.png',
    ),
  );
}

class RatingStarGroup extends StatelessWidget {
  final int rating;

  const RatingStarGroup({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(children: getStars());
  }

  List<Widget> getStars() {
    List<Widget> stars = [];
    int i = 0;
    for (i = 0; i < rating; i++) {
      stars.add(Icon(Icons.star, color: Colors.black, size: 16));
    }

    for (; i < 5; i++) {
      stars.add(Icon(Icons.star, color: Colors.blue, size: 16));
    }
    return stars;
  }
}
