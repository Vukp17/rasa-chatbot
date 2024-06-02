from flask import Flask, request, jsonify, render_template
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/chat', methods=['POST'])
def chat():
    user_message = request.form['message']
    response = get_chat_response(user_message)
    return jsonify({'response': response})

def get_chat_response(message):
    rasa_response = requests.post(
        'http://localhost:5005/webhooks/rest/webhook',  # RASA strežnik naslov
        json={"sender": "user", "message": message}
    )
    rasa_response = rasa_response.json()
    if rasa_response:
        return rasa_response[0]['text']
    else:
        return "Oprostite, ne razumem."

if __name__ == '__main__':
    app.run(debug=True)
