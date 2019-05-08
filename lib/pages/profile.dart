import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';




class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {

  File _image;


  @override

  Future getImage() async{
      var image= await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;

        print('Image Path $_image');
      });
  }


  Future uploadPic(BuildContext context) async{
//    final ref = FirebaseStorage.instance.ref().child('ProfilePic');
//    var url = await ref.getDownloadURL();
//    print(url);

    String fileName=basename(_image.path);
    StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask=firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: (){
          Navigator.pop(context);
            }),
        title: Text('Edit Profile'),
      ),
      body: Builder(
        builder: (context)=>
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Color(0xff476cfb),
                          child: ClipOval(
                            child:
                            SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image!= null)?Image.file(_image, fit:BoxFit.fill)
                              :Image.asset("assets/perfildefault.png", fit: BoxFit.fill),


                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                            icon: Icon(FontAwesomeIcons.camera, size: 30.0),
                            onPressed: (){
                              getImage();
                            },
                            ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text('Username',
                          style: TextStyle(
                            color: Colors.blueGrey, fontSize: 19.0
                          ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text('Ricardo Milos',
                            style: TextStyle(
                                color: Colors.black,
                            fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Color(0xff476cfb),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Color(0xff47cfb),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),

                        ),
                      ),
                      RaisedButton(
                        color: Color(0xff47cfb),
                        onPressed: (){
                          uploadPic(context);
                        },
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),

                    ],
                  )

                ],

              ),
            ),
      ),
    );

  }

}