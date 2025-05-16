import 'package:assigment_flutter/add_item/item.dart';
import 'package:assigment_flutter/add_item/item_model.dart';
import 'package:assigment_flutter/details/details_screen/details_page.dart';
import 'package:assigment_flutter/add_item/add_item_screen.dart';
import 'package:assigment_flutter/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../details/details_widget/favorite.dart';
import '../profile/profile_page/profile_page.dart';
import '../profile/user_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context) .user?.image;
    final items = Provider.of<ItemModel>(context);

    final fav = Provider.of<FavoriteModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),
        actions: [
          Stack(children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite , color: Colors.purple)),
            Text("${fav.fav.length}")
          ]),

          IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>profilePage()));
        },
            icon: profileImage == null ? Icon(Icons.account_box) : CircleAvatar(child: ClipOval(child: Image.file(profileImage ,
              fit: BoxFit.cover, height: 50, width: 50,),),))],
      ),
      body: items.items.isEmpty
          ? Center(child: Text("No items in Dashboard"))
          : GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
          ,crossAxisSpacing: 10
          ),
      itemCount: items.items.length,
        itemBuilder: (context , index){
            
            return InkWell(
              onTap: (){

                items.selectItem(Item(images: items.items[index].images, title: items.items[index].title, body: items.items[index].body, favorite: items.items[index].favorite));

                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
              },
              child: SizedBox(child: Column(children: [
                Image.file(items.items[index].images.first, height: 125, width: 200, fit: BoxFit.cover, ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(items.items[index].title),
                    FavoriteWidget(index: items.items.indexOf(items.items[index]),),

                    // IconButton(onPressed: (){
                    //   Provider.of<FavoriteModel>(context, listen: false).add(items.items[index]);
                    // }, icon:Icon(Icons.favorite))
                  ],
                )
              ],),),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddItemScreen()));
      }, child: Icon(Icons.add),),
    );
  }
}
