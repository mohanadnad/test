// import 'package:latlong2/latlong.dart';
// import 'constructros/travels_constructor.dart';

// import 'constructros/category_constructor.dart';
// import 'constructros/hotel_constructor.dart';
// import 'constructros/resturnt_constructor.dart';
// import 'constructros/trips_constructor.dart';

// // Data for regions and cities
// const categoryInforamtion = [
//   CategoryConstructor(
//     id: 'c1',
//     title: 'الخرطوم',
//     titleEn: 'Khartoum',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/63ee4402b_generated_image.png',
//   ),
//   CategoryConstructor(
//     id: 'c9',
//     title: 'امدرمان',
//     titleEn: 'Omdurman',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/2e78068be_generated_image.png',
//   ),
//   CategoryConstructor(
//     id: 'c2',
//     title: 'مروي',
//     titleEn: 'Meroe',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/3f47ecfa3_generated_image.png',
//   ),
//   CategoryConstructor(
//     id: 'c3',
//     title: 'بورت سودان',
//     titleEn: 'Port Sudan',
//     imageUrl:
//         'https://i.pinimg.com/originals/04/cf/ba/04cfba5fb6311eaf5b5b730ad1e2b3c5.jpg',
//   ),
//   CategoryConstructor(
//     id: 'c4',
//     title: 'الدمازين',
//     titleEn: 'Ad-Damazin',
//     imageUrl:
//         'https://i.pinimg.com/originals/5a/47/03/5a4703b78468587af98ddb3376fa2e4e.jpg',
//   ),
//   CategoryConstructor(
//     id: 'c5',
//     title: 'كسلا',
//     titleEn: 'Kasla',
//     imageUrl:
//         'https://wallpapers.com/images/hd/sudan-kassala-city-6jeugw1zp65v4hq8.jpg',
//   ),
//   CategoryConstructor(
//     id: 'c6',
//     title: 'سواكن',
//     titleEn: 'Suakin',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/e6b07fe5f_generated_image.png',
//   ),
//   CategoryConstructor(
//     id: 'c7',
//     title: 'كريمة',
//     titleEn: 'Krima',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/63ebef22f_generated_image.png',
//   ),
//   CategoryConstructor(
//     id: 'c8',
//     title: 'دارفور',
//     titleEn: 'Darfur',
//     imageUrl:
//         'https://i.pinimg.com/originals/c9/1a/99/c91a99f8c1f6f218824fa96b1ceb7dd7.jpg',
//   ),
// ];
// // Travels Data
// const travelsData = [
//   TravelsConstructor(
//     images: [
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/a1/1d/76/meroe-pyramids-56.jpg?w=800&h=500&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/61/f4/e7/meroe-pyramids.jpg?w=1600&h=900&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/07/62/07/caption.jpg?w=1100&h=600&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/d5/b8/4b/meroe-pyramid.jpg?w=1600&h=-1&s=1',
//     ],
//     categories: 'c1',
//     cityName: 'مروي',
//     cityNameEn: 'Meroe',
//     travelType: 'تاريخي',
//     travelTypeEn: 'Historical',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/07/62/39/caption.jpg?w=1100&h=-1&s=1',
//     youtubeUrl:
//         'https://github.com/mohanadnad/sudan-tourism-videos/releases/download/v.1/Storyboard.mp4',
//     title: 'أهرامات مروي',
//     titleEn: 'Meroe Pyramids',
//     discription:
//         'تعد أهرامات مروي عاصمة مملكة كوش الثانية ومركزاً لصناعة الحديد في العالم القديم، وتضم أكثر من 200 هرم جنائزي.',
//     descriptionEn:
//         'The Pyramids of Meroe served as the capital of the second Kingdom of Kush and a major iron-smelting center in the ancient world, featuring over 200 funerary pyramids.',
//     id: 'A1',
//     budget: 15000,
//     activities: [
//       "استكشاف الأهرامات المروحية ذات القمم الحادة والفريدة.",
//       "زيارة المعابد الجنائزية المحيطة ورؤية النقوش الملكية.",
//       "القيام بجولة على ظهور الجمال وسط الكثبان الرملية الذهبية.",
//       "مشاهدة غروب الشمس الساحر وهو يغلف الأهرامات باللون الأحمر.",
//     ],
//     activitiesEn: [
//       "Explore unique, steep-sided Meroitic pyramids.",
//       "Visit funerary temples and admire royal inscriptions.",
//       "Enjoy a camel ride through golden sand dunes.",
//       "Witness a breathtaking sunset painting the pyramids in crimson hues.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/db/fa/18/photo2jpg.jpg?w=1100&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/73/c7/d3/photo6jpg.jpg?w=1100&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/73/c7/d0/photo3jpg.jpg?w=1400&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/ea/22/8d/photo8jpg.jpg?w=1400&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/33/6b/ad/caption.jpg?w=1100&h=-1&s=1',
//     ],
//     categories: 'c2',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'تاريخي',
//     travelTypeEn: 'Historical',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/d4/9c/f2/museum.jpg?w=1400&h=-1&s=1',
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/35ecb8848_Sudan-NationalMuseum720P_HD.mp4',
//     title: 'المتحف القومي السوداني',
//     titleEn: 'Sudan National Museum',
//     discription:
//         'يعتبر المتحف القومي السوداني حارس تراث وادي النيل، حيث يضم آثاراً نادرة من مملكة كرمة ونبتة ومروي ومعابد أنقذت من الغرق.',
//     descriptionEn:
//         'The Sudan National Museum is the guardian of Nile Valley heritage, housing rare artifacts from the Kerma, Napata, and Meroe kingdoms, including temples rescued from rising waters.',
//     id: 'A2',
//     budget: 5000,
//     activities: [
//       "رؤية معبد بوهين المعاد بناؤه في حديقة المتحف.",
//       "مشاهدة الجداريات القبطية الفريدة المكتشفة في كاتدرائية فرس.",
//       "استكشاف تماثيل الجرانيت الضخمة لملوك كوش السود.",
//       "التعرف على تسلسل الحضارات السودانية عبر العصور المختلفة.",
//     ],
//     activitiesEn: [
//       "See the reconstructed Temple of Buhen in the museum garden.",
//       "Admire unique Coptic murals discovered in the Faras Cathedral.",
//       "Explore massive granite statues of the Black Pharaohs of Kush.",
//       "Discover the chronological sequence of Sudanese civilizations through the ages.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/17/24/c8/photo6jpg.jpg?w=1600&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/17/24/c2/photo0jpg.jpg?w=1600&h=-1&s=1',
//     ],
//     categories: 'c3',
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     travelType: 'رحلة بحرية',
//     travelTypeEn: 'Sea trip',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/25/a5/b8/vistas-desde-el-faro.jpg?w=1400&h=-1&s=1',
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/bd70964cd_fasl_JJcjZBjcJ9ka.mp4',
//     title: 'منتزه سنقنيب',
//     titleEn: 'Sanganeb Marine National Park',
//     discription:
//         'تقع محمية سنقنيب على بعد كيلومترات من بورتسودان، وتتميز بفنار تاريخي عريق وتحيط بها شعاب مرجانية فريدة عالمياً.',
//     descriptionEn:
//         'Located a few kilometers from Port Sudan, Sanganeb is a marine reserve featuring a historic lighthouse and surrounded by world-renowned coral reefs.',
//     id: 'A3',
//     budget: 30000,
//     activities: [
//       "الغوص لاستكشاف الشعاب المرجانية الملونة والأسماك النادرة.",
//       "صعود قمة الفنار التاريخي للحصول على رؤية بانورامية للبحر.",
//       "مراقبة الدلافين التي تسبح بجانب القوارب المتجهة للمحمية.",
//       "الاستمتاع بالسباحة في المياه الفيروزية الصافية والهدوء التام.",
//     ],
//     activitiesEn: [
//       "Dive to explore colorful coral reefs and rare marine life.",
//       "Climb the historic lighthouse for panoramic views of the Red Sea.",
//       "Watch dolphins swimming alongside boats heading to the reserve.",
//       "Enjoy swimming in crystal-clear turquoise waters and total serenity.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273),
//   ),

//   TravelsConstructor(
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     imageUrl:
//         'https://www.image2url.com/r2/default/images/1776255006011-c03cfe10-9b64-4f7b-a79c-5d8563548e08.jpg',
//     youtubeUrl: 'youtubeUrl',
//     title: 'جزيرة توتي',
//     titleEn: 'Tuti Island',
//     discription:
//         'جزيرة توتي هي القلب النابض للخرطوم، حيث صمدت لقرون أمام الفيضانات وحافظت على طابعها الزراعي التقليدي الأصيل.',
//     descriptionEn:
//         'Tuti Island is the heart of Khartoum, having withstood floods for centuries while maintaining its authentic traditional agricultural character.',
//     id: 'A4',
//     budget: 2000,
//     activities: [
//       "المشي على شاطئ الرمال البيضاء عند ملتقى النيلين.",
//       "زيارة المزارع التقليدية وتذوق الفواكه الطازجة في الحقول.",
//       "الاستمتاع برحلة بالقوارب التقليدية حول الجزيرة وقت الغروب.",
//       "تناول الشاي والقهوة السودانية في الجلسات المطلة على النيل.",
//     ],
//     activitiesEn: [
//       "Walk on white sand beaches at the confluence of the two Niles.",
//       "Visit traditional farms and taste fresh fruits directly from the fields.",
//       "Enjoy a sunset boat trip in a traditional wooden vessel around the island.",
//       "Sip Sudanese tea and coffee at local spots overlooking the river.",
//     ],
//     location: LatLng(15.619771898525798, 32.50675708193894),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/07/5c/0f/caption.jpg?w=1100&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/07/5c/0e/caption.jpg?w=1100&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/74/74/53/naqa.jpg?w=1400&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/73/a8/ed/photo2jpg.jpg?w=1400&h=-1&s=1',
//     ],
//     categories: 'c3',
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     travelType: 'تاريخي',
//     travelTypeEn: 'Historical',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/07/5c/0d/caption.jpg?w=1100&h=-1&s=1',
//     youtubeUrl: 'youtubeUrl',
//     title: 'مدينة النقعة الأثرية',
//     titleEn: 'Naqa Ancient City',
//     discription:
//         'تعتبر نقاع مركزاً تجارياً ودينياً مهماً في الحضارة المروية، وتشتهر بمعبد الأسد الذي يعكس القوة الدينية للمملكة.',
//     descriptionEn:
//         'Naqa was an important commercial and religious center in the Meroitic civilization, famous for the Lion Temple which reflects the kingdom\'s religious power.',
//     id: 'A5',
//     budget: 12000,
//     activities: [
//       "تأمل نقوش معبد الأسد (أبادماك) المتقنة والمحفوظة جيداً.",
//       "زيارة 'الكشك الروماني' الذي يمزج بين العمارة النوبية والرومانية.",
//       "استكشاف معبد آمون والوقوف على أطلال المدينة القديمة.",
//       "التصوير في الموقع الصحراوي الهادئ الذي يعبق بعبق التاريخ.",
//     ],
//     activitiesEn: [
//       "Admire the well-preserved and intricate carvings of the Lion Temple (Apedemak).",
//       "Visit the 'Roman Kiosk' which blends Nubian and Roman architecture.",
//       "Explore the Temple of Amun and stand amidst the ruins of the ancient city.",
//       "Capture stunning photos in a serene desert setting steeped in history.",
//     ],
//     location: LatLng(19.745438292958585, 37.43635950238654),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1a/ac/0b/photo3jpg.jpg?w=1100&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/d4/9d/f3/tombs.jpg?w=1400&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/aa/59/fd/hoily-men-s-tombs-at.jpg?w=1600&h=-1&s=1',
//     ],
//     categories: 'c3',
//     cityName: 'دونغولا',
//     cityNameEn: 'Dongola',
//     travelType: 'تاريخي',
//     travelTypeEn: 'Historical',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/d4/9e/53/tombs.jpg?w=1400&h=800&s=1',
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/d877ce5e5_OldDongola_Sudan720P_HD.mp4',
//     title: 'دونغولا القديمة',
//     titleEn: 'Old Dongola',
//     discription:
//         'كانت دونغولا القديمة عاصمة مملكة المقرة المسيحية لقرون، وتضم بقايا كنائس عريقة وقصوراً إسلامية وقباباً تاريخية.',
//     descriptionEn:
//         'Old Dongola was the capital of the Christian Kingdom of Makuria for centuries, featuring remains of ancient churches, Islamic palaces, and historic domes.',
//     id: 'A6',
//     budget: 18000,
//     activities: [
//       "زيارة بقايا كنيسة الأعمدة الستة عشر العريقة.",
//       "استكشاف القاعة الملكية التاريخية التي تحولت لاحقاً لمسجد.",
//       "رؤية قباب المشايخ والآثار الإسلامية الفريدة في المنطقة.",
//       "التعرف على تاريخ تحول الممالك في السودان من المسيحية للإسلام.",
//     ],
//     activitiesEn: [
//       "Visit the ruins of the ancient Church of the Sixteen Columns.",
//       "Explore the historic Throne Hall which was later converted into a mosque.",
//       "View the unique Sufi domes and Islamic monuments in the area.",
//       "Learn about the historical transition of Sudanese kingdoms from Christianity to Islam.",
//     ],
//     location: LatLng(18.224567152725673, 30.753597519835555),
//   ),

//   TravelsConstructor(
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'تاريخي',
//     travelTypeEn: 'Historical',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/31/56/1d/77/vue-de-face.jpg?w=1200&h=700&s=1',
//     youtubeUrl: 'youtubeUrl',
//     title: 'أهرامات البجراوية',
//     titleEn: 'Pyramids of Begrawiya',
//     discription:
//         'تمثل الأهرامات النوبية في البجراوية الرمز الحضاري للسودان، حيث بنيت بزوايا حادة لتمجيد ملوك وملكات كوش العظماء.',
//     descriptionEn:
//         'The Nubian pyramids at Begrawiya represent Sudan\'s cultural symbol, built with sharp angles to honor the great kings and queens of Kush.',
//     id: 'A7',
//     budget: 14000,
//     activities: [
//       "التعرف على طقوس الدفن والمراسم الجنائزية لمملكة كوش.",
//       "استكشاف الغرف الجنائزية المزينة بالنقوش والرموز القديمة.",
//       "الاستمتاع برحلة سياحية تثقيفية حول تاريخ وادي النيل.",
//       "حضور عروض تعريفية عن الاكتشافات الأثرية الحديثة في الموقع.",
//     ],
//     activitiesEn: [
//       "Learn about the burial rituals and funerary ceremonies of the Kingdom of Kush.",
//       "Explore funerary chambers decorated with ancient carvings and symbols.",
//       "Enjoy an educational tour about the history of the Nile Valley.",
//       "Attend presentations on recent archaeological discoveries at the site.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273),
//   ),

