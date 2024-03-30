import 'package:flutter/material.dart';

class JobViewPage extends StatelessWidget {
  final Map<String, dynamic> job;

  JobViewPage({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['Position'] ?? 'No title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Description'),
                subtitle: Text(job['description'] ?? 'No description'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Line of Service'),
                subtitle: Text(job['lineOfService'] ?? 'No line of service'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Industry/Sector'),
                subtitle: Text(job['industrySector'] ?? 'No industry/sector'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Specialism'),
                subtitle: Text(job['specialism'] ?? 'No specialism'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Management Level'),
                subtitle: Text(job['managementLevel'] ?? 'No management level'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Job Description & Summary'),
                subtitle: Text(job['jobDescriptionSummary'] ?? 'No job description & summary'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Preferred Skills'),
                subtitle: Text(job['preferredSkills'] ?? 'No preferred skills'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Minimum Years Experience Required'),
                subtitle: Text(job['minimumYearsExperienceRequired'] ?? 'No minimum years experience required'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Education'),
                subtitle: Text(job['education'] ?? 'No education'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Certifications'),
                subtitle: Text(job['certifications'] ?? 'No certifications'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Required Skills'),
                subtitle: Text(job['requiredSkills'] ?? 'No required skills'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Optional Skills'),
                subtitle: Text(job['optionalSkills'] ?? 'No optional skills'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Desired Languages'),
                subtitle: Text(job['desiredLanguages'] ?? 'No desired languages'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Travel Requirements'),
                subtitle: Text(job['travelRequirements'] ?? 'No travel requirements'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Email'),
                subtitle: Text(job['emailToConnect'] ?? 'No email'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}