from ollama import chat


def llm_post_process(transcript: str, model: str) -> str:
    """Post-process the transcript using an LLM."""

    prompt = f""" 
    You are my assistant that helps me post-prcess transcripts of messages I want to send to make them clearer and more readable. You should not modify the content of the transcript, only adjust it slightly and clean it up into a more readable text message format.

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

    NOW ONLY OUTPUT THE CLEANED UP MESSAGE, DO NOT OUTPUT ANYTHING ELSE:
    """

    response = chat(model=model, messages=[{"role": "user", "content": prompt}])
    summary = response.message.content

    print("\n--- summary ---")
    print(summary)
    print("--------------------")

    return summary