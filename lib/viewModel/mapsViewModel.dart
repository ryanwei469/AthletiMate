// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapsViewModel {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Fetch locations from Firestore
//   Future<List<Map<String, dynamic>>> getLocations() async {
//     try {
//       QuerySnapshot snapshot = await _firestore.collection('locations').get();

//       // Debugging
//       snapshot.docs.forEach((doc) {
//         print('Document data: ${doc.data()}');
//       });

//       List<Map<String, dynamic>> locations = snapshot.docs.map((doc) {
//         return {
//           'title': doc['title'],
//           'latitude': double.tryParse(doc['latitude'].toString()) ?? 0.0, // Convert to double
//           'longitude': double.tryParse(doc['longitude'].toString()) ?? 0.0, // Convert to double
//           'sports': List<String>.from(doc['sports']),
//         };
//       }).toList();

//       return locations;
//     } catch (e) {
//       print('Error fetching locations: $e');
//       return [];
//     }
//   }

//   Future<Marker> createMarker(Map<String, dynamic> location) async {
//     final LatLng position = LatLng(location['latitude'], location['longitude']);
//     Uint8List iconData;

//     if (location['title'] == 'Current Location') {
//       iconData = await _loadImageAsBytes('assets/sample_map2.png');
//     } else {
//       iconData = await _loadImageAsBytes('assets/sample_map.png');
//     }

//     return Marker(
//       markerId: MarkerId(location['title']),
//       position: position,
//       icon: BitmapDescriptor.fromBytes(iconData),
//       infoWindow: InfoWindow(
//         title: location['title'],
//         snippet: location['sports'].join(', '), // Display sports in snippet
//       ),
//       onTap: () {
//         print("Location clicked: ${location['title']}");
//       },
//     );
//   }

//   // Generate markers for locations
//   Future<Set<Marker>> getMarkersFromLocations(List<Map<String, dynamic>> locations) async {
//     Set<Marker> markers = {};

//     // Add current location marker
//     final currentLocation = LatLng(25.0339, 55.2133); // Example current location
//     Uint8List iconData = await _loadImageAsBytes('assets/sample_map2.png');
//     markers.add(
//       Marker(
//         markerId: MarkerId('current_location'),
//         position: currentLocation,
//         icon: BitmapDescriptor.fromBytes(iconData),
//         onTap: () {
//           print("Current location clicked!");
//         },
//       ),
//     );

//     // Add markers for other locations
//     for (var location in locations) {
//       final marker = await createMarker(location);
//       markers.add(marker);
//     }

//     return markers;
//   }

//   // Load image asset as bytes
//   Future<Uint8List> _loadImageAsBytes(String assetPath) async {
//     ByteData data = await rootBundle.load(assetPath);
//     return data.buffer.asUint8List();
//   }
// }

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch locations from Firestore
  Future<List<Map<String, dynamic>>> getLocations() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('locations').get();

      // Debugging
      snapshot.docs.forEach((doc) {
        print('Document data: ${doc.data()}');
      });

      List<Map<String, dynamic>> locations = snapshot.docs.map((doc) {
        return {
          'title': doc['title'],
          'latitude': double.tryParse(doc['latitude'].toString()) ?? 0.0, // Convert to double
          'longitude': double.tryParse(doc['longitude'].toString()) ?? 0.0, // Convert to double
          'sports': List<String>.from(doc['sports']),
        };
      }).toList();

      return locations;
    } catch (e) {
      print('Error fetching locations: $e');
      return [];
    }
  }

  // Get the current position using Geolocator
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception("Location permission denied.");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<Marker> createMarker(Map<String, dynamic> location) async {
    final LatLng position = LatLng(location['latitude'], location['longitude']);
    Uint8List iconData;

    if (location['title'] == 'Current Location') {
      iconData = await _loadImageAsBytes('assets/sample_map2.png');
    } else {
      iconData = await _loadImageAsBytes('assets/sample_map.png');
    }

    return Marker(
      markerId: MarkerId(location['title']),
      position: position,
      icon: BitmapDescriptor.fromBytes(iconData),
      infoWindow: InfoWindow(
        title: location['title'],
        snippet: location['sports'].join(', '), // Display sports in snippet
      ),
      onTap: () {
        print("Location clicked: ${location['title']}");
      },
    );
  }

  // Generate markers for locations
  Future<Set<Marker>> getMarkersFromLocations(List<Map<String, dynamic>> locations) async {
    Set<Marker> markers = {};

    // Add current location marker
    try {
      Position currentPosition = await getCurrentPosition(); // Get current position using geolocator
      LatLng currentLocation = LatLng(currentPosition.latitude, currentPosition.longitude);
      Uint8List iconData = await _loadImageAsBytes('assets/sample_map2.png');
      markers.add(
        Marker(
          markerId: MarkerId('current_location'),
          position: currentLocation,
          icon: BitmapDescriptor.fromBytes(iconData),
          onTap: () {
            print("Current location clicked!");
          },
        ),
      );
    } catch (e) {
      print("Error getting current location: $e");
    }

    // Add markers for other locations from Firestore
    for (var location in locations) {
      final marker = await createMarker(location);
      markers.add(marker);
    }

    return markers;
  }

  // Load image asset as bytes
  Future<Uint8List> _loadImageAsBytes(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    return data.buffer.asUint8List();
  }
}
