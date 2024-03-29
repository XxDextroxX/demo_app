import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_drawer.g.dart';

@Riverpod(keepAlive: true)
class CurrentIndexDrawer extends _$CurrentIndexDrawer {
  // int currentIndex = 0;
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
