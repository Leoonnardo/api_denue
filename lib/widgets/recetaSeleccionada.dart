import 'package:flutter/material.dart';

class RecetaSeleccionada extends StatelessWidget {
  const RecetaSeleccionada({
    Key? key,
    required this.prueba1,
    required this.prueba2,
  }) : super(key: key);

  final String prueba1;
  final String prueba2;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850]!.withOpacity(0.29).withBlue(5),
              offset: const Offset(0, 5),
              spreadRadius: 4,
              blurRadius: 5,
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // verticalDirection: VerticalDirection.up,
        children: [
          Container(
            // color: Colors.orange,
            padding: EdgeInsetsDirectional.all(width * 0.02),
            alignment: Alignment.topLeft,
            child: Container(
              alignment: Alignment.center,
              // width: width * 0.10,
              height: width * 0.10,
              child: Text(prueba1 + prueba2,
                  textScaleFactor: 1.2, textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}
