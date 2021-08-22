import 'package:bloc_patter_example_app/blocs/health_products_bloc/health_products_bloc.dart';
import 'package:bloc_patter_example_app/blocs/health_products_bloc/health_products_state.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:bloc_patter_example_app/models/health_product.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthProductList extends StatefulWidget {
  HealthProductList({Key key}) : super(key: key);

  @override
  _HealthProductListState createState() => _HealthProductListState();
}

class _HealthProductListState extends State<HealthProductList> {
  final scrollDirection = Axis.vertical;
  // final itemSize = SizeConfig.blockHeight * 7;
  AutoScrollController controller = new AutoScrollController();
  TextEditingController searchController;
  HealthProductsBloc healthProductsBloc;
  bool isSelected = false;
  final itemSize = SizeConfig.blockHeight * 20;
  List<String> categories = [
    "Women",
    "Skin",
    "Men",
    "Hair",
    "Elders",
    "Babies",
  ];

  @override
  void initState() {
    super.initState();
    healthProductsBloc = BlocProvider.of<HealthProductsBloc>(context);
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    searchController = new TextEditingController();
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      var childIndex = (controller.offset / 100).round() + 1;
    });
  }

  List<HealthProduct> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Health Products"),
        ),
        // backgroundColor: Colors.blue[100],
        body: Container(
          // color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
            child: BlocBuilder(
              bloc: healthProductsBloc,
              builder: (context, state) {
                if (state is HealthProductsLoaded) {
                  onSearchTextChanged(String text) async {
                    _searchResult.clear();
                    if (text.isEmpty) {
                      setState(() {});
                      return;
                    }

                    state.healthProducts.forEach((product) {
                      if (product.name.contains(text))
                        _searchResult.add(product);
                    });

                    setState(() {});
                  }

                  return Container(
                    child: Stack(
                      children: [
                        // Positioned(
                        //   top: 0,
                        //   child: Container(
                        //     height: SizeConfig.blockHeight * 90,
                        //     color: Theme.of(context).primaryColor,
                        //     child: Card(
                        //       child: ListTile(
                        //         leading: Icon(Icons.search),
                        //         title: TextFormField(
                        //           controller: searchController,
                        //           decoration: InputDecoration(
                        //               hintText: 'Search',
                        //               border: InputBorder.none),
                        //           onChanged: onSearchTextChanged,
                        //         ),
                        //         trailing: IconButton(
                        //           icon: Icon(Icons.cancel),
                        //           onPressed: () {
                        //             searchController.clear();
                        //             onSearchTextChanged('');
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          left: 0,
                          top: SizeConfig.blockHeight * 10,
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "CATEGORIES",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: SizeConfig.blockHeight * 80,
                                width: SizeConfig.blockWidth * 40,
                                child: ListView.builder(
                                  physics: ScrollPhysics(
                                      parent: BouncingScrollPhysics()),
                                  itemCount: categories.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return InkWell(
                                      onTap: () {
                                        isSelected = true;
                                        if (categories[index] == 'Women') {
                                          controller.scrollToIndex(0,
                                              duration: Duration(seconds: 1),
                                              preferPosition:
                                                  AutoScrollPosition.begin);
                                        } else if (categories[index] ==
                                            'Skin') {
                                          setState(() {
                                            controller.scrollToIndex(20,
                                                duration: Duration(seconds: 1),
                                                preferPosition:
                                                    AutoScrollPosition.begin);
                                          });
                                        } else if (categories[index] == 'Men') {
                                          setState(() {
                                            controller.scrollToIndex(40,
                                                duration: Duration(seconds: 1),
                                                preferPosition:
                                                    AutoScrollPosition.begin);
                                          });
                                        } else if (categories[index] ==
                                            'Hair') {
                                          setState(() {
                                            controller.scrollToIndex(60,
                                                duration: Duration(seconds: 1),
                                                preferPosition:
                                                    AutoScrollPosition.begin);
                                          });
                                        } else if (categories[index] ==
                                            'Elders') {
                                          setState(() {
                                            controller.scrollToIndex(80,
                                                duration: Duration(seconds: 1),
                                                preferPosition:
                                                    AutoScrollPosition.begin);
                                          });
                                        } else if (categories[index] ==
                                            'Babies') {
                                          setState(() {
                                            controller.scrollToIndex(100,
                                                duration: Duration(seconds: 1),
                                                preferPosition:
                                                    AutoScrollPosition.begin);
                                          });
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                                SizeConfig.blockHeight * 1),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.red,
                                                width: SizeConfig.blockWidth *
                                                    0.5),
                                            color: Colors.red[50],
                                            borderRadius: BorderRadius.circular(
                                                SizeConfig.blockWidth * 2)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.blockWidth * 2,
                                            vertical:
                                                SizeConfig.blockHeight * 2),
                                        child: ListTile(
                                          // alignment: Alignment.centerLeft,
                                          title: Text(
                                            "${categories[index]}",
                                          ),
                                          trailing: Icon(
                                            Icons.circle,
                                            color: (controller.position == null)
                                                ? Colors.red
                                                : (controller.position.pixels / 100 > 0 &&
                                                        controller.position
                                                                    .pixels /
                                                                100 <
                                                            20 &&
                                                        categories[index] ==
                                                            "Women")
                                                    ? Colors.green
                                                    : (controller.position
                                                                        .pixels /
                                                                    100 >
                                                                20 &&
                                                            controller
                                                                        .position
                                                                        .pixels /
                                                                    100 <
                                                                40 &&
                                                            categories[index] ==
                                                                "Skin")
                                                        ? Colors.green
                                                        : (controller.position.pixels /
                                                                        100 >
                                                                    40 &&
                                                                controller.position.pixels /
                                                                        100 <
                                                                    60 &&
                                                                categories[index] ==
                                                                    "Men")
                                                            ? Colors.green
                                                            : (controller.position.pixels / 100 >
                                                                        60 &&
                                                                    controller.position.pixels / 100 <
                                                                        80 &&
                                                                    categories[index] ==
                                                                        "Hair")
                                                                ? Colors.green
                                                                : (controller.position.pixels / 100 > 80 &&
                                                                        controller.position.pixels / 100 < 100 &&
                                                                        categories[index] == "Elders")
                                                                    ? Colors.green
                                                                    : (controller.position.pixels / 100 > 100 && categories[index] == "Babies")
                                                                        ? Colors.green
                                                                        : Colors.red,
                                          ),
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
                          top: SizeConfig.blockHeight * 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.white,
                                height: SizeConfig.blockHeight * 90,
                                width: SizeConfig.blockWidth * 50,
                                child: GroupedListView<dynamic, String>(
                                  physics: ScrollPhysics(
                                      parent: BouncingScrollPhysics()),
                                  elements: state.healthProducts,
                                  groupBy: (element) => element.category[0],
                                  groupComparator: (value1, value2) =>
                                      value2.compareTo(value1),
                                  itemComparator: (item1, item2) =>
                                      item1.name.compareTo(item2.name),
                                  // itemExtent: 100,
                                  order: GroupedListOrder.ASC,
                                  groupSeparatorBuilder: (String value) =>
                                      Padding(
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
                                          height: 100,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.indigo,
                                                  width: SizeConfig.blockWidth *
                                                      0.5),
                                              color: Colors.blue[50],
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      SizeConfig.blockWidth *
                                                          2)),
                                          child: ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 20.0,
                                                    vertical: 10.0),
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
                              ),
                            ],
                          ),
                        ),
                      ],
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Loading..Please wait",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
