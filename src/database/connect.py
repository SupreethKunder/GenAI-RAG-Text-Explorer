from ..core.config import settings
from pymongo import MongoClient

client = MongoClient(f"{settings.KMONGO_URL}/?retryWrites=true&w=majority")
