from flask import jsonify
from google.cloud import firestore

def get_resume(request):
    """Retrieves the resume data from Firestore and returns it as a JSON response."""
    
    # Get the resume data from the Firestore
    resume_data = firestore.Client().collection('resumes').document('1').get().to_dict()

    # Return the resume data as a JSON response
    return jsonify(resume_data), 200
