# Legal Document Search - Server

This directory contains the FastAPI backend for the Legal Document Search [client side](https://github.com/IshtiakSaad/legal-search-client). It is a mock API designed to serve a React frontend.

Project Structure
```
legal-search-server/
├── app/
│   ├── data/
│   │   └── data.json         # Mock document data
│   ├── __init__.py           # Makes 'app' a Python package
│   ├── main.py               # Main FastAPI application, endpoints
│   ├── models.py             # Pydantic request/response models
│   └── utils.py              # Helper functions
├── requirements.txt          # Python dependencies
└── run_backend.sh            # Setup & run script
```
## Setup & Run 

The included `run_backend.sh` script automates the entire setup and launch process.
```
# Run the script in command line
./run_backend.sh
```

The backend server will be running at `http://127.0.0.1:8000.`

## API Endpoints
The server provides automatic, interactive documentation.
- API Docs (Swagger UI): `http://127.0.0.1:8000/docs`
- API Docs (ReDoc): `http://127.0.0.1:8000/redoc`

## Key Endpoints
- `GET /`
    - Description: A root endpoint to check if the server is alive. 
    - Response: `{"message": "Harvery is at the office!"}`
- `POST /generate`
    - Description: The main assignment endpoint. It receives a query and returns a mock document.
    - Request Body:
        `{
            "query": "your search query"
        }`
- Success Response (200): 
    `{
    "query": "your search query",
    "summary": "A mock summary...",
    "document": "The full text of a mock legal document..."
    }`

- Test Error (500):
    - Send a request with the query "error" to test the frontend's error handling.