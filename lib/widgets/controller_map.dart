import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ControllerMap extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  String? mapStyle;

  Set<Marker> get markers => _markers.values.toSet();

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  LatLng onTap(LatLng position) {
    _markers.clear();
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
    );
    print(position);
    _markers[markerId] = marker;
    notifyListeners();
    return position;
  }
}
