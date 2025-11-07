import os
import sqlite3
from pathlib import Path

# Prefer explicit env vars (for k8s), fall back to a sane local default.
# In Minikube via Helm, set DB_PATH=/data/mirror.db so it lives on the mounted volume.
DEFAULT_LOCAL_PATH = Path(__file__).resolve().parent / "mirror.db"
DB_PATH = Path(os.getenv("DB_PATH", DEFAULT_LOCAL_PATH))


def get_connection():
    """
    Return a connection to the SQLite database.

    - Ensures parent directory exists (important for container paths like /data).
    """
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def init_db():
    """
    Initialize database schema.

    Called on startup (from main.py) so pod/container is always ready.
    """
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS mirror_pairs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            input_word TEXT NOT NULL,
            mirrored_word TEXT NOT NULL
        )
        """
    )
    conn.commit()
    conn.close()


def save_pair(input_word: str, mirrored_word: str) -> None:
    """Insert a mirrored pair into the database."""
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO mirror_pairs (input_word, mirrored_word) VALUES (?, ?)",
        (input_word, mirrored_word),
    )
    conn.commit()
    conn.close()


def get_all_pairs():
    """Return all saved pairs (handy for debugging or tests)."""
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        "SELECT input_word, mirrored_word FROM mirror_pairs ORDER BY id DESC"
    )
    rows = cur.fetchall()
    conn.close()
    return [dict(r) for r in rows]
