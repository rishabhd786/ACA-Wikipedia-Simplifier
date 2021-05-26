# SUMMARY OF THE PAPER
## INTRODUCTION
This paper deals with the problem of simplifying the language, sentence structure , style of the original Wikipedia articles into a more readable 
form. The *Flesch-Kincaid* index is used as the measure of readability.
 
## CONCEPTS DEALT
**Encoder**<br>
The Encoder used is the *Google Universal Sentence Encoder* which converts the lexemes used in the source into high dimensional vectors which encapsulate the information contained in the said lexeme.<br>

**Lexeme Splitter**<br>
This is a heuristics driven engine which will split the source text into lexemes which are meaningful phrases or short sentences. This engine gives priority to sentecnes terminators like (.), (;), (:) when the length of the phrase goes above the specified hyper parameters, the engines falls back on secondary terminators like the (,) and (-).<br>

**Text Generator**<br>
Here the Generative Pretrained Transformer-2 (GPT-2) is used. It is a language model which takes some source text as input and can generate text samples which are aligned with the source in meaning, style and content.<br>
Since this is a pretrained model, we do not need to train it for the content part but fine tuning is required for alignment of style. The text for fine tuning will be existing simple wikipedia articles.<br>

**Similarity Index**<br>
The similarity index between two vectors is calculated as their inner product which for our purposes needs to as high as possible.<br>

**Rejection Pass Filter**<br>
In this architecture the GPT-2 will generate a set of possible replacements for the source lexemes. The sentence encoder will convert all these phrases and the source lexemes into high dimensional vectors. The source lexemes will be replaced only if the maximum similarity index between source embedding and any of the possible replacements is more than the hyper parameter τ. If none of the possibilities satisfy the condition the source lexemes will not be replaced.<br>

## PSEUDO CODE
```
Input: content source s
Output: simplified text st = ””
repeat
Identify next lexeme l = process(s)
for i = 1 to nsamples do
Generate next sample xi = generate(st)
Save embedding score e(xi)
end for
if max(|e(xi) − e(l)|) > τ then
st = argmax(|e(xi) − e(l)|) + st
else
st = l + st
end if
until source s is done
```

## ARCHITECTURE
![Please look to another PR](https://github.com/parinayc20/ACA-Wikipedia-Simplifier/blob/main/Assignment-5/assignment-architecture.png)<br>

## HYPER PARAMETERS
τ is a rejection threshold (minimum acceptable similarity), {MIN, MINSOFT,
MAX} are the unconditional minimum, punctuation-marked minimum, and the maximum
lexeme size in words respectively, SEED is the number of lexemes provided as context, NSAMPLES stands for the number of candidates produced by the generator per each lexeme, and t◦ is the generation temperature.<br>

## CONCLUSION
This model has a 37.7% replacement rate and an average of 4.712 increase in the readability index. The model performs better when the training material matches the context of the source.