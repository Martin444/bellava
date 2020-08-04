import 'package:bellava/Models/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';



class Mapex extends StatefulWidget {

  Order order;

  Mapex({this.order});

  @override
  _MapexState createState() => _MapexState();
}

class _MapexState extends State<Mapex> {
  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: LatLng(widget.order.latitude, widget.order.longitude),
        zoom: 15.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoiYWxlamFuZHJvZmFyZWwiLCJhIjoiY2szamVrenN0MDJuODNxcWs1aGF4a3p0YyJ9.6EWbZKWtiKeNyngGCeYlIw',
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(widget.order.latitude, widget.order.longitude),
              builder: (ctx) =>
              new Container(
                child: new Icon(Icons.location_on, size: 45, color: Colors.red,),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
