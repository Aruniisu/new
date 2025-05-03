import 'package:flutter/material.dart';

class FreeCoursesScreen extends StatelessWidget {
  const FreeCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Courses"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        ),
      ),
    );
  }
}

class Course {
  final String title;
  final Color backgroundColor;
  Course({required this.title, required this.backgroundColor});
}

List<Course> courses = [
  Course(title: "Spoken English", backgroundColor: Colors.orange),
  Course(title: "English Writing", backgroundColor: Colors.green),
  Course(title: "Python for Beginners", backgroundColor: Colors.blue),
  Course(title: "Web Development", backgroundColor: Colors.purple),
];

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: course.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              course.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
