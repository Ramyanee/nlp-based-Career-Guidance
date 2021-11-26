from gensim.parsing.preprocessing import remove_stopwords
import nltk
nltk.download('punkt')
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer
#from pyswip import Prolog
import re
import string
string.punctuation
ps = PorterStemmer()
file = open('/Users/ramyanee/Downloads/AI/AI-A5-RamyaneeKashyap-MT21139/facts.txt','w')

def preprocess(text):
    text = re.sub(re.compile('<.*?>') , '', text)
    text = re.sub(r'^https?:\/\/.*[\r\n]*', '', text, flags=re.MULTILINE)
    text = text.lower()
    text = "".join([t for t in text if t not in string.punctuation])
    text = remove_stopwords(text)
    # text = word_tokenize(text)
    return word_tokenize(text)

def pf():
    print("Are the following python frameworks are familiar to you?\n")
    for x in ['numpy','pandas','scikit_learn','tensorflow','pytorch']:
        r = preprocess(input(f"{x}\n"))
        if 'yes' in r or 'yeah' in r or 'yup' in r:
            file.write(f'knows({x}).\n')

def knows(L):
    for x in L:
        r= preprocess(input(f"do you know {x}?\n"))
        if 'yes' in r or 'yeah' in r or 'yup' in r:
            file.write(f'knows({x}).\n')
            if x=='python':
                pf()
def good_at(L):
    for x in L:
        r= preprocess(input(f"Are you good at {x}?\n"))
        if 'yes' in r or 'yeah' in r or 'yup' in r:
            file.write(f'good_at({x}).\n')
def interested(L):

    for x in L:
        r= preprocess(input(f"Are you interested in {x}?\n"))
        if 'yes' in r or 'yeah' in r or 'yup' in r:
            file.write(f'interested(\'{x}\').\n')

def aiml():
    knows(['python','prolog','machine_learning'])
    good_at(['statistics_and_probability','linear_algebra','logic'])
    interested(['Conversational AI','Computer Vision','Game Development'])

def de():
    knows(['\'Python\'','sql','hadoop','spark'])
    good_at(['statistics_and_probability','linear_algebra'])
    interested(['Big Data','Database Administration'])
        
def isec():
    knows(['\'C\'','cpp','java','unix'])
    good_at(['bash_scripting','number_theory','discrete_mathematics'])
    interested(['ethical hacking'])


def mc():
    knows(['\'Operating System\'','\'Computer Networks\''])
    good_at(['\'Embedded Systems','Programming\''])
    interested(['Internet of Things','Robotics'])

name = input("""

What is your name?:
""")
name = preprocess(''.join([i for i in name if not i.isdigit()]))
file.write('name({}).\n'.format(name[0]))

cgpa = input("""Is your CGPA more than 7.5?:
""")
cgpa = cgpa.lower()
cgpa = preprocess(cgpa)

for c in cgpa:
    if c=='yes' or c=='yeah' or c=='yup':
        file.write('cgpa(high).\n')
    else:
        file.write('cgpa(low).\n')


field = preprocess(input("""Which of these professions attract you most?
1. Machine Learning Engineer or AI Researcher
2. Data Engineer or Big Data expert
3. Cyber Security Expert
4. Iot Specialist or System Engineer
""")  )    

if "1" in field or "ai" in field or "ml" in field or "machine" in field or "researcher" in field:
    aiml()
elif "data" in field or "de" in field or "big" in field:
    de()

elif "info" in field or "security" in field or "cyber" in field or "information" in field:
    isec()
elif  "iot" in field or "internet" in field or "system" in field:
    mc()
