import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class ViewSellers extends StatefulWidget {
  const ViewSellers({super.key, required this.model, required this.id});
  final ClientModel model;
  final String id;

  @override
  State<ViewSellers> createState() => _ViewSellersState();
}

class _ViewSellersState extends State<ViewSellers> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    isActive = widget.model.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child:
            Icon(Icons.person_outline, color: Theme.of(context).primaryColor),
      ),
      title: Text('${widget.model.name.value} ${widget.model.lastName.value}'),
      subtitle: Text(widget.model.email.value),
      trailing: IconButton(
        onPressed: () {
          CustomDialogs.generalDialog(
            context: context,
            title: isActive ? 'Desactivar' : 'Activar',
            content: isActive
                ? '¿Desea desactivar al vendedor?'
                : '¿Desea activar al vendedor?',
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.id)
                  .update({'isActive': isActive ? false : true});
              setState(() {
                isActive = !isActive;
              });
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
          );
        },
        icon: isActive
            ? const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              )
            : const Icon(
                Icons.cancel_outlined,
                color: Colors.red,
              ),
      ),
    );
  }
}
