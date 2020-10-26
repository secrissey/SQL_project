INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	billing_info
)VALUES(
	1,
	'Josey',
	'Guerrero',
	'4242-4242-4242-4242 623 05/20'
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
)VALUES(
	1,
	'Denise',
	'Pikes'
);

INSERT INTO part(
	upc,
	upc_name
)VALUES(
	112-346,
	'battery'
);


INSERT INTO history(
	trans_id,
	customer_id,
	service_type
)VALUES(
	1,
	1,
	'battery installation'
);

INSERT INTO service(
	ticket_id,
	car_id,
	mechanic_id,
	upc,
	customer_id,
	trans_id
)VALUES(
	1,
	1,
	1,
	112346,
	1,
	1
);

INSERT INTO sale(
	sale_id,
	first_name,
	last_name
)VALUES(
	1,
	'Carlos',
	'Belen'
);

INSERT INTO invoice(
	invoice_num,
	sale_id
)VALUES(
	1000,
	1
);

INSERT INTO car(
	vin_number,
	make,
	model,
	car_year,
	customer_id,
	sale_id
)VALUES(
	12345678,
	'Tesla',
	'CyberTruck',
	2021,
	1,
	1
);


CREATE OR REPLACE PROCEDURE changePartName(
	 upc_names VARCHAR(100)
)
language plpgsql
as $$ 
BEGIN
	UPDATE part
	SET upc_name = upc_names;
	
	COMMIT;
END;
$$

CALL changePartName('transmission');

SELECT *
FROM part;

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
)VALUES(
	2,
	'Hetal',
	'Patel'
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
)VALUES(
	3,
	'Stephanie',
	'Crissey'
);


CREATE OR REPLACE PROCEDURE changeMechanic(
	mechanic1 INTEGER, 
	first_name1 VARCHAR(100),
	last_name1 VARCHAR(100)
)
language plpgsql
as $$ 
BEGIN
	UPDATE mechanic
	SET first_name = first_name1,last_name = last_name1
	WHERE mechanic.mechanic_id = mechanic1;
	
	COMMIT;
END;
$$

CALL changeMechanic(1,'Hetal','Patel');
CALL changeMechanic(2,'Stephanie','Crissey');
CALL changeMechanic(3,'Carlos','Belen');


SELECT*
FROM mechanic;

