require('./otel'); 

const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

mongoose.connect("mongodb://localhost:27017/subjectnotes", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const NoteSchema = new mongoose.Schema({
  subject: String,
  content: String,
});

const Note = mongoose.model("Note", NoteSchema);

// Create Note (POST)
app.post("/notes", async (req, res) => {
  const newNote = new Note(req.body);
  await newNote.save();
  res.send(newNote);
});

// Get All Notes (GET)
app.get("/notes", async (req, res) => {
  const notes = await Note.find();
  res.send(notes);
});

app.listen(3000, () => console.log("Server running on port 3000"));