//   TravelsConstructor(
//     budget: 1200,
//     images: [
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/7f/04/ea/photo2jpg.jpg?w=1100&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/7f/04/e9/photo1jpg.jpg?w=1400&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/f8/f5/a5/livre-des-morts.jpg?w=1600&h=-1&s=1',
//     ],
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'تاريخ/آثار',
//     travelTypeEn: 'History/Archaeology',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/10/03/9d/oct-2018-elkuru-site.jpg?w=1400&h=-1&s=1',
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/1ab86a3aa_ElKurrupyramids_Tombs_Pharaonic_History720P_HD.mp4',
//     title: 'مقابر الكرو',
//     titleEn: 'El-Kurru Tombs',
//     discription:
//         'الكرو هي المقبرة الملكية الأولى لأسرة نبتة، وتضم مدافن ملوك الأسرة الخامسة والعشرين الذين حكموا السودان ومصر معاً.',
//     descriptionEn:
//         'El-Kurru was the first royal cemetery of the Napatan dynasty, containing the tombs of the 25th Dynasty pharaohs who ruled both Sudan and Egypt.',
//     id: 'A8',
//     activities: [
//       "النزول إلى غرفة دفن الملك تهارقا لرؤية الرسومات الأصلية.",
//       "مشاهدة جداريات النجوم والآلهة المحفوظة بألوانها الزاهية.",
//       "زيارة مقابر الخيول الملكية التي دفنت بطقوس جنائزية خاصة.",
//       "التعرف على تاريخ ملوك كوش العظماء الذين حكموا وادي النيل.",
//     ],
//     activitiesEn: [
//       "Descend into King Taharqa's burial chamber to see original paintings.",
//       "View vibrant murals of stars and deities preserved in their original colors.",
//       "Visit the royal horse cemetery where horses were buried with special rituals.",
//       "Learn the history of the great Kushite kings who ruled the Nile Valley.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//   ),
//   TravelsConstructor(
//     budget: 1500,
//     images: [
//       'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Soleb2.jpg/500px-Soleb2.jpg',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/aa/6a/c8/two-well-preserved-columns.jpg?w=1600&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/18/0e/2b/photo4jpg.jpg?w=1100&h=-1&s=1',
//     ],
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'تراث ثقافي',
//     travelTypeEn: 'Cultural Heritage',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/28/Soleb1.jpg',
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/4d06a9509_Day7-TempleofSesibi_onthewestbankoftheSudaneseNileacrossfromDelgo720P_HD.mp4',
//     title: 'معبد سوليب',
//     titleEn: 'Soleb Temple',
//     discription:
//         'يعد معبد سوليب تحفة معمارية بناها الفرعون أمنحتب الثالث، ويتميز بأعمدته الضخمة التي تماثل معبد الأقصر في الجمال والدقة.',
//     descriptionEn:
//         'Soleb Temple is an architectural masterpiece built by Pharaoh Amenhotep III, featuring massive columns that rival the Temple of Luxor in beauty and precision.',
//     id: 'A9',
//     activities: [
//       "تأمل الأعمدة الجرانيتية ذات التيجان البردية المذهلة.",
//       "مشاهدة النقوش التي توثق أسماء الشعوب في عهد الدولة الحديثة.",
//       "استكشاف أطلال المعبد عند الغروب لالتقاط صور فنية رائعة.",
//       "التعرف على التاريخ الفرعوني في السودان والتبادل الحضاري.",
//     ],
//     activitiesEn: [
//       "Admire the granite columns with stunning papyrus capitals.",
//       "View inscriptions documenting various nations during the New Kingdom era.",
//       "Explore temple ruins at sunset for magnificent artistic photography.",
//       "Learn about Pharaonic history in Sudan and cultural exchanges.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//   ),
//   TravelsConstructor(
//     images: [
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/7f/04/ea/photo2jpg.jpg?w=1100&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/7f/04/e9/photo1jpg.jpg?w=1400&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/f8/f5/a5/livre-des-morts.jpg?w=1600&h=-1&s=1',
//     ],
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'تاريخي',
//     travelTypeEn: 'Historical',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/10/03/9d/oct-2018-elkuru-site.jpg?w=1400&h=-1&s=1',
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/1ab86a3aa_ElKurrupyramids_Tombs_Pharaonic_History720P_HD.mp4',
//     title: 'مقابر الكرو',
//     titleEn: 'El-Kurru Tombs',
//     discription:
//         'الكرو هي المقبرة الملكية الأولى لأسرة نبتة، وتضم مدافن ملوك الأسرة الخامسة والعشرين الذين حكموا السودان ومصر معاً.',
//     descriptionEn:
//         'El-Kurru was the first royal cemetery of the Napatan dynasty, containing the tombs of the 25th Dynasty pharaohs who ruled both Sudan and Egypt.',
//     id: 'A8',
//     budget: 13000,
//     activities: [
//       "النزول إلى غرفة دفن الملك تهارقا لرؤية الرسومات الأصلية.",
//       "مشاهدة جداريات النجوم والآلهة المحفوظة بألوانها الزاهية.",
//       "زيارة مقابر الخيول الملكية التي دفنت بطقوس جنائزية خاصة.",
//       "التعرف على تاريخ ملوك كوش العظماء الذين حكموا وادي النيل.",
//     ],
//     activitiesEn: [
//       "Descend into King Taharqa's burial chamber to see original paintings.",
//       "View vibrant murals of stars and deities preserved in their original colors.",
//       "Visit the royal horse cemetery where horses were buried with special rituals.",
//       "Learn the history of the great Kushite kings who ruled the Nile Valley.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Soleb2.jpg/500px-Soleb2.jpg',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/aa/6a/c8/two-well-preserved-columns.jpg?w=1600&h=-1&s=1',
//       'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/18/0e/2b/photo4jpg.jpg?w=1100&h=-1&s=1',
//     ],
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'ثقافي',
//     travelTypeEn: 'Cultural',
//     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/28/Soleb1.jpg',
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/4d06a9509_Day7-TempleofSesibi_onthewestbankoftheSudaneseNileacrossfromDelgo720P_HD.mp4',
//     title: 'معبد سوليب',
//     titleEn: 'Soleb Temple',
//     discription:
//         'يعد معبد سوليب تحفة معمارية بناها الفرعون أمنحتب الثالث، ويتميز بأعمدته الضخمة التي تماثل معبد الأقصر في الجمال والدقة.',
//     descriptionEn:
//         'Soleb Temple is an architectural masterpiece built by Pharaoh Amenhotep III, featuring massive columns that rival the Temple of Luxor in beauty and precision.',
//     id: 'A9',
//     budget: 14000,
//     activities: [
//       "تأمل الأعمدة الجرانيتية ذات التيجان البردية المذهلة.",
//       "مشاهدة النقوش التي توثق أسماء الشعوب في عهد الدولة الحديثة.",
//       "استكشاف أطلال المعبد عند الغروب لالتقاط صور فنية رائعة.",
//       "التعرف على التاريخ الفرعوني في السودان والتبادل الحضاري.",
//     ],
//     activitiesEn: [
//       "Admire the granite columns with stunning papyrus capitals.",
//       "View inscriptions documenting various nations during the New Kingdom era.",
//       "Explore temple ruins at sunset for magnificent artistic photography.",
//       "Learn about Pharaonic history in Sudan and cultural exchanges.",
//     ],
//     location: LatLng(12.950668171688344, 24.27000035905273),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://lh3.googleusercontent.com/gps-cs-s/APNQkAHrLEuR9oYSEQNrsrNtI-rcsyXk6ut-QiDJ6JlUOcyuPNcxrg7dERxtERJtwJVVwoOJjFp8utqnCYCoAKQuQKH98M85y6gX2NY0vHMnjoTE3kxZYhF-Fx-zdZx1QEwhG-1AFeHEUA=s1360-w1360-h1020-rw',
//       'https://lh3.googleusercontent.com/gps-cs-s/APNQkAFoq6BjZ_RmhF4UrBhscKDFbsTSKkdGmKN_ghsoiaMtdEyUeVFsyawq1nBa1WMur89YeSyc6PNnZAqQKAxUu8gVgTzw1Rbz9zK8d2z5iz34ZYbnmxXTEKEMfCmpcSM0sYNx5a2u=s1360-w1360-h1020-rw',
//       'https://lh3.googleusercontent.com/gps-cs-s/APNQkAFRqOt4DLOnDhOp5WOhd_EsVPpBbxYp0AxR5-h2A2jH-2Y_fKCe602idVQSdU1cXWbg9VJehh_WOIi0v6JE1az8NGw9v3-85ykC-GSzE21dqXb0VUbms5mJSWQsDZr5RGZC4yhq=s1360-w1360-h1020-rw',
//     ],
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     imageUrl:
//         "https://www.image2url.com/r2/default/images/1777116787333-9726bfa8-715b-4474-80f5-be171da77550.jpg",
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/a6f04f356___720P_HD.mp4',
//     title: 'غابة السنط',
//     titleEn: 'Sunut Forest',
//     discription:
//         'تعتبر غابة السنط محمية طبيعية فريدة في قلب الخرطوم، وهي ملتقى لمئات الأنواع من الطيور المهاجرة والمحلية.',
//     descriptionEn:
//         'Sunut Forest is a unique natural reserve in the heart of Khartoum, acting as a meeting point for hundreds of migratory and local bird species.',
//     id: 'A10',
//     budget: 9000,
//     activities: [
//       "مراقبة الطيور النادرة والمهاجرة وسط الأشجار الكثيفة.",
//       "الاستمتاع بالمشي في المسارات الطبيعية الهادئة داخل الغابة.",
//       "التقاط صور احترافية للحياة الفطرية عند ضفاف النيل الأبيض.",
//       "الاسترخاء في أجواء طبيعية بكر بعيداً عن صخب المدينة.",
//     ],
//     activitiesEn: [
//       "Observe rare and migratory birds amidst dense acacia trees.",
//       "Enjoy walking through serene natural paths within the forest.",
//       "Capture professional wildlife photos along the White Nile banks.",
//       "Relax in a pristine natural environment away from city noise.",
//     ],
//     location: LatLng(15.594474635569217, 32.50624213068769),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://lh3.googleusercontent.com/gps-cs-s/APNQkAFIo6PhrYfdg929iBXRZ1hJgygO4BfW-okEXRXV6p1Prx84DCTvjT4BFh1wLASKQnCs0PO0AxPZPZXYyypGee5E8wDi-dZzJBdI-zfmu785KKMPKNGh89PpCzyTFayNiyD7wyDF=s1360-w1360-h1020-rw',
//       'https://lh3.googleusercontent.com/gps-cs-s/APNQkAEZdtoQG4bqC7QopdY5jn6uVEybH5HxN9iMAucGaiELSAt44J5zWanCpQLWYl8ncuxik4TPn0mwjKBVmldg7l-34kKFhwEr7Z5iheWBj1_SAGox4Zd5fSpuOXqKEbvTvb2gnck=s1360-w1360-h1020-rw',
//       'https://lh3.googleusercontent.com/gps-cs-s/APNQkAHaZltvTNcT3HPKKhvDsfU0lyMGZmSW-mI9NnbRD4ZF8_WMnpi0IFZQeAKSjanZ4kHAfZdF5Uug9xGx81A9A0rH0YR3ktDscXWYRbBD18kVObqCWU0ZGZalFi9c4RZPJqyurpFoYQ=s1360-w1360-h1020-rw',
//     ],
//     categories: 'c3',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     travelType: 'رحلة بحرية',
//     travelTypeEn: 'Sea trip',
//     imageUrl:
//         "https://www.image2url.com/r2/default/images/1777116659093-49e55559-479c-4a10-b843-c9334af113f9.jpg",
//     youtubeUrl: 'youtubeUrl',
//     title: 'خزان جبل أولياء',
//     titleEn: 'Jebel Aulia Dam',
//     discription:
//         'يعد خزان جبل أولياء من أقدم السدود في السودان، ويشتهر ببحيرته الواسعة التي تعتبر مقصداً للصيد والتنزه العائلي.',
//     descriptionEn:
//         'Jebel Aulia Dam is one of the oldest dams in Sudan, famous for its vast reservoir which is a popular destination for fishing and family outings.',
//     id: 'A12',
//     budget: 11000,
//     activities: [
//       "القيام برحلات صيد ممتعة في بحيرة الخزان الشاسعة.",
//       "الاستمتاع بجولات القوارب وقت الغروب فوق مياه النيل الأبيض.",
//       "مشاهدة أسراب الطيور التي تستوطن المنطقة المحيطة بالخزان.",
//       "تناول الأسماك الطازجة في المطاعم الشعبية المطلة على النهر.",
//     ],
//     activitiesEn: [
//       "Go on enjoyable fishing trips in the vast dam reservoir.",
//       "Enjoy sunset boat tours on the waters of the White Nile.",
//       "Watch flocks of birds that inhabit the area surrounding the dam.",
//       "Dine on fresh fish at local restaurants overlooking the river.",
//     ],
//     location: LatLng(15.594474635569217, 32.50624213068769),
//   ),

//   TravelsConstructor(
//     images: [
//       'https://www.image2url.com/r2/default/images/1777118288691-5c29dee7-7a04-446b-980f-5e2de07480da.jpg',
//       'https://www.image2url.com/r2/default/images/1777119550080-bcb9dc80-48b1-45ff-bebe-f71d8ff3bd96.jpg',
//       'https://www.image2url.com/r2/default/images/1777119606207-d17821e9-64ef-4927-b1fa-bb85e88bb59a.jpg',
//       'https://www.image2url.com/r2/default/images/1777119713211-6a544712-886b-4b17-b7fc-b53c8ca2568d.jpg',
//     ],
//     categories: 'c3',
//     cityName: 'الفاشر',
//     cityNameEn: 'El Fasher',
//     travelType: 'تاريخي',
//     travelTypeEn: 'Historical',
//     imageUrl:
//         "https://www.image2url.com/r2/default/images/1777117885900-c372338b-bc14-460d-a3c8-d1d87e0a01be.jpg",
//     youtubeUrl:
//         'https://base44.app/api/apps/69f50b5def8a67c5938ff497/files/mp/public/69f50b5def8a67c5938ff497/c6ebd98fd__720P_HD.mp4',
//     title: 'قصر السلطان علي دينار',
//     titleEn: 'Sultan Ali Dinar Palace',
//     discription:
//         'يعد قصر السلطان علي دينار في الفاشر تحفة معمارية شاهدة على تاريخ سلطنة دارفور، ويضم مقتنيات أثرية ومخطوطات نادرة.',
//     descriptionEn:
//         'The Sultan Ali Dinar Palace in El Fasher is an architectural masterpiece witnessing the history of the Darfur Sultanate, housing rare artifacts and manuscripts.',
//     id: 'A11',
//     budget: 10000,
//     activities: [
//       "استكشاف العمارة الفريدة للقصر الذي شيد عام 1912م.",
//       "رؤية مقتنيات السلطان علي دينار من سيوف وملابس ملكية.",
//       "التعرف على تاريخ سلطنة دارفور والخدمات الجليلة التي قدمتها للحجيج.",
//       "مشاهدة المخطوطات والعملات التاريخية النادرة في متحف القصر.",
//     ],
//     activitiesEn: [
//       "Explore the unique architecture of the palace built in 1912.",
//       "See Sultan Ali Dinar's personal belongings, including swords and royal attire.",
//       "Learn about the history of the Darfur Sultanate and its services to pilgrims.",
//       "يضم المتحف مقتنيات تاريخية تعكس مراحل مختلفة من تاريخ السودان، مثل السيوف الفضية والبنادق والعملات الدارفورية والأواني المذهّبة والمخطوطات الإسلامية وملابس السلطان وعرشه.",
//       "أنشأ السلطان علي دينار مصنعاً لصناعة كسوة الكعبة وكان يرسلها إلى مكة المكرمة بانتظام لمدة 20 عاماً.",
//     ],
//     location: LatLng(13.626621403578206, 25.349449637306737),
//   ),
// ];
// //
// // هنا تضيف المطاعم
// const restaurantData = [
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     categories: 'c1',
//     id: 'a1',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/65/32/be/a-view-of-the-ozone-from.jpg?w=1800&h=-1&s=1',
//     title: "مطعم أوزون",
//     titleEn: 'Ozone Restaurant',
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//     activities: [
//       "تذوق المعجنات والحلويات الطازجة في الهواء الطلق.",
//       "الاستمتاع بالجلوس في الحديقة الخارجية الخضراء والهادئة.",
//       "تجربة أنواع القهوة المختصة والوجبات الخفيفة الراقية.",
//       "لقاء الأصدقاء وقضاء وقت ممتع في قلب منطقة الخرطوم 2.",
//     ],
//     activitiesEn: [
//       "Taste fresh pastries and desserts in an outdoor setting.",
//       "Enjoy sitting in the lush and tranquil outdoor garden.",
//       "Experience specialty coffees and high-end light meals.",
//       "Meet friends and enjoy quality time in the heart of Khartoum 2.",
//     ],
//   ),

