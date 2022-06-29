import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum SingingCharacter { Male, Female }

class ApplyLoanScreen extends StatefulWidget {
  const ApplyLoanScreen({Key? key}) : super(key: key);

  @override
  State<ApplyLoanScreen> createState() => _ApplyLoanScreenState();
}

class _ApplyLoanScreenState extends State<ApplyLoanScreen> {
  SingingCharacter? _character = SingingCharacter.Male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: mainColor,
          elevation: 0,
          title: Text("Apply Loan")),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PERSONAL INFORMATION',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            child: Column(
                      children: [
                        ListTile(
                          title: const Text('Male'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Male,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Female'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Female,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Date of Birth",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "No.ID. Card/ Passport",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Address",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Phone number",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PERSONAL INFORMATION',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Occupation/Business",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            child: Column(
                      children: [
                        ListTile(
                          title: const Text('Employment'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Male,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Business'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Female,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Amount Salary/ Income",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'LOAN INFORMATION',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Input Request Amount",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Duration",
                        style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                      ),
                    ),
                    Expanded( 
                        child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontFamily: 'kh',
                      fontWeight: bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
