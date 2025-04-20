const express = require("express");
const app = express();
const PORT = 3000;
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

app.use(authRouter);

mongoose
  .connect()
  .then(() => {
    console.log("MongoDB Connected");
  })
  .catch((e) => {
    console.log("MongoDB Error: " + e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Listening on PORT: ${PORT}`);
});
