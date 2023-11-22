import 'package:flutter/material.dart';
import 'package:internal_tools/core/hris/domain/entity/location_model.dart';
import 'package:internal_tools/utils/calculate_distance.dart';

class LocationDialog extends StatelessWidget {
  final LocationModel locationModel;

  const LocationDialog({
    super.key,
    required this.locationModel,
  });

  @override
  Widget build(BuildContext context) {
    double distance = calculateDistance(
      locationModel.userLatitude,
      locationModel.userLongitude,
      locationModel.targetLatitude,
      locationModel.targetLongitude,
    );
    return AlertDialog(
      icon: Icon(distance > 1.0 ? Icons.error : Icons.check),
      iconColor: distance > 1.0 ? Colors.red : Colors.green,
      title: Text(distance > 1.0 ? "Out Of Range" : "Time to Clock In"),
      content: Text(distance > 1.0
          ? "Anda berada di luar jangkauan, maksimal 1 km dari kantor. Lokasi Anda saat ini : ${locationModel.address}"
          : "Mantap bosque! Anda berada dalam jangkauan, maksimal 1 km dari kantor. Anda saat ini : ${locationModel.address}"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Oke"),
        ),
      ],
    );
  }
}
