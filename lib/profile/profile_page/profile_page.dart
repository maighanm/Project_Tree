import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker = ImagePicker();

  File ? selectedImage ;

  Future <void> imageSelector( ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null && mounted){



      setState(() {
        selectedImage = File(image !.path);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),

      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade500,
                  radius: 100,
                  child:
                  selectedImage == null ?

                  Icon(color: Colors.white38, Icons.person, size: 200)
                      :
                  ClipOval(child: Image.file(
                    height: 200,
                      width: 200,

                      fit: BoxFit.cover,

                      selectedImage!))




                ),

                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  Text("Profile" , style: TextStyle(fontSize: 25),),
                                  Divider(),
                                  Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Options(

                                          onPressed: (){
                                            imageSelector( ImageSource.camera);
                                            Navigator.pop(context);
                                          }


                                          ,
                                          title: "Camera", icon: Icons.camera_alt),
                                      Options(
                                          onPressed: (){
                                            imageSelector( ImageSource.gallery);
                                            Navigator.pop(context);

                                          },
                                          title: "Gallery", icon: Icons.image),
                                      if(selectedImage !=null)
                                      Options( selectedImage: selectedImage,
                                            onPressed: (){

                                              if (mounted) {
                                                setState(() {
                                                  selectedImage = null;
                                                });
                                              }
                                            },
                                          title: "Delete", icon: Icons.delete),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                    icon: Icon(color: Colors.grey, Icons.camera_alt, size: 35),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Name") ,
            subtitle: Text("Eng: Mai Abd Elghany"),
          ),
          ListTile(
            title: Text("Email") ,
            subtitle: Text("maighanm@gmail.com"),

          ),
        ],
      ),
    );
  }
}



class Options extends StatelessWidget {

  final String title;
  final IconData icon;
  Colors? colors;
  File? selectedImage;
  VoidCallback onPressed;

   Options({ required this.onPressed,
     this.colors,
     this.selectedImage,
     required this.title ,
     required this.icon ,
     super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedImage == null? Colors.grey : Colors.red,

          onPressed: onPressed,
          icon: Icon(icon),
        ),
        Text(title, style: TextStyle(color: selectedImage == null? Colors.grey.shade800 : Colors.red,),),
      ],
    );
  }
}
