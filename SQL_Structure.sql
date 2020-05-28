-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "state_names" (
    "state_id" int   NOT NULL,
    "state_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_state_names" PRIMARY KEY (
        "state_id"
     )
);

CREATE TABLE "confirmed_cases" (
    "state_name" varchar(30)   NOT NULL,
    "date" date   NOT NULL,
    "confirmed" int   NOT NULL,
    "state_id" int   NOT NULL,
    CONSTRAINT "pk_confirmed_cases" PRIMARY KEY (
        "state_id"
     )
);

CREATE TABLE "restaurant_performance" (
    "state_name" varchar(30)   NOT NULL,
    "date" date   NOT NULL,
    "percent_yoy_change" int   NOT NULL,
    "state_id" int   NOT NULL,
    CONSTRAINT "pk_restaurant_performance" PRIMARY KEY (
        "state_id"
     )
);

CREATE TABLE "quarantine_dates" (
    "state_name" varchar(30)   NOT NULL,
    "date" date   NOT NULL,
    "order_type" varchar(50)   NOT NULL,
    "state_id" int   NOT NULL,
    CONSTRAINT "pk_quarantine_dates" PRIMARY KEY (
        "state_id"
     )
);

ALTER TABLE "confirmed_cases" ADD CONSTRAINT "fk_confirmed_cases_state_id" FOREIGN KEY("state_id")
REFERENCES "state_names" ("state_id");

ALTER TABLE "restaurant_performance" ADD CONSTRAINT "fk_restaurant_performance_state_id" FOREIGN KEY("state_id")
REFERENCES "state_names" ("state_id");

ALTER TABLE "quarantine_dates" ADD CONSTRAINT "fk_quarantine_dates_state_id" FOREIGN KEY("state_id")
REFERENCES "state_names" ("state_id");

