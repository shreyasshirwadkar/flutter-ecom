const jwt = require("jsonwebtoken");

const auth = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.status(401).json({ msg: "No auth token present" });
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.status(401).json({ msg: "Token not verified" });

    req.user = verified.id;
    req.token = token;

    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = auth;
