import 'package:cloud_firestore/cloud_firestore.dart';

class YogaDataFetcher {
  final CollectionReference yogaCollection =
      FirebaseFirestore.instance.collection('Yoga');

  Future<List<String>> fetchYogaNames() async {
    QuerySnapshot querySnapshot = await yogaCollection.get();

    List<String> names = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String name = doc['name'] ?? ''; // Adjust the field name
      names.add(name);
    }

    return names;
  }
    final CollectionReference yogaImageCollection =
      FirebaseFirestore.instance.collection('Yoga');

  Future<List<String>> fetchYogaImages() async {
    QuerySnapshot querySnapshot = await yogaImageCollection.get();

    List<String> images = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String image = doc['image'] ?? ''; // Adjust the field name
      images.add(image);
    }

    return images;
  }

}

class PilatesDataFetcher {
  final CollectionReference pilatesCollection =
      FirebaseFirestore.instance.collection('Pilates');

  Future<List<String>> fetchPilatesNames() async {
    QuerySnapshot querySnapshot = await pilatesCollection.get();

    List<String> names = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String name = doc['name'] ?? ''; // Adjust the field name
      names.add(name);
    }

    return names;
  }
  final CollectionReference pilatesImageCollection =
      FirebaseFirestore.instance.collection('Pilates');

  Future<List<String>> fetchPilatesImages() async {
    QuerySnapshot querySnapshot = await pilatesImageCollection.get();

    List<String> images = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String image = doc['image'] ?? ''; // Adjust the field name
      images.add(image);
    }

    return images;
  }
}
class StrechingDataFetcher {
  final CollectionReference stretchingCollection =
      FirebaseFirestore.instance.collection('Stretching');

  Future<List<String>> fetchStretchingNames() async {
    QuerySnapshot querySnapshot = await stretchingCollection.get();

    List<String> names = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String name = doc['name'] ?? ''; // Adjust the field name
      names.add(name);
    }

    return names;
  }
   final CollectionReference stretchingImageCollection =
      FirebaseFirestore.instance.collection('Stretching');

  Future<List<String>> fetchStretchingImages() async {
    QuerySnapshot querySnapshot = await stretchingCollection.get();

    List<String> images = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String image = doc['image'] ?? ''; // Adjust the field name
      images.add(image);
    }

    return images;
  }
}
class FullBodyDataFetcher {
  final CollectionReference fullbodyCollection =
      FirebaseFirestore.instance.collection('Full Body');

  Future<List<String>> fetchFullBodyNames() async {
    QuerySnapshot querySnapshot = await fullbodyCollection.get();

    List<String> names = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String name = doc['name'] ?? ''; // Adjust the field name
      names.add(name);
    }

    return names;
  }

   final CollectionReference fullBodyImageCollection =
      FirebaseFirestore.instance.collection('Full Body');

  Future<List<String>> fetchFullBodyImages() async {
    QuerySnapshot querySnapshot = await fullBodyImageCollection.get();

    List<String> images = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      String image = doc['image'] ?? ''; // Adjust the field name
      images.add(image);
    }

    return images;
  }
}