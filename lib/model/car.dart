import 'dart:convert';

class Car {
  final String make;
  final String model;
  final String color;
  final String image;
  final String fuelType;
  final String engineType;
  final int id;
  final int mileage;
  final int makeYear;
  final int price;
  final int horsePower;

  Car({
    required this.id,
    required this.make,
    required this.model,
    required this.color,
    required this.image,
    required this.fuelType,
    required this.engineType,
    required this.mileage,
    required this.makeYear,
    required this.price,
    required this.horsePower,
  });

  static List<Car> fromList(String json) {
    List<Car> cars = [];
    var data = jsonDecode(json);
    if (data is List) {
      for (Map element in data) {
        cars.add(Car.fromJson(element));
      }
    }

    return cars;
  }

  factory Car.fromJson(Map data) {
    var id = 0;
    var make = "";
    var model = "";
    var color = "";
    var image = "";
    var fuelType = "";
    var engineType = "";
    var mileage = 0;
    var makeYear = 0;
    var price = 0;
    var horsePower = 0;

    try {
      if (data.containsKey("id")) {
        id = data["id"];
      }
      if (data.containsKey("make")) {
        make = data["make"];
      }
      if (data.containsKey("year")) {
        makeYear = data["year"];
      }
      if (data.containsKey("model")) {
        model = data["model"];
      }
      if (data.containsKey("color")) {
        color = data["color"];
      }
      if (data.containsKey("mileage")) {
        mileage = data["mileage"];
      }
      if (data.containsKey("price")) {
        price = data["price"];
      }
      if (data.containsKey("fuelType")) {
        fuelType = data["fuelType"];
      }

      if (data.containsKey("engine")) {
        engineType = data["engine"];
      }
      if (data.containsKey("horsepower")) {
        horsePower = data["horsepower"];
      }
      if (data.containsKey("image")) {
        image = data["image"];
      }
    } catch (e) {
      print('error getting car info: $e');
    }

    return Car(
      id: id,
      make: make,
      model: model,
      color: color,
      image: image,
      fuelType: fuelType,
      engineType: engineType,
      mileage: mileage,
      makeYear: makeYear,
      price: price,
      horsePower: horsePower,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "make": make,
      "model": model,
      "year": makeYear,
      "color": color,
      "mileage": mileage,
      "price": price,
      "fuelType": fuelType,
      "engine": engineType,
      "horsepower": horsePower,
      "image": image,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
