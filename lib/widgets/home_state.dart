import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class HomeState extends StatelessWidget {
  final Color color;

  HomeState(this.color);

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(-33.86, 151.20),
        zoom: 14.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoidGhlZ29vc2VtYW4iLCJhIjoiY2p0cXFkZnUyMGk2bzQ0cDM0YzVjam1pciJ9.4bcCsLkDPaSt_o9YuuLzCg',
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
                width: 30.0,
                height: 30.0,
                point: new LatLng(-33.86, 151.20),
                builder: (ctx) => new Container(
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "dive-flag-small.gif")))),
                    )),
            new Marker(
                width: 30.0,
                height: 30.0,
                point: new LatLng(-33.91, 151.26),
                builder: (ctx) => new Container(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "dive-flag-small.gif")))),
                )),
          ],
        ),
      ],
    );
  }
}
