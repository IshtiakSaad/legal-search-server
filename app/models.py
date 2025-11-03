from pydantic import BaseModel

class GenerateRequest(BaseModel):
    query: str

class GenerateResponse(BaseModel):
    query: str
    summary: str
    document: str