# ParcelFlow — notes for Claude

Parcel logistics management system. Individual project for the **Databases** course at the University of
Siedlce, 2026/2027. Full requirements: `~/Downloads/Projekty_BD_2026_2027_wymagania_i_tematy.pdf`.

## How we work (important)

- **The user writes ALL code and ALL SQL alone.** This is a learning project and the user has to defend it
  live. At the defense the lecturer asks them to explain the model, the code and the queries, and to modify
  a query on the spot. Do NOT write code or SQL for them. Explain concepts, give hints only when they are
  stuck, give a full solution only if they explicitly ask, and review their code when they are done.
- **Claude does the documentation**, generated from the user's code: ER diagram, model description, run
  instructions, the requirements mapping table and the EXPLAIN write-up. Claude also drafts the
  normalization (1NF–3NF) section, and the user must read and understand it because it comes up at the
  defense.
- **Language:** Polish (see the global ~/.claude/CLAUDE.md).
- **Scope is frozen** (see the model below). New ideas go on the "Later" list and are only touched once
  everything required works.

## Tech decisions

- **MySQL 8** (required).
- **Python + Flask**, server-rendered HTML with Jinja2 and no JavaScript framework. The lecturer suggested
  PHP but agreed to Python.
- **No ORM and no query builder** (required). Hand-written SQL through a plain driver
  (`mysql-connector-python` or `PyMySQL`). **Always use parameterized queries.** When the user picks a sort
  column or direction, whitelist the allowed values.
- The app must **not** use the MySQL root account. It gets its own user with limited GRANTs.
- Credentials go in `.env` (gitignored), with `.env.sample` committed.
- The repo stays **private** until graded, then it becomes public for the portfolio.
- The lecturer grades **only the SQL**. The UI just has to work, so keep it minimal.

## Data model v0 (agreed 2026-11-22), 11 tables

Columns are not designed yet. **That is the user's current task.**

| # | Table (PL idea) | Purpose | Notes |
|---|---|---|---|
| 1 | customers (klienci) | senders, either a person or a company | `nip` is NULL for persons (a justified NULL) |
| 2 | weight_tariffs (cennik wagowy) | weight ranges → price | lookup by `BETWEEN`; price depends only on weight |
| 3 | facilities (placówki) | branches and hubs (hubs: Łódź, Warszawa) | type branch/hub; optional self join branch → its hub |
| 4 | shipments (przesyłki) | the parcels | sender FK, receiver data stored as columns (no account), weight, `price` DECIMAL, `cod_amount` DECIMAL NULL (no COD → NULL), origin and destination facility FKs (two FKs to facilities) |
| 5 | employees (pracownicy) | couriers, warehouse staff, managers | facility FK, `supervisor_id` → employees (**self join**) |
| 6 | scan_events (zdarzenia) | parcel scans along the way | shipment, time, event type, facility and/or employee (think about NULLs) |
| 7 | event_types (typy zdarzeń) | dictionary: pickup, warehouse intake, hub sort, out for delivery, delivered, failed delivery… | |
| 8 | vehicles (pojazdy) | trucks and vans | registration number UNIQUE |
| 9 | trips (kursy) | transport between facilities | vehicle, driver (employee), from/to facility, departure time |
| 10 | trip_shipments (przesyłki w kursie) | **N:M** junction between shipments and trips | one parcel rides several trips, e.g. Katowice → Łódź → Siedlce |
| 11 | claims (reklamacje) | damage, loss, complaints | good material for R3 (missing links) |

Domain facts from the user (they worked about 7 years at FedEx):
- Scan points: courier pickup → origin branch → hub → destination branch → courier delivery.
- A branch is the origin for some shipments and the destination for others. The role depends on the
  shipment, not on the facility.
- Almost everything is parcels (very few pallets), and the price depends on weight only.

