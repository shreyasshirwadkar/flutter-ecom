require("dotenv").config();
const express = require("express");
const app = express();
const PORT = 3000;
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

mongoose
  .connect(process.env.MONGODB_URI)
  .then(() => {
    console.log("MongoDB Connected");
  })
  .catch((e) => {
    console.log("MongoDB Error: " + e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Listening on PORT: ${PORT}`);
});
