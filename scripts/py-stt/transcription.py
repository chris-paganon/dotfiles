import whisper


def transcribe_audio(audio_filename, model_type):
    """Transcribes an audio file using Whisper."""
    print("Loading whisper model...")
    model = whisper.load_model(model_type)

    print("Transcribing...")
    result = model.transcribe(audio_filename)
    transcript = result["text"]

    return transcript 