import os
import sys

import pyperclip
import typer

from recording import record_audio
from transcription import transcribe_audio
from llm import llm_post_process

SAMPLE_RATE = 44100
CHANNELS = 1
OUTPUT_DIR = "./outputs"
DEFAULT_MODEL_TYPE = "turbo"
DEFAULT_LLM_MODEL = "gemma3"

def main(
    model_type: str = typer.Option(
        DEFAULT_MODEL_TYPE,
        "--model-type",
        "-m",
        help="Whisper model type (e.g., tiny, base, small, medium, large, turbo).",
    ),
    llm_model: str = typer.Option(
        DEFAULT_LLM_MODEL, "--llm-model", "-l", help="LLM model for post-processing."
    ),
    transcript_file: str = typer.Option(
        None,
        "--summarize-only",
        "-s",
        help="Path to a transcript file to summarize.",
    ),
    raw: bool = typer.Option(
        False,
        "--raw",
        "-r",
        help="Skip post-processing and copy the raw transcript to the clipboard.",
    ),
    prompt: bool = typer.Option(
        False,
        "--prompt",
        "-p",
        help="Optimize the transcript into a prompt for a coding agent.",
    ),
):
    """Main function to record, transcribe, and output."""
    try:
        transcript, transcript_filename = get_transcript(model_type, transcript_file)

        if raw:
            pyperclip.copy(transcript)
            print("Raw transcript copied to clipboard.")
            return

        base_filename_for_outputs = os.path.splitext(transcript_filename)[0]

        post_processed_transcript = llm_post_process(transcript, llm_model, prompt)
        summary_filename = (
            os.path.splitext(base_filename_for_outputs)[0] + ".summary.md"
        )
        with open(summary_filename, "w") as f:
            f.write(post_processed_transcript)
        print(f"Post-processed transcript saved to {summary_filename}")

        pyperclip.copy(post_processed_transcript)
        print("Summary copied to clipboard.")

    except KeyboardInterrupt:
        print("\nRecording interrupted by user.")
        sys.exit()
    except Exception as e:
        print(f"An error occurred: {type(e).__name__}: {e}")
        sys.exit()

def get_transcript(model_type: str, transcript_file: str | None) -> tuple[str, str]:
    if transcript_file:
        if not os.path.exists(transcript_file):
            print(f"Error: Transcript file not found at {transcript_file}")
            sys.exit(1)
        
        with open(transcript_file, "r") as f:
            return f.read(), transcript_file

    audio_filename = record_audio(OUTPUT_DIR, SAMPLE_RATE, CHANNELS)

    if not audio_filename:
        print("Error: No audio file was recorded.")
        sys.exit(1)

    transcript = transcribe_audio(audio_filename, model_type)

    transcript_filename = os.path.splitext(audio_filename)[0] + ".transcript"
    with open(transcript_filename, "w") as f:
        f.write(transcript)
    print(f"Transcript saved to {transcript_filename}")

    return transcript, transcript_filename

if __name__ == "__main__":
    typer.run(main)