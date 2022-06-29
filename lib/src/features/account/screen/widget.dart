import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget data(String title, String text) {
  return Container(
    height: 50,
    child: Row(
      children: [
        Expanded(
            child: Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 17, fontFamily: 'kh'),
          ),
        )),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(text, style: TextStyle(fontSize: 17, fontFamily: 'kh')),
          ),
        ),
      ],
    ),
  );
}

Widget drawer() {
  return Container(
    height: 1,
    color: Colors.grey.shade100,
  );
}


Gender(BuildContext context, int gender) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff999999),
                  width: 0.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CupertinoButton(
                  child: Text("Cancel"
                      // AppLocalizations.of(context).translate("cancel"),
                      ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                ),
                CupertinoButton(
                  child: Text("Confirm"
                      // AppLocalizations.of(context).translate("confirm"),
                      ),
                  onPressed: () {
                    
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: white,
            child: CupertinoPicker(itemExtent: 50,
            onSelectedItemChanged: (int value) {
              gender = value;
              print(gender);
            },
            children: [
              Center(child: Text("male")),
              Center(child: Text('female'))
            ]),
          )
          // Container(
          //     height: MediaQuery.of(context).size.height / 3,
          //     color: Color(0xfff7f7f7),
          //     child: CupertinoPicker(
          //       itemExtent: 50,
          //       children: options
          //           .map((option) => Center(
          //                 child: Text(option["name"]),
          //               ))
          //           .toList(),
          //       onSelectedItemChanged: (indexx) {
          //         index = indexx;

          //         // BlocProvider.of<AddressFormBloc>(context).add(SelectDistrict(
          //         //     district: BlocProvider.of<AddressFormBloc>(context)
          //         //         .districts[index]));
          //       },
          //     ))
        ],
      );
      });
}