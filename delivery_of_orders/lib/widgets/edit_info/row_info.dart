import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';


class RawInfo extends StatelessWidget {
  final IconData icon;
  final String titleInfo, info;
  final Widget dialog;

  const RawInfo({
    super.key,
    required this.icon,
    required this.titleInfo,
    required this.info,
    required this.dialog,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListTile(
            leading: Icon(icon),
            title: Text(titleInfo),
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog;
                  },
                );
              },
              child: SizedBox(
                width: constraints.maxWidth * 0.375,
                child: Text(
                  info,
                  style: TextStyle(color: primaryColor, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// ************************************
// ***********************************************