//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     categories: 'c1',
//     id: 'a2',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1f/9f/7e/c1/rwabi.jpg?w=1400&h=800&s=1',
//     title: 'مطعم أمواج',
//     titleEn: 'Amwaj Restaurant',
//     location: LatLng(15.801903492591297, 32.485041092334285), // جبل مرة
//     activities: [
//       "تذوق المشويات السودانية الشهيرة (الشية والكفتة).",
//       "تجربة مجموعة واسعة من الأطباق المحلية والشرقية المتنوعة.",
//       "الاستمتاع بالخدمة السريعة والمناسبة للعائلات والمجموعات.",
//       "تذوق العصائر الطبيعية الطازجة التي يشتهر بها المطعم.",
//     ],
//     activitiesEn: [
//       "Taste famous Sudanese grills (Shaya and Kofta).",
//       "Try a wide range of diverse local and Oriental dishes.",
//       "Enjoy quick service suitable for families and large groups.",
//       "Sample the fresh natural juices the restaurant is famous for.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     categories: 'c1',
//     id: 'a3',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/7f/77/12/rickshaw-1.jpg?w=1100&h=600&s=1',
//     title: 'مطعم ريكشو',
//     titleEn: 'Rickshaw Restaurant',
//     location: LatLng(15.606629487724613, 32.513541987202125), // جبل مرة
//     activities: [
//       "تجربة المأكولات الآسيوية الفاخرة في أعلى برج الفندق.",
//       "الاستمتاع بإطلالة بانورامية ساحرة على مدينة الخرطوم.",
//       "تذوق أطباق السوشي والنودلز المحضرة باحترافية.",
//       "قضاء أمسية عشاء راقية في أجواء هادئة ومميزة.",
//     ],
//     activitiesEn: [
//       "Experience fine Asian cuisine at the top of the hotel tower.",
//       "Enjoy a magical panoramic view of Khartoum city.",
//       "Taste professionally prepared sushi and noodle dishes.",
//       "Spend an elegant dinner evening in a quiet and unique atmosphere.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     categories: 'c1',
//     id: 'a4',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/AOGcYQRy7XCV6gMkeTfunkMpsxJG-Qz4MQqBevLrBEjGFgvi3UtC9oUz41UzszRo3pTg-r24_-E4U-Tv90p2CPFbdbxzunXktfW5xn6RsyPIoEjQL_dHkDnkS8eJUw_QkCF4Fhs5ICPYIQ=w750-h401-p-k-no',
//     title: 'مطعم الساحة',
//     titleEn: 'Al Saha Village',
//     location: LatLng(15.596235868876414, 32.53687756047289), // جبل مرة
//     activities: [
//       "تذوق المأكولات اللبنانية والشرقية الأصيلة في أجواء تراثية.",
//       "الاستمتاع بالتصميم المعماري اللبناني الفريد للمكان.",
//       "حضور الأمسيات الثقافية والموسيقية التي ينظمها المطعم.",
//       "تجربة الضيافة المميزة في أجواء تحاكي القرى اللبنانية.",
//     ],
//     activitiesEn: [
//       "Taste authentic Lebanese and Oriental cuisine in a heritage setting.",
//       "Enjoy the unique Lebanese architectural design of the place.",
//       "Attend cultural and musical evenings organized by the restaurant.",
//       "Experience distinguished hospitality in an atmosphere mimicking Lebanese villages.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     categories: 'c3',
//     id: 'a5',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/dc/d6/3d/photo0jpg.jpg?w=1400&h=-1&s=1',
//     title: 'مطعم باب اليمن',
//     titleEn: 'Bab-al-Yemen Restaurant',
//     location: LatLng(15.577819533741703, 32.54987147416333), // جبل مرة
//     activities: [
//       "تذوق المندي والمظبي اليمني الأصيل المطهو بعناية.",
//       "الاستمتاع بالجلسات العربية التقليدية المريحة للعائلات.",
//       "تجربة الشاي العدني والحلويات اليمنية المشهورة.",
//       "تناول وجبة غداء دسمة ومميزة في جو اجتماعي دافئ.",
//     ],
//     activitiesEn: [
//       "Taste authentic Yemeni Mandi and Madhbi cooked with care.",
//       "Enjoy comfortable traditional Arabic seating for families.",
//       "Experience Adeni tea and famous Yemeni desserts.",
//       "Have a hearty and special lunch in a warm social atmosphere.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     categories: 'c1',
//     id: 'a6',
//     imageUrl:
//         'https://b.zmtcdn.com/data/pictures/9/20052019/e3ffdbcf92779e748ebb497150b4c1f4.jpg',
//     title: 'مطعم برجر بوينت',
//     titleEn: 'Burger Point',
//     location: LatLng(15.582590852627499, 32.568068179026106), // جبل مرة
//     activities: [
//       "تجربة أنواع البرجر المبتكرة والمحضرة بمكونات طازجة.",
//       "تذوق الوجبات السريعة والمقبلات المقرمشة واللذيذة.",
//       "الاستمتاع بالأجواء العصرية والشبابية التي تميز المكان.",
//       "تجربة صوصات المطعم الخاصة التي تضفي طعماً مميزاً.",
//     ],
//     activitiesEn: [
//       "Experience innovative burger types prepared with fresh ingredients.",
//       "Taste delicious and crispy fast food and appetizers.",
//       "Enjoy the modern and youthful atmosphere that characterizes the place.",
//       "Try the restaurant's special sauces that add a unique flavor.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الدمازين',
//     cityNameEn: 'Ad-Damazin',
//     categories: 'c4',
//     id: 'a7',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs-s/AHVAweos5jKpH0-jZCsCo4a8cObWtLmCoKJ88y4yHNAfvcznkWPylE-WnNvFxV_ctGMfI39OEo84JZX_UBBn6t4QLGrw-HpQnnZVwCDJJd7lW8KPQwE5a1ObrBx7WGUJZlLnxAQzXLBs=w532-h240-k-no',
//     title: 'منتجع النيل للاسماك و المشويات',
//     titleEn: 'Nile Fish & Grills Resort',
//     location: LatLng(11.799975372682953, 34.38163321953908), // جبل مرة
//     activities: [
//       "تذوق أسماك النيل الأزرق الطازجة والمطهوة بعناية.",
//       "الاستمتاع بإطلالة مباشرة وخلابة على ضفاف النيل بالدمازين.",
//       "القيام بجولة في المنتزه التابع للمطعم بعد تناول الطعام.",
//       "تجربة المشويات السودانية التقليدية في الهواء الطلق.",
//     ],
//     activitiesEn: [
//       "Taste fresh Blue Nile fish cooked with care.",
//       "Enjoy a direct and breathtaking view of the Nile banks in Damazin.",
//       "Take a tour in the resort's park after your meal.",
//       "Experience traditional Sudanese grills in the open air.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الدمازين',
//     cityNameEn: 'Ad-Damazin',
//     categories: 'c4',
//     id: 'a8',
//     imageUrl:
//         'https://th.bing.com/th/id/OIP.TAEXQIXvCuS4RSGhk21LYAHaFP?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3',
//     title: 'كوارع بهجة',
//     titleEn: 'Bahja Kawara',
//     location: LatLng(11.804680829997586, 34.35749546111076), // جبل مرة
//     activities: [
//       "تذوق طبق الكوارع السوداني الشهير المحضر على الطريقة التقليدية.",
//       "تجربة الأطباق الشعبية الدسمة والمغذية التي يشتهر بها المكان.",
//       "التعرف على ثقافة المطاعم الشعبية وأجوائها الحميمية.",
//       "تناول وجبة فطور سودانية أصيلة مع سكان المدينة المحليين.",
//     ],
//     activitiesEn: [
//       "Taste the famous Sudanese 'Kawara' dish prepared traditionally.",
//       "Try hearty and nutritious popular dishes the place is known for.",
//       "Get to know the local restaurant culture and its intimate atmosphere.",
//       "Have an authentic Sudanese breakfast with the city's locals.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'كسلا',
//     cityNameEn: 'Kassala',
//     categories: 'c5',
//     id: 'a9',
//     imageUrl:
//         'https://tse4.mm.bing.net/th/id/OIP.e6RQMH95PHRdyB2i0D3EZgHaFj?rs=1&pid=ImgDetMain&o=7&rm=3',
//     title: 'واحة كسلا',
//     titleEn: 'Kassala Oasis',
//     location: LatLng(15.443740509481476, 36.380024990048426), // جبل مرة
//     activities: [
//       "الاستمتاع بالوجبات المحلية وسط بساتين كسلا الخضراء.",
//       "تذوق الأطباق المميزة لشرق السودان في أجواء مريحة.",
//       "شرب القهوة السودانية (الجبنة) في الهواء الطلق الطلق.",
//       "الاستمتاع بمناظر جبال التاكا القريبة من موقع المطعم.",
//     ],
//     activitiesEn: [
//       "Enjoy local meals amidst the green orchards of Kassala.",
//       "Taste the unique dishes of Eastern Sudan in a comfortable setting.",
//       "Sip Sudanese coffee (Jabana) in the open air.",
//       "Enjoy views of the Taka Mountains near the restaurant's location.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     categories: 'c5',
//     id: 'a10',
//     imageUrl:
//         'https://tse4.mm.bing.net/th/id/OIP.RpsYzyunK87Dv2cFx7DddQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
//     title: 'مطعم الراكوبة',
//     titleEn: 'Al Rakouba Restaurant',
//     location: LatLng(15.632781835225083, 32.493776350094585), // جبل مرة
//     activities: [
//       "تجربة الطعام السوداني التقليدي تحت ظل 'الراكوبة' التراثية.",
//       "تذوق أطباق القراصة والعصيدة والملوكية على الطريقة المنزلية.",
//       "الاستمتاع بالأجواء التراثية البسيطة والدافئة في المكان.",
//       "شرب الشاي والقهوة السودانية في ختام وجبة الغداء التقليدية.",
//     ],
//     activitiesEn: [
//       "Experience traditional Sudanese food under the heritage 'Rakouba'.",
//       "Taste home-style dishes like Gurasa, Assida, and Mulukhiya.",
//       "Enjoy the simple and warm heritage atmosphere of the place.",
//       "Drink Sudanese tea and coffee after a traditional lunch.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'سواكن',
//     cityNameEn: 'Suakin',
//     categories: 'c6',
//     id: 'a11',
//     imageUrl:
//         'https://th.bing.com/th/id/OIP.JL-9xq4SLIb1w7NeKLNUfAAAAA?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3',
//     title: 'مطعم القرموشي',
//     titleEn: 'Al-Garmoushi Restaurant',
//     location: LatLng(19.10885329192192, 37.33504292483498), // جبل مرة
//     activities: [
//       "تذوق المأكولات البحرية الطازجة والمستخرجة من البحر الأحمر.",
//       "تجربة سمك 'الناجل' المقلي والمشوي الذي يشتهر به المطعم.",
//       "الاستمتاع بنسمات البحر الأحمر وأجواء سواكن التاريخية.",
//       "تناول وجبة عشاء بحرية مميزة في هدوء الميناء القديم.",
//     ],
//     activitiesEn: [
//       "Taste fresh seafood straight from the Red Sea.",
//       "Experience the fried and grilled 'Najil' fish the restaurant is famous for.",
//       "Enjoy Red Sea breezes and the historic Suakin atmosphere.",
//       "Have a special seafood dinner in the tranquility of the old port.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'سواكن',
//     cityNameEn: 'Suakin',
//     categories: 'c6',
//     id: 'a12',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/d2/3d/e2/capti_r.jpg?w=1000&h=-1&s=1',
//     title: 'مطعم غنماية',
//     titleEn: 'Ghanamaya Restaurant',
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//     activities: [
//       "تذوق اللحوم المشوية على الفحم والمحضرة بوصفات سرية.",
//       "تجربة 'السلات' (لحم مطهو على الحجر) الشهير في شرق السودان.",
//       "الاستمتاع بالضيافة البجاوية الأصيلة وأجواء الكرم المحلي.",
//       "شرب القهوة السودانية المعطرة بالزنجبيل (الجبنة).",
//     ],
//     activitiesEn: [
//       "Taste charcoal-grilled meats prepared with secret recipes.",
//       "Experience 'Sallat' (stone-cooked meat) famous in Eastern Sudan.",
//       "Enjoy authentic Beja hospitality and local generosity.",
//       "Drink ginger-scented Sudanese coffee (Jabana).",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'كريمة',
//     cityNameEn: 'Karima',
//     categories: 'c7',
//     id: 'a13',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/d2/3d/e2/capti_r.jpg?w=1000&h=-1&s=1',
//     title: 'مطعم كريمة النوبي',
//     titleEn: 'Karima Nubian Restaurant',
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//     activities: [
//       "تذوق الوجبات النوبية التقليدية الغنية بالنكهات المحلية.",
//       "الاستمتاع بإطلالة مميزة على جبل البركل أثناء تناول الطعام.",
//       "تجربة التمور الفاخرة والمأكولات التي تشتهر بها منطقة الشمال.",
//       "التعرف على كرم ضيافة أهل شمال السودان وتقاليدهم في الطعام.",
//     ],
//     activitiesEn: [
//       "Taste traditional Nubian meals rich with local flavors.",
//       "Enjoy a special view of Jebel Barkal while dining.",
//       "Try luxury dates and foods the Northern region is famous for.",
//       "Get to know the hospitality and food traditions of Northern Sudan.",
//     ],
//   ),
//   ResturntConstructor(
//     travelType: 'مطعم',
//     travelTypeEn: 'restaurant',
//     budget: 110,
//     cityName: 'الخرطوم',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOtFE7IAk94QZHBS-P6IqVY7svnZmAHx-OKs5JLDnTOCPxLsgiERvM0SJkkoUVDSaafz449vyboTwxjX84tCwdgrz7rhYGRTbMndQObA_WBtw-4QQGyFtG8HCgmYs2tZr3J1P9RigQ=w750-h813-p-k-no',
//     title: 'كافيه النيل',
//     id: 'a14',
//     categories: 'c1',
//     activities: [
//       "الاستمتاع بالقهوة والمشروبات الساخنة بجودة عالية.",
//       "الجلوس في أجواء هادئة ومناسبة للعمل أو الدراسة.",
//       "تجربة الحلويات والمعجنات الطازجة.",
//       "الاسترخاء بجوار النيل والاستمتاع بالمنظر.",
//     ],
//     location: LatLng(15.606399566492074, 32.588320900381),
//     titleEn: 'The Nile Cafe',
//     activitiesEn: [
//       "Enjoy high‑quality coffee and hot drinks.",
//       "Relax or work in a calm and cozy atmosphere.",
//       "Try freshly made pastries and desserts.",
//       "Sit by the Nile and enjoy the beautiful view.",
//     ],
//     cityNameEn: 'Khartoum',
//   ),
// ];

