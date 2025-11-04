import time
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from .models import GenerateRequest, GenerateResponse
from .utils import get_mock_document



# --- FastAPI Initialization ---

app = FastAPI(
    title = "Legal Doc Search API",
    description = "Mock API. Fake Mike Ross.",
    version = "1.0.0"
)

# --- CORS Setup ---

origins = [
    "http://localhost:5173",
    "https://harveyspectre.netlify.app/"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins = origins,
    allow_credentials = True,
    allow_methods = ["*"],
    allow_headers = ["*"],
)

@app.get('/')
async def get_root():
    return {"message" : "Harvery is at the office!"}

@app.post('/generate', response_model=GenerateResponse)
async def generate_ducument_summary(request: GenerateRequest):
    print(f"Recieved Query: {request.query}")

    time.sleep(1)

    if request.query.strip().lower() == 'error':
        raise HTTPException(
            status_code=500,
            detail="Server Error Simulation."
        )
    
    chosen_document = get_mock_document()
    # print(chosen_document)

    summary = (
        f"Requested Query: '{request.query}'.\n"
        f"The document found is '{chosen_document['title']}'."
    )   

    return {
        "query" : request.query,
        "summary" : summary,
        "heading" : chosen_document['title'],
        "document" : chosen_document['content']
    }

