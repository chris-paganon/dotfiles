import datetime
import os
import queue
import sys

import numpy as np
import sounddevice as sd
from scipy.io.wavfile import write


def record_audio(output_dir, sample_rate, channels):
    """Records audio from the user and saves it to a WAV file."""
    os.makedirs(output_dir, exist_ok=True)
    q = queue.Queue()

    def audio_callback(indata, frames, time, status):
        """This is called (from a separate thread) for each audio block."""
        if status:
            print(status, file=sys.stderr)
        q.put(indata.copy())

    print("Press ENTER to start recording.")
    input()  # Wait for user to press Enter

    stream = sd.InputStream(samplerate=sample_rate, channels=channels, callback=audio_callback)
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
        return None

    recording = np.concatenate(recorded_frames, axis=0)

    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    audio_filename = os.path.join(output_dir, f"{timestamp}.wav")

    write(audio_filename, sample_rate, recording)
    print(f"Recording saved to {audio_filename}")

    return audio_filename 