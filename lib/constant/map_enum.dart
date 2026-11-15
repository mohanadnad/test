enum MapStyle { light, dark, satellite }

String getMapStyle(MapStyle style) {
  switch (style) {
    case MapStyle.light:
      return "https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png";

    case MapStyle.dark:
      return "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png";

    case MapStyle.satellite:
      return "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}";
  }
}
// https://basemaps.cartocdn.com/rastertiles/voyager/1/0/0@2x.png