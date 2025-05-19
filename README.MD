# 📚 PostgreSQL Date & Time Practice

This documentation serves as a reference for practicing PostgreSQL datetime functions, timezone settings, interval calculations, and more.

---

## 🕒 Show Current Timezone

```sql
SHOW timezone; -- Which Timezone is set currently?

Output:
```
TimeZone
---------
Asia/Dhaka
```

📅 Get Current Timestamp

```
    SELECT now();

```

Output:
```
now
-------------------------------
2025-05-19 13:12:19.780626+06
```

🧪 Timestamp vs. Timestamptz
Create a table and Insert values to compare timestamp and timestamp with time zone:
```
CREATE TABLE test_table (
    ts timestamp without time zone,
    tsz timestamp with time zone
);
INSERT INTO test_table VALUES
('2023-09-13 10:59:00', '2023-09-13 10:59:58'),
('2023-09-13 08:09:00', '2023-09-13 10:59:58');

```

Query table:
```
SELECT * FROM test_table;
```
Output:
```
ts                  | tsz
--------------------+--------------------------
2023-09-13 10:59:00 | 2023-09-13 10:59:58+06
2023-09-13 08:09:00 | 2023-09-13 10:59:58+06
```

🔁 Date Casting
Return only date:
```
SELECT now()::date;
-- Output: 2025-05-19

```
Return only time:
```
SELECT now()::time;
-- Output: 13:12:19.780626
```
Return timestamp:
```
SELECT now()::timestamp;
-- Output: 2025-05-19 13:12:19.780626
```
🎨 Date Formatting with to_char()
Format date in YYYY-MM-DD:
```
SELECT to_char(now(), 'YYYY-MM-DD');
-- Output: 2025-05-19
```
📘 See [PostgreSQL to_char() documentation for more patterns](https://www.postgresql.org/docs/current/functions-formatting.html)