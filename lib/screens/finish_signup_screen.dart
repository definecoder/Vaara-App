import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/bg_widget.dart';
import 'package:vaara_app/common_widgets/custom_textfield.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:vaara_app/screens/login_screen.dart';

import '../common_widgets/button.dart';

class FinishSignup extends StatefulWidget {
  const FinishSignup({super.key});

  @override
  State<FinishSignup> createState() => _FinishSignupState();
}

class _FinishSignupState extends State<FinishSignup> {
  ImagePicker profilePicturePicker = ImagePicker();
  bool profilePictureUploaded = false;
  XFile? profilePicture;
  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                10.heightBox,
                Stack(
                  children: [
                    Center(
                      child: appLogoWidget(150, 150),
                    ),
                    Row(
                      children: [
                        10.widthBox,
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded),
                          color: purple1,
                        )
                      ],
                    )
                  ],
                ),
                10.heightBox,
                "Finish Sign up".text.fontFamily(poppins).size(30).bold.make(),
                20.heightBox,
                profilePictureUploaded == false
                    ? IconButton(
                        onPressed: () async {
                          profilePicture = await profilePicturePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (profilePicture != null)
                              profilePictureUploaded = true;
                          });
                        },
                        icon: const Icon(Icons.add_a_photo),
                        color: purple1,
                      )
                        .box
                        .roundedFull
                        .size(100, 100)
                        .border(color: purple1, width: 2)
                        .make()
                    : CircleAvatar(
                        backgroundImage: FileImage(File(profilePicture!.path)),
                        radius: context.height * 0.08,
                      ),
                15.heightBox,
                profilePictureUploaded == false
                    ? "Upload Image".text.fontFamily(poppins).make()
                    : MyButton(
                        height: 30,
                        width: context.width * 0.33,
                        name: "Cancel Image",
                        whenPressed: () {
                          setState(() {
                            profilePictureUploaded = false;
                            profilePicture = null;
                          });
                        }),
                Column(
                  children: [
                    CustomTextField(
                        title: 'Username', hint: 'Choose your username'),
                    CustomTextField(
                        title: 'Phone Number', hint: 'Enter your phone number'),
                  ],
                ).box.rounded.padding(EdgeInsets.all(19)).make(),
                20.heightBox,
                MyButton(
                    name: 'Finish Sign up',
                    width: context.width - 70,
                    whenPressed: () {
                      Get.to(() => LoginScreen());
                    })
              ],
            ),
          ),
        )),
      ),
    );
  }
}
