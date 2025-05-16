import 'package:assigment_flutter/add_item/item_model.dart';
import 'package:assigment_flutter/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item.dart';


class AddItemScreen extends StatefulWidget {
  AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {

    title.dispose();
    body.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background.jpg"),)
        ),
        child: Consumer <ItemModel>(
          builder: (context, itemModel, child)=>
           ListView(
            children: [
              SizedBox(height: 150,),
          
            itemModel.selectedImage!.isEmpty ? Container(
              color: Colors.white38,
              height: 60,
              width: MediaQuery.sizeOf(context).width-20,
              child: IconButton(onPressed:(){
                itemModel.imageSelector();
              } , icon: Icon(Icons.camera_alt)),)
                : Row(
                  children: [
                    Container(
                      color: Colors.white38,
                      height:100,
                      width:100,
                      child: IconButton(onPressed:(){
                        itemModel.imageSelector();
                      } , icon: Icon(Icons.camera_alt)),),
          
                    SizedBox( height: 100,
                      width: MediaQuery.sizeOf(context).width-120,
                      child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: itemModel.selectedImage!.map((toElement)=>Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Image.file(toElement, height: 100, width: 100, fit: BoxFit.cover,),
                                      ),
                                      IconButton(onPressed: (){
                                        itemModel.removeImage(itemModel.selectedImage!.indexOf(toElement));
                                      }, icon: Icon(Icons.cancel))
                                    ],
                                  )).toList(),),
                    ),
                  ],
                )
              ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "title",
                  border: OutlineInputBorder()
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: body,
                minLines: 3,
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: "body",
                    border: OutlineInputBorder()
                ),
              ),
            ),
          ],),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed:(){
            
            final item = Provider.of<ItemModel>(context,listen: false);
            item.addItem(Item(images:List.from(item.selectedImage!), title:title.text, body:body.text, favorite:false ));

            item.selectedImage!.clear();

            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=> DashboardScreen()));
      }),
    );
  }
}
