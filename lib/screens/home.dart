import 'package:cli_wea/data/imgpath.dart';
import 'package:cli_wea/services/location_p.dart';
import 'package:cli_wea/services/weather_servP.dart';
import 'package:cli_wea/utils/apptext.dart';
import 'package:cli_wea/utils/customDiv.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.determinePosition().then((_) {
      if (locationProvider.currentLocationName != null) {
        var city = locationProvider.currentLocationName!.locality;
        if (city != null) {
          Provider.of<WeatherServiceProvider>(context, listen: false)
              .fetchWeatherDataByCity(city.toString());
        }
      }
    });

    super.initState();
  }

  TextEditingController _cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final locationProvider = Provider.of<LocationProvider>(context);

    final weatherProvider = Provider.of<WeatherServiceProvider>(context);
// Inside the build method of your _HomePageState class

    0; // Replace 0 with a default timestamp if needed

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 206, 146, 146),
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 20),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      background[weatherProvider.weather?.weather![0].main ??
                              "N/A"] ??
                          "assets/img/def.webp",
                    ))),
            child: Stack(children: [
              Container(
                height: 50,
                child: Consumer<LocationProvider>(
                    builder: (context, LocationProvider, child) {
                  var locationCity;
                  if (locationProvider.currentLocationName != null) {
                    locationCity =
                        locationProvider.currentLocationName!.locality;
                  } else {
                    locationCity = "Unknown Location";
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: locationCity,
                                  color: Colors.white,
                                  fw: FontWeight.w700,
                                  size: 18,
                                ),
                                AppText(
                                  data: "Good Morning",
                                  color: Colors.white,
                                  fw: FontWeight.w400,
                                  size: 14,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Align(
                alignment: Alignment(0, -0.7),
              ),
              Align(
                  alignment: Alignment(0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        data:
                            "${weatherProvider.weather?.main?.temp?.toStringAsFixed(0)}\u00B0C", // Display temperature
                        color: Color.fromARGB(255, 239, 3, 3),
                        fw: FontWeight.bold,
                        size: 52,
                      ),
                      AppText(
                        data: weatherProvider.weather?.name ?? "N/A",
                        color: const Color.fromARGB(255, 6, 4, 4),
                        fw: FontWeight.w600,
                        size: 40,
                      ),
                      AppText(
                        data: "",
                        color: Color.fromARGB(255, 0, 0, 0),
                        fw: FontWeight.w600,
                        size: 25,
                      ),
                      AppText(
                        data: DateFormat('hh:mm a').format(DateTime.now()),
                        color: Color.fromARGB(255, 10, 8, 8),
                      )
                    ],
                  )),
              Align(
                alignment: Alignment(0.0, 0.75),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.4)),
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    data: "Temp Max",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  ),
                                  AppText(
                                    data:
                                        "${weatherProvider.weather?.main?.tempMax?.toStringAsFixed(0)}\u00B0C",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    data: "Temp Min",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  ),
                                  AppText(
                                    data:
                                        "${weatherProvider.weather?.main?.tempMin?.toStringAsFixed(0)}\u00B0C",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      CustomDivider(
                        startIndent: 20,
                        endIndent: 20,
                        color: Colors.white,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    data: "Pressure",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  ),
                                  AppText(
                                    data:
                                        "${weatherProvider.weather?.main?.pressure.toString()}",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    data: "Humidity",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  ),
                                  AppText(
                                    data:
                                        "${weatherProvider.weather?.main?.humidity.toString()}",
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Container(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: _cityController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Provider.of<WeatherServiceProvider>(context,
                                    listen: false)
                                .fetchWeatherDataByCity(
                                    _cityController.text.toString());
                          },
                          icon: Icon(Icons.search))
                    ],
                  ),
                ),
              )
            ])));
  }
}