Design talking points for the defense:
- `shipments.price` copies the tariff price at creation time. It is the historical price of that
  transaction, not duplicated data, so 3NF still holds and old shipments keep their old price when the
  tariff changes.

## Requirements checklist (short)

- [ ] ≥ 8 related tables, 1:N and N:M, PKs and FKs, proper types (DECIMAL for money), NOT NULL / UNIQUE /
      CHECK, at least one justified NULL
- [ ] ON DELETE decisions (RESTRICT / CASCADE / SET NULL), explained
- [ ] 3NF, plus the ability to explain 1NF/2NF/3NF on own examples; ER diagram
- [ ] Full CRUD for ≥ 3 tables in the app
- [ ] N:M add/remove in the app
- [ ] One view with 2 independent filters at the same time
- [ ] Sorting by ≥ 2 columns plus direction (whitelisted)
- [ ] Reports R1–R5, runnable from the app, ≥ 3 of them with user parameters:
  - R1: aggregation over ≥ 3 tables with GROUP BY, ≥ 2 aggregate functions and HAVING
  - R2: comparison with a subquery (e.g. above average)
  - R3: missing links (LEFT JOIN … IS NULL or NOT EXISTS)
  - R4: correlated subquery
  - R5: CTE (WITH) with ≥ 2 logical stages
  - Somewhere in R2 or R5: aggregation on two levels (e.g. the average of per-customer sums)
- [ ] Transaction with ≥ 2 related modifications, showing COMMIT and ROLLBACK after a forced error
- [ ] Validation and clear error messages (missing data, duplicates, failed operations)
- [ ] Constructs to cover in app SQL: WHERE/AND/OR/ORDER BY/LIKE/BETWEEN/IS [NOT] NULL; text, number and
      date functions; CASE; COALESCE/IFNULL; INNER JOIN over ≥ 3 tables; LEFT JOIN; self join;
      COUNT/SUM/AVG/MIN/MAX; single-row, multi-row (IN/NOT IN) and correlated subqueries; EXISTS/NOT EXISTS;
      INSERT/UPDATE/DELETE with ≥ 1 UPDATE or DELETE using a subquery
- [ ] Separate scripts or demos: CREATE script, ALTER TABLE example, RIGHT JOIN, an extra index with
      EXPLAIN before and after, an app DB user plus a GRANT/REVOKE demo on a test account
- [ ] Data: ≥ 200 records total, ≥ 10 rows in 3 non-dictionary tables, ≥ 20 rows in the N:M table;
      include rows that pass and fail HAVING, NULL cases and missing links
- [ ] Deliverables: source code, SQL scripts (schema + data), demo scripts, ER diagram, short docs
      (topic, model, 3NF, tech, run instructions, feature walkthrough), requirements mapping table,
      EXPLAIN comparison
- [ ] It must run from an empty database using only the provided files

## Status

- 2026-11-22: topic chosen (own topic, parcel logistics; **approved by the lecturer 2026-11-23**), repo created,
  data model v0 agreed. **Next: the user writes the columns** (name, type, PK/FK, NOT NULL/UNIQUE/CHECK,
  NULL and why) for all 11 tables, then Claude reviews them.

- 2026-11-22: Flask installed in the venv, hello-world route works.
- 2026-11-22: MySQL 8.4 running in docker compose (service `db`, database `parcelflow`, named volume
  `sql-data`, credentials in `.env`). `sql/schema.sql` has `customers` (with the NIP CHECK), loaded and
  tested with INSERTs. **Next: `weight_tariffs`**, then `facilities`.
  - Load the schema: `docker compose exec -T db sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD" parcelflow' < sql/schema.sql`
    (plain `-p` with `-T` reads the password from the file, and `$VAR` without `sh -c` expands on the
    host, where it is empty)
  - Console: the same command without `-T` and without the `< file`.
  - Container time is UTC. Remember this for date-based reports.
  - Idea: an extra CHECK that NIP is exactly 10 digits (CHAR_LENGTH / REGEXP).
