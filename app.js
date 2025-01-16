import config from "./config.js";
import express from "express"

const app = express();

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(config.server.port, () => {
  console.log(`Server started at ::${config.server.port}`);
});

process.on("SIGINT", () => {
  console.log('Server stopped');
  process.exit(0);
});
