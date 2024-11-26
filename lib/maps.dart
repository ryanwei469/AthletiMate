// import 'package:athletimate/chatList.dart';
// import 'package:athletimate/components/bottomBar.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:athletimate/viewModel/mapsViewModel.dart';

// class Maps extends StatefulWidget {
//   @override
//   _MapsState createState() => _MapsState();
// }

// class _MapsState extends State<Maps> {
//   late GoogleMapController _mapController;
//   late Set<Marker> _markers = {};
//   String _selectedLocation = "";
//   bool _isLoading = true;

//   final MapsViewModel _mapsViewModel = MapsViewModel(); // Create instance of view model

//   @override
//   void initState() {
//     super.initState();
//     _loadLocations();
//   }

//   // Load locations from Firestore and update markers
//   void _loadLocations() async {
//     try {
//       List<Map<String, dynamic>> locations = await _mapsViewModel.getLocations();
//       Set<Marker> markers = await _mapsViewModel.getMarkersFromLocations(locations);
//       setState(() {
//         _markers = markers;
//         _isLoading = false;
//       });

//       print(markers);
//       print(locations);

//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       print('Error loading locations: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Stack(
//               children: [
//                 GoogleMap(
//                   onMapCreated: (controller) {
//                     _mapController = controller;
//                   },
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(25.0391, 55.2176), // You can set this to a general location
//                     zoom: 14.0,
//                   ),
//                   markers: _markers,
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: false,
//                   zoomGesturesEnabled: true,
//                   tiltGesturesEnabled: false,
//                 ),
//                 Positioned(
//                   top: 38,
//                   right: 16,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => ChatList()),
//                       );
//                     },
//                     child: const Icon(Icons.chat_rounded),
//                   ),
//                 ),
//                 if (_selectedLocation.isNotEmpty)
//                   Positioned(
//                     bottom: 80.0,
//                     left: 20.0,
//                     right: 20.0,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           _selectedLocation,
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: BottomBar(),
//                 ),
//               ],
//             ),
//     );
//   }
// }

import 'package:athletimate/chatList.dart';
import 'package:athletimate/components/bottomBar.dart';
import 'package:athletimate/viewModel/mapsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  String _selectedLocation = "";
  bool _isLoading = true;
  final MapsViewModel _mapsViewModel = MapsViewModel(); // Create an instance of ViewModel

  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  // Load locations from Firestore and update markers
  void _loadLocations() async {
    try {
      List<Map<String, dynamic>> locations = await _mapsViewModel.getLocations();

      // Get markers (including current location and others)
      Set<Marker> markers = await _mapsViewModel.getMarkersFromLocations(locations);
      
      setState(() {
        _markers.addAll(markers);  // Add all markers to the map
        _isLoading = false;
      });

      // Optionally, you can animate the camera to the current location after markers are loaded
      if (_markers.isNotEmpty) {
        final currentLocationMarker = _markers.firstWhere(
          (marker) => marker.markerId.value == 'current_location',
          orElse: () => _markers.first,
        );
        _mapController.animateCamera(CameraUpdate.newLatLng(currentLocationMarker.position));
      }

    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error loading locations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(25.0339, 55.2133), // General initial position
                    zoom: 12.0,
                  ),
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomGesturesEnabled: true,
                  tiltGesturesEnabled: false,
                ),
                Positioned(
                  top: 38,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChatList()),
                      );
                    },
                    child: const Icon(Icons.chat_rounded),
                  ),
                ),
                if (_selectedLocation.isNotEmpty)
                  Positioned(
                    bottom: 80.0,
                    left: 20.0,
                    right: 20.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          _selectedLocation,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomBar(),
                ),
              ],
            ),
    );
  }
}
