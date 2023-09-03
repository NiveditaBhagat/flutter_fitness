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
  final CollectionReference yogaStepCollection =
      FirebaseFirestore.instance.collection('Yoga');

  Future<List<String>> fetchDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot = await yogaStepCollection.get();

      List<String> data = [];

      for (DocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> documentData = doc.data() as Map<String, dynamic>;

        // Access and add the specific fields you need to the 'data' list
        String step1 = documentData['step1'] ?? ''; // Replace 'step1' with your field name
        String step2 = documentData['step2'] ?? ''; // Replace 'step2' with your field name
        // Add more fields as needed

        // Combine the fields and add them to the list
        String combinedData = '$step1, $step2'; // Customize this based on your needs

        data.add(combinedData);
      }

      return data;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
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

Future<Map<String, dynamic>> fetchStepsData(String documentId) async {
  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('Yoga') // Replace with your collection name
        .doc(documentId) // Provide the document ID
        .get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      return data;
    } else {
      print('Document does not exist');
      return null!; // Handle the case where the document doesn't exist
    }
  } catch (e) {
    print('Error fetching data: $e');
    return null!; // Handle errors during data retrieval
  }
}



//to fetch the steps data from collections



Future<List<String>> fetchYogaStepsForExercise(String exerciseDocumentId) async {
  try {
    // Reference to the "exercises" collection
    CollectionReference exercisesCollection =
        FirebaseFirestore.instance.collection('Yoga');

    // Reference to the specific exercise document using its document ID
    DocumentReference exerciseDocRef =
        exercisesCollection.doc(exerciseDocumentId);

    // Get the exercise document
    DocumentSnapshot exerciseDoc = await exerciseDocRef.get();

    if (exerciseDoc.exists) {
      // Extract steps data from the document
      List<String> steps = [];
      for (int i = 1; i <= 8; i++) {
        String stepDescription = exerciseDoc['step$i'];
        if (stepDescription != null) {
          steps.add(stepDescription);
        }
      }

      return steps;
    } else {
      // Exercise with the given document ID not found
      return [];
    }
  } catch (error) {
    print('Error fetching steps: $error');
    return [];
  }
}
Future<List<String>> fetchPilatesStepsForExercise(String exerciseDocumentId) async {
  try {
    // Reference to the "exercises" collection
    CollectionReference exercisesCollection =
        FirebaseFirestore.instance.collection('Pilates');

    // Reference to the specific exercise document using its document ID
    DocumentReference exerciseDocRef =
        exercisesCollection.doc(exerciseDocumentId);

    // Get the exercise document
    DocumentSnapshot exerciseDoc = await exerciseDocRef.get();

    if (exerciseDoc.exists) {
      // Extract steps data from the document
      List<String> steps = [];
      for (int i = 1; i <= 4; i++) {
        String stepDescription = exerciseDoc['step$i'];
        if (stepDescription != null) {
          steps.add(stepDescription);
        }
      }

      return steps;
    } else {
      // Exercise with the given document ID not found
      return [];
    }
  } catch (error) {
    print('Error fetching steps: $error');
    return [];
  }
}
Future<List<String>> fetchFullBodyStepsForExercise(String exerciseDocumentId) async {
  try {
    // Reference to the "exercises" collection
    CollectionReference exercisesCollection =
        FirebaseFirestore.instance.collection('Full Body');

    // Reference to the specific exercise document using its document ID
    DocumentReference exerciseDocRef =
        exercisesCollection.doc(exerciseDocumentId);

    // Get the exercise document
    DocumentSnapshot exerciseDoc = await exerciseDocRef.get();

    if (exerciseDoc.exists) {
      // Extract steps data from the document
      List<String> steps = [];
      for (int i = 1; i <= 5; i++) {
        String stepDescription = exerciseDoc['step$i'];
        if (stepDescription != null) {
          steps.add(stepDescription);
        }
      }

      return steps;
    } else {
      // Exercise with the given document ID not found
      return [];
    }
  } catch (error) {
    print('Error fetching steps: $error');
    return [];
  }
}
Future<List<String>> fetchStretchStepsForExercise(String exerciseDocumentId) async {
  try {
    // Reference to the "exercises" collection
    CollectionReference exercisesCollection =
        FirebaseFirestore.instance.collection('Stretching');

    // Reference to the specific exercise document using its document ID
    DocumentReference exerciseDocRef =
        exercisesCollection.doc(exerciseDocumentId);

    // Get the exercise document
    DocumentSnapshot exerciseDoc = await exerciseDocRef.get();

    if (exerciseDoc.exists) {
      // Extract steps data from the document
      List<String> steps = [];
      for (int i = 1; i <= 5; i++) {
        String stepDescription = exerciseDoc['step$i'];
        if (stepDescription != null) {
          steps.add(stepDescription);
        }
      }

      return steps;
    } else {
      // Exercise with the given document ID not found
      return [];
    }
  } catch (error) {
    print('Error fetching steps: $error');
    return [];
  }
}

