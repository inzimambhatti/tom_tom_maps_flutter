import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:latlong2/latlong.dart";
import '../controllers/home_controller.dart';
import "package:flutter_map/flutter_map.dart";
import "package:http/http.dart" as http;
import "dart:convert" as convert;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String apiKey = "KXUGANPlq4FvKPDI6Rm0FeJ1ggfX3AxV";
    final tomtomHQ = LatLng(30.1633252, 72.4515188);
    return Scaffold(
        body: Center(
            child: Stack(
              children: <Widget>[
                FlutterMap(
                  options: MapOptions(center: tomtomHQ, zoom: 12.0),
                  layers: [
                    new TileLayerOptions(
                      urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                          "{z}/{x}/{y}.png?key={apiKey}",
                      additionalOptions: {"apiKey": apiKey},
                    ),
                    new MarkerLayerOptions(
                      markers: [
                        new Marker(
                          width: 80.0,
                          height: 80.0,
                          point: new LatLng(30.1633252, 72.4515188),
                          builder: (BuildContext context) => const Icon(
                              Icons.location_on,
                              size: 60.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    child: Image.asset("images/tt_logo.png"))
              ],
            )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.copyright),
          onPressed: () async {
            // http.Response response = await getCopyrightsJSONResponse();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => CopyrightsPage(
            //             copyrightsText: parseCopyrightsResponse(response))));
          },
        ),
      );
  }
}
