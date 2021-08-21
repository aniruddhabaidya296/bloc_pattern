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
        bool hair = false;
        bool skin = false;
        Response response =
            await healthproductsDao.fetchHealthProducts(category: "men");

        var jsonDecoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          men = true;
          for (int i = 0; i < jsonDecoded["limit"]; i++) {
            HealthProduct healthProduct =
                HealthProduct.fromJson(jsonDecoded["docs"][i]);
            healthProduct.category = ['men'];
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
            healthProduct.category = ['women'];
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
            healthProduct.category = ['baby'];
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
            healthProduct.category = ['elder'];
            healthproducts.add(healthProduct);
          }
          print("length: ${healthproducts.length}");
          // yield HealthProductsLoaded(healthproducts);
        } else {
          yield HealthProductsError(message: "Something went wrong");
        }

        response =
            await healthproductsDao.fetchHealthProducts(category: "hair");
        jsonDecoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          hair = true;
          for (int i = 0; i < jsonDecoded["limit"]; i++) {
            HealthProduct healthProduct =
                HealthProduct.fromJson(jsonDecoded["docs"][i]);
            // print("jsonDecoded[docs][i]: ${jsonDecoded["docs"][i]}");
            healthProduct.category = ['hair'];
            healthproducts.add(healthProduct);
          }
          print("length: ${healthproducts.length}");
          // yield HealthProductsLoaded(healthproducts);
        } else {
          yield HealthProductsError(message: "Something went wrong");
        }

        response =
            await healthproductsDao.fetchHealthProducts(category: "skin");
        jsonDecoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          skin = true;
          for (int i = 0; i < jsonDecoded["limit"]; i++) {
            HealthProduct healthProduct =
                HealthProduct.fromJson(jsonDecoded["docs"][i]);
            // print("jsonDecoded[docs][i]: ${jsonDecoded["docs"][i]}");
            healthProduct.category = ['skin'];
            healthproducts.add(healthProduct);
          }
          print("length: ${healthproducts.length}");
          // yield HealthProductsLoaded(healthproducts);
        } else {
          yield HealthProductsError(message: "Something went wrong");
        }

        if (men && women && baby && elder && hair && skin) {
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
