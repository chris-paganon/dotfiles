from ollama import chat


def llm_post_process(
    transcript: str, model: str, prompt_mode: bool = False, rant_mode: bool = False
) -> str:
    """Post-process the transcript using an LLM."""

    if prompt_mode:
        prompt = f"""
You are an assistant that helps me write prompts for LLM coding agents from transcribed audio. Your goal is to take my raw, transcribed audio and transform it into a clearer, concise, and effective prompt.

You will be given a transcript of my request. You must analyze it and produce an optimized prompt that a coding agent can use to perform a task.

The coding agent is running within an IDE and already has access to the codebase and any other relevant information. The coding agent already knows it is a coding agent and what type of code it is working on. Your task is only to clarify the transcript into a clearer and more specific prompt.

The prompt should be:
- Clear and specific.
- Context-rich, providing all the possible information available in the transcript. Do not add any information that is not in the transcript.
- Action-oriented, stating the desired outcome.
- Well-structured, possibly using markdown for clarity (e.g., for code blocks, lists).
- Free of filler words, repetitions, and conversational fluff.
- Do not add a phrase at the start similar to "You are a helpful assistant...", "You are an expert..." or "You are a coding agent..."... Instad start directly with the task/question/request.
- Add lists and paragraphs when necessary.
- DO NOT start with vague phrases like "Develop software to...". Instead be direct about the task/request/question.
- DO NOT come up with any new instrutions, ideas, or information. Only use the information provided in the transcript.

Here is the transcript:
<transcript>
{transcript}
</transcript>

Now, based on the transcript, generate the final, optimized prompt for the coding agent. Output ONLY the prompt itself, without any introductory text, conversational pleasantries, or explanations. Do not add ```markdown or any other formatting, only output the prompt itself.
"""
    elif rant_mode:
        prompt = f"""
You are my assistant that helps me post-process transcripts of messages I want to send to other people.
You will be given a transcript. Your job is to summarize it into a more concise, readable and clear message that I can send to other people.

The message should be:
- Summarizing: Remove repeating meaning and condense the message if possible.
- Readability: Free of filler words, repetitions, and conversational fluff.
- Formatting: Add new paragraphs when necessary but do not use markdown.
- Optional lists: You may reorganize some content with lists (only if relevant). Do not use markdown, just plain text. Lists should use simple numbers "1. " or a single dash "- ". Do not add extra spaces.
- Tone: The original tone must be strictly preserved.
- Content: Do not alter the meaning or change the user's original intent.

You must keep the core messages and tone of the transcript. Write the output as if you were me; do not include any other text than the message itself.

Here is the transcript of the rant:
<transcript>
{transcript}
</transcript>

Now only output the cleaned up and summarized message, do not output anything else
"""
    else:
        prompt = f"""
You are an expert in cleaning up raw, transcribed text. Your task is to make minimal content edits to a transcript to improve its readability while strictly preserving the original content, tone, and style.

Follow these rules precisely:
- Improve Formatting: Improve the formatting of the transcript by adding new paragraphs, lists, etc.
- Remove Only Filler Words: Your main task is to remove conversational filler words and disfluencies (e.g., "um", "uh", "ah", "er", "like", "you know", "I mean", "so", "right"...) and accidental repetitions of words.
- Do Not Summarize: Do not try to summarize the transcript.
- Correct Typos: You may fix transcription errors (e.g., "it's" instead of "is", repeated words like "the the".
- Corret Transcription errors: The transcription software can make mistakes and pickup the wrong word sometimes. Identify the places where the wording feels weird or out of context and attempt to fix it.
- Add Minimal Punctuation: Add basic punctuation like commas and periods to improve readability.
- Preserve Core Content: Do not alter the meaning or change the user's original intent in any way.
- Maintain Original Tone: The speaker's tone (e.g., casual, formal, humorous) must be kept as it is in the transcript.

You will be given a raw transcript. You must output ONLY the cleaned-up text, with no introductory phrases, explanations, or markdown formatting. Write the output as if you were me.

Here is the transcript:
<transcript>
{transcript}
</transcript>

Now, output only the cleaned-up version of the transcript. Do not output anything else.
"""

    response = chat(model=model, messages=[{"role": "user", "content": prompt}])
    summary = response["message"]["content"]

    print("\n--- post-processed transcript ---")
    print(summary)
    print("--------------------")

    return summary
