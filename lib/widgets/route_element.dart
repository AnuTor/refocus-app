import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/path.dart';
import '../screens/path_screen.dart';

class RouteElement extends StatelessWidget {
  const RouteElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = Provider.of<Path>(context, listen: false);
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        elevation: 10,
        child: InkWell(
          onTap: () => {
            Navigator.of(context)
              .pushNamed(PathScreen.routeName, arguments: path.id)
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  path.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  path.subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Expanded(child: Image.asset(path.image)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
