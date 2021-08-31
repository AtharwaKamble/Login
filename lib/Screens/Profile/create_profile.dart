import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gram_samruddhi/Screens/LoginScreen/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatProfile extends StatefulWidget {
  CreatProfile({
    Key? key,
  }) : super(key: key);

  @override
  _CreatProfileState createState() => _CreatProfileState();
}

class _CreatProfileState extends State<CreatProfile> {
  bool circular = false;
  String _imageFile = "";
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _profession = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 12,
            ),
            nameTextField(),
            SizedBox(
              height: 12,
            ),
            professionTextField(),
            SizedBox(
              height: 12,
            ),
            mobileTextField(),
            SizedBox(
              height: 12,
            ),
            emailTextField(),
            SizedBox(
              height: 12,
            ),
            genderTextField(),
            SizedBox(
              height: 12,
            ),
            dobField(),
            SizedBox(
              height: 12,
            ),
            addressTextField(),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () async {},
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: SizedBox(
                    width: 200,
                    height: 50.0,
                    child: RaisedButton(
                      elevation: 10.0,
                      color: Color(0xFF4A90E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        side: BorderSide(color: Color(0xFF4A90E2)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            ),
                          ),
                          Card(
                            color: Color(0xCDA3C5EC),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35.0)),
                            child: SizedBox(
                              width: 35.0,
                              height: 35.0,
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 55.0,
          backgroundImage: _imageFile == ""
              ? AssetImage("assets/images.jpeg")
              : FileImage(File(_imageFile)) as ImageProvider,
        ),
        Positioned(
          bottom: 10.0,
          right: -10.0,
          child: SizedBox(
            height: 46,
            width: 46,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(color: Colors.white),
              ),
              color: Color(0xFFF5F6F9),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: SvgPicture.asset("assets/Camera Icon.svg"),
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile.path;
    });
  }

  Widget nameTextField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.shade50,
        )
      ]),
      child: TextFormField(
        controller: _name,
        validator: (value) {
          if (value!.isEmpty) return "Name can't be empty";

          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD4D4D4),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Name",
          // helperText: "Name can't be empty",
          hintText: "Full Name",
        ),
      ),
    );
  }

  Widget genderTextField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.shade50,
        )
      ]),
      child: TextFormField(
        controller: _gender,
        validator: (value) {
          if (value!.isEmpty) return "Gender can't be empty";

          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD4D4D4),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Gender",
          // helperText: "Gender can't be empty",
          hintText: "Gender",
        ),
      ),
    );
  }

  Widget professionTextField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.shade50,
        )
      ]),
      child: TextFormField(
        controller: _profession,
        validator: (value) {
          if (value!.isEmpty) return "Profession can't be empty";

          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD4D4D4),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Profession",
          // helperText: "Profession can't be empty",
          hintText: "Profession",
        ),
      ),
    );
  }

  Widget dobField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.shade50,
        )
      ]),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
        controller: _dob,
        validator: (value) {
          if (value!.isEmpty) return "DOB can't be empty";

          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD4D4D4),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          prefixIcon: Icon(
            Icons.calendar_today,
            color: Colors.green,
          ),
          labelText: "Date Of Birth",
          // helperText: "Provide DOB on dd/mm/yyyy",
          hintText: "01/01/2020",
        ),
      ),
    );
  }

  Widget emailTextField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.shade50,
        )
      ]),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _email,
        validator: (value) {
          if (value!.isEmpty) return "Email Address can't be empty";

          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD4D4D4),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.green,
          ),
          labelText: "Email",
          // helperText: "Email Address",
          hintText: "abc@gmail.com",
        ),
      ),
    );
  }

  Widget mobileTextField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.shade50,
        )
      ]),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _mobile,
        validator: (value) {
          if (value!.isEmpty) return "Mobile Number can't be empty";

          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD4D4D4),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.green,
          ),
          labelText: "Mobile Number",
          // helperText: "Mobile Number can't be empty",
          hintText: "Mobile Number",
        ),
      ),
    );
  }

  Widget addressTextField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.shade50,
        )
      ]),
      child: TextFormField(
        controller: _address,
        validator: (value) {
          if (value!.isEmpty) return "Address can't be empty";

          return null;
        },
        maxLines: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD4D4D4),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          labelText: "Address",
          // helperText: "Permananet Address",
          hintText: "Address",
        ),
      ),
    );
  }
}