// const hotelsData = [
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/99/b5/3d/chk-facade4.jpg?w=1100&h=600&s=1',
//     title: 'فندق كورنثيا',
//     titleEn: 'Corinthia Hotel',
//     id: 'd1',
//     categories: 'c1',
//     location: LatLng(15.60695139104495, 32.51335919114774), // جبل مرة
//     activities: [
//       "الاستمتاع بالسباحة في المسبح الفاخر المطل على النيل.",
//       "تناول العشاء في المطعم الدوار مع رؤية بانورامية للخرطوم.",
//       "الاسترخاء في النادي الصحي (السبا) والحصول على خدمات عالمية.",
//       "الاستمتاع بمنظر ملتقى النيلين من الغرف والأجنحة الفاخرة.",
//     ],
//     activitiesEn: [
//       "Enjoy swimming in the luxurious pool overlooking the Nile.",
//       "Dine at the revolving restaurant with a panoramic view of Khartoum.",
//       "Relax in the spa and enjoy world-class services.",
//       "Admire the view of the Nile confluence from luxury rooms and suites.",
//     ],
//   ),
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/49/3b/78/al-salam-hotel-khartoum.jpg?w=1400&h=800&s=1',
//     title: 'فندق السلام',
//     titleEn: 'Al Salam Hotel',
//     id: 'd2',
//     categories: 'c1',
//     location: LatLng(15.557049721595897, 32.5549145277984), // جبل مرة
//     activities: [
//       "حضور الفعاليات الكبرى في القاعات المجهزة بأحدث التقنيات.",
//       "الاستمتاع ببوفيه الإفطار المتنوع الذي يجمع بين المحلي والعالمي.",
//       "الاسترخاء بجانب المسبح الخارجي وسط الحدائق المنسقة.",
//       "تجربة النادي الرياضي المتكامل والمرافق الترفيهية بالفندق.",
//     ],
//     activitiesEn: [
//       "Attend major events in halls equipped with the latest technology.",
//       "Enjoy a diverse breakfast buffet blending local and global flavors.",
//       "Relax by the outdoor pool amidst landscaped gardens.",
//       "Experience the fully equipped gym and recreational facilities.",
//     ],
//   ),
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     cityName: 'مروي',
//     cityNameEn: 'Merowe',
//     imageUrl:
//         'https://static.wixstatic.com/media/00daf2_66683a9df7bb4b288980912fa7e17bed~mv2.jpeg/v1/fill/w_980,h_568,q_90/00daf2_66683a9df7bb4b288980912fa7e17bed~mv2.jpeg',
//     title: 'مخيم مروي السياحي',
//     titleEn: 'Meroe Tented Camp',
//     id: 'd3',
//     categories: 'c2',
//     location: LatLng(16.94757579602292, 33.76762261177879), // جبل مرة
//     activities: [
//       "التخييم الفاخر في خيام مجهزة بالكامل أمام أهرامات مروي.",
//       "مشاهدة النجوم في سماء الصحراء الصافية بعيداً عن أضواء المدن.",
//       "الاستمتاع بوجبات العشاء التقليدية حول النار في الهواء الطلق.",
//       "القيام بجولات مشي صباحية لاستكشاف المواقع الأثرية القريبة.",
//     ],
//     activitiesEn: [
//       "Luxury camping in fully equipped tents facing the Meroe pyramids.",
//       "Watch stars in the clear desert sky away from city lights.",
//       "Enjoy traditional dinners around a campfire in the open air.",
//       "Take morning walking tours to explore nearby archaeological sites.",
//     ],
//   ),
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     imageUrl:
//         'https://scontent.fmed1-1.fna.fbcdn.net/v/t39.30808-6/481233964_122206729028163840_4386230853526884772_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=2a1932&_nc_ohc=0Nog2yjdINUQ7kNvwHb344V&_nc_oc=Adnqu19F4AXgEegQK61C6EZI0HmxQkM0NED4Iaa0FzKh-oTAbAkNWzMZok637jUr_JPvSZaTgHEGh-jLqyDAeYkU&_nc_zt=23&_nc_ht=scontent.fmed1-1.fna&_nc_gid=KWCpf0qUOjl9CmKNqzK2EA&oh=00_AfvwtOFObAJ58McBEw76-9xb5dXUxkIqthIOuehgWWsg6w&oe=69A68810',
//     title: 'فندق مارينا',
//     titleEn: 'Marina Hotel',
//     id: 'd4',
//     categories: 'c3',
//     location: LatLng(19.61339044848968, 37.224484065057446), // جبل مرة
//     activities: [
//       "الاستمتاع بإطلالة مباشرة وهادئة على ميناء بورتسودان الرئيسي.",
//       "تنسيق وحجز رحلات غوص في أعماق البحر الأحمر عبر الفندق.",
//       "الاسترخاء في غرف مريحة ومطلة على الساحل الشرقي للسودان.",
//       "تناول وجبات بحرية طازجة في مطعم الفندق المطل على البحر.",
//     ],
//     activitiesEn: [
//       "Enjoy a direct and quiet view of Port Sudan's main harbor.",
//       "Coordinate and book diving trips in the Red Sea via the hotel.",
//       "Relax in comfortable rooms overlooking Sudan's eastern coast.",
//       "Dine on fresh seafood in the hotel's seaside restaurant.",
//     ],
//   ),
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/28/5d/d4/swimming-pool-at-coral.jpg?w=1400&h=-1&s=1',
//     title: 'فندق كورال بورتسودان',
//     titleEn: 'Coral Port Sudan Hotel',
//     id: 'd5',
//     categories: 'c3',
//     location: LatLng(19.61292002925886, 37.22437085819247), // جبل مرة
//     activities: [
//       "السباحة في مسبح الفندق الكبير المفتوح في الهواء الطلق.",
//       "تنظيم جولات سياحية داخل مدينة بورتسودان ومعالمها التاريخية.",
//       "الاستمتاع بالخدمات الفندقية الراقية والأجواء الهادئة والمريحة.",
//       "شرب القهوة السودانية في تراس الفندق المطل على الميناء.",
//     ],
//     activitiesEn: [
//       "Swim in the hotel's large open-air swimming pool.",
//       "Organize tourist tours within Port Sudan and its historic landmarks.",
//       "Enjoy high-end hotel services and a quiet, comfortable atmosphere.",
//       "Drink Sudanese coffee on the hotel terrace overlooking the port.",
//     ],
//   ),
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/2f/43/99/two-types-of-accommodation.jpg?w=2000&h=-1&s=1',
//     title: 'منتجع البحر الأحمر',
//     titleEn: 'Red Sea Resort',
//     id: 'd6',
//     categories: 'c3',
//     location: LatLng(19.895727014662327, 37.23425035913879), // جبل مرة
//     activities: [
//       "الإقامة في أكواخ شاطئية هادئة تعيد إليك حيوية ونشاط الطبيعة.",
//       "السباحة في شاطئ خاص نظيف بعيداً عن زحام المدينة وصخبها.",
//       "ممارسة رياضة الغطس السطحي لمشاهدة المرجان القريب من الساحل.",
//       "الاستمتاع بحفلات الشواء الليلية على الرمال تحت ضوء القمر.",
//     ],
//     activitiesEn: [
//       "Stay in quiet beach huts that restore natural vitality.",
//       "Swim at a private clean beach away from city crowds.",
//       "Practice snorkeling to see coral near the coast.",
//       "Enjoy nightly BBQ parties on the sand under the moonlight.",
//     ],
//   ),
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     cityName: 'الدمازين',
//     cityNameEn: 'Ad-Damazin',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs-s/AHVAwepobFzO26sR1QqeSAD82AuGsCN9vR7wDAZXi_W7C_Uj8i1uh7qEsL6AX9m-Z0CBn5_47bAEdC0MCD_2_7A9JlYdH0EIv_RxnzMZxyS9xiUrHP0ffYzboz9iHb_oTp8vX19usvc=w408-h544-k-no',
//     title: 'فندق اتحاد الدمازين',
//     titleEn: 'Damazin Union Hotel',
//     id: 'd7',
//     categories: 'c4',
//     location: LatLng(11.802948351997768, 34.35460517798461), // جبل مرة
//     activities: [
//       "الإقامة المريحة في قلب مدينة الدمازين النابضة بالحياة.",
//       "الاستراحة والاستجمام بعد جولات طويلة في خزان الروصيرص القريب.",
//       "التعرف على معالم المدينة الرئيسية التي تقع على مسافة قصيرة.",
//       "الاستمتاع بالأجواء الهادئة والبساطة السودانية في التعامل والخدمة.",
//     ],
//     activitiesEn: [
//       "Enjoy a comfortable stay in the vibrant heart of Damazin.",
//       "Rest and relax after long tours at the nearby Roseires Dam.",
//       "Get to know the city's main landmarks located a short distance away.",
//       "Enjoy the quiet atmosphere and Sudanese simplicity in service.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'الدمازين',
//     cityNameEn: 'Ad-Damazin',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://www.dabangasudan.org/wp-content/uploads/2023/09/16xxxx-NYALA-A-panoramic-view-of-Nyala-South-Darfur-the-second-largest-city-in-Sudan-after-the-capital-Khartoum-File-photo-Hamid-Abdulsalam-UNAMID-2048x1146.jpeg',
//     title: 'فندق الصديق',
//     titleEn: 'Al Siddiq Hotel',
//     id: 'd8',
//     categories: 'c4',
//     location: LatLng(11.7980723692574, 34.348164864295875), // جبل مرة
//     activities: [
//       "الإقامة في غرف فندقية مريحة وبأسعار مناسبة لجميع الزوار.",
//       "تناول الوجبات المحلية الشهية في مطعم الفندق المخصص للنزلاء.",
//       "الاستفادة من موقع الفندق المركزي للوصول السهل لأسواق الدمازين.",
//       "التعرف على المسافرين والزوار في بهو الفندق الودي والهادئ.",
//     ],
//     activitiesEn: [
//       "Stay in comfortable hotel rooms at suitable prices for all visitors.",
//       "Dine on delicious local meals in the guests-only restaurant.",
//       "Benefit from the central location for easy access to Damazin markets.",
//       "Meet other travelers and visitors in the friendly hotel lobby.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'كسلا',
//     cityNameEn: 'Kassala',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/49/3b/78/al-salam-hotel-khartoum.jpg?w=1400&h=800&s=1',
//     title: 'فندق كسلا',
//     titleEn: 'Kassala Hotel',
//     id: 'd9',
//     categories: 'c5',
//     location: LatLng(15.455631413604477, 36.39321471905915), // جبل مرة
//     activities: [
//       "الاستيقاظ صباحاً على منظر جبال التاكا المهيب من نافذة غرفتك.",
//       "الاستمتاع بالحدائق الخضراء المحيطة بالفندق والتي تشتهر بها كسلا.",
//       "تنظيم رحلات للسوق الشعبي بكسلا لشراء المشغولات اليدوية.",
//       "تذوق الفواكه الطازجة (الموالح) من مزارع المدينة المجاورة للفندق.",
//     ],
//     activitiesEn: [
//       "Wake up to the majestic view of the Taka Mountains from your window.",
//       "Enjoy the green gardens surrounding the hotel, famous in Kassala.",
//       "Organize trips to the popular Kassala market for handicrafts.",
//       "Taste fresh citrus fruits from neighboring farms near the hotel.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'كسلا',
//     cityNameEn: 'Kassala',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://th.bing.com/th/id/OIP.ZrqfIxBFhl8aINHZvTLZIgHaFj?w=245&h=184&c=7&r=0&o=7&cb=defcache2&dpr=1.5&pid=1.7&rm=3&defcache=1',
//     title: 'فندق سراي تمنتلي',
//     titleEn: 'Saray Timintay Hotel',
//     id: 'd10',
//     categories: 'c5',
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//     activities: [
//       "الإقامة في مبنى ذو طابع معماري فريد يعكس هوية المنطقة.",
//       "الاستمتاع بالخصوصية والهدوء في واحد من أعرق فنادق كسلا.",
//       "تجربة الضيافة السودانية الأصيلة والخدمة المتميزة للنزلاء.",
//       "زيارة المعالم التاريخية والدينية القريبة من موقع الفندق المميز.",
//     ],
//     activitiesEn: [
//       "Stay in a building with a unique architecture reflecting regional identity.",
//       "Enjoy privacy and tranquility in one of Kassala's oldest hotels.",
//       "Experience authentic Sudanese hospitality and excellent service.",
//       "Visit historical and religious landmarks near the hotel's prime location.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'سواكن',
//     cityNameEn: 'Suakin',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/49/3b/78/al-salam-hotel-khartoum.jpg?w=1400&h=800&s=1',
//     title: 'استراحة جامعة الخرطوم',
//     titleEn: 'UofK Rest House',
//     id: 'd11',
//     categories: 'c6',
//     location: LatLng(19.10565642555938, 37.340571706426026), // جبل مرة
//     activities: [
//       "الإقامة في استراحة تاريخية بسواكن تابعة لجامعة الخرطوم.",
//       "استكشاف آثار المدينة المرجانية القديمة التي تقع على مسافة قريبة.",
//       "الاستمتاع بمناخ البحر الأحمر المنعش والهدوء الذي يسود المكان.",
//       "التعرف على تاريخ المنطقة البحري ودور سواكن كمركز تجاري قديم.",
//     ],
//     activitiesEn: [
//       "Stay in a historic Suakin rest house belonging to the University of Khartoum.",
//       "Explore the ruins of the old coral city located nearby.",
//       "Enjoy the refreshing Red Sea climate and the prevailing tranquility.",
//       "Learn about the area's maritime history and Suakin's role as a trading hub.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'سواكن',
//     cityNameEn: 'Suakin',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/72/93/94/adel-hotel.jpg?w=1100&h=600&s=1',
//     title: 'فندق زهرة الشام السياحي',
//     titleEn: 'Zahrat Al-Sham Tourist Hotel',
//     id: 'd12',
//     categories: 'c6',
//     location: LatLng(19.11219121025925, 37.30871194331923), // جبل مرة
//     activities: [
//       "الإقامة في موقع استراتيجي قريب من ميناء سواكن الجديد.",
//       "الاستمتاع بخدمات غرف مريحة وهادئة تضمن لك راحة تامة.",
//       "تجربة العيش في أجواء مدينة سواكن والتعرف على أهلها الكرام.",
//       "الاستراحة في الفندق قبل الانطلاق في رحلات البحر الأحمر المختلفة.",
//     ],
//     activitiesEn: [
//       "Stay in a strategic location near the new Suakin port.",
//       "Enjoy quiet and comfortable room services ensuring total relaxation.",
//       "Experience living in the Suakin atmosphere and meet its honorable people.",
//       "Rest at the hotel before embarking on various Red Sea trips.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'كريمة',
//     cityNameEn: 'Karima',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://www.weseektravel.com/wp-content/uploads/2022/05/nubian-village-egypt-12-960x640.jpg',
//     title: 'البيت النوبي',
//     titleEn: 'Nubian House',
//     id: 'd13',
//     categories: 'c7',
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//     activities: [
//       "تجربة العيش في بيت نوبي أصيل مبني ومزين بالطرق التقليدية.",
//       "الاستمتاع بالرسومات النوبية الملونة التي تزين جدران الغرف والبهو.",
//       "تناول طعام منزلي نوبي أصيل محضر بمكونات محلية طازجة.",
//       "زيارة جبل البركل التاريخي الذي يقع على مسافة مشي قصيرة من البيت.",
//     ],
//     activitiesEn: [
//       "Experience living in an authentic Nubian house built traditionally.",
//       "Enjoy colorful Nubian paintings decorating the room walls and lobby.",
//       "Dine on authentic home-cooked Nubian food with fresh ingredients.",
//       "Visit historic Jebel Barkal located within walking distance.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'كريمة',
//     cityNameEn: 'Karima',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://tse1.mm.bing.net/th/id/OIP.9qrqG1agHv9uNO0JTBmz3AHaEk?rs=1&pid=ImgDetMain&o=7&rm=3',
//     title: 'فندق دميرة',
//     titleEn: 'Damira Hotel',
//     id: 'd14',
//     categories: 'c7',
//     location: LatLng(18.558936588215378, 31.843084508615373), // جبل مرة
//     activities: [
//       "الاستمتاع بإطلالة هادئة على نهر النيل في منطقة الشمال العريقة.",
//       "الاسترخاء في غرف حديثة ومريحة تلبي احتياجات السياح والباحثين.",
//       "ترتيب زيارات لأهرامات الكرو ونوري ومعالم مدينة كريمة التاريخية.",
//       "تذوق أفضل أنواع التمور السودانية التي تشتهر بها هذه المنطقة.",
//     ],
//     activitiesEn: [
//       "Enjoy a quiet view of the Nile in the ancient Northern region.",
//       "Relax in modern, comfortable rooms meeting all tourist needs.",
//       "Arrange visits to the El-Kurru and Nuri pyramids and Karima landmarks.",
//       "Taste the finest Sudanese dates for which this region is famous.",
//     ],
//   ),
//   HotelConstructor(
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 300,
//     cityName: 'نيالا',
//     cityNameEn: 'Nyala',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/partner/bookingcom/photo-o/32/6c/34/12/sama-stars-guest-hous.jpg?w=1400&h=800&s=1',
//     title: 'بيت ضيافة سما ستارز',
//     titleEn: 'Sama Stars Guest House',
//     id: 'd15',
//     categories: 'c8',
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//     activities: [
//       "الإقامة في بيئة آمنة ومريحة في مدينة نيالا عاصمة جنوب دارفور.",
//       "التعرف على ثقافة وتراث دارفور العريق من خلال الضيافة والتعامل.",
//       "الاستراحة في بيت الضيافة قبل الانطلاق لرحلات استكشاف جبل مرة.",
//       "الاستمتاع بوجبات محلية طازجة تعكس هوية المطبخ في غرب السودان.",
//     ],
//     activitiesEn: [
//       "Stay in a safe and comfortable environment in Nyala city.",
//       "Learn about Darfur's rich culture and heritage through hospitality.",
//       "Rest at the guest house before starting Jebel Marra exploration trips.",
//       "Enjoy fresh local meals reflecting the Western Sudan kitchen identity.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'الفاشر',
//     cityNameEn: 'El Fasher',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://scontent.fruh4-5.fna.fbcdn.net/v/t39.30808-6/359381104_841718624277284_3466923021565956093_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=1d70fc&_nc_ohc=BJgeUhvltp0Q7kNvwE1TawN&_nc_oc=AdnhXy_RDjm8yb4kIjsMa7ZzOH263MxBQfAnuefBBkfc-irrdYJKN0qBy428QuDOo4kKQ1JNzmkmNHkbQRnJQPqm&_nc_zt=23&_nc_ht=scontent.fruh4-5.fna&_nc_gid=mb8b0ZJV0Y9l0742CvdM5Q&oh=00_AftB9hAT2bODy3M3_AUMQ01iywp3N-cJ6GAS9d1IuOaSZw&oe=69A69852',
//     title: 'فندق درة الفاشر',
//     titleEn: 'Durrat El-Fasher Hotel',
//     id: 'd16',
//     categories: 'c8',
//     location: LatLng(13.634735385128304, 25.337258583277574), // جبل مرة
//     activities: [
//       "الإقامة في واحد من أرقى وأحدث الفنادق في مدينة الفاشر العريقة.",
//       "زيارة قصر السلطان علي دينار والمتحف القريب من موقع الفندق.",
//       "الاستمتاع بجلسات الشاي والقهوة السودانية في بهو الفندق الواسع.",
//       "تنسيق وتنظيم رحلات استكشافية للمناطق الطبيعية المحيطة بمدينة الفاشر.",
//     ],
//     activitiesEn: [
//       "Stay in one of the finest and newest hotels in ancient El-Fasher.",
//       "Visit the Sultan Ali Dinar Palace and the museum near the hotel.",
//       "Enjoy Sudanese tea and coffee sessions in the spacious hotel lobby.",
//       "Coordinate exploration trips to the natural areas surrounding the city.",
//     ],
//   ),
//   HotelConstructor(
//     cityName: 'الفاشر',
//     cityNameEn: 'El Fasher',
//     travelType: 'فندق',
//     travelTypeEn: 'hotel',
//     budget: 400,
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/e9/2f/af/hotel.jpg?w=1400&h=800&s=1',
//     title: 'القراند هوليداي',
//     titleEn: 'Grand Holiday',
//     id: 'd17',
//     categories: 'c1',
//     location: LatLng(15.607904216512715, 32.51612263700212), // جبل مرة
//     activities: [
//       "الإقامة في فندق حديث يوفر غرفاً مريحة وخدمات عالية الجودة في قلب مدينة الفاشر.",
//       "الاستمتاع بوجبات محلية وعالمية داخل مطعم الفندق المجهّز بأجواء هادئة.",
//       "الاسترخاء في صالة الفندق الواسعة مع الشاي والقهوة السودانية.",
//       "تنسيق زيارات لأبرز معالم الفاشر مثل قصر السلطان علي دينار والمتحف القومي.",
//     ],

