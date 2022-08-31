import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/controller/auth_manage.dart';
import 'package:medkit_app/controller/storage_services.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/size_config.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthManage());
    final auth = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference imgprofile = firestore.collection('imgprofile');

    final Storage storage = Storage();
    String? imagePath = 'default';
    String? id;
    return SizedBox(
      width: SizeConfig.screenWidth / 2.5,
      height: SizeConfig.screenWidth / 2.5,
      child: StreamBuilder<QuerySnapshot>(
          stream: imgprofile.where('id', isEqualTo: auth!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myData = snapshot.data!.docs;
              if (myData.isNotEmpty) {
                for (var i = 0; i < myData.length; i++) {
                  id = myData[i].id;
                  imagePath = myData[i]['img'] == null
                      ? 'default'
                      : myData[i]['img'].toString();
                }
                print('profile siap');
              } else if (myData.isEmpty) {
                imgprofile.add({
                  'id': auth.uid,
                  'img': auth.photoURL == null
                      ? 'default'
                      : auth.photoURL.toString()
                });
                print('profile belum siap');
              }
            }
            return Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                imagePath == 'default'
                    ? CircleAvatar(
                        backgroundColor: kPrimaryColor,
                      )
                    : CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        backgroundImage: NetworkImage(imagePath.toString()),
                      ), // auth == null ? Text('aria') : Text(auth!.email.toString()),
                Positioned(
                  right: -1,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        primary: Colors.white,
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.image,
                          // allowedExtensions: ['png', 'jpg', 'jpeg'],
                        );
                        if (result == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'No file selected',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: kWhite),
                              ),
                            ),
                          );
                          return null;
                        }

                        final path = result.files.single.path;
                        final fileName = result.files.single.name;
                        // print('path : ' +
                        //     path.toString() +
                        //     'name: ' +
                        //     fileName.toString());
                        await storage
                            .onUploadImg(path.toString(), fileName.toString())
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: kPrimaryColor,
                              content: Text(
                                'Upload completed',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: kWhite),
                              ),
                            ),
                          );
                        });

                        String myimage =
                            await storage.downloadURL(fileName.toString());
                        setState(() {
                          authC.updateImgProfile(id, 'img', myimage.toString());
                        });
                      },
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: kWhite,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
