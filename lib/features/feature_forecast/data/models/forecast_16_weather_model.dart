import 'package:weathery/features/feature_forecast/domain/entities/forecast_16_weather_entity.dart';

/// city : {"id":3163858,"name":"Zocca","coord":{"lon":10.99,"lat":44.34},"country":"IT","population":4593,"timezone":7200}
/// cod : "200"
/// message : 0.0582563
/// cnt : 7
/// list : [{"dt":1661857200,"sunrise":1661834187,"sunset":1661882248,"temp":{"day":299.66,"min":288.93,"max":299.66,"night":290.31,"eve":297.16,"morn":288.93},"feels_like":{"day":299.66,"night":290.3,"eve":297.1,"morn":288.73},"pressure":1017,"humidity":44,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":2.7,"deg":209,"gust":3.58,"clouds":53,"pop":0.7,"rain":2.51},{"dt":1661943600,"sunrise":1661920656,"sunset":1661968542,"temp":{"day":295.76,"min":287.73,"max":295.76,"night":289.37,"eve":292.76,"morn":287.73},"feels_like":{"day":295.64,"night":289.45,"eve":292.97,"morn":287.59},"pressure":1014,"humidity":60,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":2.29,"deg":215,"gust":3.27,"clouds":66,"pop":0.82,"rain":5.32},{"dt":1662030000,"sunrise":1662007126,"sunset":1662054835,"temp":{"day":293.38,"min":287.06,"max":293.38,"night":287.06,"eve":289.01,"morn":287.84},"feels_like":{"day":293.31,"night":287.01,"eve":289.05,"morn":287.85},"pressure":1014,"humidity":71,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":2.67,"deg":60,"gust":2.66,"clouds":97,"pop":0.84,"rain":4.49}]

class Forecast16WeatherModel extends Forecast16WeatherEntity {
  Forecast16WeatherModel({
    super.city,
    super.cod,
    super.message,
    super.cnt,
    super.list,
  });

  factory Forecast16WeatherModel.fromJson(dynamic json) {
    List<dayList> list = [];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(dayList.fromJson(v));
      });
    }
    return Forecast16WeatherModel(
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],

      list: list,
    );
  }

  Forecast16WeatherModel copyWith({
    City? city,
    String? cod,
    num? message,
    num? cnt,
    List<dayList>? list,
  }) =>
      Forecast16WeatherModel(
        city: city ?? this.city,
        cod: cod ?? this.cod,
        message: message ?? this.message,
        cnt: cnt ?? this.cnt,
        list: list ?? this.list,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// dt : 1661857200
/// sunrise : 1661834187
/// sunset : 1661882248
/// temp : {"day":299.66,"min":288.93,"max":299.66,"night":290.31,"eve":297.16,"morn":288.93}
/// feels_like : {"day":299.66,"night":290.3,"eve":297.1,"morn":288.73}
/// pressure : 1017
/// humidity : 44
/// weather : [{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]
/// speed : 2.7
/// deg : 209
/// gust : 3.58
/// clouds : 53
/// pop : 0.7
/// rain : 2.51

class dayList {
  dayList({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
    this.pop,
    this.rain,
  });

  dayList.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
    clouds = json['clouds'];
    pop = json['pop'];
    rain = json['rain'];
  }

  num? dt;
  num? sunrise;
  num? sunset;
  Temp? temp;
  FeelsLike? feelsLike;
  num? pressure;
  num? humidity;
  List<Weather>? weather;
  num? speed;
  num? deg;
  num? gust;
  num? clouds;
  num? pop;
  num? rain;

  dayList copyWith({
    num? dt,
    num? sunrise,
    num? sunset,
    Temp? temp,
    FeelsLike? feelsLike,
    num? pressure,
    num? humidity,
    List<Weather>? weather,
    num? speed,
    num? deg,
    num? gust,
    num? clouds,
    num? pop,
    num? rain,
  }) =>
      dayList(
        dt: dt ?? this.dt,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        weather: weather ?? this.weather,
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
        gust: gust ?? this.gust,
        clouds: clouds ?? this.clouds,
        pop: pop ?? this.pop,
        rain: rain ?? this.rain,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    if (temp != null) {
      map['temp'] = temp?.toJson();
    }
    if (feelsLike != null) {
      map['feels_like'] = feelsLike?.toJson();
    }
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    map['clouds'] = clouds;
    map['pop'] = pop;
    map['rain'] = rain;
    return map;
  }
}

/// id : 500
/// main : "Rain"
/// description : "light rain"
/// icon : "10d"

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  num? id;
  String? main;
  String? description;
  String? icon;

  Weather copyWith({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// day : 299.66
/// night : 290.3
/// eve : 297.1
/// morn : 288.73

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  FeelsLike.fromJson(dynamic json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  num? day;
  num? night;
  num? eve;
  num? morn;

  FeelsLike copyWith({
    num? day,
    num? night,
    num? eve,
    num? morn,
  }) =>
      FeelsLike(
        day: day ?? this.day,
        night: night ?? this.night,
        eve: eve ?? this.eve,
        morn: morn ?? this.morn,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

/// day : 299.66
/// min : 288.93
/// max : 299.66
/// night : 290.31
/// eve : 297.16
/// morn : 288.93

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  Temp.fromJson(dynamic json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  num? day;
  num? min;
  num? max;
  num? night;
  num? eve;
  num? morn;

  Temp copyWith({
    num? day,
    num? min,
    num? max,
    num? night,
    num? eve,
    num? morn,
  }) =>
      Temp(
        day: day ?? this.day,
        min: min ?? this.min,
        max: max ?? this.max,
        night: night ?? this.night,
        eve: eve ?? this.eve,
        morn: morn ?? this.morn,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['min'] = min;
    map['max'] = max;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

/// id : 3163858
/// name : "Zocca"
/// coord : {"lon":10.99,"lat":44.34}
/// country : "IT"
/// population : 4593
/// timezone : 7200

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  num? id;
  String? name;
  Coord? coord;
  String? country;
  num? population;
  num? timezone;

  City copyWith({
    num? id,
    String? name,
    Coord? coord,
    String? country,
    num? population,
    num? timezone,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        coord: coord ?? this.coord,
        country: country ?? this.country,
        population: population ?? this.population,
        timezone: timezone ?? this.timezone,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    map['country'] = country;
    map['population'] = population;
    map['timezone'] = timezone;
    return map;
  }
}

/// lon : 10.99
/// lat : 44.34

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  num? lon;
  num? lat;

  Coord copyWith({
    num? lon,
    num? lat,
  }) =>
      Coord(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
