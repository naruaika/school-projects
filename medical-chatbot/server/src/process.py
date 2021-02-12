from Levenshtein import ratio
import json


with open('db/alodokter_penyakit.json', 'r') as f:
    db = json.load(f)


def qa_pairs(message: str) -> str:
    message = message.lower().lstrip().rstrip()

    max_similarity_score = 0
    reply = ''
    predicate_question = ''
    for question, answer in db.items():
        similarity_score = ratio(question, message)
        if similarity_score > max_similarity_score:
            max_similarity_score = similarity_score
            predicate_question = question
            reply = answer
            if similarity_score >= 0.9:
                break

    closing = '<p>Semoga menjawab, ya ... :)</p>'
    if max_similarity_score <= 0.9:
        reply = '<p>Apakah maksudmu <i>' + predicate_question + \
            '</i> Kalau iya ...</p>' + reply + closing
    elif max_similarity_score <= 0.7:
        reply = 'Maaf, tolong diperjelas lagi maksudnya.'
    elif max_similarity_score <= 0.5:
        reply = 'Maaf, kami belum bisa menjawabnya sekarang.'
    else:
        reply += closing
    return reply
