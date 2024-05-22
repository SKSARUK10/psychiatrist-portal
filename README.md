# Psychiatrists Platform

## Major Libraries/Frameworks Used
- Express.js: Fast, unopinionated, minimalist web framework for Node.js
- Sequelize: A promise-based Node.js ORM for Postgres, MySQL, MariaDB, SQLite, and Microsoft SQL Server.
- MySQL: Relational database management system.
- Multer: Node.js middleware for handling multipart/form-data, which is primarily used for uploading files.
- Express-Validator: A set of express.js middlewares that wraps validator.js validator and sanitizer functions.

## API Endpoints

### Register a new patient
**URL:** `/patients/register`

**Method:** `POST`

**Body Parameters:**
- `name`: string (required)
- `address`: string, minimum 10 characters (required)
- `email`: string, valid email (required)
- `phone_number`: string, minimum 10 characters (required)
- `password`: string, 8-15 characters, must contain one upper character, one lower character, and a number (required)
- `psychiatrist_id`: integer (required)
- `photo`: file (optional)

### Fetch hospital details
**URL:** `/hospitals/details`

**Method:** `POST`

**Body Parameters:**
- `hospital_id`: integer (required)

**Response:**
```json
{
  "hospital_name": "Apollo Hospitals",
  "total_psychiatrists": 10,
  "total_patients": 50,
  "psychiatrist_details": [
    {
      "id": 1,
      "name": "Dr. Smith",
      "patients_count": 5
    },
    ...
  ]
}
