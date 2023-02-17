import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/path.dart';
import '../screens/path_screen.dart';

class RouteElement extends StatelessWidget {
  const RouteElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = Provider.of<Path>(context);
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        elevation: 10,
        child: InkWell(
          onTap: () => {
            Navigator.of(context).pushNamed(
              PathScreen.routeName,
              arguments: path.id
            )
          },
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
                  path.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  path.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Image.asset(
                    path.image,
                  )
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
