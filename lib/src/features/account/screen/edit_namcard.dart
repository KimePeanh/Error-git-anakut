
import 'package:anakut_bank/src/features/account/screen/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditNameCardScreen extends StatefulWidget {
  const EditNameCardScreen({Key? key}) : super(key: key);

  @override
  State<EditNameCardScreen> createState() => _EditNameCardScreenState();
}

class _EditNameCardScreenState extends State<EditNameCardScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController primaryController = TextEditingController();
  TextEditingController hsController = TextEditingController();
  TextEditingController UniController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController phController = TextEditingController();
  TextEditingController fbController = TextEditingController();
  TextEditingController teleController = TextEditingController();
  TextEditingController instarController = TextEditingController();
  late Icon icongender = Icon(Icons.male);
  @override
  void initState() {
    nameController.text = "Liu Bei";
    genderController.text = "male";
    dateController.text = "2000-01-01";
    jobController.text = "Student";
    heightController.text = "1.68 cm";
    primaryController.text = "Anuwat Primary School";
    hsController.text = "Chihe High School";
    UniController.text = "RUPP";
    majorController.text = "Information Technology Engineer";
     phController.text = "0887112932";
     fbController.text = "Peanh Kime";
     teleController.text ="0887112932";
     instarController.text = "_kime168";
     if (genderController.text == "male"){
       icongender = Icon(Icons.male);
     }else{
       icongender = Icon(Icons.female);
     }
     print("hi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: mainColor,
        title: Text("Edit Nameccard"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                "Information",
                style:
                    TextStyle(fontSize: 17, fontFamily: 'kh', fontWeight: bold),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Username",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),
                          prefixIcon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: genderController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Gender",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),
                          prefixIcon:
                          Icon(
                            icongender.icon,
                            color: Colors.blue.shade800,
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: Colors.blue.shade800,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                      onTap: (){
                        Gender(context, 2);
                        // if (Gender(context, 0)){
                        //   setState(() {
                        //     genderController.text = "male";
                        //   });
                        // }else{
                        //   setState(() {
                        //      genderController.text = "female";
                        //   });
                        // }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: dateController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Date of Birth",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),
                          prefixIcon: Icon(
                            Icons.cake,
                            color: Colors.pink,
                          ),
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            size: 30,
                            color: Colors.blue.shade800,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: jobController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Job",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),
                          prefixIcon: Icon(
                            Icons.work,
                            color: Colors.green,
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: heightController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Height",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),
                          prefixIcon: Icon(
                            Icons.height,
                            color: Colors.orange.shade600,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Education",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'kh',
                      fontWeight: bold,
                      color: Colors.blue.shade800),
                )),
                Container(
              width: MediaQuery.of(context).size.width - 30,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: primaryController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Primary School",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: hsController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "High School",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: UniController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "University",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: majorController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Major",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contact",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'kh',
                      fontWeight: bold,
                      color: Colors.pink),
                )),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: phController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Phone number",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: teleController,
                      style: TextStyle(
                          color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Paste your Telegram link here",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: fbController,
                      style: TextStyle(
                          color: Colors.black,  fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Paste your Facebook link here",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: instarController,
                      style: TextStyle(
                          color: Colors.black,fontSize: 17),
                      decoration: InputDecoration(
                          isDense: true,
                          label: Text(
                            "Paste your Instargram link here",
                            style: TextStyle(color: Colors.blue.shade800),
                          ),        
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: grey.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: grey),
                            gapPadding: 5,
                          )),
                      maxLines: 1,
                      minLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 40,),
          ],
        ),
      )),
      bottomNavigationBar: Container(height: 50,
      alignment: Alignment.center,
      color: mainColor,
      child: Text("Save",style: TextStyle(color: white, fontWeight: bold, fontSize: 20, fontFamily: 'kh'),),
      ),
      floatingActionButton: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Icon(
              Icons.add,
              color: white,
            ),
          ),
    );
  }
}
