import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '40b158a0b0c200434d00f699e7cb2902';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    //we can only await if there's a future set up. We are creating a Location obect from location.dart, then accessing one of it's method called getCurrentLocation()
    Location location = Location();
    // We await here b/c we need to wait for the currentLocation() to finish so that we can use the longitude and latitude in NetworkHelper
    await location.getCurrentLocation();
    //NetworkHelper is found from networking.dart
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s hot! Maybe get some 🍦';
    } else if (temp > 20) {
      return 'Nice temperature today, wear shorts and 👕';
    } else if (temp < 10) {
      return 'Consider wearing something warm';
    } else {
      return 'Bring a jacket just in case';
    }
  }
}
