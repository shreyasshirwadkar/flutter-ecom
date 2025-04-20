const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return value.match(emailRegex);
      },
      message: "Please enter valid email address",
    },
  },
  password: {
    required: true,
    type: String,
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "Password must be greater than 6 letters",
    },
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: "String",
    default: "user",
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
