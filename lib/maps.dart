import 'package:athletimate/components/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  String _selectedLocation = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Use Future.delayed to simulate async marker loading or data fetch
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _setInitialMarkers();
        _isLoading = false;
      });
    });
  }

  // Initialize markers for the map
  void _setInitialMarkers() {
    _markers.addAll([
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.42796133580664, -122.085749655962),
        infoWindow: InfoWindow(title: "Location 1", snippet: "Details of Location 1"),
        onTap: () {
          setState(() {
            _selectedLocation = "Location 1: Details of Location 1";
          });
        },
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(37.43296265331129, -122.08832357078792),
        infoWindow: InfoWindow(title: "Location 2", snippet: "Details of Location 2"),
        onTap: () {
          setState(() {
            _selectedLocation = "Location 2: Details of Location 2";
          });
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: _isLoading
    ? Center(child: CircularProgressIndicator()) // Show loading spinner until map is ready
    : Stack(
        children: [
          // Google Maps widget
          GoogleMap(
            onMapCreated: (controller) {
              _mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 14.0,
            ),
            markers: _markers,
            // Disable gestures that aren't needed
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: false,
          ),
          // Chat Icon in the top right corner
          Positioned(
            top: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                // Handle chat icon tap
              },
              child: const Icon(
                Icons.chat_bubble,
                color: Colors.blue,
                size: 30.0,
              ),
            ),
          ),
          // Bottom card to display location details
          if (_selectedLocation.isNotEmpty)
            Positioned(
              bottom: 80.0, // Adjust to avoid overlapping with BottomNavBar
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}