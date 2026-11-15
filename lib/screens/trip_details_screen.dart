import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/cutsom_tools/custom_button.dart';
import 'package:sudan_tourist_guide/cutsom_tools/rating_service.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/screens/booking/booking_screen.dart';
import 'package:sudan_tourist_guide/screens/comment_screen.dart';
import 'package:sudan_tourist_guide/screens/test_vedio.dart';

import 'package:sudan_tourist_guide/screens/video_screen.dart';
// import 'package:sudan_tourist_guide/screens/video_screen.dart';
import '../app_widget_desing/maps_design.dart';
import '../constant/my_strings.dart';
import 'full_screen_image.dart';
import 'package:url_launcher/url_launcher.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});
  static const screenRoute = '/trip_details_screen';

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  final ScrollController _controller = ScrollController();
  double _imageHeight = 260;
  double fontSize = 20;
  double avaregRating = 0.0;
  int userRating = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadRating();
    });
    Future.microtask(() {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final id = args['id'];
      final type = args['type'];
      final lang = Provider.of<LanguageProvider>(
        context,
        listen: false,
      ).locale.languageCode;

      Provider.of<LanguageProvider>(
        context,
        listen: false,
      ).fetchDetails(type, id, lang);
    });
    _controller.addListener(() {
      double offset = _controller.offset;
      setState(() {
        _imageHeight = (260 - offset).clamp(0, 260);
      });
    });
  }

  // fuction for load ratings
  void loadRating() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final placeId = args['id'];
    final userId = FirebaseAuth.instance.currentUser!.uid;
    avaregRating = await RatingService.getRating(placeId.toString());
    userRating = await RatingService.getUserRating(userId, placeId.toString());
    setState(() {});
  }

  // function for rating
  void submitRating(int rating) async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final placeId = args['id'];
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await RatingService.ratePlace(userId, placeId, rating);
    userRating = rating;
    avaregRating = await RatingService.getRating(placeId.toString());
    setState(() {});
  }

  //  fuction for open the location in google map
  Future<void> openMap(LatLng location) async {
    final double lat = location.latitude;
    final double lng = location.longitude;
    final Uri url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("could not open google maps");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading || provider.detailItem == null) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final detailItem = provider.detailItem!;
        // final type = provider.type;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              detailItem.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontFamily: myFonts,
              ),
            ).fadeInDown(duration: Duration(milliseconds: 600)),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                height: _imageHeight,
                width: double.infinity,
                child: Hero(
                  tag: detailItem.id,
                  child: Image.network(
                    detailItem.imageUrl,
                    height: 300,
                    width: double.infinity,

                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/i.png'),
                  ),
                ),
              ),
              SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    SizedBox(height: 235),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),

                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Builder(
                              builder: (context) {
                                final activities = detailItem.activities
                                    .toSet()
                                    .toList();
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...activities.map((text) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Theme.of(
                                                context,
                                              ).shadowColor,
                                              blurRadius: 6,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          text,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: fontSize,

                                            height: 1.6,
                                            fontFamily: myFonts,
                                            color: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge!.color,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    if (provider.type == 'hotel' ||
                                        provider.type == 'restaurant' ||
                                        provider.type == 'travel') ...[
                                      SizedBox(height: 12),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Theme.of(
                                                context,
                                              ).cardColor.withOpacity(0.95),
                                              Theme.of(
                                                context,
                                              ).cardColor.withOpacity(0.80),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),

                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Theme.of(
                                                context,
                                              ).shadowColor,
                                              blurRadius: 12,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              'General informations',
                                              style: TextStyle(
                                                fontFamily: myFonts,
                                                fontSize: 20,
                                                color: Theme.of(
                                                  context,
                                                ).textTheme.bodyLarge!.color,
                                              ),
                                            ),
                                            listTileInformation(
                                              detailItem,
                                              '${detailItem.rating} Rating',
                                              Icons.star,
                                              Colors.amber,
                                            ),
                                            Divider(
                                              indent: 10,
                                              endIndent: 10,

                                              thickness: 2,
                                              color: Theme.of(
                                                context,
                                              ).shadowColor,
                                            ),
                                            listTileInformation(
                                              detailItem,
                                              provider.type == 'hotel'
                                                  ? '${detailItem.budget} Per Day'
                                                  : '${detailItem.budget} budget',
                                              Icons.attach_money,
                                              Colors.green,
                                            ),
                                            Divider(
                                              indent: 10,
                                              endIndent: 10,

                                              thickness: 2,
                                              color: Theme.of(
                                                context,
                                              ).shadowColor,
                                            ),
                                            provider.type != 'travel'
                                                ? ListTile(
                                                    title: Text(
                                                      'Visit WebSite',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: myFonts,
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .color,
                                                      ),
                                                    ),
                                                    horizontalTitleGap: 40,
                                                    leading: Icon(Icons.web),
                                                    trailing: IconButton(
                                                      onPressed: () async {
                                                        if (detailItem.webUrl ==
                                                                null ||
                                                            detailItem
                                                                .webUrl
                                                                .isEmpty) {
                                                          ScaffoldMessenger.of(
                                                            context,
                                                          ).showSnackBar(
                                                            SnackBar(
                                                              content: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'No website available',
                                                                    style: TextStyle(
                                                                      fontFamily:
                                                                          myFonts,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                  // SizedBox(width: 60),
                                                                  Icon(
                                                                    Icons
                                                                        .cancel,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                          return;
                                                        }
                                                        final Uri
                                                        url = Uri.parse(
                                                          '${detailItem.webUrl}',
                                                        );
                                                        await launchUrl(
                                                          url,
                                                          mode: LaunchMode
                                                              .externalApplication,
                                                        );
                                                      },
                                                      icon: Icon(Icons.launch),
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                : SizedBox().shakeX(),
                                          ],
                                        ),
                                      ),
                                    ],
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (_) => TestVedio(),
                                          ),
                                        );
                                      },
                                      child: Text('Test screen'),
                                    ),
                                    // A button for comment screen
                                    CustomButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => CommentScreen(
                                              place: detailItem,
                                            ),
                                          ),
                                        );
                                      },
                                      buttonText: 'View Comments',
                                    ),
                                    SizedBox(height: 10),
                                    // rating section for userss
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        gradient: LinearGradient(
                                          colors: [
                                            Theme.of(
                                              context,
                                            ).cardColor.withOpacity(0.95),
                                            Theme.of(
                                              context,
                                            ).cardColor.withOpacity(0.70),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        color: Theme.of(context).cardColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Theme.of(
                                              context,
                                            ).shadowColor.withOpacity(0.25),
                                            blurRadius: 15,
                                            offset: Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ...List.generate(5, (index) {
                                                final isSelected =
                                                    index < userRating;
                                                return AnimatedContainer(
                                                  duration: Duration(
                                                    milliseconds: 250,
                                                  ),
                                                  curve: Curves.easeOut,
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 4,
                                                  ),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                    onTap: () =>
                                                        submitRating(index + 1),
                                                    child: Material(
                                                      elevation: isSelected
                                                          ? 12
                                                          : 4,
                                                      shadowColor: Colors.amber
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            30,
                                                          ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                          6,
                                                        ),
                                                        child: Icon(
                                                          isSelected
                                                              ? Icons.star
                                                              : Icons
                                                                    .star_border,
                                                          color: Colors.amber,
                                                          size: isSelected
                                                              ? 34
                                                              : 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Rating: $avaregRating ⭐",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    // A button for visiting google maps
                                    if (provider.type == 'travel' &&
                                        detailItem.images != null &&
                                        detailItem.images.isNotEmpty) ...[
                                      SizedBox(height: 20),
                                      CarouselSlider(
                                        items: detailItem.images.map<Widget>((
                                          imge,
                                        ) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      FullScreenImage(
                                                        imageUrl: imge,
                                                      ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: imge,
                                              child: Material(
                                                elevation: 18,
                                                shadowColor: Theme.of(
                                                  context,
                                                ).shadowColor,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image.network(
                                                    imge,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    errorBuilder:
                                                        (
                                                          context,
                                                          error,
                                                          stackTrace,
                                                        ) => Image.asset(
                                                          'assets/images/i.png',
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        options: CarouselOptions(
                                          height: 400,
                                          enlargeCenterPage: true,
                                          viewportFraction: 0.8,
                                          aspectRatio: 20 / 11,
                                          autoPlay: true,
                                          autoPlayInterval: Duration(
                                            seconds: 3,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      if (detailItem.youtubeUrl !=
                                          'youtubeUrl') ...[
                                        Container(
                                          height: 270,
                                          // padding: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.15,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: Colors.black.withOpacity(
                                                0.3,
                                              ),
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Theme.of(
                                                  context,
                                                ).shadowColor.withOpacity(0.15),
                                                blurRadius: 12,
                                                offset: Offset(0, 6),
                                              ),
                                            ],
                                          ),

                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Theme.of(context)
                                                              .shadowColor
                                                              .withOpacity(
                                                                0.15,
                                                              ),
                                                          Colors.transparent,
                                                          Theme.of(context)
                                                              .shadowColor
                                                              .withOpacity(
                                                                0.15,
                                                              ),
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: VideoScreen(
                                                    youtubeUrl:
                                                        detailItem.youtubeUrl,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],

                                    SizedBox(height: 20),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        openMap(detailItem.location);
                                      },
                                      icon: Icon(Icons.location_pin),
                                      label: Text(S.of(context).visitPlace),
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: Theme.of(
                                          context,
                                        ).shadowColor,

                                        elevation: 12,
                                        backgroundColor: Theme.of(
                                          context,
                                        ).cardColor,
                                        foregroundColor: Theme.of(
                                          context,
                                        ).primaryColor,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    MapsDesign(detailItem: detailItem),
                                    if (provider.type == 'travel' ||
                                        provider.type == 'trip') ...[
                                      SizedBox(height: 20),
                                      Center(
                                        child: CustomButton(
                                          onPressed: () {
                                            if (provider.detailItem != null) {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) => BookingScreen(
                                                    place: detailItem,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          buttonText: 'Book a Trip',
                                        ),
                                      ),
                                    ],
                                    SizedBox(height: 40),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: TweenAnimationBuilder<double>(
            duration: Duration(seconds: 5),
            tween: Tween<double>(begin: 950, end: 60),
            curve: Curves.easeOutExpo,
            builder: (context, value, child) {
              final safeHeight = value.clamp(60, 750).toDouble();
              final opacity = ((750 - safeHeight) / 700).clamp(0, 1).toDouble();
              return Opacity(
                opacity: opacity,
                child: SizedBox(height: safeHeight, child: child),
              );
            },
            child: _AnimatedBottomBar(
              onIncrease: () {
                if (fontSize < 40) {
                  setState(() => fontSize += 5);
                }
              },
              onDecrease: () {
                if (fontSize > 15) {
                  setState(() => fontSize -= 5);
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget listTileInformation(
    detailItem,
    String title,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontFamily: myFonts,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          horizontalTitleGap: 40,
          leading: Icon(icon, color: color),
        ),
      ],
    );
  }
}

class _AnimatedBottomBar extends StatefulWidget {
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _AnimatedBottomBar({
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  State<_AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<_AnimatedBottomBar> {
  double opacity1 = 0;
  double opacity2 = 0;

  @override
  void initState() {
    super.initState();

    // ⭐ Staggered Icons Animation
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => opacity1 = 1);
    });

    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;

      setState(() => opacity2 = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      height: 60,
      indicatorColor: Colors.transparent,
      destinations: [
        NavigationDestination(
          label: '',
          icon: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: opacity1,
            child: IconButton(
              onPressed: widget.onIncrease,
              icon: Icon(Icons.text_increase, size: 30),
            ),
          ),
        ),
        NavigationDestination(
          label: '',
          icon: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: opacity2,
            child: IconButton(
              onPressed: widget.onDecrease,
              icon: Icon(Icons.text_decrease, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}
