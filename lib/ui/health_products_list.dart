import 'package:bloc_patter_example_app/blocs/health_products_bloc/health_products_bloc.dart';
import 'package:bloc_patter_example_app/blocs/health_products_bloc/health_products_state.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:bloc_patter_example_app/models/health_product.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class HealthProductList extends StatefulWidget {
  HealthProductList({Key key}) : super(key: key);

  @override
  _HealthProductListState createState() => _HealthProductListState();
}

class _HealthProductListState extends State<HealthProductList> {
  ItemScrollController controller = new ItemScrollController();
  HealthProductsBloc healthProductsBloc;
  bool isSelected = false;
  List<String> categories = [
    "Men",
    "Women",
    "Children",
    "Elders",
    "Men",
    "Women",
    "Children",
    "Elders",
    "Men",
    "Women",
    "Children",
    "Elders",
    "Men",
    "Women",
    "Children",
    "Elders",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    healthProductsBloc = BlocProvider.of<HealthProductsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HealthProducts"),
      ),
      // backgroundColor: Colors.blue[100],
      body: Container(
        // color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Container(
                  color: Colors.white,
                  height: SizeConfig.blockHeight * 80,
                  width: SizeConfig.blockWidth * 40,
                  child: ListView.builder(
                    physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.indigo,
                                      width: SizeConfig.blockWidth * 0.5),
                                  color: Colors.blue
                                      .withOpacity(index.toDouble() / 15),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.blockWidth * 2)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.blockWidth * 2,
                                  vertical: SizeConfig.blockHeight * 2),
                              child: ListTile(
                                onTap: () {
                                  isSelected = true;
                                  if (categories[index] == 'Men') {
                                    controller.scrollTo(
                                        index: 0,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeIn);
                                    print(index);
                                  } else if (categories[index] == 'Women') {
                                    setState(() {
                                      controller.scrollTo(
                                          index: 20,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeIn);
                                    });
                                  } else if (categories[index] == 'Children') {
                                    setState(() {
                                      controller.scrollTo(
                                          index: 40,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeIn);
                                    });
                                  } else if (categories[index] == 'Elders') {
                                    setState(() {
                                      controller.scrollTo(
                                          index: 60,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeIn);
                                    });
                                  }
                                },
                                // alignment: Alignment.centerLeft,
                                title: Text(
                                  "${categories[index]}",
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 2),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder(
                        bloc: healthProductsBloc,
                        builder: (context, state) {
                          if (state is HealthProductsLoaded) {
                            return Container(
                              color: Colors.white,
                              height: SizeConfig.blockHeight * 80,
                              width: SizeConfig.blockWidth * 50,
                              child: ScrollablePositionedList.builder(
                                itemScrollController: controller,
                                physics: ScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                itemCount: state.healthProducts.length,
                                itemBuilder: (BuildContext ctxt, int i) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.indigo,
                                                  width: SizeConfig.blockWidth *
                                                      0.5),
                                              color: Colors.blue.withOpacity(
                                                  i.toDouble() / 100),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      SizeConfig.blockWidth *
                                                          2)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  SizeConfig.blockWidth * 2,
                                              vertical:
                                                  SizeConfig.blockHeight * 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${state.healthProducts[i].name}",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockWidth *
                                                          4),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    SizeConfig.blockHeight * 1,
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Rs ${state.healthProducts[i].price}",
                                                ),
                                              ),
                                              // Container(
                                              //   alignment: Alignment.centerLeft,
                                              //   child: Text(
                                              //     "Category: ${state.healthProducts[i].category[0]}",
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: SizeConfig.blockHeight * 2),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                          if (state is HealthProductsError) {
                            return Center(
                              child: Container(
                                width: 200,
                                child: Text(
                                  state.message,
                                ),
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildProducts() {
    List<HealthProduct> healthProducts = [];
  }
}
