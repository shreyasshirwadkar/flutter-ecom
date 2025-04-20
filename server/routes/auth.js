const express = require("express");
const User = require("../models/User");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "User already exists" });
    }
    if (password.length <= 6) {
      return res
        .status(400)
        .json({ msg: "Password must be greater than 6 characters" });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({ email, password: hashedPassword, name });
    user = await user.save();
    res.json(user);
  } catch (e) {
    if (e.name === "ValidationError") {
      const messages = Object.values(e.errors).map((val) => val.message);
      return res.status(400).json({ msg: messages.join(", ") });
    }
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: "User does not exist" });
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
