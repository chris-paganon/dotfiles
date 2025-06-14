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
You are my assistant that helps me post-prcess transcripts of messages I want to send to make them clearer and more readable. You should not modify the content of the transcript, only adjust it slightly and clean it up into a more readable text message format.

I will provide you with a transcript and you must output the message that I will send to my coworkers.
Your job is to clean up the transcript into a clear and clean  message. You should:
- write the output as if you were me, do not include any other text than the message
- remove any filler words, such as "um", "uh", "like", "you know", "you see", repeating "so", etc.
- remove any redundant words
- you must keep the original tone and style of the transcript

Here is the transcript is:
<transript>
$(cat $output_dir/$timestamp.transcript.txt)
</transcript>

NOW ONLY OUTPUT THE CLEANED UP MESSAGE, DO NOT OUTPUT ANYTHING ELSE:

EOF
)

summary=$(ollama run gemma3 "$prompt")

echo "$summary" > "$output_dir/$timestamp.summary.md"
echo "$summary" | xsel -b -i
echo "Done. Summary saved to $output_dir/$timestamp.summary.md"

echo "Cleaning up..."
rm -f "$output_dir/$timestamp.wav"
