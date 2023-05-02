import 'package:weathery/features/feature_weather/domain/entities/forecast_days_entity.dart';

/// lat : 39.31
/// lon : -74.5
/// timezone : "America/New_York"
/// timezone_offset : -18000
/// current : {"dt":1646318698,"sunrise":1646306882,"sunset":1646347929,"temp":282.21,"feels_like":278.41,"pressure":1014,"humidity":65,"dew_point":275.99,"uvi":2.55,"clouds":40,"visibility":10000,"wind_speed":8.75,"wind_deg":360,"wind_gust":13.89,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]}
/// minutely : [{"dt":1646318700,"precipitation":0}]
/// hourly : [{"dt":1646316000,"temp":281.94,"feels_like":278.49,"pressure":1014,"humidity":67,"dew_point":276.16,"uvi":1.49,"clouds":52,"visibility":10000,"wind_speed":7.16,"wind_deg":313,"wind_gust":10.71,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"pop":0.03}]
/// daily : [{"dt":1646326800,"sunrise":1646306882,"sunset":1646347929,"moonrise":1646309880,"moonset":1646352120,"moon_phase":0.03,"temp":{"day":281.63,"min":271.72,"max":282.21,"night":271.72,"eve":277.99,"morn":280.92},"feels_like":{"day":277.83,"night":264.72,"eve":273.35,"morn":277.66},"pressure":1016,"humidity":55,"dew_point":273.12,"wind_speed":9.29,"wind_deg":3,"wind_gust":16.48,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":49,"pop":0.25,"rain":0.11,"uvi":3.38}]
/// alerts : [{"sender_name":"NWS Philadelphia - Mount Holly (New Jersey, Delaware, Southeastern Pennsylvania)","event":"Small Craft Advisory","start":1646344800,"end":1646380800,"description":"...SMALL CRAFT ADVISORY REMAINS IN EFFECT FROM 5 PM THIS\nAFTERNOON TO 3 AM EST FRIDAY...\n* WHAT...North winds 15 to 20 kt with gusts up to 25 kt and seas\n3 to 5 ft expected.\n* WHERE...Coastal waters from Little Egg Inlet to Great Egg\nInlet NJ out 20 nm, Coastal waters from Great Egg Inlet to\nCape May NJ out 20 nm and Coastal waters from Manasquan Inlet\nto Little Egg Inlet NJ out 20 nm.\n* WHEN...From 5 PM this afternoon to 3 AM EST Friday.\n* IMPACTS...Conditions will be hazardous to small craft.","tags":[]}]

class ForecastDayModel extends ForecastDaysEntity {
  const ForecastDayModel({
    num? lat,
    num? lon,
    String? timezone,
    num? timezoneOffset,
    Current? current,
    List<Daily>? daily,
    List<Alerts>? alerts,
  }) : super(
            lat: lat,
            lon: lon,
            timezone: timezone,
            timezoneOffset: timezoneOffset,
            current: current,
            daily: daily,
            alerts: alerts);

  factory ForecastDayModel.fromJson(dynamic json) {
    /// convert daily from json
    List<Daily> daily = [];
    if (json['daily'] != null) {
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }

    /// convert alerts from json
    List<Alerts> alerts = [];
    if (json['alerts'] != null) {
      json['alerts'].forEach((v) {
        alerts.add(Alerts.fromJson(v));
      });
    }

    return ForecastDayModel(
        lat: json['lat'] as num,
        lon: json['lon'] as num,
        timezone: json['timezone'],
        timezoneOffset: json['timezone_offset'] as num,
        current:
            json['current'] != null ? Current.fromJson(json['current']) : null,
        daily: daily,
        alerts: alerts);
  }

