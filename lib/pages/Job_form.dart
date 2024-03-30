import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobFormPage extends StatefulWidget {
  @override
  _JobFormPageState createState() => _JobFormPageState();
}

class _JobFormPageState extends State<JobFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _lineOfServiceController =
      TextEditingController();
  final TextEditingController _industrySectorController =
      TextEditingController();
  final TextEditingController _specialismController = TextEditingController();
  final TextEditingController _managementLevelController =
      TextEditingController();
  final TextEditingController _jobDescriptionSummaryController =
      TextEditingController();
  final TextEditingController _preferredSkillsController =
      TextEditingController();
  final TextEditingController _minimumYearsExperienceRequiredController =
      TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _certificationsController =
      TextEditingController();
  final TextEditingController _requiredSkillsController =
      TextEditingController();
  final TextEditingController _optionalSkillsController =
      TextEditingController();
  final TextEditingController _desiredLanguagesController =
      TextEditingController();
  final TextEditingController _travelRequirementsController =
      TextEditingController();
  final TextEditingController _emailToConnectController =
      TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    _lineOfServiceController.dispose();
    _industrySectorController.dispose();
    _specialismController.dispose();
    _managementLevelController.dispose();
    _jobDescriptionSummaryController.dispose();
    _preferredSkillsController.dispose();
    _minimumYearsExperienceRequiredController.dispose();
    _educationController.dispose();
    _certificationsController.dispose();
    _requiredSkillsController.dispose();
    _optionalSkillsController.dispose();
    _desiredLanguagesController.dispose();
    _travelRequirementsController.dispose();
    _emailToConnectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job Form'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            // Add TextFormField for each field
            _buildTextField(_descriptionController, 'Description'),
            _buildTextField(_lineOfServiceController, 'Line of Service'),
            _buildTextField(_industrySectorController, 'Industry/Sector'),
            _buildTextField(_specialismController, 'Specialism'),
            _buildTextField(_managementLevelController, 'Management Level'),
            _buildTextField(
                _jobDescriptionSummaryController, 'Job Description & Summary'),
            _buildTextField(_preferredSkillsController, 'Preferred skills'),
            _buildTextField(_minimumYearsExperienceRequiredController,
                'Minimum years experience required'),
            _buildTextField(_educationController, 'Education'),
            _buildTextField(_certificationsController, 'Certifications'),
            _buildTextField(_requiredSkillsController, 'Required Skills'),
            _buildTextField(_optionalSkillsController, 'Optional Skills'),
            _buildTextField(_desiredLanguagesController, 'Desired Languages'),
            _buildTextField(
                _travelRequirementsController, 'Travel Requirements'),
            _buildTextField(_emailToConnectController, 'Email to connect'),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Check if job already exists in 'work' collection
                  final snapshot = await FirebaseFirestore.instance
                      .collection('work')
                      .where('description',
                          isEqualTo: _descriptionController.text)
                      .where('lineOfService',
                          isEqualTo: _lineOfServiceController.text)
                      // Add more where clauses for each field
                      .get();

                  if (snapshot.docs.isEmpty) {
                    // Job doesn't exist, add new job to 'work' collection
                    await FirebaseFirestore.instance.collection('work').add({
                      'description': _descriptionController.text,
                      'lineOfService': _lineOfServiceController.text,
                      'industrySector': _industrySectorController.text,
                      'specialism': _specialismController.text,
                      'managementLevel': _managementLevelController.text,
                      'jobDescriptionSummary':
                          _jobDescriptionSummaryController.text,
                      'preferredSkills': _preferredSkillsController.text,
                      'minimumYearsExperienceRequired':
                          _minimumYearsExperienceRequiredController.text,
                      'education': _educationController.text,
                      'certifications': _certificationsController.text,
                      'requiredSkills': _requiredSkillsController.text,
                      'optionalSkills': _optionalSkillsController.text,
                      'desiredLanguages': _desiredLanguagesController.text,
                      'travelRequirements': _travelRequirementsController.text,
                      'emailToConnect': _emailToConnectController.text,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Job added successfully')),
                    );
                  } else {
                    // Job already exists, show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Job already exists')),
                    );
                  }
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a $label';
        }
        return null;
      },
    );
  }
}
