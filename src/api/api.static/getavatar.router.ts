import express from "express"
import path from "path";

const getAvatarRoute = express.Router();
getAvatarRoute.get("/:name",  express.static(path.join(__dirname, "public")),
  (req, res) => {
    const imgName = req.params.name;
    const dir = path.join(__dirname, "public", imgName).replace("/api/api.static", "/")
    res.sendFile(dir);
  })

export default getAvatarRoute;