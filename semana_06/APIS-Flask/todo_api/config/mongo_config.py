import os
import dotenv
from pymongo import MongoClient

dotenv.load_dotenv()

dburl = os.getenv("URL")
print(f"me he conectado a {dburl}!")

if not dburl:
    raise ValueError("no tienes url de base de datos")

client=MongoClient()
db=client.get_database("HP")
c = db["frases"]