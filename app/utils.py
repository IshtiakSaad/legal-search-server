import json
import random
from pathlib import Path

DATA_PATH = Path(__file__).parent / "data" / "data.json"

def load_document():
    try:
        with open(DATA_PATH, 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Error: No file at {DATA_PATH} directory")
        return []
    except json.JSONDecodeError:
        print(f"Error: Couldn't decode JSON from {DATA_PATH}")


MOCK_DOCUMENTS = load_document()

def get_mock_document():
    if not MOCK_DOCUMENTS:
        return {
            "title": "Error Document",
            "content": "Coun't load mock document from json file."
        }
    return random.choice(MOCK_DOCUMENTS)

