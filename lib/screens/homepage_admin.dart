import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/config/config.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/shared/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  FirebaseAuth auth = FirebaseAuth.instance;
  DocumentSnapshot? _lastDocument;
  List<DocumentSnapshot> sellers = [];
  final ScrollController _scrollController = ScrollController();
  String queryText = '';
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    fetchCustomers();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchCustomers();
    }
  }

  Future<void> fetchCustomers() async {
    Query query = FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'seller')
        .orderBy('createdAt')
        .limit(20);

    if (queryText.isNotEmpty) {
      query = query.where('name',
          isGreaterThanOrEqualTo: queryText, isLessThan: '$queryText\uf8ff');
    }

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    final querySnapshot = await query.get();
    if (querySnapshot.docs.isNotEmpty) {
      _lastDocument = querySnapshot.docs.last;
      sellers.addAll(querySnapshot.docs);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vendedores'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  queryText = '';
                  sellers = [];
                  _lastDocument = null;
                });
                fetchCustomers();
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(PathRouter.createSeller);
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              sellers.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: size.height * 0.4),
                      child: const Center(
                        child: Text('No hay vendedores registrados'),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: sellers.length,
                      itemBuilder: (context, index) {
                        final client = sellers[index];
                        final model = ClientModel.fromJson(
                            client.data() as Map<String, dynamic>);
                        return ViewSellers(
                          model: model,
                          id: client.id,
                        );
                      },
                    ),
            ],
          ),
        ));
  }
}
