import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class FormEditPf extends StatefulWidget {
  const FormEditPf({Key? key}) : super(key: key);

  @override
  _FormEditPfState createState() => _FormEditPfState();
}

class _FormEditPfState extends State<FormEditPf> {
  late GlobalKey<FormState>? _key = GlobalKey<FormState>();
  late TextEditingController? _fistnameCon = TextEditingController();
  late TextEditingController? _lastnameCon = TextEditingController();
  late TextEditingController? _emailCon = TextEditingController();
  late TextEditingController? _dobCon = TextEditingController();
  //late TextEditingController? _fistnameCon = TextEditingController();
  Color girlClick = Colors.transparent;
  Color boyClick = Colors.transparent;
  Color textboy = Colors.blue.shade800;
  Color textgirl = Colors.red.shade800;
  String? gender;

  void checkgender() {
    if (gender == "Female") {
      setState(() {
        gender = "Female";
        girlClick = mainColor;
        textgirl = Colors.white;
        boyClick = Colors.transparent;
        textboy = Colors.blue.shade800;
      });
    } else if (gender == "Male") {
      boyClick = mainColor;
      textboy = white;
      girlClick = Colors.transparent;
      textgirl = Colors.red.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: _fistnameCon,
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.translate('fname')!,
                      hintStyle: TextStyle(fontFamily: 'kh'),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor, width: 2),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: _lastnameCon,
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.translate('lname')!,
                      hintStyle: TextStyle(fontFamily: 'kh'),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor, width: 2),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailCon,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.translate('email')!,
                  hintStyle: TextStyle(fontFamily: 'kh'),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailCon,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.translate('dob')!,
                  hintStyle: TextStyle(fontFamily: 'kh'),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 120,
                height: 44,
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: girlClick,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: mainColor)),
                        child: Text(
                          AppLocalizations.of(context)!.translate('girl')!,
                          style: TextStyle(fontFamily: 'kh', color: textgirl),
                        ),
                      ),
                      onTap: () {
                        gender = "Female";
                        checkgender();
                      },
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: boyClick,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: mainColor)),
                          child: Text(
                            AppLocalizations.of(context)!.translate('boy')!,
                            style: TextStyle(fontFamily: 'kh', color: textboy),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            gender = "Male";
                            checkgender();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 90,),
              BTLog(context, "Done")
            ],
          ),
        ),
      ),
    );
  }
}
