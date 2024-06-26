import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobFormPage extends StatefulWidget {
  const JobFormPage({super.key});

  @override
  _JobFormPageState createState() => _JobFormPageState();
}

class _JobFormPageState extends State<JobFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _positionController = TextEditingController();
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
    _positionController.dispose();
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
          title: const Text('Add Job Form'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
// Add TextFormField for each field
            _buildTextField(_positionController, 'Position'),
            const SizedBox(height: 25),
            _buildTextField(_descriptionController, 'Description'),
            const SizedBox(height: 25),
            _buildTextField(_lineOfServiceController, 'Line of Service'),
            const SizedBox(height: 25),
            _buildTextField(_industrySectorController, 'Industry/Sector'),
            const SizedBox(height: 25),
            _buildTextField(_specialismController, 'Specialism'),
            const SizedBox(height: 25),
            _buildTextField(_managementLevelController, 'Management Level'),
            const SizedBox(height: 25),
            _buildTextField(_jobDescriptionSummaryController, 'Job Description & Summary'),
            const SizedBox(height: 25),
            _buildTextField(_preferredSkillsController, 'Preferred skills'),
            const SizedBox(height: 25),
            _buildTextField(_minimumYearsExperienceRequiredController, 'Minimum years experience required'),
            const SizedBox(height: 25),
            _buildTextField(_educationController, 'Education'),
            const SizedBox(height: 25),
            _buildTextField(_certificationsController, 'Certifications'),
            const SizedBox(height: 25),
            _buildTextField(_requiredSkillsController, 'Required Skills'),
            const SizedBox(height: 25),
            _buildTextField(_optionalSkillsController, 'Optional Skills'),
            const SizedBox(height: 25),
            _buildTextField(_desiredLanguagesController, 'Desired Languages'),
            const SizedBox(height: 25),
            _buildTextField(_travelRequirementsController, 'Travel Requirements'),
            const SizedBox(height: 25),
            _buildTextField(_emailToConnectController, 'Email to connect'),
            const SizedBox(height: 25),            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Check if job already exists in 'work' collection
                  final snapshot = await FirebaseFirestore.instance
                      .collection('work')
                      .where('Position', isEqualTo: _positionController.text)
                      .where('emailToConnect',
                          isEqualTo: _emailToConnectController.text)
                      .get();

                  if (snapshot.docs.isEmpty) {
                    // Job doesn't exist, add new job to 'work' collection
                    await FirebaseFirestore.instance.collection('work').add({
                      'Position': _positionController.text,
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
                      const SnackBar(content: Text('Job added successfully')),
                    );
                  } else {
                    // Job already exists, show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Job already exists')),
                    );
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Flexible(
      flex: 3,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          hintText: 'Enter $label',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $label';
          }
          if (label == 'Email to connect') {
            // Regular expression for email validation
            String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
            if (!RegExp(emailRegex).hasMatch(value)) {
              return 'Please enter a valid email';
            }
          }
          return null;
        },
      ),
    );
  }
}