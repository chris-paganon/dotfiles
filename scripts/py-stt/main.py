import os
import sys

import pyperclip

from recording import record_audio
from transcription import transcribe_audio

# --- Configuration ---
MODEL_TYPE = "turbo"  # Options: tiny, base, small, medium, large, turbo
SAMPLE_RATE = 44100  # Sample rate
CHANNELS = 1  # 1 for mono, 2 for stereo
OUTPUT_DIR = "./outputs"


def main():
    """Main function to record, transcribe, and output."""
    try:
        audio_filename = record_audio(OUTPUT_DIR, SAMPLE_RATE, CHANNELS)

        if not audio_filename:
            return

        transcript = transcribe_audio(audio_filename, MODEL_TYPE)

        # 3. Save and Output Transcript
        print("\n--- Transcript ---")
        print(transcript)
        print("--------------------")

        # Save the transcript to a file
        transcript_filename = os.path.splitext(audio_filename)[0] + ".transcript"
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


if __name__ == "__main__":
    main()