import os
import uuid
import flask
import urllib
from PIL import Image
import tensorflow as tf
from tensorflow.keras.models import load_model
from flask import Flask , render_template  , request , send_file, request, jsonify
from tensorflow.keras.preprocessing.image import load_img , img_to_array
import werkzeug
import joblib
import math
import json

app = Flask(__name__)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
model = load_model(os.path.join(BASE_DIR , 'model_skin_2.h5'))
loaded_model = joblib.load('final_model_diabetese.pkl')
prediction_model = joblib.load("predict_disease.pkl")


classes = ['benign','malignant']

def predict(filename , model):
    # Read in target file (an image)
    img = tf.io.read_file(filename)

# Decode the read file into a tensor & ensure 3 colour channels 
# (our model is trained on images with 3 colour channels and sometimes images have 4 colour channels)
    img = tf.image.decode_image(img, channels=3)

# Resize the image (to the same size our model was trained on)
    img = tf.image.resize(img, size = [224, 224])

# Rescale the image (get all values between 0 and 1)
    img = img/255.

    pred = model.predict(tf.expand_dims(img, axis=0))
    #prob = model.predict(img)

   
    if len(pred[0]) > 1: # check for multi-class
        class_result = classes[pred.argmax()] # if more than one output, take the max
    else:
        class_result = classes[int(tf.round(pred)[0][0])]
    #prob_result = (prob[0]*100).round(2)
    #class_result = classes[int(tf.round(pred)[0][0])]
    

    return class_result 


@app.route('/upload', methods=["POST"])
def upload():
    target_img = os.path.join(os.getcwd() , 'static/images')
    if(request.method == "POST"):
        imagefile = request.files['image']
        imagefile.save(os.path.join(target_img , imagefile.filename))
        img_path = os.path.join(target_img , imagefile.filename)
        img = imagefile.filename
        
        class_result  = predict(img_path , model)
        
        return jsonify({
            "message": class_result,
            })
    
# Create API routing call
@app.route('/diabetespredict', methods=['POST'])
def diabetespredict():
    global response
    
    if (request.method == "POST"):
        request_data = request.get_json()
        if request_data:
            if 'glucose' in request_data:
                glucose = request_data['glucose']
            if 'bp' in request_data:
                bp = request_data['bp']
            if 'bmi' in request_data:
                bmi = request_data['bmi']
            if 'age' in request_data:
                age = request_data['age']
        
            prediction = loaded_model.predict([[glucose,bp,bmi,age]])
            full_prediction = prediction[0]
        
            diabetes_prediction = round(full_prediction)

            return jsonify({'prediction': diabetes_prediction})
        
        else:
            return jsonify({'error': "There was an error with the submission"} )
        
@app.route("/malariapredict", methods=["POST"])
def malariapredict():
    
    if (request.method == "POST"):
        request_datas = request.get_json()
        if request_datas:
            if 'malaria' in request_datas:
                malariadengue = request_datas['malaria']
                
            final_malariadengue = malariadengue.replace(',',"")
            predictions = prediction_model.predict([final_malariadengue])

            full_predictions = predictions[0]
  
    
            return jsonify({"predictions":full_predictions})
        
        else:
            return jsonify({'error': "There was an error with your submission"})

@app.route("/login", methods=["POST"])
def login():
    
    if (request.method == "POST"):
        request_data = request.get_json()
        if request_data:
            if 'email' in request_data:
                email = request_data['email']
            if 'password' in request_data:
                password = request_data['password']
            
            if (email == 'test@test.com' and password == 'machinelearning'):
                return jsonify({"response": "Success"})
            else:
                return jsonify({"response": "Wrong Credentials"})

        
if __name__ == "__main__":
    app.run(debug=True, port=4000)