import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/Shop/screen/map.dart';
import 'package:anakut_bank/src/features/Shop/screen/shopScreen.dart';
import 'package:anakut_bank/src/features/home/bloc/search/bloc/search_bloc.dart';
import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ShopModel> shopmodel = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: white,
        toolbarHeight: 65,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: mainColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: MediaQuery.of(context).size.width *0.8,
          height: 40,
          child: TextFormField(
            //controller: searchController,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 5),
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: mainColor)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: mainColor),
                  //gapPadding: 5,
                ),
                hintStyle: TextStyle(fontFamily: 'kh', height: 1),
                hintText: AppLocalizations.of(context)!.translate("search")!),
            //  focusNode: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: ),
            onChanged: (value) {
              print(value);
              if (value != null) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchStarted(query: value));
              }
            },
            // onSaved: (newValue) {
            //  // print(newValue);
            // },
          ),
        ),
      ),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is Searching) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorSearching) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              // return ListView.builder(
              //   itemCount: shopmodel.length,
              //   itemBuilder: (context, index) {

              // });
              return ListView.builder(
                itemCount : BlocProvider.of<SearchBloc>(context).results.length ,
                itemBuilder: (context, index) {
                  return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          margin: EdgeInsets.only(bottom: 15),
          height: 200,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 150,
                    child: BlocProvider.of<SearchBloc>(context).results[index].cover_url ==
                            "https://system.anakutapp.com/assets/uploads/none.jpg"
                        ? Container(
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.red)),
                            child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/cv_shop.jpg")))
                        : Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(BlocProvider.of<SearchBloc>(context).results[index].cover_url!)),
                  ),
                ),
                //Container(height: 1, color: mainColor,),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      child: BlocProvider.of<SearchBloc>(context).results[index].image_url == null
                          ? Image(image:
                                  AssetImage("assets/images/shop.png"),
                            )
                          : CircleAvatar(
                              backgroundColor: white,
                              backgroundImage:
                                  NetworkImage(BlocProvider.of<SearchBloc>(context).results[index].image_url!)),
                    ),
                    title: Text(
                     BlocProvider.of<SearchBloc>(context).results[index].name!,
                      style: TextStyle(
                          fontFamily: 'kh', fontSize: 17, fontWeight: bold),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          BlocProvider.of<SearchBloc>(context).results[index].distance!,
                          style: TextStyle(fontSize: 17, fontWeight: bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          BlocProvider.of<SearchBloc>(context).results[index].points! + " pt",
                          style: TextStyle(
                              fontSize: 17, fontWeight: bold, color: mainColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          BlocProvider.of<SearchBloc>(context).results[index].percentage!,
                          style: TextStyle(
                              fontSize: 17, fontWeight: bold, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          print(BlocProvider.of<SearchBloc>(context).results[index].id);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShopScreen(id: BlocProvider.of<SearchBloc>(context).results[index].id!)));
        },
      );
              });
            },
          ));

  }
}
