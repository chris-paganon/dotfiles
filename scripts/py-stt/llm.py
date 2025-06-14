from ollama import chat


def llm_post_process(
    transcript: str, model: str, prompt_mode: bool = False, rant_mode: bool = False
) -> str:
    """Post-process the transcript using an LLM."""

    if prompt_mode:
        prompt = f"""
You are an expert at crafting perfect prompts for LLM coding agents. Your goal is to take a user's raw, transcribed thoughts and transform them into a clear, concise, and effective prompt.

You will be given a transcript of a user's request. You must analyze it and produce an optimized prompt that a coding agent can use to perform a task.

The prompt should be:
- Clear and specific.
- Context-rich, providing necessary background information if available in the transcript.
- Action-oriented, stating the desired outcome.
- Well-structured, possibly using markdown for clarity (e.g., for code blocks, lists).
- Free of filler words, repetitions, and conversational fluff.

Here is the transcript:
<transcript>
{transcript}
</transcript>

Now, based on the transcript, generate the final, optimized prompt for the coding agent. Output ONLY the prompt itself, without any introductory text, conversational pleasantries, or explanations. Do not add ```markdown or any other formatting, only output the prompt itself.
"""
    elif rant_mode:
        prompt = f"""
You are my assistant that helps me post-process transcripts of messages I want to send to my coworkers.
You will be given a transcript. Your job is to summarize it into a more concise, readable and clear  message that I can send to my coworkers.

The message should be:
- Shorter and to the point.
- Stripped of overly-casual language.
- Focused on the core issues or requests.
- Free of filler words, repetitions, and conversational fluff.

You must keep the core messages and tone of the transcript. Write the output as if you were me; do not include any other text than the message itself.

Here is the transcript of the rant:
<transcript>
{transcript}
</transcript>

NOW ONLY OUTPUT THE CLEANED UP AND SUMMARIZED MESSAGE, DO NOT OUTPUT ANYTHING ELSE
"""
    else:
        prompt = f"""
You are my assistant that helps me post-process transcripts of messages I want to send to make them clearer and more readable. You should not modify the content of the transcript, only adjust it slightly and clean it up into a more readable text message format.

I will provide you with a transcript and you must output the message that I will send to my coworkers.
Your job is to clean up the transcript into a clear and clean  message. You should:
- write the output as if you were me, do not include any other text than the message
- remove any filler words, such as "um", "uh", "like", "you know", "you see", repeating "so", etc.
- remove any redundant words
- you must keep the original tone and style of the transcript

Here is the transcript is:
<transript>
{transcript}
</transript>

NOW ONLY OUTPUT THE CLEANED UP MESSAGE, DO NOT OUTPUT ANYTHING ELSE
"""

    response = chat(model=model, messages=[{"role": "user", "content": prompt}])
    summary = response["message"]["content"]

    print("\n--- post-processed transcript ---")
    print(summary)
    print("--------------------")

    return summary