//     activitiesEn: [
//       "Stay in a modern hotel offering comfortable rooms and high‑quality services in the heart of El Fasher.",
//       "Enjoy local and international meals at the hotel's calm and well‑designed restaurant.",
//       "Relax in the spacious hotel lounge with authentic Sudanese tea and coffee.",
//       "Arrange visits to major landmarks such as Sultan Ali Dinar Palace and the National Museum.",
//     ],
//   ),
// ];
// // Specific attractions and trips within regions
// const Trips_data = [
//   TripsConstructor(
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     budget: 5000,
//     id: 'm1',
//     categories: 'c1',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     location: LatLng(15.606065751365483, 32.50839070564191), // المتحف القومي
//     title: 'المتحف القومي السوداني',
//     titleEn: 'National Museum of Sudan',
//     imageUrl:
//         'https://tse3.mm.bing.net/th/id/OIP.PxVD6vsGmkJMe7OKuESxHAHaFj?rs=1&pid=ImgDetMain&o=7&rm=3',
//     activities: [
//       "رؤية معبد بوهين المنقذ من مياه بحيرة ناصر.",
//       "مشاهدة تماثيل ملوك كوش السود الضخمة من الجرانيت.",
//       "استكشاف المقتنيات المسيحية والمروية النادرة في القاعات.",
//       "التجول في الحديقة الخارجية التي تضم قطعاً أثرية كبيرة.",
//     ],
//     activitiesEn: [
//       "See the Temple of Buhen saved from Lake Nasser waters.",
//       "View the massive granite statues of Kushite Pharaohs.",
//       "Explore rare Christian and Meroitic artifacts in the halls.",
//       "Wander through the outdoor garden featuring large archaeological pieces.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 2000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm2',
//     categories: 'c1',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     location: LatLng(15.5950, 32.5343), // السوق العربي
//     title: 'السوق العربي',
//     titleEn: 'Souq Al Arabi',
//     imageUrl:
//         'https://i.pinimg.com/736x/e1/db/ff/e1dbff2ca39120359aaac1e3b094cc50.jpg',
//     activities: [
//       "التسوق لشراء الصناعات الجلدية اليدوية مثل الأحذية والحقائب.",
//       "شراء أجود أنواع البخور والعطور السودانية التقليدية.",
//       "شرب القهوة (الجبنة) في المقاهي الشعبية وسط صخب المدينة.",
//       "رؤية حركة المدينة التجارية النابضة في قلب العاصمة الخرطوم.",
//     ],
//     activitiesEn: [
//       "Shop for handmade leather goods like shoes and bags.",
//       "Buy the finest types of traditional Sudanese incense and perfumes.",
//       "Drink coffee (Jabana) in popular cafes amidst the city's hustle.",
//       "Experience the vibrant commercial heartbeat in the center of Khartoum.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 5000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm3',
//     categories: 'c1',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     location: LatLng(15.6035, 32.5152), // المتحف الحربي
//     title: 'المتحف الحربي',
//     titleEn: 'Military Museum',
//     imageUrl:
//         'https://www.skynewsarabia.com/images/v1/2015/03/22/732552/800/450/1-732552.jpg',
//     activities: [
//       "رؤية الأسلحة والمعدات العسكرية التاريخية التي استعملها الجيش.",
//       "التعرف على تاريخ القوات المسلحة السودانية منذ التأسيس.",
//       "مشاهدة الأوسمة والنياشين النادرة وصور القادة التاريخيين.",
//       "زيارة معرض الطائرات والدبابات القديمة في الساحة الخارجية.",
//     ],
//     activitiesEn: [
//       "See historic military weapons and equipment used by the army.",
//       "Learn about the history of the Sudanese Armed Forces since its founding.",
//       "View rare medals, decorations, and photos of historic leaders.",
//       "Visit the outdoor aircraft and vintage tank exhibition.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm4',
//     categories: 'c2',
//     cityName: 'مروي',
//     cityNameEn: 'Merowe',
//     location: LatLng(16.9378, 33.7431), // أهرامات الجراوية
//     title: 'أهرامات البجراوية',
//     titleEn: 'Pyramids of Begrawiya',
//     imageUrl:
//         'https://upload.wikimedia.org/wikipedia/commons/e/e6/NubianMeroePyramids30sep2005%282%29.jpg',
//     activities: [
//       "استكشاف الأهرامات المروية ذات الزوايا الحادة والفريدة.",
//       "زيارة المصليات الجنائزية التي تضم نقوشاً ملكية نادرة.",
//       "ركوب الجمال وسط الكثبان الرملية الذهبية المحيطة بالموقع.",
//       "مشاهدة لحظة غروب الشمس الساحرة خلف قمم الأهرامات.",
//     ],
//     activitiesEn: [
//       "Explore unique, steep-angled Meroitic pyramids.",
//       "Visit funerary chapels featuring rare royal carvings.",
//       "Ride camels amidst the golden dunes surrounding the site.",
//       "Witness a magical sunset behind the pyramid peaks.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm5',
//     categories: 'c2',
//     cityName: 'مروي',
//     cityNameEn: 'Merowe',
//     location: LatLng(18.5672, 31.8389), // أهرامات نوري
//     title: 'أهرامات نوري',
//     titleEn: 'Pyramids of Nuri',
//     imageUrl:
//         'https://upload.wikimedia.org/wikipedia/commons/a/a2/Pyramids_of_Nuri.jpg',
//     activities: [
//       "زيارة هرم الملك تهارقا، وهو الأكبر والأهم في موقع نوري.",
//       "استكشاف مدافن وقبور ملوك مملكة نبتة القديمة تحت الأرض.",
//       "المشي في الرمال الناعمة الذهبية التي تحيط بموقع الأهرامات.",
//       "التقاط صور احترافية وتوثيق عظمة العمارة النوبية القديمة.",
//     ],
//     activitiesEn: [
//       "Visit King Taharqa's pyramid, the largest at the Nuri site.",
//       "Explore underground tombs of the ancient Napatan kings.",
//       "Walk through the soft golden sands surrounding the pyramids.",
//       "Capture professional photos documenting ancient Nubian architectural grandeur.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 3500,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm6',
//     categories: 'c2',
//     cityName: 'مروي',
//     cityNameEn: 'Merowe',
//     location: LatLng(16.9405, 33.7480), // المدينة الملكية
//     title: 'المدينة الملكية',
//     titleEn: 'The Royal City',
//     imageUrl:
//         'https://th.bing.com/th/id/R.2ed3317678878fb48eafa0759ac62243?rik=oMlK%2f0ngJLYyUg&pid=ImgRaw&r=0',
//     activities: [
//       "استكشاف بقايا القصور الملكية التي سكنها ملوك مملكة كوش.",
//       "رؤية الحمام الملكي بتصميمه المائي المتقدم والفريد في المنطقة.",
//       "مشاهدة أطلال المعابد الكوشية والتعرف على أهميتها الدينية.",
//       "التعرف على نظام الري المروي المتطور الذي خدم المدينة قديماً.",
//     ],
//     activitiesEn: [
//       "Explore the remains of royal palaces inhabited by Kushite kings.",
//       "See the Royal Baths with its advanced water design, unique to the region.",
//       "Watch ruins of Kushite temples and learn about their religious significance.",
//       "Learn about the advanced Meroitic irrigation system that served the city.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 2000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm7',
//     categories: 'c3',
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     location: LatLng(19.6179, 37.2160), // شاطئ الأول
//     title: 'ميناء بورتسودان',
//     titleEn: 'Port Sudan Harbor',
//     imageUrl:
//         'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Port_Sudan.jpg/1280px-Port_Sudan.jpg',
//     activities: [
//       "مشاهدة السفن التجارية الضخمة والرافعات في ميناء السودان الرئيسي.",
//       "التعرف على حركة التجارة البحرية والنشاط الاقتصادي في الميناء.",
//       "القيام بجولة بحرية ممتعة في القوارب بالقرب من منطقة الميناء.",
//       "التقاط صور بانورامية للميناء الذي يعتبر بوابة السودان للعالم.",
//     ],
//     activitiesEn: [
//       "Watch massive commercial ships and cranes in Sudan's main port.",
//       "Learn about maritime trade movement and economic activity.",
//       "Take an enjoyable boat trip near the harbor area.",
//       "Capture panoramic photos of the harbor, Sudan's gateway to the world.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'رحلة بحرية',
//     travelTypeEn: 'Sea trip',
//     id: 'm8',
//     categories: 'c3',
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     location: LatLng(19.2615, 37.4251), // محمية سنقنيب
//     title: 'محمية سنقنيب المرجانية',
//     titleEn: 'Sanganeb Reef Reserve',
//     imageUrl: 'https://pbs.twimg.com/media/Ef4tawnWkAE5V65.jpg',
//     activities: [
//       "الغوص في مياه المحمية لاستكشاف الشعاب المرجانية النادرة.",
//       "صعود فنار سنقنيب التاريخي لرؤية البحر من ارتفاع شاهق.",
//       "السباحة في المياه الفيروزية الصافية وسط الأسماك الملونة.",
//       "مراقبة الكائنات البحرية المتنوعة وتوثيقها بالتصوير تحت الماء.",
//     ],
//     activitiesEn: [
//       "Dive in the reserve to explore rare coral reefs.",
//       "Climb the historic Sanganeb lighthouse for high-altitude sea views.",
//       "Swim in clear turquoise waters among colorful fish.",
//       "Observe diverse marine creatures and document them with underwater photography.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'رحلة بحرية',
//     travelTypeEn: 'Sea trip',
//     id: 'm9',
//     categories: 'c3',
//     cityName: 'بورتسودان',
//     cityNameEn: 'Port Sudan',
//     location: LatLng(19.6201, 37.2102), // شاطئ الصخور
//     title: 'مخيم عروس',
//     titleEn: 'Arous Resort',
//     imageUrl:
//         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/8d/d4/86/seashell-sudan.jpg?w=1400&h=-1&s=1',
//     activities: [
//       "الاستمتاع بالسباحة والغطس في شواطئ المخيم النظيفة والهادئة.",
//       "الإقامة في أكواخ خشبية ريفية تطل مباشرة على ساحل البحر.",
//       "مشاهدة الشعاب المرجانية القريبة من الساحل باستخدام القناع.",
//       "الاسترخاء والتمتع بالهدوء والسكينة بعيداً عن صخب حياة المدن.",
//     ],
//     activitiesEn: [
//       "Enjoy swimming and diving in the resort's clean, quiet beaches.",
//       "Stay in rustic wooden huts directly overlooking the coast.",
//       "Watch coral reefs near the shore using a snorkel mask.",
//       "Relax and enjoy peace and quiet away from the city's hustle.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 2000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm10',
//     categories: 'c4',
//     cityName: 'الدمازين',
//     cityNameEn: 'Ad-Damazin',
//     location: LatLng(11.8030, 34.3860), // خزان الروصيرص
//     title: 'خزان الروصيرص',
//     titleEn: 'Roseires Dam',
//     imageUrl:
//         'https://i.pinimg.com/originals/06/65/e8/0665e8b4d4a57f904ba7eefc731533c7.jpg',
//     activities: [
//       "مشاهدة بوابات خزان الروصيرص الضخمة وتدفق المياه القوي.",
//       "القيام برحلة صيد ممتعة في بحيرة الخزان الشاسعة والجميلة.",
//       "الاستمتاع بالمناظر الطبيعية الخضراء التي تحيط بضفاف النيل الأزرق.",
//       "التعرف على كيفية عمل الخزان في توليد الطاقة والري في السودان.",
//     ],
//     activitiesEn: [
//       "Watch the massive gates of Roseires Dam and strong water flow.",
//       "Take an enjoyable fishing trip in the vast dam reservoir.",
//       "Enjoy the green natural scenery surrounding the Blue Nile banks.",
//       "Learn how the dam works in power generation and irrigation.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm11',
//     categories: 'c4',
//     cityName: 'الدمازين',
//     cityNameEn: 'Ad-Damazin',
//     location: LatLng(12.4660, 34.4670), // منتزه الدندر
//     title: 'منتزه الدندر القومي',
//     titleEn: 'Dinder National Park',
//     imageUrl:
//         'https://c.regencyholidays.com/blog/2023/12/191552_Lake%20Duma%20Jandal.webp',
//     activities: [
//       "القيام بجولات سفاري مثيرة لمشاهدة الأسود في بيئتها الطبيعية.",
//       "مراقبة الطيور المهاجرة والمحلية والظباء والجاموس الأفريقي.",
//       "التخييم تحت النجوم وسط أجواء الحياة البرية الأفريقية البكر.",
//       "استكشاف البحيرات الموسمية (المايات) التي تجذب الحيوانات للشرب.",
//     ],
//     activitiesEn: [
//       "Go on exciting safaris to see lions in their natural habitat.",
//       "Observe migratory and local birds, antelopes, and African buffalo.",
//       "Camp under the stars amidst pristine African wildlife settings.",
//       "Explore seasonal lakes (Mayas) that attract animals for drinking.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm12',
//     categories: 'c4',
//     cityName: 'الدمازين',
//     cityNameEn: 'Ad-Damazin',
//     location: LatLng(12.81816954894654, 35.390526062189835), // محمية الدندر
//     title: 'محمية الدندر الوطنية',
//     titleEn: 'Dinder Nature Reserve',
//     imageUrl:
//         'https://i.pinimg.com/originals/a9/73/79/a9737976f5a3f9ed90f0feb49f060328.jpg',
//     activities: [
//       "تتبع آثار الأفيال والحيوانات البرية الكبيرة بمساعدة المرشدين.",
//       "التقاط صور احترافية للمناظر الطبيعية الخلابة والتنوع الفطري.",
//       "المشي في المسارات المخصصة داخل الغابة لاكتشاف النباتات النادرة.",
//       "التعرف على التنوع البيولوجي الفريد الذي تضمه المحمية الوطنية.",
//     ],
//     activitiesEn: [
//       "Track elephant and large wildlife trails with the help of guides.",
//       "Capture professional photos of breathtaking landscapes and biodiversity.",
//       "Walk in designated paths within the forest to discover rare plants.",
//       "Learn about the unique biodiversity housed within the national reserve.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm13',
//     categories: 'c5',
//     cityName: 'كسلا',
//     cityNameEn: 'Kassala',
//     location: LatLng(15.426509809650556, 36.42858295045882), // جبال التاكا
//     title: 'جبال التاكا',
//     titleEn: 'Taka Mountains',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/AOGcYQQn-8o7svvkMK5JMr3tABraauB8QYxhVCFZb1KCTxKLc59_bgvLbqUnIK75dfE3HU_N5bbH2BCGR3yvurN7McKSSos4_QjkPJoxJWIMyMiWvMTJoDUAXLiDE6x-5xKMMcnYrD5flQ=w900-h975-p-k-no',
//     activities: [
//       "تسلق الصخور الجرانيتية المميزة للاستمتاع برياضة المغامرة.",
//       "الاستمتاع بإطلالة بانورامية شاملة على مدينة كسلا من القمة.",
//       "شرب القهوة السودانية (الجبنة) في جلسات شعبية عند سفوح الجبال.",
//       "التقاط صور تذكارية للسحب وهي تعانق قمم الجبال عند الفجر.",
//     ],
//     activitiesEn: [
//       "Climb unique granite rocks for an adventurous experience.",
//       "Enjoy a comprehensive panoramic view of Kassala from the peak.",
//       "Drink Sudanese coffee (Jabana) at local spots by the mountain foothills.",
//       "Capture commemorative photos of clouds hugging the mountain peaks at dawn.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 3500,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm14',
//     categories: 'c5',
//     cityName: 'كسلا',
//     cityNameEn: 'Kassala',
//     location: LatLng(15.740124274372503, 32.87062426700996), // الختمية
//     title: 'منطقة الختمية',
//     titleEn: 'Al Khatmiya Area',
//     imageUrl:
//         'https://i.pinimg.com/originals/34/4f/1e/344f1effdd2bc49b416113cf15da6e48.jpg',
//     activities: [
//       "زيارة مسجد الختمية الأثري والتعرف على طرازه المعماري النادر.",
//       "شرب المياه العذبة من بئر توتيل الشهير الذي يقصده الزوار.",
//       "التعرف على التراث الروحاني والصوفي الذي تشتهر به المنطقة.",
//       "التسوق في السوق الشعبي القريب لشراء المنتجات اليدوية المحلية.",
//     ],
//     activitiesEn: [
//       "Visit the historic Khatmiya Mosque and learn about its rare architecture.",
//       "Drink fresh water from the famous Tootil Well visited by tourists.",
//       "Learn about the spiritual and Sufi heritage the region is famous for.",
//       "Shop in the nearby local market for handmade products.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'رحلة بحرية',
//     travelTypeEn: 'Sea trip',
//     id: 'm15',
//     categories: 'c6',
//     cityName: 'سواكن',
//     cityNameEn: 'Suakin',
//     location: LatLng(19.113992441765372, 37.3329253079463), // المنارة
//     title: 'ميناء سواكن',
//     titleEn: 'Suakin Port',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/AOGcYQR5u_8Kckrup_90PDwAA23nEZS1rJ5loleHC0B42nWJPRZvqwSsryI9Di0Jb0GgcdU-H3tyLBeCHB_-fl-I0wDGvgHHUNzS-Wl_y1j6slbxgwOYMwa_FNNaqalGgV_SwPY6JUDUCg=w900-h1482-p-k-no',
//     activities: [
//       "رؤية القوارب التقليدية الخشبية التي يستخدمها الصيادون المحليون.",
//       "شراء الأسماك الطازجة مباشرة من المرفأ فور وصول القوارب.",
//       "القيام بجولة بحرية قصيرة لاستكشاف الساحل المحيط والمناطق القريبة.",
//       "الاستمتاع بمشاهدة الأمواج والهدوء التام في الميناء المحلي البسيط.",
//     ],
//     activitiesEn: [
//       "See traditional wooden boats used by local fishermen.",
//       "Buy fresh fish directly from the pier upon the boats' arrival.",
//       "Take a short boat tour to explore the surrounding coast and nearby areas.",
//       "Enjoy watching the waves and total tranquility in the simple local port.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm16',
//     categories: 'c6',
//     cityName: 'سواكن',
//     cityNameEn: 'Suakin',
//     location: LatLng(
//       19.110763246497207,
//       37.33712572340968,
//     ), // جزيرة سواكن القديمة
//     title: 'جزيرة سواكن القديمة',
//     titleEn: 'Old Suakin Island',
//     imageUrl:
//         'https://www.ancient-origins.net/sites/default/files/styles/large/public/many_5.jpg?itok=kvpifA5X',
//     activities: [
//       "التجول بين المباني المرجانية الأثرية المتبقية من العصر العثماني.",
//       "زيارة قصر الشناوي التاريخي والتعرف على عظمة تجارة سواكن القديمة.",
//       "استكشاف بقايا الموانئ والمساجد الأثرية التي تروي قصة مجد غابر.",
//       "مشاهدة لحظة غروب الشمس الساحرة خلف أطلال المدينة المرجانية.",
//     ],
//     activitiesEn: [
//       "Wander among the archaeological coral buildings from the Ottoman era.",
//       "Visit the historic Shennawi Palace and learn about Suakin's ancient trade glory.",
//       "Explore remains of ports and ancient mosques telling stories of a bygone age.",
//       "Watch a magical sunset behind the ruins of the coral city.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'طبيعية',
//     travelTypeEn: 'Nature',
//     id: 'm17',
//     categories: 'c7',
//     cityName: 'كريمة',
//     cityNameEn: 'Karima',
//     location: LatLng(18.537811013950382, 31.828578910646), // جبل البركل
//     title: 'جبل البركل',
//     titleEn: 'Jebel Barkal',
//     imageUrl:
//         'https://media.istockphoto.com/id/1730639548/photo/ancient-temple-of-pharaoh-in-jebel-barkal-sudan-nubia.jpg?s=170667a&w=0&k=20&c=BaxFOHvsYXm35AVFxAJ9mZ1oQiaBNmwO1J085aZmT3Q=',
//     activities: [
//       "تسلق الجبل لمشاهدة منحنى نهر النيل الرائع وقت الغروب.",
//       "زيارة معبد الإله آمون الضخم ورؤية التماثيل والمنحوتات الصخرية.",
//       "استكشاف الأهرامات الملكية المجاورة للجبل والتعرف على تاريخ ملوك نبتة.",
//       "حضور الفعاليات الثقافية التي تقام أحياناً في ساحة الجبل التاريخية.",
//     ],
//     activitiesEn: [
//       "Climb the mountain to see the magnificent Nile curve at sunset.",
//       "Visit the massive Temple of Amun and see the rock statues and carvings.",
//       "Explore the royal pyramids adjacent to the mountain and learn about Napatan kings.",
//       "Attend cultural events sometimes held in the historic mountain square.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm18',
//     categories: 'c7',
//     cityName: 'كريمة',
//     cityNameEn: 'Karima',
//     location: LatLng(18.408584180968393, 31.77025712090209), // أهرامات الكرو
//     title: 'أهرامات الكرو',
//     titleEn: 'Pyramids of El-Kurru',
//     imageUrl:
//         'https://tse3.mm.bing.net/th/id/OIP.OTxggJHNM3zSSgkzLFSxTgHaFj?cb=defcache2&defcache=1&rs=1&pid=ImgDetMain&o=7&rm=3',
//     activities: [
//       "النزول إلى المقابر الملونة تحت الأرض لرؤية الرسومات الجدارية النادرة.",
//       "رؤية نقوش النجوم والآلهة القديمة التي تزين سقف غرف الدفن.",
//       "زيارة مقابر الخيول الملكية التي تعكس مكانة الخيل عند ملوك كوش.",
//       "المشي وسط أشجار النخيل والمزارع المحيطة بالموقع الأثري الهادئ.",
//     ],
//     activitiesEn: [
//       "Descend into colored underground tombs to see rare murals.",
//       "View carvings of stars and ancient deities decorating burial chamber ceilings.",
//       "Visit royal horse tombs reflecting the status of horses for Kushite kings.",
//       "Walk through palm groves and farms surrounding the quiet archaeological site.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 3000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm19',
//     categories: 'c7',
//     cityName: 'كريمة',
//     cityNameEn: 'Karima',
//     location: LatLng(18.5400, 31.8300), // مزارع النخيل
//     title: 'مزارع النخيل',
//     titleEn: 'Palm Orchards',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/AOGcYQQCmySoM1gkrKqVZ8d1lhOnPQAP0f69gCsyRWDm6bHqgaqsQNxBYkT5s6zXSNRvITGlGXGnmBoJwN_k5ZfOIxv8czBuu4nYF65M5lPJb5AnZ2yNiyv6i-DerANDOqiqG0iiCiYtrw=w900-h482-p-k-no',
//     activities: [
//       "المشي في الممرات الظليلة وسط غابات النخيل الكثيفة على ضفاف النيل.",
//       "تذوق أفضل أنواع التمور السودانية مباشرة من المزارعين المحليين.",
//       "التعرف على طرق الري التقليدية القديمة المتبعة في المنطقة.",
//       "الاسترخاء في أحضان الطبيعة الخضراء الهادئة بعيداً عن ضجيج الحياة.",
//     ],
//     activitiesEn: [
//       "Walk through shaded paths amidst dense palm forests on the Nile banks.",
//       "Taste the best Sudanese dates directly from local farmers.",
//       "Learn about ancient traditional irrigation methods used in the area.",
//       "Relax in the embrace of quiet green nature away from life's noise.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 4000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm20',
//     categories: 'c8',
//     cityName: 'جبل مرة',
//     cityNameEn: 'Jebel Marra',
//     location: LatLng(12.950668171688344, 24.27000035905273), // جبل مرة
//     title: 'جبل مرة',
//     titleEn: 'Jebel Marra',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/9580586ab_generated_image.png',
//     activities: [
//       "السباحة في بحيرة ديربا البركانية التي تقع داخل فوهة الجبل.",
//       "الاستمتاع بمياه الشلالات الطبيعية الباردة والمنعشة وسط الجبال.",
//       "التنزه في وديان الفواكه والموالح التي تشتهر بها المنطقة الخصبة.",
//       "تسلق القمم البركانية الشاهقة واستكشاف التكوينات الصخرية المذهلة.",
//     ],
//     activitiesEn: [
//       "Swim in the volcanic Lake Deriba located inside the mountain crater.",
//       "Enjoy the cool, refreshing natural waterfalls amidst the mountains.",
//       "Hike in the fruit and citrus valleys for which this fertile region is famous.",
//       "Climb towering volcanic peaks and explore stunning rock formations.",
//     ],
//   ),

