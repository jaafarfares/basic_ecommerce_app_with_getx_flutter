import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServicce {
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection('Category');

  final CollectionReference _ProductsCollectionReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await _categoryCollectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getbestsellingproducts() async {
    var value = await _ProductsCollectionReference.get();
    return value.docs;
  }
}
