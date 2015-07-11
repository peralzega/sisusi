CREATE TABLE jabatan (
	id int(2) NOT NULL AUTO_INCREMENT,
	name varchar(25),
	CONSTRAINT jabatan_pk PRIMARY KEY(id)
);

CREATE TABLE divisi (
	id int(2) NOT NULL AUTO_INCREMENT,
	name varchar(25),
	CONSTRAINT divisi_pk PRIMARY KEY(id)
);

CREATE TABLE role (
	id int(1) NOT NULL AUTO_INCREMENT,
	name varchar(15),
	CONSTRAINT role_pk PRIMARY KEY(id)
);

CREATE TABLE users (
	id int(4) NOT NULL AUTO_INCREMENT,
	fname varchar(10),
	mname varchar(25),
	lname varchar(25),
	jabatan int(2),
	divisi int(2),
	role int(1),
	CONSTRAINT users_pk PRIMARY KEY(id),
	CONSTRAINT users_jabatan FOREIGN KEY(jabatan) REFERENCES jabatan(id),
	CONSTRAINT users_divisi FOREIGN KEY(divisi) REFERENCES divisi(id),
	CONSTRAINT users_role FOREIGN KEY(role) REFERENCES role(id)
);

/* ------ */

CREATE TABLE visibility (
	id int(1) NOT NULL AUTO_INCREMENT,
	name varchar(15),
	CONSTRAINT visibility_pk PRIMARY KEY(id)
);

CREATE TABLE surat (
	id int(4) NOT NULL AUTO_INCREMENT,
	no_agenda int(6),
	dari int(4),
	kepada int(4),
	tgl_kirim date,
	due_time date,
	about varchar(100),
	action varchar(50),
	lampiran varchar(100),
	notes varchar(200),
	visibility int(1),
	CONSTRAINT surat_pk PRIMARY KEY(id),
	CONSTRAINT surat_dari FOREIGN KEY(dari) REFERENCES users(id),
	CONSTRAINT surat_kepada FOREIGN KEY(kepada) REFERENCES users(id),
	CONSTRAINT surat_visibility FOREIGN KEY(visibility) REFERENCES visibility(id)
);

CREATE TABLE status (
	id int(1) NOT NULL AUTO_INCREMENT,
	name varchar(15),
	CONSTRAINT status_pk PRIMARY KEY(id)
);

CREATE TABLE disposisi (
	id_surat int(4),
	dari int(4),
	kepada int(4),
	tgl_kirim date,
	status int(1),
	CONSTRAINT disposisi_dari FOREIGN KEY(dari) REFERENCES users(id),
	CONSTRAINT disposisi_kepada FOREIGN KEY(kepada) REFERENCES users(id),
	CONSTRAINT diposisi_status FOREIGN KEY(status) REFERENCES status(id)
);

