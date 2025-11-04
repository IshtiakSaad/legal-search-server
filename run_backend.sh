#!/bin/bash
# This is the run script to set up and start the backend.

echo "--- Backend Setup Starting ---"

# Create a Python virtual environment named 'venv' if it doesn't exist
if [ ! -d "venv" ]
then
    echo "Creating Python virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment 'venv' already exists."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install the required packages
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Start the FastAPI server
echo ""
echo "--- Starting FastAPI Server ---"
echo "Access the server at: http://127.0.0.1:8000"
echo "To test in browser, open: http://127.0.0.1:8000/docs"
echo "Press CTRL+C to stop the server."
echo ""

# Finally, run the FastAPI app with uvicorn
# uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000} --reload
