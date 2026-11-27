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
- The repo is **public** (user's choice 2026-11-25, not worried about copying). Never commit secrets.
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

**Overall: ~33%** (5 + 3 + 15 + 10; update after each session)

| Step | Weight | Status |
|---|---|---|
| Setup (repo, Docker/MySQL, Flask, .env) | 5% | ✅ done |
| Data model planned (11 tables) | 3% | ✅ done |
| `schema.sql`: 11 tables | 15% | ✅ 11/11 |
| `data.sql`: 200+ rows | 10% | ✅ ~596 rows |
| Flask ↔ MySQL connection | 5% | ⏳ |
| CRUD ×3 + N:M + filters + sorting | 20% | ⏳ |
| Reports R1–R5 | 20% | ⏳ |
| Transaction, EXPLAIN, GRANT, ALTER, RIGHT JOIN | 7% | ⏳ |
| Docs + final test from an empty DB | 10% | ⏳ |
| Lecturer approved the topic | (blocker) | ✅ approved (2026-11-23) |

- 2026-11-23: shipments done (3 FKs, all RESTRICT; receiver_* columns; weight_kg >= 0.1; cod NULL = no COD; tracking_number CHAR(12) digits like FedEx). All CHECK names now prefixed with their table (chk_tariff_*, chk_shipment_*). **Next: `scan_events`** (FKs to shipments, event_types, employees, facilities; facility NULL for courier scans outside a facility), then trips, trip_shipments (N:M), claims.
- 2026-11-25: scan_events, trips (CHECK origin <> destination, arrival > departure, arrival NULL = still on the road) and trip_shipments (N:M, surrogate PK + `uq_trip_shipment` UNIQUE(trip_id, shipment_id), both FKs RESTRICT) done and tested (12 tests). Defense note: `trips.driver_id` can point to any employee, CHECK can't see `employees.role` (would need a trigger or app validation). **Next: `claims`.**
- 2026-11-25 (later): claims done and tested (12 tests): ENUM type loss/damage/delay, status new/pending/accepted/rejected DEFAULT 'new', resolved_date NULL = open, compensation_amount NULL = no decision yet vs 0 = decided, nothing paid, reviewer_id NULL = not assigned (R3 material), CHECK claimed > 0, 0 <= compensation <= claimed, resolved > filed, both FKs RESTRICT. Added `chk_claim_status` (4 scenarios joined by OR): new = all NULL; pending = reviewer only; accepted = date + reviewer + compensation > 0; rejected = date + reviewer + compensation = 0. Needs explicit IS NOT NULL next to > 0 / = 0, because NULL gives UNKNOWN and CHECK lets UNKNOWN through (good defense point). Tested: 4 OK + 11 rejected cases incl. UPDATE new→accepted. **Schema complete (11/11). Next: `data.sql`.**
- 2026-11-26: business rule parcels only up to 100 kg (heavier = pallet, not handled): `chk_shipment_weight` is now `weight_kg BETWEEN 0.1 AND 100`. That used up the planned ALTER TABLE demo idea, so pick another one later (add a column or an index). `data.sql` started: weight_tariffs 0.1–5 / 5.01–10 / 10.01–20 / 20.01–100 (steps of 0.01 because DECIMAL(10,2), so no overlap and no gaps). **Next: event_types**, then the other tables in FK order.

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

## Seed data ids (data.sql, fixed by insert order)

- weight_tariffs: 1 = 0.1–5 kg (5 zł), 2 = 5.01–10 (10), 3 = 10.01–20 (20), 4 = 20.01–100 (30)
- event_types: 1 pickup, 2 arrival, 3 loading, 4 out_for_delivery, 5 delivery, 6 delivery_attempt, 7 refusal, 8 rescheduling
- facilities: 1 HUB_WAW, 2 HUB_LDZ; under WAW: 3 BR_SDE Siedlce, 4 BR_LBN Lublin, 5 BR_BIA Bialystok, 6 BR_GDA Gdansk; under LDZ: 7 BR_BDG Bydgoszcz, 8 BR_SCZ Szczecin, 9 BR_KRK Krakow, 10 BR_KAT Katowice
- R3 idea: keep BR_SCZ (8) with no staff and no shipments
- customers (12 persons, 8 companies; created_at = load time for all): persons 1 Angjel Dust (Siedlce), 2 Kamiljeg Changmil (Siedlce), 3 Ignacy Paderewski (Warszawa), 6 Marta Wisniewska (Lublin), 7 Piotr Zielinski (Bialystok), 8 Anna Kaczmarek (Gdansk), 9 Tomasz Lewandowski (Bydgoszcz), 10 Katarzyna Dabrowska (Krakow), 11 Michal Wojcik (Katowice), 12 Agnieszka Mazur (Warszawa), 13 Pawel Krawczyk (Siedlce), 14 Ewa Grabowska (Lodz); companies 4 Intel Company (Warszawa), 5 Siemens Opposite Conc. (Katowice), 15 Mebloteka S.A. (Warszawa), 16 Kowalski Transport (Siedlce), 17 Bursztynowy Sklep (Gdansk), 18 Gorska Kawa (Krakow), 19 Elektro-Pol (Katowice), 20 Agro-Lub (Lublin). Plan: 15/16/19 = heavy senders (HAVING passes), 7 and 14 = no shipments (R3).
- employees (22, ids also as `-- n` comments in data.sql): managers 1 Changlicki (branch_mgr HUB_WAW), 2 Nowicki (branch_mgr HUB_LDZ), shift_mgrs 3 Sikora (WAW), 4 Baran (LDZ), 11 Zawadzka (BR_SDE); drivers 5, 6 (WAW), 7, 8 (LDZ); warehouse 9 (WAW), 10 (LDZ), 21 (BR_KAT); dispatchers 12 (BR_SDE), 13 (LDZ) = claims reviewers; couriers 14, 22 (BR_SDE), 15 (LBN), 16 (BIA), 17 (GDA), 18 (BDG), 19 (KRK), 20 (KAT). Nobody at BR_SCZ (8). Branch couriers report to the shift manager of their hub (Siedlce ones to 11).
- vehicles (9): trucks 1, 2 (HUB_WAW), 3, 4 (HUB_LDZ), 18–19 t; vans 5 BR_SDE, 6 BR_LBN, 7 BR_GDA, 8 BR_KRK, 9 BR_KAT, 1.1–1.4 t. No vehicle at BR_BIA, BR_BDG, BR_SCZ. Idea for R3: a vehicle with no trips.
- shipments (40, ids = tracking 7946000000NN, route in `-- n ORIGIN -> DEST` comments): price comes from a subquery on weight_tariffs (`(SELECT price ... WHERE w BETWEEN weight_from AND weight_to)`), boundary weights 4.99 / 5.00 / 5.01 / 20.00 included. Dates 2026-10-03 … 2026-11-25. 10 with COD, 4 without receiver phone. Warsaw senders ship from HUB_WAW (1), because there is no Warsaw branch. Heavy senders: 15 and 16 (6 each), 19 (5). Customers 7 and 14 send nothing, BR_SCZ (8) is never used. Shipping dates were later clustered (about 3 parcels per day, every 4 days from 2026-10-03; #40 on 2026-11-25) so trips carry several parcels.
- employees 23 (HUB_WAW) and 24 (HUB_LDZ) are hub couriers; 25, 26 (WAW) and 27, 28 (LDZ) extra drivers. vehicles 10, 11 (WAW) and 12, 13 (LDZ) extra trucks. Each hub has 4 truck+driver pairs, no double booking.
- History (generated by Claude on request, from rules the user gave: courier scans pickup at the customer, 1–2 days door to door, parcels dropped at a hub go straight to sorting): route = origin branch → its hub → [other hub] → destination branch. Fixed times: branch→hub 19:00–21:00, hub→hub 23:00–01:30, hub→branch 03:30–06:00, out_for_delivery 08:00. trips 66, trip_shipments 79, scan_events 319, claims 9. Total ~596 rows.
- Special cases: #40 in transit (last trip arrival_date NULL), #36 lost after arriving at HUB_LDZ (claim loss accepted 800), #6 and #22 delivery_attempt → rescheduling → delivered next day, #32 refused (COD). Pickup and delivery scans have facility_id NULL. Claims: accepted #4, #36, #12; rejected #18, #8; pending #22, #34; new (no reviewer) #33, #26. 6 vehicles never used (5 vans + 1 truck) for R3.
- **data.sql is complete. Next: SQL practice block (levels 1–8) on this data.**

## Reminders for Claude

- **Self join exercise is pending:** the user wants to practise it (facilities f LEFT JOIN facilities h ON f.hub_id = h.facility_id → branch + hub name). Postponed until all tables exist. Remind them before the Flask stage. The employees + supervisor self join was already shown in the employees tests (2026-11-23).
- employees done 2026-11-23: two FKs, both ON DELETE RESTRICT (manager can't be deleted while they have subordinates; facility can't be deleted while it has staff). Business rule: only `driver` runs trips; couriers and warehouse workers scan.

- **SQL practice block (user wants it):** after schema.sql + data.sql, run exercises on their own DB, levels 1–8: basics → functions/CASE/COALESCE → joins incl. RIGHT and self join → GROUP BY/HAVING → subqueries (IN, EXISTS, correlated) → CTE + bonus window functions → INSERT/UPDATE/DELETE + transactions → ALTER/index/EXPLAIN/GRANT. Claude gives tasks in the ParcelFlow domain, the user writes the queries, Claude checks them. Good exercises become report candidates.

## Later (ideas parked, not in scope)

- Trigger practice (user wants it, 2026-11-25), after the required parts work: (1) BEFORE INSERT/UPDATE on `trips` that rejects a `driver_id` whose role is not `driver` (SIGNAL), (2) optional BEFORE INSERT on `shipments` that fills `price` from `weight_tariffs`. Must stay in a separate demo script or at the end of schema.sql so it still runs from an empty DB.