//   TripsConstructor(
//     budget: 2000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     id: 'm21',
//     categories: 'c8',
//     cityName: 'وادي أزوم',
//     cityNameEn: 'Wadi Azum',
//     location: LatLng(12.834267513036426, 23.32964513454569), // وادي ازوم
//     title: 'وادي أزوم',
//     titleEn: 'Wadi Azum',
//     imageUrl:
//         'https://tse4.mm.bing.net/th/id/OIP.Uk9IB9o5DCZFt_H27a47PQAAAA?cb=defcache',
//     activities: [
//       "استكشاف مجرى الوادي الواسع خلال وبعد موسم الأمطار الخريفية.",
//       "مشاهدة تجمعات الطيور المهاجرة والمحلية التي تقصد الوادي للماء.",
//       "التنزه وسط الغابات الكثيفة والأشجار البرية المعمرة في المنطقة.",
//       "التعرف على نمط الحياة الرعوي والزراعي للسكان المحليين في دارفور.",
//     ],
//     activitiesEn: [
//       "Explore the wide valley stream during and after the autumn rains.",
//       "Watch gatherings of migratory and local birds seeking water.",
//       "Hike amidst dense forests and ancient wild trees in the area.",
//       "Learn about the pastoral and agricultural lifestyle of locals in Darfur.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm22',
//     categories: 'c1',
//     cityName: 'الخرطوم',
//     cityNameEn: 'Khartoum',
//     location: LatLng(15.610137266480029, 32.54265501215873), // وادي ازوم
//     title: 'جامعة الخرطوم',
//     titleEn: 'University of Khartoum',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/f5af142e6_generated_image.png',
//     activities: [
//       "زيارة المباني التاريخية العريقة ذات الطراز المعماري الكلاسيكي.",
//       "التجول في المكتبة المركزية الضخمة واستكشاف كنوزها العلمية.",
//       "مشاهدة الهندسة المعمارية البريطانية التي تميز مباني الكليات القديمة.",
//       "الجلوس في الساحات الخضراء الواسعة والاستمتاع بالأجواء الأكاديمية.",
//     ],
//     activitiesEn: [
//       "Visit ancient historic buildings with classical architectural styles.",
//       "Wander through the massive main library and explore its scientific treasures.",
//       "View the British architecture that characterizes old college buildings.",
//       "Sit in wide green squares and enjoy the academic atmosphere.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 2000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm23',
//     categories: 'c6',
//     cityName: 'سواكن',
//     cityNameEn: 'Suakin',
//     location: LatLng(19.11232423606938, 37.33720575942753), // وادي ازوم
//     title: 'مسجد الشافعي',
//     titleEn: 'Al-Shafi\'i Mosque',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/AOGcYQR0Zquw4ogGYl0YSYRiETHv8ratlO0_7oXjN9D-e8kRCPTUYrTCS6yNQfwYNSV8T38qdSBdl1pN4S_BOyGYI0nQOjjXH4GtM-x-fLsVWsNYUuszKuG0kI-7FKkOjV3jaVfkslqsE1EfVaKv=w900-h1482-p-k-no',
//     activities: [
//       "تأمل العمارة المرجانية الفريدة التي تميز مباني سواكن التاريخية.",
//       "أداء الصلاة في هذا المعلم الأثري واستشعار عبق التاريخ الإسلامي.",
//       "التعرف على تاريخ بناء المساجد في سواكن خلال العصور السابقة.",
//       "توثيق النقوش الإسلامية والزخارف القديمة المحفورة على الجدران.",
//     ],
//     activitiesEn: [
//       "Admire the unique coral architecture characterizing Suakin's historic buildings.",
//       "Pray in this archaeological landmark and feel the Islamic history.",
//       "Learn about the history of mosque construction in Suakin in previous eras.",
//       "Document Islamic inscriptions and ancient decorations carved on the walls.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 2000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm24',
//     categories: 'c9',
//     cityName: 'امدرمان',
//     cityNameEn: 'Omdurman',
//     location: LatLng(15.621207446202455, 32.48810891555261), // وادي ازوم
//     title: 'مسجد النيلين',
//     titleEn: 'Masjid Al-Nilin',
//     imageUrl:
//         'https://static.republika.co.id/uploads/infografis/masjid-an-nilin-di_241029190803-964.jpg',
//     activities: [
//       "مشاهدة القبة الهندسية المتميزة التي تعطي المسجد شكله الأيقوني.",
//       "الاستمتاع بمنظر المسجد الخلاب عند الغروب من شاطئ النيل الأبيض.",
//       "أداء الصلاة في رحاب المسجد الواسعة التي تتسم بالهدوء والجمال.",
//       "رؤية المسجد من أعلى كوبري النيل الأبيض للحصول على أفضل زاوية تصوير.",
//     ],
//     activitiesEn: [
//       "Watch the distinct geometric dome giving the mosque its iconic shape.",
//       "Enjoy the mosque's magnificent view at sunset from the White Nile beach.",
//       "Pray in the mosque's spacious halls characterized by peace and beauty.",
//       "View the mosque from atop the White Nile Bridge for the best photo angle.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 2500,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm25',
//     categories: 'c9',
//     cityName: 'امدرمان',
//     cityNameEn: 'Omdurman',
//     location: LatLng(15.647663359402847, 32.47510937492615), // وادي ازوم
//     title: "الجوهرة الزرقاء - نادي الهلال",
//     titleEn: 'The Blue Jewel - Al Hilal Club',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/248cb640c_generated_image.png',
//     activities: [
//       "حضور مباريات كرة القدم الحماسية وتشجيع نادي الهلال العريق.",
//       "زيارة مرافق النادي والاستاد الملقب بـ 'الجوهرة الزرقاء'.",
//       "التقاط صور تذكارية في المدرجات الزرقاء الشهيرة والمميزة.",
//       "شراء الهدايا التذكارية والقمصان الأصلية من متجر النادي الرسمي.",
//     ],
//     activitiesEn: [
//       "Attend exciting football matches and cheer for the historic Al Hilal club.",
//       "Visit club facilities and the stadium nicknamed 'The Blue Jewel'.",
//       "Take commemorative photos in the famous and distinct blue stands.",
//       "Buy souvenirs and original shirts from the official club store.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 2500,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm26',
//     categories: 'c9',
//     cityName: 'امدرمان',
//     cityNameEn: 'Omdurman',
//     location: LatLng(15.641443946789135, 32.47154685582215), // وادي ازوم
//     title: 'استاد المريخ - الرد كاسل',
//     titleEn: 'Al-Merrikh Stadium - Red Castle',
//     imageUrl:
//         'https://media.base44.com/images/public/69cd67cf0244b5937b92c938/946fd3e0e_generated_image.png',
//     activities: [
//       "مشاهدة مباريات 'الزعيم' المريخ في ملعبه الملقب بالرد كاسل.",
//       "زيارة مقر النادي والتعرف على تاريخه البطولي وإنجازاته القارية.",
//       "الاستمتاع بالأجواء الرياضية الصاخبة والمميزة في مدرجات المريخ.",
//       "التقاط صور تذكارية مع كؤوس النادي التاريخية المعروضة في مقره.",
//     ],
//     activitiesEn: [
//       "Watch matches of 'Al-Zaeem' Merrikh in its stadium nicknamed the Red Castle.",
//       "Visit the club headquarters and learn about its heroic history.",
//       "Enjoy the loud and unique sports atmosphere in the Merrikh stands.",
//       "Take commemorative photos with the historic club trophies on display.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 5000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm27',
//     categories: 'c7',
//     cityName: 'كريمة',
//     cityNameEn: 'Karima',
//     location: LatLng(19.998049035412027, 31.39628633209841), // وادي ازوم
//     title: 'متحف كرمة',
//     titleEn: 'Kerma Museum',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/AOGcYQQTHskWa4bgewr9BcA4IRWb6Vg6WJJYt05EzUcjdRdbubMbdEp7sd21TtlavXGOKK-z4gWdcnSu3LhiMFzyE067QplFXNC3MkK2Gq9qRYtvIaWSAA2Hn6-jabRfwgg3T95DlHLvqg=w750-h813-p-k-no',
//     activities: [
//       "رؤية تماثيل ملوك كرمة السبعة الضخمة والمنحوتة ببراعة.",
//       "استكشاف الدفوفة الغربية الضخمة، وهي أقدم بناء من الطوب اللبن في أفريقيا.",
//       "مشاهدة الفخار الكرمي الرقيق ذو اللون الأسود والأحمر والتعرف على صنعه.",
//       "التعرف على أقدم الحضارات المنظمة في السودان وتاريخها الموغل في القدم.",
//     ],
//     activitiesEn: [
//       "See the seven massive statues of Kerma kings, masterfully carved.",
//       "Explore the Western Deffufa, the oldest mud-brick building in Africa.",
//       "View delicate black-and-red Kerma pottery and learn how it's made.",
//       "Discover the oldest organized civilizations in Sudan and its ancient history.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 2000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     id: 'm28',
//     categories: 'c9',
//     cityName: 'امدرمان',
//     cityNameEn: 'Omdurman',
//     location: LatLng(15.65951083952783, 32.48816249322836), // وادي ازوم
//     title: 'مركز عبد الكريم مرغني الثقافي',
//     titleEn: 'Abdel Karim Mirghani Cultural Center',
//     imageUrl:
//         'https://www.image2url.com/r2/default/images/1777117453833-e612f2be-b2be-4dd9-b7ac-446385d1989b.jpg',
//     activities: [
//       "تأسس المركز في عام 1998 تخليداً لذكرى السيد عبد الكريم مرغني (1925–1995)، السياسي والمعلم والدبلوماسي السوداني.",
//       "يقدم المركز أنشطة ثقافية متنوعة ويضم مكتبة ضخمة ثنائية اللغة مع قسم مخصص للأطفال.",
//       "ينظم المركز فعاليات ثقافية مختلفة ويشارك بانتظام في معرض الخرطوم الدولي للكتاب والمعارض الإقليمية.",
//       "يقوم المركز بطباعة الروايات والقصص القصيرة ونشر كتب في مجالات الثقافة والفكر والتاريخ.",
//     ],
//     activitiesEn: [
//       "Learn about the legacy of Abdel Karim Mirghani (1925–1995), a prominent diplomat.",
//       "Access a massive bilingual library with a section dedicated to children.",
//       "Attend cultural events and various regional book exhibitions.",
//       "Explore publications of novels, short stories, and intellectual books.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 5000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     id: 'm29',
//     categories: 'c8',
//     cityName: 'الفاشر',
//     cityNameEn: 'El Fasher',
//     location: LatLng(13.626621403578206, 25.349449637306737), // وادي ازوم
//     title: 'قصر السلطان علي دينار',
//     titleEn: 'Sultan Ali Dinar Palace',
//     imageUrl:
//         'https://www.image2url.com/r2/default/images/1777117885900-c372338b-bc14-460d-a3c8-d1d87e0a01be.jpg',
//     activities: [
//       "استكشاف عمارة القصر الذي شُيّد عام 1912م على يد بنّائين أتراك وأغاريق.",
//       "زيارة المتحف الذي يضم سيوفاً فضية وبنادق وعملات دارفورية تاريخية.",
//       "التعرف على حياة السلطان علي دينار ودوره في خدمة الحجيج وكسوة الكعبة.",
//       "مشاهدة العرش الملكي والملابس التاريخية والمخطوطات الإسلامية النادرة.",
//       "الاستماع إلى قصص عن تاريخ سلطنة دارفور واستقلالها الإداري.",
//     ],
//     activitiesEn: [
//       "Explore the palace architecture built in 1912 by Turkish and Greek masons.",
//       "Visit the museum housing silver swords, rifles, and historic Darfur coins.",
//       "Learn about Sultan Ali Dinar's life and his role in providing the Kaaba cover.",
//       "View the royal throne, historic clothing, and rare Islamic manuscripts.",
//       "Listen to stories about the history of the Darfur Sultanate.",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     location: LatLng(15.639892206380813, 32.488560642627114),
//     title: 'قبة المهدي',
//     id: 'm30',
//     imageUrl:
//         'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Mahdi%27s_Tomb_in_Omdurman_001.jpg/960px-Mahdi%27s_Tomb_in_Omdurman_001.jpg',
//     categories: 'c9',
//     activities: [
//       "استكشاف مبنى القبة المخروطية الشهير الذي يضم رفات الإمام محمد أحمد المهدي وقادة الدولة المهدية",
//       "تأمل نمط العمارة السودانية التقليدية المخصص لأضرحة الأولياء والصوفية، والذي أُعيد بناؤه في خمسينيات القرن الماضي",
//       "قراءة اللوحات الاسترشادية وفهم قصة هدم القبة من قِبل القوات الإنجليزية وإعادة تشييدها لاحقاً",
//       "التقاط صور تذكارية للمبنى المعماري الفريد والساحات الخارجية المحيطة به بوسط دائرة آل المهدي",
//     ],
//     cityName: 'أم درمان',
//     titleEn: 'Mahdi Tomb',
//     cityNameEn: 'Omdurman',
//     activitiesEn: [
//       "Exploring the iconic conical dome building that contains the remains of Imam Muhammad Ahmad Al-Mahdi and the leaders of the Mahdist State",
//       "Observing the traditional Sudanese architectural style used for the shrines of saints and Sufi figures, which was rebuilt in the 1950s",
//       "Reading the informational panels and learning the story of the dome’s demolition by British forces and its later reconstruction",
//       "Taking memorable photos of the unique architectural structure and the surrounding open courtyards within the Al-Mahdi family district",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     location: LatLng(15.638919816641556, 32.488290581224625),
//     title: 'بيت الخليفة',
//     id: 'm31',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOu8_KplX99zo6Cd8H6asmASvvq7dTsgKV4i3MBF_UYm62U3-QYk6Wk5nxzGOjeCG1WkNCPk_ujigRi7nW-wszQFXGp6vou88Lm3TqgfjhpbsIaKUSDi3LLOGudza5-rXJGqzK8=w900-h482-p-k-no',
//     categories: 'c9',
//     activities: [
//       "مشاهدة الأسلحة النارية والتقليدية مثل السيوف والحراب، والرايات، والجباب التاريخية",
//       "الاطلاع على التقارير والرسائل والمراسلات الرسمية التي تعود لفترة حكم المهدية",
//       "رؤية واحدة من أقدم المطابع الأثرية في السودان والتي كانت تُستخدم لطباعة المنشورات",
//       "التجول بين الغرف والأفنية المتصلة للمبنى المصنوع من الطوب اللبن، والذي بناه المعماري الإيطالي بيترو عام 1887",
//     ],
//     cityName: 'أم درمان',
//     titleEn: 'Khalifa House Museum',
//     cityNameEn: 'Omdurman',
//     activitiesEn: [
//       "Viewing traditional and historical weapons such as swords, spears, banners, and Mahdist-era garments",
//       "Exploring official reports, letters, and correspondence dating back to the Mahdist State period",
//       "Seeing one of the oldest historical printing presses in Sudan, used for printing publications at the time",
//       "Walking through the interconnected rooms and courtyards of the mud‑brick building constructed by the Italian architect Pietro in 1887",
//     ],
//   ),
//   TripsConstructor(
//     budget: 2500,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     location: LatLng(15.612838882820222, 32.49448469471663),
//     title: 'منتزه المقرن العائلي',
//     id: 'm32',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOvg9XA-0TcKdpiv43r2kzcIKAJ5YNde8JTnKASIkIZWCXaIH8rAVf7jXy2-dsnT-K3FPlQvdVriIJS_JxmIM-AHzYmmdAzdX5K_k5G0yOkH6pPSprzub_pXuVRz7ugqVZihmTRO=w900-h482-p-k-no',
//     categories: 'c1',
//     activities: [
//       "الاستمتاع بظاهرة اندماج النيلين الأبيض والأزرق في مشهد طبيعي فريد",
//       "ركوب الملاهي التقليدية مثل الأفعوانية وسيارات التصادم",
//       "الاستمتاع بألعاب مثل ليزر تاق",
//       "حضور الحفلات الموسيقية والفعاليات الثقافية التي تقام في المساحات المفتوحة",
//     ],
//     cityName: 'الخرطوم',
//     titleEn: 'Mogran Family Park',
//     cityNameEn: 'Khartoum',
//     activitiesEn: [
//       "Enjoying the unique natural phenomenon where the White and Blue Nile meet",
//       "Riding classic amusement attractions such as roller coasters and bumper cars",
//       "Having fun with modern activities like Laser Tag",
//       "Attending musical concerts and cultural events held in the park’s open spaces",
//     ],
//   ),
//   TripsConstructor(
//     budget: 4500,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     location: LatLng(15.613915656196017, 32.568403780359844),
//     title: 'نادي النيل العالمي',
//     id: 'm33',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOt5cgCoQiL2WTqdJ_ZvrS3UNfaen9LLOAYXmgV7iwL1rp6Q6m13rJXFcxdRM_0GmPCJi5eohkkpbCoIEFFpBo1ucJFvrhuPX8fyNakQZYIv-wsqQeXZ7Cu5WzgpklflR0YntI8mEQ=w900-h482-p-k-no',
//     categories: 'c1',
//     activities: [
//       "زيارة المعارض المتنوعة للمنتجات السودانية والصناعات المحلية بالتعاون مع شركات تنظيم الفعاليات",
//       "حضور الفعاليات الفنية والثقافية",
//       "الاستمتاع بمساحات وملاعب، بالإضافة إلى مرافق تتيح أنشطة رياضية متنوعة",
//       "زيارة نافورته الراقصة ومناطق الجلسات المفتوحة المطلة على ضفاف النيل",
//     ],
//     cityName: 'الخرطوم',
//     titleEn: 'Nile International Club',
//     cityNameEn: 'Khartoum',
//     activitiesEn: [
//       "Visiting diverse exhibitions showcasing Sudanese products and local industries",
//       "Attending artistic and cultural events",
//       "Enjoying open spaces, playgrounds, and various sports facilities",
//       "Visiting the dancing fountain and the open seating areas overlooking the Nile",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     location: LatLng(15.594893925758639, 32.58802948608542),
//     title: 'شارع النيل',
//     id: 'm34',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOtpNvYGQMTXa-U1I_eYW-A4x3r7SDI6lhkf2A1DuBc2Qqp1aFqL_vBW6qFhU7g0oW6WPwNS38nd-QtlfjZ_Gxfn70Kn3Rbbw8TGirag24yUetLYkxj938i2wcNIV8Lvn7G8Dw5m=w900-h482-p-k-no',
//     categories: 'c1',
//     activities: [
//       "الاستمتاع برحلات نيلية هادئة وقت الغروب أو في المساء، وهي تجربة شهيرة وشعبية",
//       "الجلوس في المقاهي المفتوحة والجلسات المنتشرة على طول الشارع لاحتساء الشاي والقهوة السودانية التقليدية",
//       "الاستمتاع بوجبات العشاء المتنوعة والمأكولات الشعبية في المطاعم المطلة مباشرة على صفحة النيل",
//       "المشي في الهواء الطلق والاستمتاع بالنسيم العليل والتقاط الصور التذكارية",
//     ],
//     cityName: 'الخرطوم',
//     titleEn: 'Nile Street',
//     cityNameEn: 'Khartoum',
//     activitiesEn: [
//       "Enjoying peaceful Nile cruises during sunset or at night",
//       "Relaxing in open-air cafés along the street while sipping traditional Sudanese tea and coffee",
//       "Enjoying diverse dinners and local dishes at restaurants overlooking the Nile",
//       "Walking outdoors, enjoying the fresh breeze, and taking memorable photos",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     location: LatLng(15.646194416268015, 32.47752418307567),
//     title: 'سوق أم درمان',
//     id: 'm35',
//     imageUrl:
//         'https://images.akhbarelyom.com/images/images/large/20230118123104883.jpg',
//     categories: 'c9',
//     activities: [
//       "التسوق في سوق يتوفر فيه كل ما يخطر على البال من بهارات، أقمشة زاهية، ملابس تقليدية، والمصنوعات الجلدية",
//       "شراء التحف والهدايا التذكارية",
//       "تذوق الوجبات الخفيفة والقهوة السودانية في الأكشاك والمقاهي الشعبية المنتشرة في السوق",
//       "التقاط الصور للزقاق الضيقة والأجواء الصاخبة التي تعكس الروح الحقيقية للثقافة السودانية",
//     ],
//     cityName: 'أم درمان',
//     titleEn: 'Omdurman Market',
//     cityNameEn: 'Omdurman',
//     activitiesEn: [
//       "Shopping for spices, colorful fabrics, traditional clothing, and leather crafts",
//       "Buying souvenirs and handcrafted gifts",
//       "Tasting local snacks and Sudanese coffee from street vendors and traditional cafés",
//       "Capturing photos of the narrow alleys and lively atmosphere that reflect true Sudanese culture",
//     ],
//   ),
//   TripsConstructor(
//     budget: 4000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     location: LatLng(18.65237160908142, 31.80061686678448),
//     title: 'الغابة المتحجرة',
//     id: 'm36',
//     imageUrl:
//         'https://travel2unlimited.com/wp-content/uploads/2022/11/316965705_10160661340403701_1310416074144713957_n_10160661335968701-1030x773.jpg',
//     categories: 'c2',
//     activities: [
//       "التجول بين التضاريس الصخرية لرؤية جذوع الأشجار القديمة التي تحولت إلى حجارة عبر ملايين السنين",
//       "استكشاف الصحراء الصخرية المحيطة التي توفر تجربة رائعة للمشي الوعر",
//     ],
//     cityName: 'نهر النيل',
//     titleEn: 'Petrified Forest',
//     cityNameEn: 'River Nile State',
//     activitiesEn: [
//       "Walking among rocky terrain to see ancient tree trunks that turned into stone over millions of years",
//       "Exploring the surrounding rocky desert, ideal for rugged hiking experiences",
//     ],
//   ),
//   TripsConstructor(
//     budget: 4000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     location: LatLng(20.70960366027008, 30.3241410188248),
//     title: 'جزيرة صاي',
//     id: 'm37',
//     imageUrl:
//         'https://afrolegends.com/wp-content/uploads/2023/04/sudan_sai-island_ruins.jpg',
//     categories: 'c2',
//     activities: [
//       "التجول داخل قلعة عثمانية ضخمة بنيت فوق مستوطنة مصرية قديمة تعود لعام 1500 قبل الميلاد، حيث ترى الأعمدة الباقية والبوابات الحجرية والنقوش الهيروغليفية",
//       "مشاهدة بقايا الكنيسة الأثرية ذات التصميم الصليبي وأعمدتها القائمة، والتي كانت مقراً لأسقف نوبي في العصور الوسطى",
//       "استئجار قارب محلي من مرسى قرية تبج للتنقل بين مواقع الجزيرة المترامية على ضفاف النيل",
//       "الاستمتاع بكرم الضيافة النوبي وقضاء الوقت في المنازل التقليدية وتناول الشاي على الحطب والتعرف على العادات المحلية",
//     ],
//     cityName: 'وادي حلفا',
//     titleEn: 'Sai Island',
//     cityNameEn: 'Wadi Halfa',
//     activitiesEn: [
//       "Exploring a large Ottoman fortress built over an ancient Egyptian settlement dating back to 1500 BC, featuring remaining columns, stone gates, and hieroglyphic carvings",
//       "Viewing the ruins of the ancient cross‑shaped church that once served as the seat of a Nubian bishop",
//       "Renting a local boat from the village of Tebej to explore the island’s scattered archaeological sites",
//       "Enjoying Nubian hospitality, spending time in traditional homes, drinking fire‑brewed tea, and learning about local customs",
//     ],
//   ),
//   TripsConstructor(
//     budget: 4000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     location: LatLng(16.27708526287542, 32.605017077536885),
//     title: 'السبلوقة',
//     id: 'm38',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOtjSJXTzqEfXVA2Dnb7Djuw0MIOav5ywguGLhNOWeItzbVXRFze2zHne-Q3pm5I8vwHvIYl_S37_VNlQ_rmF4sqOMgGF866wcYBq8sFVfJd5u-K5onada3YvnSZMsFQasgBv2yF=w900-h482-p-k-no',
//     categories: 'c1',
//     activities: [
//       "استئجار قوارب محلية للقيام بجولة استكشافية وسط المضايق النيلية والصخور الجرانيتية",
//       "نصب الخيام على ضفاف النيل أو فوق الجزر الصخرية للاستمتاع بهدوء الطبيعة وسماء الليل",
//       "استكشاف التضاريس الصخرية المعروفة بالجنادل، وهي مثالية لمحبي المغامرة والهايكنج",
//       "مراقبة الطيور المهاجرة والتقاط صور بانورامية للمياه والتكوينات الصخرية",
//     ],
//     cityName: 'بحري',
//     titleEn: 'Sabalooga Rapids',
//     cityNameEn: 'Khartoum North',
//     activitiesEn: [
//       "Renting local boats to explore the Nile gorges and granite rock formations",
//       "Camping along the Nile banks or on rocky islands to enjoy peaceful nature and clear night skies",
//       "Exploring the rocky terrain known as the ‘Jandals’, ideal for adventure lovers and hikers",
//       "Watching migratory and resident birds and capturing panoramic photos of the river and unique rock formations",
//     ],
//   ),
//   TripsConstructor(
//     budget: 4000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     location: LatLng(13.800625124309422, 23.699828366993913),
//     title: 'جبل عامر',
//     id: 'm39',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOsOknDG0wteB_tcvQ9ptv3T1Tsg-wWOwvsc255cyzTeCsyS57eg69rkh-nQVOdfOT4fOiijxFTpiDC0K23TXKPWLuCQdN0L-9w_rA9B-WmgZQkUzDBJdgSJZnGbG2BViyaWG4w=w900-h482-p-k-no',
//     categories: 'c8',
//     activities: [
//       "مشاهدة التنقيب الأهلي عن الذهب",
//       "زيارة مواقع التنقيب المنظم الذي تقوم به شركات التعدين الكبرى",
//     ],
//     cityName: 'كبكابية',
//     titleEn: 'Jabal Amir',
//     cityNameEn: 'Kebkabiya',
//     activitiesEn: [
//       "Observing traditional artisanal gold mining activities",
//       "Visiting organized mining operations run by major licensed companies",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'طبيعة',
//     travelTypeEn: 'Nature',
//     location: LatLng(21.11006434508351, 33.802672493038884),
//     title: 'صحراء بيوضة',
//     id: 'm40',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOv5v2jAjlOK5OrC_sX2dKLzspZ2mZQTk6dYxdijef619QyJrCQ5k9zRNuO2wo9gX-4JJZSQA3qBuyem9kWhU-Q4HYBNYmTgdWHuOtPqoJEoMFvHIakpHHuJY0EgxD2csroiqaZM=w900-h482-p-k-no',
//     categories: 'c8',
//     activities: [
//       "القيادة عبر الكثبان الرملية والتضاريس الصخرية باستخدام سيارات مجهزة",
//       "الاستمتاع بليالي الصحراء الصافية للتأمل ورصد النجوم",
//       "زيارة المعالم الجيولوجية",
//       "التعرف على الحياة البدوية",
//     ],
//     cityName: 'الجراوية',
//     titleEn: 'Bayuda Desert',
//     cityNameEn: 'Al-Jarawiya',
//     activitiesEn: [
//       "Driving across sand dunes and rocky terrain using equipped off‑road vehicles",
//       "Enjoying clear desert nights ideal for stargazing and quiet reflection",
//       "Visiting notable geological formations",
//       "Learning about traditional Bedouin life and culture",
//     ],
//   ),

