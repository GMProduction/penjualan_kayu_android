import 'package:flutter/material.dart';

import 'genText.dart';

class MenuDrawer extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon icon;
  final Function ontap;

  const MenuDrawer({Key key, @required this.title, this.ontap, this.icon, this.subTitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ontap ?? (){},
      child: Column(
        children: [
          Row(
            children: [
              icon == null ? Container() : Padding(
                padding: EdgeInsets.only(right: 20),
                child: icon,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GenText(
                        title,
                        style: TextStyle(fontSize: 15),
                      ),
                      subTitle != null ?
                      GenText(
                        subTitle,
                        style: TextStyle(fontSize: 25, color: Colors.black54),
                      ) : Container()
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
