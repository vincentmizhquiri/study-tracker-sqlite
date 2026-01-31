# Study Tracker (SQLite)

A small SQLite project to practice relational database concepts and SQL queries.

## Project structure
- `setup.sql` – creates tables and inserts sample data
- `queries.sql` – example SELECT, JOIN, and aggregation queries
- `migrations.sql` – improvements (view and index)
- `.gitignore` – prevents committing the database file

## Setup
Create the database from scratch:

```bash
sqlite3 study_tracker.db < setup.sql
