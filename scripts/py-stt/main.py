import os
import sys

import pyperclip

from recording import record_audio
from transcription import transcribe_audio
from llm import llm_post_process

# --- Configuration ---
MODEL_TYPE = "turbo"  # Options: tiny, base, small, medium, large, turbo
LLM_MODEL = "gemma3"
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
        print("\n--- Transcript ---")
        print(transcript)
        print("--------------------")

        transcript_filename = os.path.splitext(audio_filename)[0] + ".transcript"
        with open(transcript_filename, "w") as f:
            f.write(transcript)
        print(f"Transcript saved to {transcript_filename}")

        post_processed_transcript = llm_post_process(transcript, LLM_MODEL)

        print("\n--- summary ---")
        print(post_processed_transcript)
        print("--------------------")

        summary_filename = os.path.splitext(audio_filename)[0] + ".summary.md"
        with open(summary_filename, "w") as f:
            f.write(post_processed_transcript)
        print(f"Post-processed transcript saved to {summary_filename}")

        pyperclip.copy(post_processed_transcript)
        print("Transcript copied to clipboard.")

    except KeyboardInterrupt:
        print("\nRecording interrupted by user.")
        sys.exit()
    except Exception as e:
        print(f"An error occurred: {type(e).__name__}: {e}")
        sys.exit()


if __name__ == "__main__":
    main()