  ForecastDayModel copyWith({
    num? lat,
    num? lon,
    String? timezone,
    num? timezoneOffset,
    Current? current,
    List<Daily>? daily,
    List<Alerts>? alerts,
  }) =>
      ForecastDayModel(
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        timezone: timezone ?? this.timezone,
        timezoneOffset: timezoneOffset ?? this.timezoneOffset,
        current: current ?? this.current,
        daily: daily ?? this.daily,
        alerts: alerts ?? this.alerts,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone'] = timezone;
    map['timezone_offset'] = timezoneOffset;
    if (current != null) {
      map['current'] = current?.toJson();
    }
    if (daily != null) {
      map['daily'] = daily?.map((v) => v.toJson()).toList();
    }
    if (alerts != null) {
      map['alerts'] = alerts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// sender_name : "NWS Philadelphia - Mount Holly (New Jersey, Delaware, Southeastern Pennsylvania)"
/// event : "Small Craft Advisory"
/// start : 1646344800
/// end : 1646380800
/// description : "...SMALL CRAFT ADVISORY REMAINS IN EFFECT FROM 5 PM THIS\nAFTERNOON TO 3 AM EST FRIDAY...\n* WHAT...North winds 15 to 20 kt with gusts up to 25 kt and seas\n3 to 5 ft expected.\n* WHERE...Coastal waters from Little Egg Inlet to Great Egg\nInlet NJ out 20 nm, Coastal waters from Great Egg Inlet to\nCape May NJ out 20 nm and Coastal waters from Manasquan Inlet\nto Little Egg Inlet NJ out 20 nm.\n* WHEN...From 5 PM this afternoon to 3 AM EST Friday.\n* IMPACTS...Conditions will be hazardous to small craft."
/// tags : []

class Alerts {
  Alerts({
    this.senderName,
    this.event,
    this.start,
    this.end,
    this.description,
    this.tags,
  });

  Alerts.fromJson(dynamic json) {
    senderName = json['sender_name'];
    event = json['event'];
    start = json['start'];
    end = json['end'];
    description = json['description'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }

  String? senderName;
  String? event;
  num? start;
  num? end;
  String? description;
  List<dynamic>? tags;

  Alerts copyWith({
    String? senderName,
    String? event,
    num? start,
    num? end,
    String? description,
    List<dynamic>? tags,
  }) =>
      Alerts(
        senderName: senderName ?? this.senderName,
        event: event ?? this.event,
        start: start ?? this.start,
        end: end ?? this.end,
        description: description ?? this.description,
        tags: tags ?? this.tags,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sender_name'] = senderName;
    map['event'] = event;
    map['start'] = start;
    map['end'] = end;
    map['description'] = description;
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// dt : 1646326800
/// sunrise : 1646306882
/// sunset : 1646347929
/// moonrise : 1646309880
/// moonset : 1646352120
/// moon_phase : 0.03
/// temp : {"day":281.63,"min":271.72,"max":282.21,"night":271.72,"eve":277.99,"morn":280.92}
/// feels_like : {"day":277.83,"night":264.72,"eve":273.35,"morn":277.66}
/// pressure : 1016
/// humidity : 55
/// dew_point : 273.12
/// wind_speed : 9.29
/// wind_deg : 3
/// wind_gust : 16.48
/// weather : [{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]
/// clouds : 49
/// pop : 0.25
/// rain : 0.11
/// uvi : 3.38

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  Daily.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    pop = json['pop'];
    rain = json['rain'];
    uvi = json['uvi'];
  }

  num? dt;
  num? sunrise;
  num? sunset;
  num? moonrise;
  num? moonset;
  num? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? windSpeed;
  num? windDeg;
  num? windGust;
  List<Weather>? weather;
  num? clouds;
  num? pop;
  num? rain;
  num? uvi;

  Daily copyWith({
    num? dt,
    num? sunrise,
    num? sunset,
    num? moonrise,
    num? moonset,
    num? moonPhase,
    Temp? temp,
    FeelsLike? feelsLike,
    num? pressure,
    num? humidity,
    num? dewPoint,
    num? windSpeed,
    num? windDeg,
    num? windGust,
    List<Weather>? weather,
    num? clouds,
    num? pop,
    num? rain,
    num? uvi,
  }) =>
      Daily(
        dt: dt ?? this.dt,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        moonrise: moonrise ?? this.moonrise,
        moonset: moonset ?? this.moonset,
        moonPhase: moonPhase ?? this.moonPhase,
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        dewPoint: dewPoint ?? this.dewPoint,
        windSpeed: windSpeed ?? this.windSpeed,
        windDeg: windDeg ?? this.windDeg,
        windGust: windGust ?? this.windGust,
        weather: weather ?? this.weather,
        clouds: clouds ?? this.clouds,
        pop: pop ?? this.pop,
        rain: rain ?? this.rain,
        uvi: uvi ?? this.uvi,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moon_phase'] = moonPhase;
    if (temp != null) {
      map['temp'] = temp?.toJson();
    }
    if (feelsLike != null) {
      map['feels_like'] = feelsLike?.toJson();
    }
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['clouds'] = clouds;
    map['pop'] = pop;
    map['rain'] = rain;
    map['uvi'] = uvi;
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

/// day : 277.83
/// night : 264.72
/// eve : 273.35
/// morn : 277.66

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

/// day : 281.63
/// min : 271.72
/// max : 282.21
/// night : 271.72
/// eve : 277.99
/// morn : 280.92

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

class Minutely {
  Minutely({
    this.dt,
    this.precipitation,
  });

  Minutely.fromJson(dynamic json) {
    dt = json['dt'];
    precipitation = json['precipitation'];
  }

  num? dt;
  num? precipitation;

  Minutely copyWith({
    num? dt,
    num? precipitation,
  }) =>
      Minutely(
        dt: dt ?? this.dt,
        precipitation: precipitation ?? this.precipitation,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['precipitation'] = precipitation;
    return map;
  }
}

/// dt : 1646318698
/// sunrise : 1646306882
/// sunset : 1646347929
/// temp : 282.21
/// feels_like : 278.41
/// pressure : 1014
/// humidity : 65
/// dew_point : 275.99
/// uvi : 2.55
/// clouds : 40
/// visibility : 10000
/// wind_speed : 8.75
/// wind_deg : 360
/// wind_gust : 13.89
/// weather : [{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });

  Current.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
  }

  num? dt;
  num? sunrise;
  num? sunset;
  num? temp;
  num? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? uvi;
  num? clouds;
  num? visibility;
  num? windSpeed;
  num? windDeg;
  num? windGust;
  List<Weather>? weather;

  Current copyWith({
    num? dt,
    num? sunrise,
    num? sunset,
    num? temp,
    num? feelsLike,
    num? pressure,
    num? humidity,
    num? dewPoint,
    num? uvi,
    num? clouds,
    num? visibility,
    num? windSpeed,
    num? windDeg,
    num? windGust,
    List<Weather>? weather,
  }) =>
      Current(
        dt: dt ?? this.dt,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        dewPoint: dewPoint ?? this.dewPoint,
        uvi: uvi ?? this.uvi,
        clouds: clouds ?? this.clouds,
        visibility: visibility ?? this.visibility,
        windSpeed: windSpeed ?? this.windSpeed,
        windDeg: windDeg ?? this.windDeg,
        windGust: windGust ?? this.windGust,
        weather: weather ?? this.weather,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['uvi'] = uvi;
    map['clouds'] = clouds;
    map['visibility'] = visibility;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 802
/// main : "Clouds"
/// description : "scattered clouds"
/// icon : "03d"
