import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:st_car_dealer/model/car.dart';

class HomeController extends ChangeNotifier {
  List<Car> _carsCopy = [];
  List<Car> _cars = [];
  List<Car> get cars => _cars;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  TextEditingController searchCtrl = TextEditingController();

  Future<void> fetchCars({int limit = 1}) async {
    loading = true;

    try {
      var res = await http
          .get(Uri.parse("https://freetestapi.com/api/v1/cars/?limit=$limit"));

      if (res.statusCode >= 200 && res.statusCode <= 300) {
        var c = Car.fromList(res.body);
        _cars = c;
        _carsCopy = c;
      }
    } catch (e) {
      print('error fetching cars: $e');
    }

    loading = false;
  }

  void searchCars(String query) {
    List<Car> carsmatched = [];

    for (var car in _carsCopy) {
      var q = query.toLowerCase().replaceAll(" ", "");
      var make = car.make.toLowerCase().replaceAll(" ", "");
      var model = car.model.toLowerCase().replaceAll(" ", "");

      if (make.contains(q) || model.contains(q)) {
        carsmatched.add(car);
      }
    }

    _cars = carsmatched;
    notifyListeners();
  }
}
