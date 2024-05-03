import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  final List<Map<String, dynamic>> _allusers = [
    {
      "image": "assets/images/5.jpg",
      "name": "Sumeet joshi",
      "location": "Delhi",
      "companyName": "Hyperlink InfoSystem",
    },
    {
      "image": "assets/images/4.jpg",
      "name": "Aarav kumar",
      "location": "Mumbai",
      "companyName": "Infosys",
    },
    {
      "image": "assets/images/6.jpg",
      "name": "Bipin sharma",
      "location": "Gujrat",
      "companyName": "Tata Consultancy Services",
    },
    {
      "image": "assets/images/7.jpg",
      "name": "Kapil Patel",
      "location": "Surat",
      "companyName": "Wipro",
    },
    {
      "image": "assets/images/8.jpg",
      "name": "Dipesh kakadiya",
      "location": "Ahemdabaad",
      "companyName": "Tech Mahindra",
    },
    {
      "image": "assets/images/3.jpg",
      "name": "Meet Bhuva",
      "location": "Rajkot",
      "companyName": "CodeX",
    },
    {
      "image": "assets/images/10.jpg",
      "name": "Amit Harsora",
      "location": "kolkata",
      "companyName": "Capagini india pvt.ltd",
    },
    {
      "image": "assets/images/11.jpg",
      "name": "Vishal Vekriya",
      "location": "Jamnagar",
      "companyName": "Tata techno",
    },
    {
      "image": "assets/images/2.jpg",
      "name": "Mohit Mer",
      "location": "Mumbai,india",
      "companyName": "Tata techno",
    },
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = _allusers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
    } else {
      results = _allusers
          .where((user) =>
              user['name'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff202020),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Transform.translate(
                offset: const Offset(-57, 0),
                child: const Text(
                  'Search for your saved companies here',
                  style: TextStyle(
                    color: Color(0xffA995CE),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextField(
                        onChanged: (value) {
                          _runFilter(value);
                        },
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Search',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          prefixIconColor: Colors.grey,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      height: screenHeight * 0.048,
                      width: screenWidth * 0.24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff8861D4),
                      ),
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: screenHeight * 0.048,
                      width: screenWidth * 0.35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Recently Visited',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: screenHeight * 0.048,
                      width: screenWidth * 0.22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Saved',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Expanded(
                child: _foundUsers.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) => Dismissible(
                          key: ValueKey<String>(_foundUsers[index]['name']),
                          child: Container(
                            height: screenHeight * 0.17,
                            width: 200,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.8),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(9, 9),
                                  color: Color(0xff353C4A),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Transform.translate(
                                    offset: const Offset(-10, 35),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                        _foundUsers[index]['image'],
                                      ),
                                    ),
                                  ),
                                  title: Transform.translate(
                                    offset: const Offset(5, 10),
                                    child: Text(
                                      _foundUsers[index]['name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  trailing: Transform.translate(
                                    offset: const Offset(10, 70),
                                    child: SizedBox(
                                      height: 35,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color(0xff8861D4),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Icon(
                                          FontAwesomeIcons.download,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 90,
                                    ),
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Transform.translate(
                                      offset: const Offset(-25, 0),
                                      child: Text(
                                        _foundUsers[index]['location'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Align(
                        child: Text(
                          "No Result found",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
