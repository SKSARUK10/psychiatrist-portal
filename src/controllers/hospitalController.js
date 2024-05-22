const pool = require("../models/db");

const getHospitalDetails = async (req, res) => {
  const { hospital_id } = req.body;

  if (!hospital_id) {
    return res.status(400).json({ message: "Hospital ID is required" });
  }

  try {
    const [hospitalRows] = await pool.query(
      "SELECT * FROM hospitals WHERE id = ?",
      [hospital_id]
    );

    if (hospitalRows.length === 0) {
      return res.status(404).json({ message: "Hospital not found" });
    }

    const hospitalName = hospitalRows[0].name;

    const [psychiatristRows] = await pool.query(
      "SELECT * FROM psychiatrists WHERE hospital_id = ?",
      [hospital_id]
    );
    const psychiatristCount = psychiatristRows.length;

    const [patientRows] = await pool.query(
      "SELECT * FROM patients WHERE psychiatrist_id IN (SELECT id FROM psychiatrists WHERE hospital_id = ?)",
      [hospital_id]
    );
    const patientCount = patientRows.length;

    const psychiatrists = await Promise.all(
      psychiatristRows.map(async (psychiatrist) => {
        const [patientCountRows] = await pool.query(
          "SELECT COUNT(*) as patientCount FROM patients WHERE psychiatrist_id = ?",
          [psychiatrist.id]
        );
        return {
          id: psychiatrist.id,
          name: psychiatrist.name,
          patientCount: patientCountRows[0].patientCount,
        };
      })
    );

    res.status(200).json({
      hospitalName,
      psychiatristCount,
      patientCount,
      psychiatrists,
    });
  } catch (error) {
    res.status(500).json({ message: "Database error", error });
  }
};

module.exports = {
  getHospitalDetails,
};
