const express = require("express");
const { getHospitalDetails } = require("../controllers/hospitalController");
const router = express.Router();

router.post("/details", getHospitalDetails);

module.exports = router;
