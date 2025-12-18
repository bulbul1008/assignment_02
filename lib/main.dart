import 'package:assignment_02/Pages/custom_button_widget.dart';
import 'package:assignment_02/Pages/button_page_check.dart';
import 'package:assignment_02/Pages/custom_card.dart';
import 'package:assignment_02/Pages/custom_navbar_check.dart';
import 'package:assignment_02/Pages/mental_health_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "List Assignment",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle drawerTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    );
    const TextStyle listViewTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
      fontStyle: FontStyle.italic,
    );
    const TextStyle subListViewTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
      fontStyle: FontStyle.italic,
    );

    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(title: const Text("List Assignment")),

      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          children: [
            const DrawerHeader(child: Icon(Icons.home, size: 40)),
            // Settings button
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text("Custom Button", style: drawerTextStyle),
              onTap: () => navigateToPage(context, ButtonPageCheck()),
            ),

            ListTile(
              leading: const Icon(Icons.scanner, color: Colors.white),
              title: const Text("Custom NavBar", style: drawerTextStyle),
              onTap: () => navigateToPage(context, CustomCardsDemo()),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: const Text("Layout Practice", style: drawerTextStyle),
              onTap: () => navigateToPage(context, LayoutPractice()),
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: const Text("Mental Health App", style: drawerTextStyle),
              onTap: () => navigateToPage(context, MentalHealthPage()),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: const Text("ACCOUNTS", style: drawerTextStyle),
              onTap: ()=> navigateToPage(context, MentalHealthPage()),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: const Text("CREDIT CARDS", style: drawerTextStyle),
            ),
            ListTile(
              leading: Icon(Icons.transfer_within_a_station),
              title: const Text("TRANSFERS", style: drawerTextStyle),
            ),
            ListTile(
              leading: Icon(Icons.transcribe),
              title: const Text(
                "AUTHORIZE TRANSACTION",
                style: drawerTextStyle,
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: const Text("Bill Payments", style: drawerTextStyle),
            ),
            ListTile(
              leading: Icon(Icons.location_searching),
              title: const Text("LOCATION", style: drawerTextStyle),
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: const Text("CONTACT", style: drawerTextStyle),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_outlined),
              title: const Text("About Us", style: drawerTextStyle),
            ),
            ListTile(
              leading: Icon(Icons.scanner),
              title: const Text("SCAN & PAY", style: drawerTextStyle),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              height: 100,
              color: Colors.yellow[700],
              child: const Center(
                child: Text("Item One", style: listViewTextStyle),
              ),
            ),
            Container(
              height: 100,
              color: Colors.yellow[600],
              child: const Center(
                child: Text("Item Two", style: listViewTextStyle),
              ),
            ),
            Container(
              height: 100,
              // width: 100,
              color: Colors.yellow[500],
              child: const Center(
                child: Text("Item Three", style: listViewTextStyle),
              ),
            ),

            Container(
              height: 100,
              // width: 100,
              color: Colors.yellow[400],
              child: const Center(
                child: Text("Item Four", style: listViewTextStyle),
              ),
            ),
            Container(
              height: 100,
              // width: 100,
              color: Colors.yellow[300],
              child: const Center(
                child: Text("Item Five", style: listViewTextStyle),
              ),
            ),
            Container(
              height: 100,
              // width: 100,
              color: Colors.yellow[200],
              child: const Center(
                child: Text("Item Six", style: listViewTextStyle),
              ),
            ),
            Container(
              height: 300,
              color: Colors.blue,
              child: ListView(
                children: [
                  Container(
                    height: 100,
                    color: Colors.green[700],
                    child: const Center(
                      child: Text("Sub Item One", style: listViewTextStyle),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.green[600],
                    child: const Center(
                      child: Text("Sub Item Two", style: subListViewTextStyle),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.green[500],
                    child: const Center(
                      child: Text(
                        "Sub Item Three",
                        style: subListViewTextStyle,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.green[400],
                    child: const Center(
                      child: Text("Sub Item Four", style: subListViewTextStyle),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.green[300],
                    child: const Center(
                      child: Text("Sub Item Five", style: subListViewTextStyle),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.green[200],
                    child: const Center(
                      child: Text("Sub Item Six", style: subListViewTextStyle),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              // width: 100,
              color: Colors.yellow[700],
              child: const Center(
                child: Text("Item Seven", style: listViewTextStyle),
              ),
            ),
            Container(
              height: 100,
              // width: 100,
              color: Colors.yellow[600],
              child: const Center(
                child: Text("Item Eight", style: listViewTextStyle),
              ),
            ),
            Container(
              child: MyCustomButton(
                text: "Next Page bangladesh India Australia Ireland Bangladesh",
                fontSize: 20,
                textColor: Colors.white,
                leftIcon: Icons.menu,
                rightIcon: Icons.arrow_forward,
                iconColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToPage(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
