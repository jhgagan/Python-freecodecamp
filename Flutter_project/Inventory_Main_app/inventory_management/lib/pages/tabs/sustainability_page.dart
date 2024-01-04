import 'package:flutter/material.dart';
import 'package:inventory_management/pages/plot_pages.dart';
//import 'package:inventory_management/pages/plot_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Sustainability extends StatefulWidget {


  const Sustainability({super.key});

  @override
  State<Sustainability> createState() => _SustainabilityState();
}
 
 
 const List<String> list = <String>['Monthly plane of array irradiance', 'Monthly DC array output', 'Monthly AC system output', 'Monthly solar radiation values'];
 

class _SustainabilityState extends State<Sustainability> {

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  
  

  

  /*
    String sysCap,
    int modType,
    Double losses,
    int arrayType,
    int tilt,
    int azimuth,
    Double lat,
    Double lon,
    bool isTilt,
    bool isAzimuth,
  */
  // Module type
  int _moduleType = 0;
  int _arrayType = 1;
  
    Map<String, String> power = {'Monthly plane of array irradiance':"poa_monthly",
   'Monthly DC array output': "dc_monthly",
   'Monthly AC system output': "ac_monthly",
   'Monthly solar radiation values': "solrad_monthly"
    };
  String _userSelection = "poa_monthly" ;

  bool _validateSysCap = false;
  bool _validatelosses = false;
  bool _validatetilt = false;
  bool _validateAzimuth = false;



  String dropdownValue = list.first;

  List<double>? monthlyAc;
  
  final TextEditingController sysCap = TextEditingController();
  final TextEditingController losses = TextEditingController();
  final TextEditingController tilt = TextEditingController();
  final TextEditingController azimuth = TextEditingController();
  

  Future<List<double>> makePlot() async {  
                      return await solarForecastcall(
                      double.parse(sysCap.text),
                      _moduleType,
                      double.parse(losses.text),
                      _arrayType,
                      int.parse(tilt.text),
                      int.parse(azimuth.text),
                      _userSelection,);
                }


