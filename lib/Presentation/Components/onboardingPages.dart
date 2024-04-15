import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> onboardingPages = [
  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 30), // Adjust this value to move the title down
        Text(
          "Velkommen til Compassion App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10), // Adjust this value to move the body down
        Text(
          "Page 1 Body",
          style: TextStyle(
            fontSize: 18,
            color: Constants.kWhiteColor
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    image: const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.0), // Adjust this value to move the image down
        child: SizedBox(
          width: 200, // Specify the desired width
          height: 200, // Specify the desired height
          child: Image(
              image: AssetImage('assets/logos/compassionLogo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ),

  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100), // Adjust this value to move the title down
        Text(
          "Øvelser og meditationer",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50), // Adjust this value to move the body down
        Text(
          "Page 2 Body",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    ),
  ),

  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100), // Adjust this value to move the title down
        Text(
          "Dagbog",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50), // Adjust this value to move the body down
        Text(
          "Page 3 Body",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    ),
  ),

  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100), // Adjust this value to move the title down
        Text(
          "Kollegacafé",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50), // Adjust this value to move the body down
        Text(
          "Page 4 Body",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    ),
  ),

/*  PageViewModel(
    titleWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100), // Adjust this value to move the title down
        Text(
          "Om Compassion?",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    bodyWidget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50), // Adjust this value to move the body down
        Text(
          "Page 5 Body",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    ),
  ),// Add more pages as needed*/
];
