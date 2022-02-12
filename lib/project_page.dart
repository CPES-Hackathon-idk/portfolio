import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage(
      {Key? key,
      required this.name,
      required this.image,
      required this.description})
      : super(key: key);
  final String name;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: name,
                child: Image.asset(image, ),
              ),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
