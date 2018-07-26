import 'dart:async';

import 'package:flutter/material.dart';
import 'package:profile_manager/ColorRes.dart';
import 'package:map_view/map_view.dart';
import 'package:profile_manager/Strings.dart';
import 'package:location/location.dart' as location;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Container(
          decoration: BoxDecoration(color: ColorRes.backgroundColor),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ProfileHeader(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Employee Name',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  MapWidget()
                ],
              ),
            ],
          ),
        ));
  }
}

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: ColorRes.barColor),
              height: 64 + 48.0,
            ),
            Container(
              height: 64.0,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            width: 128.0,
            height: 128.0,
            child: Image(
              image: AssetImage('assets/user.png'),
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  MapView mapView = MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  StaticMapProvider staticMapProvider = StaticMapProvider(MapApiKeys.key);

  Uri staticMapUri;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraPosition = CameraPosition(Locations.centerOfUSA, 2.0);
    staticMapUri = staticMapProvider.getStaticUri(Locations.centerOfUSA, 12,
        width: 900, height: 400, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(child: Image.network(staticMapUri.toString())),
        RaisedButton(
          child: Text('showMap'),
          onPressed: () {
            showMap();
            getLocation().then((locate) {
              debugPrint(locate.toString());
            });
          },
        )
      ],
    );
  }

  Future<location.Location> getLocation() async {
    var locate = location.Location();
    var currentLocation;
    try {
      currentLocation = await locate.getLocation;
    } on Error {
      currentLocation = null;
    }
    return currentLocation;
  }

  showMap() {
    mapView.show(
      new MapOptions(
          mapViewType: MapViewType.normal,
          showUserLocation: true,
          showMyLocationButton: true,
          showCompassButton: true,
          initialCameraPosition: new CameraPosition(
              new Location(45.526607443935724, -122.66731660813093), 15.0),
          hideToolbar: false,
          title: "Recently Visited"),
      // toolbarActions: [new ToolbarAction("Close", 1)]
    );
    StreamSubscription sub = mapView.onMapReady.listen((_) {
      // mapView.setMarkers(_markers);
      // mapView.setPolylines(_lines);
      // mapView.setPolygons(_polygons);
    });
    compositeSubscription.add(sub);
    sub = mapView.onLocationUpdated.listen((location) {
      print("Location updated $location");
    });
    compositeSubscription.add(sub);
    sub = mapView.onTouchAnnotation
        .listen((annotation) => print("annotation ${annotation.id} tapped"));
    compositeSubscription.add(sub);
    sub = mapView.onTouchPolyline
        .listen((polyline) => print("polyline ${polyline.id} tapped"));
    compositeSubscription.add(sub);
    sub = mapView.onTouchPolygon
        .listen((polygon) => print("polygon ${polygon.id} tapped"));
    compositeSubscription.add(sub);
    sub = mapView.onMapTapped
        .listen((location) => print("Touched location $location"));
    compositeSubscription.add(sub);
    sub = mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => this.cameraPosition = cameraPosition));
    compositeSubscription.add(sub);
    sub = mapView.onAnnotationDragStart.listen((markerMap) {
      var marker = markerMap.keys.first;
      print("Annotation ${marker.id} dragging started");
    });
    sub = mapView.onAnnotationDragEnd.listen((markerMap) {
      var marker = markerMap.keys.first;
      print("Annotation ${marker.id} dragging ended");
    });
    sub = mapView.onAnnotationDrag.listen((markerMap) {
      var marker = markerMap.keys.first;
      var location = markerMap[marker];
      print("Annotation ${marker.id} moved to ${location.latitude} , ${location
          .longitude}");
    });
    compositeSubscription.add(sub);
    sub = mapView.onToolbarAction.listen((id) {
      print("Toolbar button id = $id");
      if (id == 1) {
        // _handleDismiss();
      }
    });
    compositeSubscription.add(sub);
    sub = mapView.onInfoWindowTapped.listen((marker) {
      print("Info Window Tapped for ${marker.title}");
    });
    compositeSubscription.add(sub);
  }
}

class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}
