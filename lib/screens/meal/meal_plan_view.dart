import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/tab_button.dart';
import 'package:flutter/material.dart';

class MealPlanView extends StatefulWidget {
  const MealPlanView({Key? key}) : super(key: key);

  @override
  State<MealPlanView> createState() => _MealPlanViewState();
}

class _MealPlanViewState extends State<MealPlanView> {
  int isActiveTab = 0;
  String searchText = '';
  String selectedCategory = 'Breakfast';
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> mealArr = [
    {
      "category": "Breakfast",
      "name": "Nasi Lemak",
      "image": "assets/nasi lemak.jpeg",
      "title": "Nasi Lemak",
      "calories": 350,
      "fat": 15,
      "recommendedAmount": "1 plate"
    },
    {
      "category": "Breakfast",
      "name": "Roti Canai",
      "image": "assets/roti_canai.jpg",
      "title": "Roti Canai",
      "calories": 318,
      "fat": 11,
      "recommendedAmount": "1 plate"
    },
    {
      "category": "Breakfast",
      "name": "Bubur Ayam",
      "image": "assets/bubur.jpeg",
      "title": "Bubur",
      "calories": 333,
      "fat": 11,
      "recommendedAmount": "1 plate"
    },
    {
      "category": "Lunch",
      "name": "Nasi Kerabu",
      "image": "assets/nasi_kerabu.jpg",
      "title": "Nasi Kerabu",
      "calories": 450,
      "fat": 20,
      "recommendedAmount": "1 serving"
    },
    {
      "category": "Lunch",
      "name": "Nasi Goreng",
      "image": "assets/nasi_goreng.jpg",
      "title": "Nasi Goreng",
      "calories": 637,
      "fat": 25,
      "recommendedAmount": "1 serving"
    },
    {
      "category": "Lunch",
      "name": "Laksa Penang",
      "image": "assets/laksa_penang.jpg",
      "title": "Laksa Penang",
      "calories": 377,
      "fat": 2,
      "recommendedAmount": "1 serving"
    },
    {
      "category": "Lunch",
      "name": "Satay Ayam / Daging",
      "image": "assets/satay.jpg",
      "title": "Satay Ayam / Daging",
      "calories": 47,
      "fat": 1.4,
      "recommendedAmount": "2 serving"
    },
    {
      "category": "Snack",
      "name": "Snacks",
      "image": "assets/snacks.jpeg",
      "title": "Snacks",
      "calories": 200,
      "fat": 10,
      "recommendedAmount": "1 packet"
    },
    {
      "category": "Dinner",
      "name": "Mee goreng Mamak",
      "image": "assets/mee.jpg",
      "title": "Mee goreng Mamak",
      "calories": 500,
      "fat": 25,
      "recommendedAmount": "1 plate"
    },
    {
      "category": "Dinner",
      "name": "MeeHun Goreng",
      "image": "assets/meehoon.jpg",
      "title": "MeeHun Goreng",
      "calories": 588,
      "fat": 23,
      "recommendedAmount": "1 plate"
    },
    {
      "category": "Dinner",
      "name": "Tomyam Seafood",
      "image": "assets/tomyam.jpg",
      "title": "Tomyam Seafood",
      "calories": 285,
      "fat": 19,
      "recommendedAmount": "1 plate"
    },
    {
      "category": "Dinner",
      "name": "Nasi Goreng",
      "image": "assets/nasi_goreng.jpg",
      "title": "Nasi Goreng",
      "calories": 637,
      "fat": 25,
      "recommendedAmount": "1 serving"
    },
  ];

  List<Map<String, dynamic>> get filteredMeals {
    return mealArr
        .where((meal) =>
    meal["category"] == selectedCategory &&
        meal["title"].toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          "Meal Plan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TabButton2(
                    title: "Breakfast",
                    isActive: isActiveTab == 0,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 0;
                        selectedCategory = "Breakfast";
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton2(
                    title: "Lunch",
                    isActive: isActiveTab == 1,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 1;
                        selectedCategory = "Lunch";
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton2(
                    title: "Snack",
                    isActive: isActiveTab == 2,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 2;
                        selectedCategory = "Snack";
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton2(
                    title: "Dinner",
                    isActive: isActiveTab == 3,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 3;
                        selectedCategory = "Dinner";
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filteredMeals.length,
              itemBuilder: (context, index) {
                var meal = filteredMeals[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          meal["image"].toString(),
                          width: media.width,
                          height: media.width * 0.55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        meal["name"],
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        meal["title"],
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Calories: ${meal["calories"]} kcal",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Fat: ${meal["fat"]} g",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Recommended Amount: ${meal["recommendedAmount"]}",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
