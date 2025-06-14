# py-stt: Speech-to-Text with LLM Post-Processing

A Python script to record audio, transcribe it using Whisper, and post-process it with a local LLM via Ollama.

## Features

- Record audio from your microphone.
- Transcribe audio using OpenAI's Whisper.
- Post-process transcripts with an LLM for various purposes:
  - **Default**: Clean up and format the text.
  - **Prompt Mode**: Transform transcript into a clear and effective prompt for a coding agent.
  - **Rant Mode**: Summarize a longer rant into a concise and professional message.
- Process existing transcript files.
- Copy the final output to the clipboard.
- Select different Whisper and LLM models.

## Requirements

- Python 3.12+
- `uv` python package manager
- Ollama running with a desired model (e.g., `gemma3`).
- ffmpeg for running whisper locally

The script's dependencies are managed by `uv` and are listed in the script file.

## Installation

1.  Clone the repository.
2.  Make sure you have `uv` installed (https://docs.astral.sh/uv/getting-started/installation/).
3.  Make sure the script is executable: `chmod +x ./py-stt`.
4.  Ensure Ollama is installed and has the models you intend to use (e.g., `ollama pull gemma3`).

## Usage

The script is self-contained and can be run directly using `uv`, which will handle the dependencies.

```bash
cd scripts/py-stt
./py-stt [OPTIONS]
```

### Basic Usage

Simply run the script. It will prompt you to press Enter to start and stop recording. The transcript will be cleaned up by the default LLM model and copied to your clipboard.

```bash
./py-stt
```

### Options

Run `py-stt --help` to see available options

### Examples

**Create a prompt for a coding agent:**

```bash
./py-stt --prompt
# or
./py-stt -p
```

**Summarize a rant:**

```bash
./py-stt --rant
# or
./py-stt -r
```

**Use a different Whisper and LLM model:**

```bash
./py-stt --model-type small --llm-model llama3
```

Remember to run `ollama pull llama3` 1st

**Process an existing transcript file:**

```bash
./py-stt --transcript-file /path/to/my/transcript.txt --prompt
```

**Get the raw transcript without post-processing:**

```bash
./py-stt --raw
```