    // To handle the permission to get the user's location data
   Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return true;
  }


  // Function to do the api call to get the information about the expected solar power 
  // generation
  Future<List<double>> solarForecastcall (
    double sysCap,
    int modType,
    double losses,
    int arrayType,
    int tilt,
    int azimuth,
    String userSelection,
  ) async {

    //print("printing location");
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      //print("No Permissions");
    }

    final position = await _geolocatorPlatform.getCurrentPosition();

     double lat = position.latitude;
     double lon = position.longitude;

    
    //print("entered API");
    // API Call
    String url = 'https://developer.nrel.gov/api/pvwatts/v8.json?api_key=DF3vKV14cycQSvRNs2RAgGhdhREbZh6OkCZ5xprq&dataset=intl';
    String parameters = '&system_capacity=$sysCap&module_type=$modType&losses=$losses&array_type=$arrayType&lat=$lat&lon=$lon&';
    parameters+='tilt=$tilt&';
    parameters+='azimuth=$azimuth&';
    final uri = Uri.parse(url+parameters);

    //print("API CALL: $uri");
    // Waiting for the response from the API
    final response = await http.get(uri);
    
      //print("Calling API please wait");
      final body = response.body;
      // decode the call
      final outputs = jsonDecode(body);
      final acMonthlyDynamic =  outputs["outputs"];
      List<double> acMonthly = (acMonthlyDynamic[userSelection] as List).map((item) => item as double).toList();
      ////print("//printing $userSelection results below");

      ////print(acMonthly);

      return acMonthly;

  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100,),
              
              SizedBox(
                width: 300,
                child:Lottie.asset(
                      'lib/animations/solar.json',
                      repeat: true,
                      fit: BoxFit.fitWidth,
                    )
              ),
    
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  // System Capacity
    
                  TextField(
                    controller: sysCap,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText:'System Capacity (kW)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 450,
                       )
                       
                    ),
                    ),
                  
                  
                  // Module type Radio Buttons
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Standard',
                          style: TextStyle(color: Colors.white),),
                          leading: Radio<int>(
                            value: 0,
                            groupValue: _moduleType,
                            onChanged: (value) {
                              setState(() {
                                _moduleType = 0;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.orange.withOpacity(.32);
                              }
                              return Colors.orange;
                            })
                          ),
                        ),
                      ),
    
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Premium',
                          style: TextStyle(color: Colors.white),),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: _moduleType,
                            onChanged: (value) {
                              setState(() {
                                _moduleType = 1;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.yellow.withOpacity(.32);
                              }
                              return Colors.yellow;
                            })
                          ),
                        ),
                      ),
    
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Thin Film',
                          style: TextStyle(color: Colors.white),),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: _moduleType,
                            onChanged: (value) {
                              setState(() {
                                _moduleType = 2;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.green.withOpacity(.32);
                              }
                              return Colors.green;
                            })
                          ),
                        ),
                      ),
                    ],
                  ),
    
    
              // System Losses
              TextField(
                    controller: losses,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText:'System Loses (%)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 450,
                       )
                    ),
                    ),
    
              // Array Type
              Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Fixed - Open Rack',
                          style: TextStyle(color: Colors.white),),
                          leading: Radio<int>(
                            value: 0,
                            groupValue: _arrayType,
                            onChanged: (value) {
                              setState(() {
                                _arrayType = 0;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.white.withOpacity(.32);
                              }
                              return Colors.white;
                            })
                          ),
                        ),
                      ),
    
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Fixed - Roof Mounted',
                          style: TextStyle(color: Colors.white),),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: _arrayType,
                            onChanged: (value) {
                              setState(() {
                                _arrayType = 1;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.white.withOpacity(.32);
                              }
                              return Colors.white;
                            })
                          ),
                        ),
                      ),
                    ],
                  ),
    
                  Row(children: [
                    Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Axis',
                          style: TextStyle(color: Colors.white),),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: _arrayType,
                            onChanged: (value) {
                              setState(() {
                                _arrayType = 2;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.blue.withOpacity(.32);
                              }
                              return Colors.blue;
                            })
                          ),
                        ),
                      ),
    
                       Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Axis - Backtracking',
                          style: TextStyle(color: Colors.white),),
                          leading: Radio<int>(
                            value: 3,
                            groupValue: _arrayType,
                            onChanged: (value) {
                              setState(() {
                                _arrayType = 3;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.blue.withOpacity(.32);
                              }
                              return Colors.blue;
                            })
                          ),
                        ),
                      ),
                  ],),
    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                    controller: tilt,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText:'Tile (degrees)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 220,
                       )
                    ),
                    ),
    
                    TextField(
                    controller: azimuth,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText:'Azimuth (degrees)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 220,
                       )
                    ),
                    ),
                    ],
                  ),
                  
                  // Drop down menu to select the type of graph data
                  DropdownButton<String>(
                    value: dropdownValue,
                    dropdownColor: Colors.grey,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                        _userSelection = power[value] as String;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                 
                ],
              ),

              const SizedBox(height:50),
    
              FloatingActionButton(
                  onPressed: () async {
                    setState(() {
                    _validateSysCap = sysCap.text.isEmpty;
                    _validateAzimuth = azimuth.text.isEmpty;
                    _validatelosses = losses.text.isEmpty;
                    _validatetilt = tilt.text.isEmpty;
                    });


                    if(!(_validateAzimuth | _validateSysCap | _validatelosses | _validatetilt))
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                            );
                        }, 
                      );

                      try{
                        
                        monthlyAc = await makePlot();

                      }
                      finally{
                      Navigator.pop(context);
                      if (monthlyAc != null)
                      {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Plots(acMonthly: monthlyAc!),),);
                      }
                      }
                    }
                    else{
                      showDialog(context: context, builder: (context) {
                        return const AlertDialog(
                          backgroundColor: Colors.redAccent,
                          title: Text(
                            'Error. Fill all the Fields and try again.', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        );
                      },);
                    }
                    
                  },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.solar_power),
                ),
              

              

              
            ],
          ),
    );
  }


} 
 