//   TripsConstructor(
//     budget: 5000,
//     travelType: 'تاريخية',
//     travelTypeEn: 'Historical',
//     location: LatLng(17.697260453784494, 33.97264345980245),
//     title: 'متحف السكة حديد عطبرة',
//     id: 'm41',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOueToKJMZ_jevHIn0LkMHAssZxO4G-Gkw9swdfjFVoTecSZ3Ybw13KAJjFYHOYePm_9txGLNpqO6EbP1nTTmDlr1G3eHoLqgYkffSY1VEFXoyJmPYKT7ZnMzMM9dVGREVp6Uks=w900-h975-p-k-no',
//     categories: 'c5',
//     activities: [
//       "مشاهدة قاطرات البخار والديزل الأصلية والقديمة",
//       "رؤية آلات التخريم القديمة من عام 1900",
//       "الاطلاع على مخططات تأسيس خطوط السكك الحديدية",
//       "استكشاف أحجار الأساس وفلكات المحركات القديمة",
//     ],
//     cityName: 'عطبرة',
//     titleEn: 'Atbara Railway Museum',
//     cityNameEn: 'Atbara',
//     activitiesEn: [
//       "Viewing original steam and diesel locomotives",
//       "Seeing historic drilling machines dating back to 1900",
//       "Exploring the early blueprints of Sudan’s railway network",
//       "Discovering foundation stones and old engine wheels",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     location: LatLng(17.690900334347813, 33.96838789259687),
//     title: 'كورنيش عطبرة',
//     id: 'm42',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOvAt9gPQcPNWwXOzKylkwVOQgiRfSwg-WLJKbtR90GcxQxwFPeOie4pcnpMZ5tZPcfxO-QuBYlDODSiYvKAhQYSiMQzFQGeGxjmw-Z2GvIjKE8zyExi-If7-RhV0hGAC44NzpsY=w900-h975-p-k-no',
//     categories: 'c5',
//     activities: [
//       "الاستمتاع بمنظر التقاء النهرين ومراقبة شروق وغروب الشمس الساحر",
//       "التجمع مع العائلة والأصدقاء لتناول القهوة التقليدية (الجبنة) من الباعة المنتشرين",
//       "ممارسة رياضة المشي والجري على طول الرصيف البحري في الساعات المسائية الباردة",
//       "تناول الوجبات السريعة المحلية والمشروبات والتسالي من الأكشاك والكافتيريات الممتدة",
//     ],
//     cityName: 'عطبرة',
//     titleEn: 'Atbara Corniche',
//     cityNameEn: 'Atbara',
//     activitiesEn: [
//       "Enjoying the view where the two rivers meet and watching the magical sunrise and sunset",
//       "Gathering with family and friends to drink traditional Sudanese coffee (Jabana)",
//       "Walking or jogging along the waterfront during the cool evening hours",
//       "Trying local fast food, drinks, and snacks from the many kiosks and cafés",
//     ],
//   ),
//   TripsConstructor(
//     budget: 2000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     location: LatLng(13.184371023797077, 30.21575245062974),
//     title: 'مسجد الأبيض العتيق',
//     id: 'm43',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOs7POT2pIEufIwwplVnif82zdmRsW80fMTKi1-Ol5R6d6Nwc9YRgMawEi0rfr8eybrbYQ0g4aN8JVy4CJhu0laYmiczGJFMj-ITDQxMplyObP4SajIE2pMCsUnGx68Q0WD8r5Xbgg=w900-h482-p-k-no',
//     categories: 'c8',
//     activities: [
//       "تجربة الصلاة الجماعية وسط أجواء إيمانية وتاريخية مهيبة",
//       "الاستماع إلى خطبة الجمعة والدروس الدينية اليومية",
//       "التعرف على حلقات تحفيظ القرآن الكريم والتعليم التقليدي",
//       "مشاهدة التصميم المعماري الفريد للمسجد والتقاط الصور التذكارية",
//     ],
//     cityName: 'الأبيض',
//     titleEn: 'El-Obeid Great Mosque',
//     cityNameEn: 'El-Obeid',
//     activitiesEn: [
//       "Experiencing congregational prayers in a spiritual and historic atmosphere",
//       "Listening to Friday sermons and daily religious lessons",
//       "Learning about Quran memorization circles and traditional Islamic education",
//       "Viewing the mosque’s unique architecture and taking memorable photos",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3000,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     location: LatLng(13.181033241771157, 30.219772737138893),
//     title: 'كاتدرائية سيدة أفريقيا',
//     id: 'm44',
//     imageUrl:
//         'https://lh3.googleusercontent.com/gps-cs/ACgwaOtQovKzBNnWA4STSAu7N1sTooI0eyAE63uiZUDYtIX_VuiK84YjQnQVTZfBiC2dtQkRTEGQkgX18doKmBYYGB27v_yP92TIFdROUPHGtAIBKHGw8_HdU26LXL-55_voFkqXqxwJ=w900-h482-p-k-no',
//     categories: 'c8',
//     activities: [
//       "مشاركة الرعية الصلوات، لا سيما قداس الثامنة صباحاً للاستماع إلى التراتيل الأفريقية الحية",
//       "قضاء أوقات للتأمل الصامت خلال برامج السجود للقربان المقدس",
//       "المشاركة في المناسبات الليتورجية الخاصة ومسيرات الحج الإبرشية والأعياد الدينية",
//       "التجول في ساحات الكاتدرائية لمشاهدة التصاميم المحلية والنوافذ الزجاجية الملونة",
//     ],
//     cityName: 'الأبيض',
//     titleEn: 'Cathedral of Our Lady Queen of Africa',
//     cityNameEn: 'El-Obeid',
//     activitiesEn: [
//       "Joining parish prayers, especially the 8 AM Mass with vibrant African hymns",
//       "Spending quiet moments in Eucharistic adoration programs",
//       "Participating in special liturgical celebrations, diocesan pilgrimages, and religious feasts",
//       "Walking through the cathedral grounds to view local designs and colorful stained‑glass windows",
//     ],
//   ),
//   TripsConstructor(
//     budget: 3500,
//     travelType: 'ثقافية',
//     travelTypeEn: 'Cultural',
//     location: LatLng(15.838866300605687, 32.56094122438439),
//     title: 'مجمع النور الإسلامي',
//     id: 'm45',
//     imageUrl:
//         'https://www.image2url.com/r2/default/images/1780172841635-1713c740-d426-492f-b0c0-40c72f5c88bf.jpg',
//     categories: 'c1',
//     activities: [
//       "أداء الصلوات في المسجد الكبير داخل المجمع وسط أجواء روحانية هادئة",
//       "حضور الدروس الدينية والمحاضرات التي يقدمها الشيوخ والدعاة",
//       "زيارة مكتبة المجمع التي تضم كتباً في الفقه والتفسير والسيرة",
//       "التجول في الساحات الخارجية الواسعة والتقاط الصور للعمارة الإسلامية الجميلة",
//     ],
//     cityName: 'الخرطوم',
//     titleEn: 'Al-Noor Islamic Complex',
//     cityNameEn: 'Khartoum',
//     activitiesEn: [
//       "Performing prayers in the main mosque of the complex within a peaceful spiritual atmosphere",
//       "Attending religious lessons and lectures delivered by scholars and preachers",
//       "Visiting the complex’s library, which contains books on jurisprudence, tafsir, and prophetic biography",
//       "Walking through the spacious outdoor courtyards and taking photos of the beautiful Islamic architecture",
//     ],
//   ),
// ];
