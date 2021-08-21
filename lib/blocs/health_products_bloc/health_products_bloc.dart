import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_patter_example_app/dao/healthcare_products_dao.dart';
import 'package:bloc_patter_example_app/models/health_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../global_handlers.dart';
import 'health_products_event.dart';
import 'health_products_state.dart';

class HealthProductsBloc
    extends Bloc<HealthProductsEvent, HealthProductsState> {
  HealthProductsDao healthproductsDao;

  HealthProductsBloc() : super(HealthProductsEmpty()) {
    healthproductsDao = HealthProductsDao();
  }

  @override
  Stream<HealthProductsState> mapEventToState(
    HealthProductsEvent event,
  ) async* {
    if (event is FetchHealthProducts) {
      yield HealthProductsLoading();
      try {
        List<HealthProduct> healthproducts = [];
        bool men = false;
        bool women = false;
        bool baby = false;
        bool elder = false;
        Response response =
            await healthproductsDao.fetchHealthProducts(category: "men");

        var jsonDecoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          men = true;
          for (int i = 0; i < jsonDecoded["limit"]; i++) {
            HealthProduct healthProduct =
                HealthProduct.fromJson(jsonDecoded["docs"][i]);
            // print("jsonDecoded[docs][i]: ${jsonDecoded["docs"][i]}");
            healthproducts.add(healthProduct);
          }
          print("length: ${healthproducts.length}");
          // yield HealthProductsLoaded(healthproducts);
        } else {
          yield HealthProductsError(message: "Something went wrong");
        }
        response =
            await healthproductsDao.fetchHealthProducts(category: "women");
        jsonDecoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          women = true;
          for (int i = 0; i < jsonDecoded["limit"]; i++) {
            HealthProduct healthProduct =
                HealthProduct.fromJson(jsonDecoded["docs"][i]);
            healthproducts.add(healthProduct);
          }
          print("length: ${healthproducts.length}");
        } else {
          yield HealthProductsError(message: "Something went wrong");
        }

        response =
            await healthproductsDao.fetchHealthProducts(category: "baby");
        jsonDecoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          baby = true;
          for (int i = 0; i < jsonDecoded["limit"]; i++) {
            HealthProduct healthProduct =
                HealthProduct.fromJson(jsonDecoded["docs"][i]);
            healthproducts.add(healthProduct);
          }
          print("length: ${healthproducts.length}");
          // yield HealthProductsLoaded(healthproducts);
        } else {
          yield HealthProductsError(message: "Something went wrong");
        }

        response =
            await healthproductsDao.fetchHealthProducts(category: "elder");
        jsonDecoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          elder = true;
          for (int i = 0; i < jsonDecoded["limit"]; i++) {
            HealthProduct healthProduct =
                HealthProduct.fromJson(jsonDecoded["docs"][i]);
            // print("jsonDecoded[docs][i]: ${jsonDecoded["docs"][i]}");
            healthproducts.add(healthProduct);
          }
          print("length: ${healthproducts.length}");
          // yield HealthProductsLoaded(healthproducts);
        } else {
          yield HealthProductsError(message: "Something went wrong");
        }

        if (men && women && baby && elder) {
          yield HealthProductsLoaded(healthproducts);
        }
      } catch (e) {
        print(e);
        final snackBar = SnackBar(content: Text("Something went wrong."));
        ScaffoldMessenger.of(GlobalBlocClass.homeContext)
            .showSnackBar(snackBar);
      }
    }
  }
}
