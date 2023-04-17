import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';

class StorageRepository {
  final FirebaseStorage _storage;

  StorageRepository(this._storage);

  Future<Either<Failure, String>> uploadFile(File file) async {
    try {
      final uploadTask = _storage
          .ref("images")
          .child("${DateTime.now().millisecondsSinceEpoch}${_getImageName(file.path)}")
          .putFile(file);
      final ref = await uploadTask.then((snapShot) => snapShot.ref);
      return ref.getDownloadURL().then((value) => Right(value));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  String _getImageName(String path) {
    return path.split('/').last.split('%').last.split("?").first;
  }
}

/* import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

// Obtener la referencia de almacenamiento de Firebase Storage para la imagen actual
StorageReference storageRef = FirebaseStorage.instance.ref();
StorageReference imageRef = storageRef.getReferenceFromUrl("URL_de_la_imagen_actual");

// Eliminar la imagen actual
imageRef.delete().then((value) {
  // La imagen ha sido eliminada exitosamente
}).catchError((error) {
  // Ha ocurrido un error al eliminar la imagen
});

// Subir la nueva imagen al almacenamiento de Firebase Storage
StorageReference newImageRef = storageRef.child("nombre_de_la_imagen_nueva");
UploadTask uploadTask = newImageRef.putFile(File("ruta_de_la_imagen_nueva"));

uploadTask.then((taskSnapshot) {
  // La imagen ha sido subida exitosamente
}).catchError((error) {
  // Ha ocurrido un error al subir la imagen
});

// Obtener la URL de la nueva imagen y actualizar la imagen de perfil del usuario en tu base de datos
newImageRef.getDownloadURL().then((uri) {
  String newImageUrl = uri.toString();
  // Actualiza la imagen de perfil del usuario en tu base de datos con la nueva URL
}).catchError((error) {
  // Ha ocurrido un error al obtener la URL de la nueva imagen
});
 */