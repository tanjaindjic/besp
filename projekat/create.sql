create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
create sequence hibernate_sequence start with 1 increment by 1
create table cenovnik (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, primary key (id))
create table dodatne_usluge (id bigint not null, opcija varchar(255), primary key (id))
create table iznajmljivanje (id bigint not null, cena bigint, datum_do timestamp, datum_od timestamp, moze_pojedinacno boolean, soba_id bigint, primary key (id))
create table iznajmljivanje_rezervisano (iznajmljivanje_id bigint not null, rezervisano_id bigint not null)
create table kategorija_smestaja (id bigint not null, kategorija varchar(255), primary key (id))
create table komentar (id bigint not null, odobreno boolean not null, tekst varchar(255), rezervacija_id bigint, primary key (id))
create table korisnik (id bigint not null, adresa varchar(255), aktiviran boolean not null, first_name varchar(255), last_name varchar(255), password varchar(255), pib varchar(255), role varchar(255), status_naloga varchar(255), username varchar(255), primary key (id))
create table korisnik_izdaje (korisnik_id bigint not null, izdaje_id bigint not null)
create table korisnik_rezervacije (korisnik_id bigint not null, rezervacije_id bigint not null)
create table poruka (id bigint not null, tekst varchar(255), posiljalac_id bigint, primalac_id bigint, primary key (id))
create table rezervacija (id bigint not null, datum_do timestamp, datum_od timestamp, ocena integer not null, status varchar(255), rezervisao_id bigint, primary key (id))
create table slika (id bigint not null, uri varchar(255), primary key (id))
create table smestaj (id bigint not null, adresa varchar(255), broj_ocena integer not null, drzava varchar(255), gmap_url varchar(2084), grad varchar(255), naziv varchar(255), opis varchar(255), rejting float not null, zvezdice integer, tip_id bigint, vlasnik_id bigint, primary key (id))
create table smestaj_dodatne_usluge (smestaj_id bigint not null, dodatne_usluge_id bigint not null)
create table smestaj_slike (smestaj_id bigint not null, slike_id bigint not null)
create table smestaj_sobe (smestaj_id bigint not null, sobe_id bigint not null)
create table soba (id bigint not null, broj_lezaja integer not null, kategorija_id bigint, primary key (id))
create table soba_cene (soba_id bigint not null, cene_id bigint not null)
create table soba_iznajmljivanja (soba_id bigint not null, iznajmljivanja_id bigint not null)
create table soba_opcija (soba_id bigint not null, opcija_id bigint not null)
create table tip_smestaja (id bigint not null, tip varchar(255), primary key (id))
alter table iznajmljivanje_rezervisano add constraint UK_ix615mhdl1bpk0ic0ikvceh56 unique (rezervisano_id)
alter table korisnik_izdaje add constraint UK_cxno9cqi7h2x50yl90337qy6v unique (izdaje_id)
alter table korisnik_rezervacije add constraint UK_dfdeyrq9lfw0hyag978dusdao unique (rezervacije_id)
alter table smestaj_slike add constraint UK_llpwjslf9jx2gnnui0wusf1ra unique (slike_id)
alter table smestaj_sobe add constraint UK_hkdhgk2yukjshbdbe9ayixfuj unique (sobe_id)
alter table soba_cene add constraint UK_sthwr6fjupvitqycjt42y6qn1 unique (cene_id)
alter table soba_iznajmljivanja add constraint UK_ao5c6d1um6i838xor4ybpr32y unique (iznajmljivanja_id)
alter table iznajmljivanje add constraint FKbu2mo32fbd0l8jtnqw9xia89k foreign key (soba_id) references soba
alter table iznajmljivanje_rezervisano add constraint FK3c55m2e5dcuhvi6d1gvly41to foreign key (rezervisano_id) references rezervacija
alter table iznajmljivanje_rezervisano add constraint FK753qr3fagppg7y3xsyw0ow9h6 foreign key (iznajmljivanje_id) references iznajmljivanje
alter table komentar add constraint FKlpjin8yyxali21n7jx4ig3lc foreign key (rezervacija_id) references rezervacija
alter table korisnik_izdaje add constraint FKr2xjks38jaawhvmar4i6ao527 foreign key (izdaje_id) references smestaj
alter table korisnik_izdaje add constraint FKmcf235bdqkg65msq2jagn7jcw foreign key (korisnik_id) references korisnik
alter table korisnik_rezervacije add constraint FKk7igk1f0wgf3eiaxc6qqbj5tp foreign key (rezervacije_id) references rezervacija
alter table korisnik_rezervacije add constraint FKcirjegpygaxjsnbq1a908m5fo foreign key (korisnik_id) references korisnik
alter table poruka add constraint FKtpx98gy2ac9vo7ew4d9r1sfx6 foreign key (posiljalac_id) references korisnik
alter table poruka add constraint FK5cy5moubr0gesrkr69bc69vbn foreign key (primalac_id) references korisnik
alter table rezervacija add constraint FKglh2jx7vudjmoj9l0nfdfac9m foreign key (rezervisao_id) references korisnik
alter table smestaj add constraint FK9yro4u7pxrtyxsdsf0e1b80k0 foreign key (tip_id) references tip_smestaja
alter table smestaj add constraint FKit6dty48uffyktf92icehnbt9 foreign key (vlasnik_id) references korisnik
alter table smestaj_dodatne_usluge add constraint FK7ws5xg6di0nbkqim9enx7wuy9 foreign key (dodatne_usluge_id) references dodatne_usluge
alter table smestaj_dodatne_usluge add constraint FKf6t93ggqbqrf12dm8pmgf7xed foreign key (smestaj_id) references smestaj
alter table smestaj_slike add constraint FKld0f4ckry3ap5a62s7qjixm6o foreign key (slike_id) references slika
alter table smestaj_slike add constraint FK7juqsxsna6gmfapks56aoan4f foreign key (smestaj_id) references smestaj
alter table smestaj_sobe add constraint FK3na442eq2bjy3fygdhgv0vu0k foreign key (sobe_id) references soba
alter table smestaj_sobe add constraint FKggdsglmlif4rp7epg8rh7wus4 foreign key (smestaj_id) references smestaj
alter table soba add constraint FK26xnl2900n3yyghyu11f569yt foreign key (kategorija_id) references kategorija_smestaja
alter table soba_cene add constraint FKq5mc79pehgauo6chyq0myy3h6 foreign key (cene_id) references cenovnik
alter table soba_cene add constraint FKcbt8gqqinxr0hsh14xjowquia foreign key (soba_id) references soba
alter table soba_iznajmljivanja add constraint FKsi56q48jnyklt28dpny356bdy foreign key (iznajmljivanja_id) references iznajmljivanje
alter table soba_iznajmljivanja add constraint FKnoad5yamqeej6lkfkrw2cv1yc foreign key (soba_id) references soba
alter table soba_opcija add constraint FK8j2mlcox3n5o5giatu7yay6bn foreign key (opcija_id) references dodatne_usluge
alter table soba_opcija add constraint FK670frmj287dpqwacxrp90hn2l foreign key (soba_id) references soba
