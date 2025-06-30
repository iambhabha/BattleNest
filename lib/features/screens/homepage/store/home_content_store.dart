import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/section_model.dart';

part 'home_content_store.g.dart';

class HomeContentStore = _HomeContentStore with _$HomeContentStore;

abstract class _HomeContentStore with Store {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @observable
  ObservableList<SectionModel> sections = ObservableList<SectionModel>();

  @action
  Future<void> fetchSections() async {
    final snapshot =
        await firestore
            .collection('homepage_sections')
            .where('visible', isEqualTo: true)
            .orderBy('priority')
            .get();
    final fetchedSections =
        snapshot.docs
            .map((doc) => SectionModel.fromFirestore(doc.id, doc.data()))
            .where((section) => section.visible)
            .toList();
    sections = ObservableList.of(fetchedSections);
  }
}
