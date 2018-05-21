-- password == username
INSERT INTO korisnik (username, firstName, lastName, password, aktiviran, role, statusNaloga, adresa, pib, izdaje, rezervacije) 
VALUES ('admin', 'admin', 'admin', 'admin', true, 'ADMIN', 'AKTIVAN', 'adresa', null, null, null );