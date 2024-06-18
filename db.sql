// Importa el módulo mysql
const mysql = require('mysql');

// Configura los detalles de la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost', // Cambia esto según tu configuración
  user: 'crudoperadores',
  password: '',
  database: 'operadores' // Nombre de la base de datos
});

// Conéctate a la base de datos
connection.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
    return;
  }
  console.log('Conexión exitosa a la base de datos');
});

// Crea la tabla 'operadores'
const createTableQuery = `
  CREATE TABLE IF NOT EXISTS operadores (
    id INT(6) AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL
  )
`;

connection.query(createTableQuery, (err, results) => {
  if (err) {
    console.error('Error al crear la tabla:', err);
    return;
  }
  console.log('Tabla "operadores" creada exitosamente');
});

// Cierra la conexión cuando ya no la necesitas
connection.end();
