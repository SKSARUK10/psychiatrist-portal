const pool = require("../models/db");
const {
  validateEmail,
  validatePhoneNumber,
  validatePassword,
} = require("../utils/validation");

const registerPatient = async (req, res) => {
  const { name, address, email, phone, password, psychiatrist_id } = req.body;
  const photo = req.file;

  if (
    !name ||
    !address ||
    !email ||
    !phone ||
    !password ||
    !photo ||
    !psychiatrist_id
  ) {
    return res.status(400).json({ message: "All fields are required" });
  }

  if (address.length < 10) {
    return res
      .status(400)
      .json({ message: "Address must be at least 10 characters long" });
  }

  if (!validateEmail(email)) {
    return res.status(400).json({ message: "Invalid email address" });
  }

  if (!validatePhoneNumber(phone)) {
    return res.status(400).json({ message: "Invalid phone number" });
  }

  if (!validatePassword(password)) {
    return res.status(400).json({
      message:
        "Password must contain one upper character, one lower character, and a number. Max length 15 and min length 8",
    });
  }

  try {
    const [result] = await pool.query(
      "INSERT INTO patients (name, address, email, phone, password, photo, psychiatrist_id) VALUES (?, ?, ?, ?, ?, ?, ?)",
      [name, address, email, phone, password, photo.filename, psychiatrist_id]
    );
    res.status(201).json({ id: result.insertId });
  } catch (error) {
    console.error("Error registering patient:", error);
    res.status(500).json({ message: "Database error", error });
  }
};

module.exports = {
  registerPatient,
};
