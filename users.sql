CREATE SCHEMA 'cars';
CREATE SCHEMA 'my_app';
CREATE SCHEMA 'cakephp';

CREATE USER 'cars'@'localhost';
CREATE USER 'my_app'@'localhost' IDENTIFIED BY 'secret';
CREATE USER 'cakephp'@'localhost';

GRANT ALL ON 'cars'.* TO 'cars'@'localhost';
GRANT ALL ON 'my_app'.* TO 'my_app'@'localhost';
GRANT ALL ON 'cakephp'.* TO 'cakephp'@'localhost';