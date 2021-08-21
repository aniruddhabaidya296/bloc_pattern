import 'package:bloc_patter_example_app/blocs/health_products_bloc/health_products_bloc.dart';
import 'package:bloc_patter_example_app/blocs/health_products_bloc/health_products_state.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:bloc_patter_example_app/models/health_product.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class HealthProductList extends StatefulWidget {
  HealthProductList({Key key}) : super(key: key);

  @override
  _HealthProductListState createState() => _HealthProductListState();
}

class _HealthProductListState extends State<HealthProductList> {
  final scrollDirection = Axis.vertical;
  AutoScrollController controller = new AutoScrollController();
  HealthProductsBloc healthProductsBloc;
  bool isSelected = false;
  List<String> categories = [
    "Men",
    "Women",
    "Babies",
    "Elders",
    // "Men",
    // "Women",
    // "Children",
    // "Elders",
    // "Men",
    // "Women",
    // "Children",
    // "Elders",
    // "Men",
    // "Women",
    // "Children",
    // "Elders",
  ];

  @override
  void initState() {
    super.initState();
    healthProductsBloc = BlocProvider.of<HealthProductsBloc>(context);
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
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
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "CATEGORIES",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: SizeConfig.blockHeight * 80,
                      width: SizeConfig.blockWidth * 40,
                      child: ListView.builder(
                        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockHeight * 1),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.red,
                                    width: SizeConfig.blockWidth * 0.5),
                                color: Colors.red[50],
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockWidth * 2)),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockWidth * 2,
                                vertical: SizeConfig.blockHeight * 2),
                            child: ListTile(
                              onTap: () {
                                isSelected = true;
                                if (categories[index] == 'Men') {
                                  controller.scrollToIndex(20,
                                      duration: Duration(seconds: 1),
                                      preferPosition: AutoScrollPosition.begin);
                                  print(index);
                                } else if (categories[index] == 'Women') {
                                  setState(() {
                                    controller.scrollToIndex(0,
                                        duration: Duration(seconds: 1),
                                        preferPosition:
                                            AutoScrollPosition.begin);
                                  });
                                } else if (categories[index] == 'Babies') {
                                  setState(() {
                                    controller.scrollToIndex(60,
                                        duration: Duration(seconds: 1),
                                        preferPosition:
                                            AutoScrollPosition.begin);
                                  });
                                } else if (categories[index] == 'Elders') {
                                  setState(() {
                                    controller.scrollToIndex(40,
                                        duration: Duration(seconds: 1),
                                        preferPosition:
                                            AutoScrollPosition.begin);
                                  });
                                }
                              },
                              // alignment: Alignment.centerLeft,
                              title: Text(
                                "${categories[index]}",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
                            //   child: ScrollablePositionedList.builder(
                            //     itemScrollController: controller,
                            //     physics: ScrollPhysics(
                            //         parent: BouncingScrollPhysics()),
                            //     itemCount: state.healthProducts.length,
                            //     itemBuilder: (BuildContext ctxt, int i) {
                            //       return Container(
                            //         child: Column(
                            //           children: [
                            //             Container(
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //         color: Colors.indigo,
                            //         width: SizeConfig.blockWidth *
                            //             0.5),
                            //     color: Colors.blue.withOpacity(
                            //         i.toDouble() / 100),
                            //     borderRadius:
                            //         BorderRadius.circular(
                            //             SizeConfig.blockWidth *
                            //                 2)),
                            //               padding: EdgeInsets.symmetric(
                            //                   horizontal:
                            //                       SizeConfig.blockWidth * 2,
                            //                   vertical:
                            //                       SizeConfig.blockHeight * 2),
                            //               child: Column(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.center,
                            //                 children: [
                            //                   Container(
                            //                     alignment: Alignment.centerLeft,
                            //                     child: Text(
                            //                       "${state.healthProducts[i].name}",
                            //                       style: TextStyle(
                            //                           fontSize: SizeConfig
                            //                                   .blockWidth *
                            //                               4),
                            //                     ),
                            //                   ),
                            //                   SizedBox(
                            //                     height:
                            //                         SizeConfig.blockHeight * 1,
                            //                   ),
                            //                   Container(
                            //                     alignment: Alignment.centerLeft,
                            //                     child: Text(
                            //                       "Rs ${state.healthProducts[i].price}",
                            //                     ),
                            //                   ),
                            //                   // Container(
                            //                   //   alignment: Alignment.centerLeft,
                            //                   //   child: Text(
                            //                   //     "Category: ${state.healthProducts[i].category[0]}",
                            //                   //   ),
                            //                   // ),
                            //                 ],
                            //               ),
                            //             ),
                            //             SizedBox(
                            //                 height: SizeConfig.blockHeight * 2),
                            //           ],
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // );
                            child: GroupedListView<dynamic, String>(
                              physics: ScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              elements: state.healthProducts,
                              groupBy: (element) => element.category[0],
                              groupComparator: (value1, value2) =>
                                  value2.compareTo(value1),
                              itemComparator: (item1, item2) =>
                                  item1.name.compareTo(item2.name),
                              order: GroupedListOrder.ASC,
                              groupSeparatorBuilder: (String value) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  value.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              controller: controller,
                              indexedItemBuilder: (c, element, i) {
                                return AutoScrollTag(
                                  controller: controller,
                                  index: i,
                                  key: ValueKey(i),
                                  child: Card(
                                    elevation: 8.0,
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 6.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.indigo,
                                              width:
                                                  SizeConfig.blockWidth * 0.5),
                                          color: Colors.blue[50],
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.blockWidth * 2)),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        //leading: Icon(Icons.account_circle),
                                        title: Text(
                                          element.name,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
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
                          child: Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockHeight * 80,
                            width: SizeConfig.blockWidth * 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Loading..Please wait."),
                                CircularProgressIndicator(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
