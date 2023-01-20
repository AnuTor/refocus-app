import 'package:flutter/material.dart';

import '../screens/day_screen.dart';

class RouteElement extends StatelessWidget {
  final int dias;
  final DateTime ingreso;
  final String titulo;
  final String subtitulo;
  final String imagen;

  const RouteElement(
      {Key? key,
      required this.titulo,
      required this.subtitulo,
      required this.imagen,
      required this.dias,
      required this.ingreso})
      : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return DayScreen(
            dias: dias,
            ingreso: ingreso,
            titulo: titulo,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        elevation: 10,
        child: InkWell(
          onTap: () => {selectCategory(context)},
          child: Container(
              /* decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(),
                /* boxShadow: const [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 15,
                  )
                ], */
              ), */
              width: double.infinity,
              //margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              padding: const EdgeInsets.all(5),
              //height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    titulo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color.fromRGBO(21, 178, 150, 100),
                        fontFamily: 'Roboto'),
                  ),
                  Text(
                    subtitulo,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                      child: Image.network(
                    imagen,
                  ))
                ],
              )),
        ),
      ),
    );
  }
}
