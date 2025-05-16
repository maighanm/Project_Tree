import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../profile/profile_page/profile_page.dart';
import '../profile/user_model.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;

    // Static data for the 5 photos and labels
    final List<Map<String, String>> aboutItems = [
      {'text': 'Mai', 'url': 'assets/Mai.jpg'},
      {'text': 'Sara', 'url': 'assets/Sara.jpeg'},
      {'text': 'Sohila', 'url': 'assets/Sohila.jpg'},
      {'text': 'Kenzy', 'url': 'assets/Kenzy.jpg'},
      {'text': 'Habiba', 'url': 'assets/Habiba.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage()));
            },
            icon: profileImage == null
                ? Icon(Icons.account_box)
                : CircleAvatar(
              child: ClipOval(
                child: Image.file(
                  profileImage,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
        ],
      ),

      // Body with static grid of images and text
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Meet Our Team",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: aboutItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(aboutItems[index]['url']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        color: Colors.black54,
                        child: Text(
                          aboutItems[index]['text']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
