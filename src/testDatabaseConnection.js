const pool = require("./src/config/database");

async function testConnection() {
  try {
    const connection = await pool.getConnection();
    console.log("Connected to the MySQL database!");
    connection.release(); // Release the connection back to the pool
  } catch (error) {
    console.error("Error connecting to the MySQL database:", error);
  }
}

testConnection();
