import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:st_car_dealer/model/car.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: car.image,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Text("Error loading image!"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Details ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Brand: ${car.make}"),
                ],
              ),
              Row(
                children: [
                  Text("Model: ${car.model}"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text("Year: ${car.makeYear}"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text("Price: \$${car.price}"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text("Color: ${car.color}"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text("Mileage: ${car.mileage}"),
                ],
              ),
              Row(
                children: [
                  Text("Power: ${car.horsePower} hp"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text("Engine: ${car.engineType}"),
                ],
              ),
              Row(
                children: [
                  Text("Fuel Type: ${car.fuelType}"),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
