CREATE TABLE "public"."city"(
    "id" INT4 NOT NULL,
    "name" TEXT NOT NULL,
    "countrycode" BPCHAR(3) NOT NULL,
    "district" TEXT NOT NULL,
    "population" INT4 NOT NULL CHECK (population >=0),
    PRIMARY KEY ("id") 
);
CREATE TABLE "public"."country"(
    "code" BPCHAR(3) NOT NULL,
    "name" TEXT NOT NULL,
    "continent" TEXT NOT NULL CHECK((continent='Asia'::text)OR(continent = 'South America'::text)OR(continent = 'North America'::text)OR(continent = 'Oceania'::text)OR(continent = 'Antarctica'::text)OR(continent = 'Central America'::text)),
    "region" TEXT NOT NULL,
    "surfacearea" FLOAT4 NOT NULL CHECK (surfacearea >= (0)::double precision),
    "indepyear" INT2,
    "population" INT4 NOT NULL,
    "lifeexpectancy" FLOAT4,
    "gnp" NUMERIC(10,2),
    "gnpold" NUMERIC(10,2),
    "localname" TEXT NOT NULL,
    "govermentform" TEXT NOT NULL,
    "headofstate" TEXT,
    "capital" INT4,
    "code2" BPCHAR(2) NOT NULL,
    PRIMARY KEY ("code")
);

CREATE TABLE "public"."countrylanguage"(
    "countrycode" BPCHAR(3) NOT NULL,
    "language" TEXT NOT NULL,
    "isofficial" BOOL NOT NULL,
    "percentage" FLOAT4 NOT NULL CHECK((percentage >= (0)::double precision) AND (percentage <= (100)::double precision)),
    PRIMARY KEY ("countrycode","language")
);

CREATE TABLE public.continent(
    code SERIAL4 NOT NULL,
    name TEXT NULL,
    CONSTRAINT continent_pk PRIMARY KEY (code)
);