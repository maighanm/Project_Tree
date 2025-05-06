import 'dart:io';

import 'package:assigment_flutter/first_screen.dart';
import 'package:assigment_flutter/profile/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import '../home_widget/home_widget.dart';

class MyHomePage extends StatelessWidget {

  final String ? title;
  final String ? body;
  final List <File> ? image;
  const MyHomePage({ this.image, this.title,  this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [IconButton(onPressed: (){



          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())) ;
        }, icon: Icon(Icons.account_box))],
          centerTitle: true,
          title: Text("The ${title ?? "Tree"}")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            image == null || image!.isEmpty ? Image.asset("assets/s3.jpg") : Image.file(image![0], height: 300, fit: BoxFit.cover,width: double.infinity ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  textAlign: TextAlign.justify,
                  body ?? "tree, woody plant that regularly renews its growth (perennial). Most plants classified as trees have a single self-supporting trunk containing woody tissues, and in most species the trunk produces secondary limbs, called branches."
              ),
            ),
            image == null || image!.isEmpty ?Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Myseason(url: "assets/s1.jpg" , text: "Spring",),
                Myseason(url: "assets/s2.jpg" , text: "Fall",),

              ],
            ):
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemCount: image!.length ,
                      itemBuilder: (context, index) => Image.file(image![index] ,height: 200 ,width: 200, fit: BoxFit.cover,),

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing:10, crossAxisSpacing: 10, )),
                )
                
          ]),
      ),

        floatingActionButton: FloatingActionButton(child: Icon(Icons.save), onPressed: (){

          Navigator.push(

              context,
              MaterialPageRoute(builder: (context)=> Firstscreen()));

        }));
  }
}
