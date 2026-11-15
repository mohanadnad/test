import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';

final api = ApiGetServices();
SharedPreferences? sharedPreferences;

final String myFonts = "ElMessiri";
final String myFontEn = 'Bobbers';
const String admin = "https://sudan-tourist-api.onrender.com/";

const String linkServer = 'https://sudan-tourist-api.onrender.com';

const String addRatings = '$linkServer/add_rating.php';
const String getRatings = '$linkServer/get_rating.php';
const String getUserRatings = '$linkServer/get_user_rating.php';
const String addUser = '$linkServer/add_user.php';
const String addBookingApi = '$linkServer/create_booking.php';
const String getUrserBookings = '$linkServer/get_user_bookings.php';
const String deleteBookingApi = '$linkServer/delete_booking.php';
const String updateBookingApi = '$linkServer/update_booking.php';
const String addCategoryApi = '$linkServer/add_category.php';
const String addHotelApi = '$linkServer/add_hotel.php';
const String addTripApi = '$linkServer/add_trip.php';
const String addTravelApi = '$linkServer/add_travel.php';
const String addRestaurantApi = '$linkServer/add_restaurant.php';
const String addRestaurantActivitiesApi =
    '$linkServer/add_restaurant_activities.php';
const String addHotelActivitiesApi = '$linkServer/add_hotel_activities.php';
const String addTripActivitiesApi = '$linkServer/add_trip_activities.php';
const String addTravelActivitiesApi = '$linkServer/add_travel_activities.php';
const String addTravelImagesApi = '$linkServer/add_travel_images.php';

const String getCategoriesApi = '$linkServer/get_all_categories.php';

// -------------------------------------------------------------
// 🟩 GET TRAVELS (الرحلات)
// -------------------------------------------------------------

/// English: Get all travels
/// Arabic: جلب جميع الرحلات
const String getTravelsApi = '$linkServer/get_all_travels.php';

/// English: Get travel details by ID
/// Arabic: جلب تفاصيل الرحلة حسب رقمها
const String getTravelDetailsApi = '$linkServer/get_travel_details.php';

/// English: Get activities for a travel
/// Arabic: جلب الأنشطة الخاصة بالرحلة
const String getTravelActivitiesApi = '$linkServer/get_travel_activities.php';

/// English: Get images for a travel
/// Arabic: جلب صور الرحلة
const String getTravelImagesApi = '$linkServer/get_travel_images.php';

// -------------------------------------------------------------
// 🟧 GET HOTELS (الفنادق)
// -------------------------------------------------------------

/// English: Get all hotels
/// Arabic: جلب جميع الفنادق
const String getHotelsApi = '$linkServer/get_all_hotels.php';

/// English: Get hotel activities
/// Arabic: جلب أنشطة الفندق
const String getHotelActivitiesApi = '$linkServer/get_hotel_activities.php';

// -------------------------------------------------------------
// 🟥 GET RESTAURANTS (المطاعم)
// -------------------------------------------------------------

/// English: Get all restaurants
/// Arabic: جلب جميع المطاعم
const String getRestaurantsApi = '$linkServer/get_all_restaurants.php';

/// English: Get restaurant activities
/// Arabic: جلب أنشطة المطعم
const String getRestaurantActivitiesApi =
    '$linkServer/get_restaurant_activities.php';

// -------------------------------------------------------------
// 🟪 GET TRIPS (الرحلات السياحية)
// -------------------------------------------------------------

/// English: Get all trips
/// Arabic: جلب جميع الرحلات السياحية
const String getTripsApi = '$linkServer/get_all_trips.php';

/// English: Get trip activities
/// Arabic: جلب أنشطة الرحلة السياحية
const String getTripActivitiesApi = '$linkServer/get_trip_activities.php';

// -------------------------------------------------------------
// 🟫 GENERAL IMAGES (صور عامة)
// -------------------------------------------------------------

/// English: Get images (if needed)
/// Arabic: جلب الصور (إن لزم الأمر)
// const String getImagesApi = '$linkServer/get_images.php';
