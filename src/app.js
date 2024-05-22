const express = require("express");
const bodyParser = require("body-parser");
const multer = require("multer");
const patientRoutes = require("./routes/patientRoutes");
const hospitalRoutes = require("./routes/hospitalRoutes");
const pool = require("./models/db");
const path = require("path");
const app = express();

app.get("/", (req, res) => {
  res.send("okay path ");
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname).toLowerCase();
    if (ext === ".jpg") {
      cb(null, `${Date.now()}${ext}`);
    } else {
      cb(new Error("Only .jpg files are allowed"));
    }
  },
});

const upload = multer({
  storage: storage,
  fileFilter: function (req, file, cb) {
    const ext = path.extname(file.originalname).toLowerCase();
    if (ext === ".jpg") {
      cb(null, true);
    } else {
      cb(new Error("Only .jpg files are allowed"), false);
    }
  },
});
app.use("/api/patient", upload.single("photo"), patientRoutes);
app.use("/api/hospital", hospitalRoutes);

const PORT = process.env.PORT || 5000;
async function startServer() {
  try {
    const connection = await pool.getConnection();
    console.log("Connected to the MySQL database!");
    connection.release(); // Release the connection back to the pool

    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  } catch (error) {
    console.error("Error connecting to the MySQL database:", error);
    process.exit(1); // Exit the process with a failure code
  }
}

startServer();
