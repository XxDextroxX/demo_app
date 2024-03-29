import 'package:demo_app/models/models.dart';
import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        const TextStyle(fontSize: 18, fontFamily: 'NimbusSans');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _avatar(userModel.name ?? '', context),
          const SizedBox(height: 10),
          Text('${userModel.name} ${userModel.lastName}', style: textStyle),
          ListTile(
            title: Text(userModel.email ?? '', style: textStyle),
          ),
          const SizedBox(height: 10),
          Divider(
            color: Theme.of(context).primaryColorDark,
          ),
        ],
      ),
    );
  }

  Widget _avatar(String? name, BuildContext context) {
    if (name == null || name.isEmpty) {
      name = '000';
    }
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColorDark,
      ),
      child: Center(
        child: Text(
          name.substring(0, 2).toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
