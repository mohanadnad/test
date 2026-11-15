import 'dart:ui';

import 'package:flutter/material.dart';
import '../constant/my_strings.dart';
import '../screens/tab_screen_for_activities.dart';
// import '../screens/trips_screen.dart';

// دي الصحفة المسؤالة عن تصميم الشباكات الموجودة في الصفحة الاولى
class CategoryItem extends StatelessWidget {
  // هنا لازم نعرف المتغيرات النحن محتاجين ليها عشان نقدر نخزن فيها البيانات الاصلية الموجودة قي ملف البيانات

  const CategoryItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.id,
  });
  final String title;
  final String imageUrl;
  final String id;
  void moveTo(BuildContext context) {
    Navigator.of(context).pushNamed(
      TabScreenForActivities.screenRoute,
      arguments: {"id": id, "title": title},
    );
  }

  @override
  Widget build(BuildContext context) {
    // استخدمانا الوديدجت دي عشان نحن عايزين ننتقل للصفحة البعدها
    return InkWell(
      onTap: () => moveTo(context),

      child: Stack(
        children: [
          // الخلفية (الصورة)
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.23, sigmaY: 0.23),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).shadowColor.withOpacity(0.15),
                          Colors.white.withOpacity(0.5),
                          Theme.of(context).shadowColor.withOpacity(0.15),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: myFonts,
                fontSize: 25,
                color: Colors.white.withOpacity(0.95),
                shadows: [Shadow(color: Colors.black.withOpacity(0.3))],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
