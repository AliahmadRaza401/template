import 'package:aiidar_restaurant_app/utils/app_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  getRestaurantByUserId() async {
    QuerySnapshot snapshot=await  FirebaseFirestore.instance
        .collection('restaurant')
        .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
        .get();
    if (snapshot !=null){
      GetStorage().writeIfNull('restId', snapshot.docs[0]['rest_id']);
      print('restaturant of the user is ${GetStorage().read('restId')}');
    }
  }
  static  List<Widget> _widgetOptions = <Widget>[
    Text('data'),
    Text('data'),
    Text('data'),
    Text('data'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
@override
  void initState() {
    getRestaurantByUserId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png',height: 24,color:_selectedIndex==0 ?AppColors.primaryColor:AppColors.darkGreyColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/cart.png',height: 20,color:_selectedIndex==1 ?AppColors.primaryColor:AppColors.darkGreyColor),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/fvrt.png',height: 24,color:_selectedIndex==2?AppColors.primaryColor:AppColors.darkGreyColor),

            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profile.png',height: 24,color:_selectedIndex==3 ?AppColors.primaryColor:AppColors.darkGreyColor),

            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColors.darkGreyColor,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
