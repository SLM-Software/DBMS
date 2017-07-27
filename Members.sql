create table slm.members(	id serial not null		constraint customers_pkey			primary key, 	deviceid varchar(30) not null,	primaryemail varchar(100) not null,	primaryphone bigint not null,	firstname varchar(25) not null,	lastname varchar(30) not null,	password varchar(100) not null,	confirmed boolean default false not null,	updateby json not null,	primarypaymentmethod json,	suppliedgender char(6),	predictedgender char(6), 	birthdate json);create unique index customers_id_uindex	on slm.members (id);create unique index customers_device_uindex	on slm.members (deviceid);create unique index customers_primaryemail_uindex	on slm.members (primaryemail);create unique index customers_primaryphone_uindex	on slm.members (primaryphone);create index customers_firstlastname_index	on slm.members (lastname, firstname);comment on column slm.members.id is 'System ID - not for human use.';comment on column slm.members.deviceid is 'Device MAC Addresses. - not for human use.';comment on column slm.members.primaryemail is 'This is the email address that is used to login to SLM.';comment on column slm.members.primaryphone is 'This is the phone number without formatting.';comment on column slm.members.password is 'This must be securely hashed before being stored via OpenPHP + Salted S2K, scrypt, bcrypt or PBKDF2.';comment on column slm.members.confirmed is 'This can only be true or false. This is set to true when the confirmation email is received.';comment on column slm.members.updateby is 'String containing the Update type, date/time and user id.';comment on column slm.members.primarypaymentmethod is 'String containing type, nickname, third party token for the preferred method and other details to be defined in the future.';comment on column slm.members.suppliedgender is 'The gender the member identifies themselves by to SLM.';comment on column slm.members.predictedgender is 'The gender SLM has determined via algorithms.';comment on column slm.members.birthdate is 'String containing the day, month and/or year. All values are optional.';