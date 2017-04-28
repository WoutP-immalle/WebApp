create schema currency_converter;
use currency_converter;

create table Gebruiker(
    id int not null auto_increment primary key,
    name text not null,
    favorieten text
);

create table Currencies(
    id int not null auto_increment primary key,
    valuta text,
    naam text,
    afkorting text,
    bedrag real
);

create table GebruikerCurrencies(
    id int not null auto_increment primary key,
    gebruiker_id int,
    currencies_id int
);

insert into Gebruiker(id, name, favorieten)
values 
(1, "Joske", "EURO"),
(2, "Jefke", "DOLLAR");

insert into Currencies(id, valuta, naam, afkorting, bedrag)
values
(1, "€", "EURO", "EUR", 1.0000),
(2, "$", "DOLLAR", "USD", 0.9186);

insert into GebruikerCurrencies(id, gebruiker_id, currencies_id)
values
(1, 1, 1),
(2, 2, 1),
(3, 1, 2),
(4, 2, 2);

/* TESTS */

/* favorieten currency van personen tonen */
SELECT *
FROM Gebruiker
JOIN GebruikerCurrencies on Gebruiker.id = GebruikerCurrencies.gebruiker_id
JOIN Currencies ON GebruikerCurrencies.currencies_id = Currencies.id
WHERE Gebruiker.favorieten = "DOLLAR";

/* valuta en bijhorend bedrag weergeven */
SELECT valuta, bedrag
FROM Currencies;