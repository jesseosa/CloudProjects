from fastapi import FastAPI, Query
import sqlite3
import os

app = FastAPI(title="Qashqade Mirror Service (minimal)")

DB_PATH = os.getenv("DB_PATH", "/data/mirror.db")
os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)

def get_conn():
    conn = sqlite3.connect(DB_PATH, check_same_thread=False)
    conn.execute(
        "CREATE TABLE IF NOT EXISTS mirror_pairs (id INTEGER PRIMARY KEY AUTOINCREMENT, word TEXT NOT NULL, mirrored TEXT NOT NULL)"
    )
    return conn

def transform_word(s: str) -> str:
    flipped = "".join([c.lower() if c.isupper() else c.upper() if c.islower() else c for c in s])
    return flipped[::-1]

@app.get("/api/health")
def health():
    return {"status": "ok"}

@app.get("/api/mirror")
def mirror(word: str = Query(...)):
    mirrored = transform_word(word)
    conn = get_conn()
    with conn:
        conn.execute("INSERT INTO mirror_pairs (word, mirrored) VALUES (?, ?)", (word, mirrored))
    conn.close()
    return {"transformed": mirrored}