- 2026-11-22: `weight_tariffs` done (DECIMAL(10,2), CHECKs: from > 0, to > from, price > 0) and pushed.
  The user decided against UNIQUE on weight_from (they fill the tariffs themselves). Defense answer: full
  overlap protection would need a trigger, because CHECK only sees one row. Tariffs start at 0.1 kg, so
  `shipments.weight` must be ≥ 0.1. Remote switched to SSH, `.idea/` ignored. **Next: `facilities`** (first FK).

## Progress

**Overall: ~19%** (5 + 3 + 15×8/11; update after each session)

| Step | Weight | Status |
|---|---|---|
| Setup (repo, Docker/MySQL, Flask, .env) | 5% | ✅ done |
| Data model planned (11 tables) | 3% | ✅ done |
| `schema.sql`: 11 tables | 15% | 🔄 8/11 (+ scan_events) |
| `data.sql`: 200+ rows | 10% | ⏳ |
| Flask ↔ MySQL connection | 5% | ⏳ |
| CRUD ×3 + N:M + filters + sorting | 20% | ⏳ |
| Reports R1–R5 | 20% | ⏳ |
| Transaction, EXPLAIN, GRANT, ALTER, RIGHT JOIN | 7% | ⏳ |
| Docs + final test from an empty DB | 10% | ⏳ |
| Lecturer approved the topic | (blocker) | ✅ approved (2026-11-23) |

- 2026-11-23: shipments done (3 FKs, all RESTRICT; receiver_* columns; weight_kg >= 0.1; cod NULL = no COD; tracking_number CHAR(12) digits like FedEx). All CHECK names now prefixed with their table (chk_tariff_*, chk_shipment_*). **Next: `scan_events`** (FKs to shipments, event_types, employees, facilities; facility NULL for courier scans outside a facility), then trips, trip_shipments (N:M), claims.

## Roadmap

1. Columns for all 11 tables (the user designs them, Claude reviews) + email the lecturer for topic approval
2. Install MySQL 8 locally, create the database and the app user
3. `schema.sql`: CREATE TABLE with all constraints, runnable from an empty DB
4. `data.sql`: ≥ 200 demo rows, designed to exercise the reports (passing and failing HAVING, NULLs, missing links)
5. Flask ↔ MySQL connection (driver, `.env`, one query displayed on a page)
6. CRUD #1 (customers), then shipments (with N:M trips), then vehicles
7. List view with 2 filters + whitelisted sorting
8. Reports R1–R5 (with parameters)
9. Transaction (COMMIT / ROLLBACK demo)
10. Demo scripts: ALTER, RIGHT JOIN, index + EXPLAIN, GRANT/REVOKE
11. Docs (Claude) + requirements mapping, final check from an empty DB

## Reminders for Claude

- **Self join exercise is pending:** the user wants to practise it (facilities f LEFT JOIN facilities h ON f.hub_id = h.facility_id → branch + hub name). Postponed until all tables exist. Remind them before the Flask stage. The employees + supervisor self join was already shown in the employees tests (2026-11-23).
- employees done 2026-11-23: two FKs, both ON DELETE RESTRICT (manager can't be deleted while they have subordinates; facility can't be deleted while it has staff). Business rule: only `driver` runs trips; couriers and warehouse workers scan.

- **SQL practice block (user wants it):** after schema.sql + data.sql, run exercises on their own DB, levels 1–8: basics → functions/CASE/COALESCE → joins incl. RIGHT and self join → GROUP BY/HAVING → subqueries (IN, EXISTS, correlated) → CTE + bonus window functions → INSERT/UPDATE/DELETE + transactions → ALTER/index/EXPLAIN/GRANT. Claude gives tasks in the ParcelFlow domain, the user writes the queries, Claude checks them. Good exercises become report candidates.

## Later (ideas parked, not in scope)

- (empty)
