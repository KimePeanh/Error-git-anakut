import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/app_constants.dart';

class ShopbyID extends StatefulWidget {
  const ShopbyID({Key? key}) : super(key: key);

  @override
  State<ShopbyID> createState() => _ShopbyIDState();
}

class _ShopbyIDState extends State<ShopbyID> {
  @override
  Widget build(BuildContext context) {
    BlocProvider(
        create: (BuildContext context) =>
            GetshopBloc()..add(GetShopByIdStarted(id: 180)),
      );
    return BlocBuilder(builder: (context, state) {
      if (state is FetchingShop) {
        return Center(child: CircularProgressIndicator(),);
      }
      if (state is ErrorFetchingShop){
        return Text(state.error.toString());
      }
              return InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(bottom: 15),
                  height: 200,
                  child: Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 150,
                            child: BlocProvider.of<GetshopBloc>(context)
                                        .shopModel!
                                        .cover_url ==
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
                                    image: NetworkImage(
                                        BlocProvider.of<GetshopBloc>(context)
                                            .shopModel!
                                            .cover_url!)),
                          ),
                        ),
                        //Container(height: 1, color: mainColor,),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              child: BlocProvider.of<GetshopBloc>(context)
                                          .shopModel!
                                          .image_url ==
                                      null
                                  ? Image.asset("assets/images/shop.png")
                                  : CircleAvatar(
                                      backgroundColor: white,
                                      backgroundImage: NetworkImage(
                                          BlocProvider.of<GetshopBloc>(context)
                                              .shopModel!
                                              .image_url!)),
                            ),
                            title: Text(
                              BlocProvider.of<GetshopBloc>(context)
                                  .shopModel!
                                  .name!,
                              style: TextStyle(
                                  fontFamily: 'kh',
                                  fontSize: 17,
                                  fontWeight: bold),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  BlocProvider.of<GetshopBloc>(context)
                                      .shopModel!
                                      .distance!,
                                  style:
                                      TextStyle(fontSize: 17, fontWeight: bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  BlocProvider.of<GetshopBloc>(context)
                                          .shopModel!
                                          .points! +
                                      " pt",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: bold,
                                      color: mainColor),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  BlocProvider.of<GetshopBloc>(context)
                                      .shopModel!
                                      .percentage!,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: bold,
                                      color: Colors.red),
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
                  // print(BlocProvider.of<GetshopBloc>(context).ShopById[index].id);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShopScreen(id: widget.shopModel.id!)));
                },
              );
            });
  }
}
