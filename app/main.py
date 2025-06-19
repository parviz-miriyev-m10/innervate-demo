from flask import Flask, jsonify
import os

app = Flask(__name__)

down = False

@app.route("/")
def home():
    return jsonify({"message": "App is running!"})

@app.route("/chaos")
def chaos():
    global down
    down = True
    return jsonify({"message": "Chaos triggered. Health checks will now fail."}), 500

@app.route("/healthz")
def healthz():
    if down:
        return jsonify({"status": "fail"}), 500
    return jsonify({"status": "ok"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 8080))) 