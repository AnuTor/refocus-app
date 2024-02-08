import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/path.dart';
import '../screens/path_screen.dart';

class RouteElement extends StatelessWidget {
  const RouteElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = Provider.of<Path>(context, listen: false);
    DateTime now = DateUtils.dateOnly(DateTime.now());
    final bool isPathValid =
        now.difference(path.startdate as DateTime).inDays + 1 > 0;
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        elevation: 10,
        color: !isPathValid ? const Color.fromARGB(255, 202, 202, 202) : null,
        child: InkWell(
          onTap: isPathValid
              ? () {
                  Navigator.of(context)
                      .pushNamed(PathScreen.routeName, arguments: path.id);
                }
              : null,
          child: _buildContent(context, path, isPathValid),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Path path, bool isPathValid) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            path.title,
            textAlign: TextAlign.center,
            style: !isPathValid
                ? const TextStyle(
                    fontSize: 22, color: Color.fromARGB(255, 129, 128, 128))
                : Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          Text(
            path.subtitle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: !isPathValid
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color.fromARGB(255, 202, 202, 202),
                        BlendMode.saturation),
                    child: Image.asset(path.image))
                : Image.asset(path.image),
          ),
        ],
      ),
    );
  }
}
