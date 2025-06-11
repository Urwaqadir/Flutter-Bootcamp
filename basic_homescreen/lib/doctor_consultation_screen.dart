import 'package:flutter/material.dart';

class DoctorConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.health_and_safety, color: Colors.blue),
            SizedBox(width: 5),
            Text("MediEase", style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search for specialist",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Upcoming Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("Calendar", style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 10),

            // Upcoming Card
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.jpg"), 
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Max Goodwin", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("General Consultation"),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.video_call ,color: Colors.white,),
                    label: Text("Connect" ,style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      minimumSize: Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("Show All", style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryItem(Icons.medical_services, "General"),
                categoryItem(Icons.favorite, "Heart"),
                categoryItem(Icons.remove_red_eye, "Eyes"),
              ],
            ),
            SizedBox(height: 20),

            // Rate your doctors
            Text("Rate your doctors", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  doctorListItem("Max Goodwin", "General Consultation"),
                  doctorListItem("Helen Sharp", "General Consultation"),
                  doctorListItem("Max Goodwin", "General Consultation"),
                  doctorListItem("Helen Sharp", "General Consultation"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget doctorListItem(String name, String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/images/avatar.jpg"),
      ),
      title: Text(name),
      subtitle: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}  