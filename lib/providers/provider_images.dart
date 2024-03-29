import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_images.g.dart';

@riverpod
class LoadImages extends _$LoadImages {
  List<File>? imageFiles;
  @override
  List<File>? build() {
    return imageFiles;
  }

  //add images

  void addImage(File image) {
    state = [...state ?? [], image];
  }

  //delete images

  void deleteImage(int index) {
    state = List.from(state ?? [])..removeAt(index);
  }

  void addImages(List<File> images) {
    state = [...state ?? [], ...images];
  }

  void clear() {
    state = [];
  }

  void reset() {
    imageFiles = [];
  }
}
