#!/bin/bash
script_dir=$(dirname "$0")
output_dir="$script_dir/outputs"
timestamp=$(date +%s)

echo "Recording audio..."
arecord -f S16_LE -c 1 -r 16000 -t wav "$output_dir/$timestamp.wav"
echo "Recording complete. Transcribing audio..."

whisper-cli -f "$output_dir/$timestamp.wav" -m /usr/share/whisper.cpp-model-large-v3-turbo/ggml-large-v3-turbo.bin -t 8 -otxt -of "$output_dir/$timestamp.transcript"

echo "Audio transcribed. Summarizing text..."

prompt=$(cat <<EOF
You are my assistant that helps me post-prcess transcripts of messages I want to send to make them clearer and more concise. 

I will provide you with a transcript and you must output the message that I will send to my coworkers.
Your job is to clean up the transcript into a clear and concise message. You should:
- remove any filler words, such as "um", "uh", "like", "you know", "you see", etc.
- remove any redundant words or sentences.
- write the output as if you were me, you must write in the 1st person, and use the word "I" instead of "the speaker", "the user", "the sender"...
- you must keep the original tone and style of the transcript, but make it more concise and readable.

The transcript is:
$(cat $output_dir/$timestamp.transcript.txt)

ONLY OUTPUT THE MESSAGE, DO NOT INCLUDE ANYTHING ELSE.

EOF
)

summary=$(ollama run gemma3 "$prompt")

echo "$summary" > "$output_dir/$timestamp.summary.md"
echo "$summary" | xsel -b -i
echo "Done. Summary saved to $output_dir/$timestamp.summary.md"

echo "Cleaning up..."
rm -f "$output_dir/$timestamp.wav"
