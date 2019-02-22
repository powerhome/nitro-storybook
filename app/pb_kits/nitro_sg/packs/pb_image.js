import Image from "pb_image/_image.jsx";
import WebpackerReact from "webpacker-react";

const images = require.context('', true)
const imagePath = (name) => images(name, true)


WebpackerReact.setup({ Image });
