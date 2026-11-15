import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/category_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import '../app_widget_desing/category_item.dart';

//   دي الصفحة الولى في التطبيق بنظهر فيها الشبكات(الدول)
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Widget buildStaggeredGrid(BuildContext context, List<CategoryConstructor> i) {
    return Container(
      padding: EdgeInsets.only(bottom: 70),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 12,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1.1,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                shadowColor: Theme.of(context).shadowColor,
                child: CategoryItem(
                  id: i[0].id,
                  imageUrl: i[0].imageUrl,
                  title: i[0].title,
                ),
              ),
            ),

            ...i.skip(1).map((i) {
              return StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Material(
                  elevation: 10,
                  shadowColor: Theme.of(context).shadowColor,
                  borderRadius: BorderRadius.circular(15),
                  child: CategoryItem(
                    id: i.id,
                    imageUrl: i.imageUrl,
                    title: i.title,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      Provider.of<LanguageProvider>(context, listen: false).loadData();
    });
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final api = ApiGetServices();
    final user = FirebaseAuth.instance.currentUser;
    final langProvider = Provider.of<LanguageProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      langProvider.locale.languageCode == 'en'
                          ? 'Hi ${user!.displayName}'
                          : 'اهلاً ${user!.displayName}',
                      style: TextStyle(
                        fontFamily: myFonts,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Skeletonizer(
                enabled: langProvider.isLoading,
                child: Center(
                  child: FutureBuilder<List<CategoryConstructor>>(
                    future: api.getCategories(langProvider.locale.languageCode),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text(S.of(context).categoryError));
                      }
                      final cities = snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            //  هنا بنستخدم الدالة العملناها عشان نرتب شكل الكود
                            buildStaggeredGrid(context, cities),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
