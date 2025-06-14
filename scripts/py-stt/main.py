import whisper
import pyperclip

model = whisper.load_model("turbo")

print("Transcribing...")
result = model.transcribe("./outputs/test1.wav")

print(result["text"])
pyperclip.copy(result["text"])