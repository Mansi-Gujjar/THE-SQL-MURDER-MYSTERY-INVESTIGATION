# 🕵️ SQL Murder Mystery – Complete Investigation

This repository contains my full solution to the **SQL Murder Mystery** challenge hosted at:
[https://mystery.knightlab.com/](https://mystery.knightlab.com/)

The challenge is an interactive SQL-based investigation where you solve a fictional murder case using database queries. Instead of clues in paragraphs, all information is hidden inside relational database tables — and the only way to solve the crime is by writing SQL queries.

---

## 📖 Case Background

A murder took place on **January 15, 2018**, in **SQL City**.

The police database contains multiple tables such as:

- `crime_scene_report`
- `person`
- `interview`
- `drivers_license`
- `get_fit_now_member`
- `income`
- `facebook_event_checkin`

Our mission is to:
1. Identify the murderer.
2. Uncover the mastermind behind the crime.

All clues must be extracted using SQL queries.

---

## 🧠 Investigation Process

### Step 1: Locate the Crime Scene Report
The case begins by filtering the `crime_scene_report` table using:
- Date
- Type (murder)
- City (SQL City)

This reveals two witnesses:
- One living on **Northwestern Dr**
- One named **Annabel** on **Franklin Ave**

---

### Step 2: Identify the Witnesses
Using address and name filters:
- **Morty Schapiro**
- **Annabel Miller**

---

### Step 3: Analyze Witness Interviews
Their interviews reveal key clues:
- The suspect had a **"Get Fit Now Gym" bag**
- Membership ID started with **"48Z"**
- Only **gold members** have those bags
- The getaway car’s plate included **"H42W"**

---

### Step 4: Narrow Down the Suspects
Using the clues:
- Filter gold gym members whose ID starts with `48Z`
- Match vehicle plates containing `H42W`
- Cross-reference membership data with driver's license records

This leads to:

## 🔍 Murderer Identified:
**Jeremy Bowers**

---

## 🎯 Bonus Challenge: The Real Mastermind

After arresting Jeremy Bowers, his interview reveals:
- He was hired by a wealthy woman
- Female
- Height between 65–67 inches
- Red hair
- Drives a Tesla Model S
- Attended SQL Symphony Concert 3 times in December 2017

Using multiple joins across:
- `drivers_license`
- `income`
- `facebook_event_checkin`
- `person`

The final suspect matching all conditions:

## 👑 Mastermind Identified:
**Miranda Priestly**

---

## 💻 SQL Skills Demonstrated

This project demonstrates practical use of:

- `SELECT` with complex `WHERE` conditions
- `LIKE` pattern matching
- `ORDER BY` and `LIMIT`
- `JOIN` and `LEFT JOIN`
- Multi-table filtering
- Logical deduction using structured data

---

## 📂 Repository Contents

- `solution.sql` → Complete step-by-step solution with comments
- `README.md` → Explanation of investigation process

---

## 🚀 What This Project Shows

This challenge highlights how SQL can be used not just for data retrieval, but for:
- Analytical thinking
- Logical problem solving
- Real-world style data investigation

It’s a fun and practical way to strengthen SQL fundamentals while applying deductive reasoning.

---

## 🔗 Original Challenge

SQL Murder Mystery by Knight Lab:
https://mystery.knightlab.com/

---

⭐ If you found this interesting, feel free to fork the repo or try solving the mystery yourself!
