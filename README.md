# PL/SQL Practical Guide

A beginner-friendly guide for writing, compiling, and running PL/SQL programs using Oracle SQL*Plus. This repository contains common PL/SQL programs such as procedures, functions, cursors, triggers, and other practical examples.

---

## Prerequisites

* Oracle Database (XE/19c/21c or later)
* SQL*Plus (or Oracle SQL Developer)

---

## Running a PL/SQL Script

### 1. Open SQL*Plus

```bash
sqlplus username/password
```

or

```bash
sqlplus / as sysdba
```

---

### 2. Enable Output

Always place these commands at the beginning of your script.

```sql
SET SERVEROUTPUT ON
SET VERIFY OFF
```

* `SET SERVEROUTPUT ON` → Displays output from `DBMS_OUTPUT.PUT_LINE()`.
* `SET VERIFY OFF` → Hides the `old` and `new` substitution variable messages.

---

### 3. Write Your PL/SQL Code

There are three common types of PL/SQL programs.

#### Anonymous Block

```sql
DECLARE
    n NUMBER := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE(n);
END;
/
```

---

#### Procedure

```sql
CREATE OR REPLACE PROCEDURE hello
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;
/
```

---

#### Function

```sql
CREATE OR REPLACE FUNCTION square(n NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN n * n;
END;
/
```

---

## Taking User Input

### Number Input

```sql
ACCEPT n NUMBER PROMPT 'Enter a number: '
```

### Character/String Input

```sql
ACCEPT name CHAR PROMPT 'Enter your name: '
```

### Date Input

```sql
ACCEPT d CHAR PROMPT 'Enter a date (DD-MM-YYYY): '
```

Convert the input to a DATE:

```sql
TO_DATE('&d','DD-MM-YYYY')
```

> **Note:** `ACCEPT VARCHAR(...)` is **not valid** in SQL*Plus. Use `CHAR`.

---

## Executing Procedures

Without parameters:

```sql
EXEC hello;
```

or

```sql
BEGIN
    hello;
END;
/
```

With parameters:

```sql
EXEC factorial(&n);
```

or

```sql
BEGIN
    factorial(&n);
END;
/
```

---

## Executing Functions

Functions return a value and should be called inside a PL/SQL block.

```sql
DECLARE
    result NUMBER;
BEGIN
    result := square(5);
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
```

---

## Running a Script

Save your file with the `.sql` extension.

Example:

```
factorial.sql
```

Run it from SQL*Plus:

```sql
@factorial.sql
```

or

```sql
START factorial.sql
```

---

## Common SQL*Plus Commands

| Command               | Description                             |
| --------------------- | --------------------------------------- |
| `@file.sql`           | Execute a SQL script                    |
| `START file.sql`      | Execute a SQL script                    |
| `EXEC procedure_name` | Execute a procedure                     |
| `SET SERVEROUTPUT ON` | Enable DBMS output                      |
| `SET VERIFY OFF`      | Hide substitution variable verification |
| `EXIT`                | Exit SQL*Plus                           |

---

## Common PL/SQL Mistakes

| Incorrect                                     | Correct                              |
| --------------------------------------------- | ------------------------------------ |
| `=` (assignment)                              | `:=`                                 |
| `"Hello"`                                     | `'Hello'`                            |
| `BEGIN:`                                      | `BEGIN`                              |
| Missing `;` after `END`                       | `END;`                               |
| Forgetting `/` after a block                  | Add `/`                              |
| `EXEC` inside `BEGIN...END`                   | Call the procedure directly          |
| `ACCEPT VARCHAR(...)`                         | `ACCEPT CHAR`                        |
| `SERVEROUPUT`                                 | `SERVEROUTPUT`                       |
| Using `&variable` inside a procedure/function | Use the procedure/function parameter |

---


