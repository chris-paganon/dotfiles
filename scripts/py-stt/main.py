import datetime
import os
import queue
import sys
import pyperclip
import sounddevice as sd
from scipy.io.wavfile import write
import numpy as np
import whisper

# --- Configuration ---
MODEL_TYPE = "turbo"  # Options: tiny, base, small, medium, large, turbo
SAMPLE_RATE = 44100  # Sample rate
CHANNELS = 1  # 1 for mono, 2 for stereo
OUTPUT_DIR = "./outputs"

# --- Main Script ---

# Ensure the output directory exists
os.makedirs(OUTPUT_DIR, exist_ok=True)

# This queue will hold the audio data
q = queue.Queue()

def audio_callback(indata, frames, time, status):
  """This is called (from a separate thread) for each audio block."""
  if status:
      print(status, file=sys.stderr)
  q.put(indata.copy())

try:
  # 1. Record Audio
  print("Press ENTER to start recording.")
  input()  # Wait for user to press Enter

  stream = sd.InputStream(
    samplerate=SAMPLE_RATE, channels=CHANNELS, callback=audio_callback
  )
  with stream:
    print("Recording... Press ENTER to stop.")
    input()  # Block until user presses Enter again

  print("Recording complete.")

  # Retrieve recorded data from the queue
  recorded_frames = []
  while not q.empty():
    recorded_frames.append(q.get())

  if not recorded_frames:
    print("No audio was recorded.")
    sys.exit()

  recording = np.concatenate(recorded_frames, axis=0)

  # Generate a timestamped filename
  timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
  audio_filename = os.path.join(OUTPUT_DIR, f"{timestamp}.wav")
  transcript_filename = os.path.join(OUTPUT_DIR, f"{timestamp}.transcript")

  # Save the recording as a WAV file
  print(f"Saving recording to {audio_filename}...")
  write(audio_filename, SAMPLE_RATE, recording)
  print("Saving complete.")

  # 2. Transcribe Audio
  print("Loading whisper model...")
  model = whisper.load_model(MODEL_TYPE)

  print("Transcribing...")
  result = model.transcribe(audio_filename)
  transcript = result["text"]

  # 3. Save and Output Transcript
  print("\n--- Transcript ---")
  print(transcript)
  print("--------------------")

  # Save the transcript to a file
  with open(transcript_filename, "w") as f:
    f.write(transcript)
  print(f"Transcript saved to {transcript_filename}")

  # Copy to clipboard
  pyperclip.copy(transcript)
  print("Transcript copied to clipboard.")

except KeyboardInterrupt:
  print("\nRecording interrupted by user.")
  sys.exit()
except Exception as e:
  print(f"An error occurred: {type(e).__name__}: {e}")
  sys.exit()