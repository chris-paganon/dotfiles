import os
import sys

import pyperclip
import typer

from recording import record_audio
from transcription import transcribe_audio
from llm import llm_post_process


def main(
    model_type: str = typer.Option(
        "turbo",
        "--model-type",
        "-m",
        help="Whisper model type (e.g., tiny, base, small, medium, large, turbo).",
    ),
    llm_model: str = typer.Option(
        "gemma3", "--llm-model", "-l", help="LLM model for post-processing."
    ),
    sample_rate: int = typer.Option(
        44100, "--sample-rate", "-r", help="Sample rate for audio recording."
    ),
    channels: int = typer.Option(
        1, "--channels", "-c", help="Number of audio channels (1 for mono, 2 for stereo)."
    ),
    output_dir: str = typer.Option(
        "./outputs", "--output-dir", "-o", help="Directory to save output files."
    ),
    transcript_file: str = typer.Option(
        None,
        "--summarize-only",
        "-s",
        help="Path to a transcript file to summarize.",
    ),
):
    """Main function to record, transcribe, and output."""
    try:
        transcript = ""
        base_filename_for_outputs = ""

        if transcript_file:
            try:
                with open(transcript_file, "r") as f:
                    transcript = f.read()
                base_filename_for_outputs = transcript_file
            except FileNotFoundError:
                print(f"Error: Transcript file not found at {transcript_file}")
                sys.exit(1)
        else:
            audio_filename = record_audio(output_dir, sample_rate, channels)

            if not audio_filename:
                return

            transcript = transcribe_audio(audio_filename, model_type)
            print("\n--- Transcript ---")
            print(transcript)
            print("--------------------")

            transcript_filename = os.path.splitext(audio_filename)[0] + ".transcript"
            with open(transcript_filename, "w") as f:
                f.write(transcript)
            print(f"Transcript saved to {transcript_filename}")
            base_filename_for_outputs = audio_filename

        post_processed_transcript = llm_post_process(transcript, llm_model)

        print("\n--- summary ---")
        print(post_processed_transcript)
        print("--------------------")

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


if __name__ == "__main__":
    typer.run(main)