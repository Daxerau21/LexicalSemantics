# LexicalSemantics
Matlab programs implementing a neural network based lexical semantics system

This README file was generated on 2021-01-25 by Hermann Moisl.
Last updated: 2021-01-26.

-------------------
GENERAL INFORMATION
-------------------
Title of Dataset: Dynamical systems implementation of intrinsic lexical meaning
Contact Information
 Name: Hermann Moisl
 Institution: Newcastle University, UK
 Email: hermann.moisl49@gmail.com
 ORCID: 0000-0002-5911-0373

This dataset contains data and software associated with an article submitted to the journal Cognitive Linguistics entitled 
'Dynamical systems implementation of intrinsic lexical meaning', henceforth LEX. The full reference will be provided if and when LEX is accepted
for publication; a preprint 'WordMeaning.pdf' is provided to enable interpretation of what follows. The software files are components of an 
artificial neural network architecture shown in Figure 3 of LEX, and the .txt files are referenced by these components either as input or 
output, as described below. 

--------------------
DATA & FILE OVERVIEW
--------------------

PREPRINT
WordMeaning.pdf: Preprint of the article 'Dynamical systems implementation of intrinsic lexical meaning' submitted to the journal 
Cognitive Linguistics, which provides the context for the data and program files listed below.

DATA FILES
All data files are in .txt Unicode encoding.

alphabet.txt: a list of the letters of the alphabet.
lettermaps.txt: the letter bitmaps corresponding to the example in Figure 4 in LEX.
lettercodes.txt: the vectorized letter bitmaps which are input to the letter subnet of Figure 3 in LEX.
visualmaps.txt: the visual bitmaps corresponding to those in Figure 5 in LEX.
visualcodes.txt: the vectorized visual bitmaps which are input to the visual subnet of Figure 3 in LEX.
wordlist.txt: List of words to be learned.

PROGRAM FILES
Matlab program files are in .txt format. The .m extension denotes the code file, and the .fig extension the associated GUI file.

letter.m and letter.fig: implementation of the letter subnet of Figure 3 of LEX. 
visual.m and visual.fig: implementation of the visual subnet of Figure 3 of LEX.
word.m and word.fig: implementation of the word subnet of Figure 3 of LEX.
assoc.m and assoc.fig: implementation of the association subnet of Figure 3 of LEX.
lstm4.m and lstm4.fig: implementation of the Long Short-Term Memory (LSTM) network require for Figure 12 in LEX.
pca.m: implementation of principal component analysis used by the above programs to reduce output vector dimensionality.
cl.m: implementation of hierarchical cluster analysis to generate tree diagrams of network output.

----------------------
HOW TO USE THE DATASET
----------------------
Programs require the standard Matlab environment to run. All the data and program files must be downloaded into 
the same folder and the Matlab environment pointed to that folder. The programs are designed to be run in
the following order and use the following data files; varying the order will result in malfunction:

1. letter.m generates letter representations used by word.m. Input: lettercodes.txt and alphabet.txt. Output: letterreps.txt. 
2. word.m generates word representations used by assoc.m. Input: letterreps.txt and wordlist.txt. Output: wordreps.txt.
3. visual.m generates visual representations used by assoc.m. Input: visualcodes.txt. Output: visualreps.txt.
4. assoc.m generates representations of the association between word and visual input. Input: wordreps.txt and
   visualreps.txt. Output: assocreps.txt.

To generate Figure 12 in LEX, lstm4.m is used. Input: letterreps.txt and lstmstrings.txt. Output: lstmstrreps.txt.

Programs are invoked by typing the program name, without the .m extension, in the Matlab environment window. The program generates 
the associated GUI, which requires input parameters from the user. Radio buttons in the GUI are to be selected strictly sequentially 
from top to bottom. The parameters used for the results reported in LEX are given below.

letter.m
- Initialization: Sets program-internal variables.
- Load letter codes: Loads lettercodes.txt and shows the code matrix dimensions.
- Nr of hidden units: Requires user entry. For LEX, this was 24.
- Nr of iterations: Number of training iterations. For LEX, this was 2000.
- Nr of cycles: Number of iterations of the training procedure for any given input/output pair. For LEX, this was 1.
- Learning rate: For LEX, this was 0.1.
- Show training graph: Shows the training error curve over the training interval 1..nr of iterations. Selecting this radically slows 
  the training process. It is, however, useful for experimentation in determining optimal network settings.
- Train: Starts the training procedure. Completion of training is notified in the Matlab interface workspace.
- Run: Generates letter representations as output in letterreps.txt. Completion is notified in the Matlab interface workspace.
- Show trajectories 2-D and 3-D: Shows the training trajectories of the hidden layer in 2 or 3 dimensions. There is a lag as the graph is 
  constructed; this lag grows with increasing hidden layer size and number of training interations and can be substantial. The graph
  will, however, eventually appear.

Use of the following programs is analogous to that for letter.m. Any deviations are noted as required.

word.m
Input: letter representations generated by letter.m in file letterreps.txt, and the list of words to be learned in wordlist.txt. 
Output: word representations in file wordreps.txt. Parameter settings for results in LEX:
- Nr of hidden units: 20
- Nr of iterations: 1200
- Nr of cycles: 1
- Learning rate: 0.1
Selecting 'Show letter sequence trajectories' shows, for each word, the letter trajectory through the hidden layer space. Each 'enter' 
key press advances the trajectory by one letter, and when complete the letter trajectories for all the words in wordlist.txt are
displayed.

visual.m
Input: visualcodes.txt. Output: representations of input visual codes in file visualreps.txt. Parameter settings for results in LEX:
- Nr of hidden units: 18
- Nr of iterations: 2000
- Nr of cycles: 1
- Learning rate: 0.1

assoc.m
Input: word representations generated by word.m in file wordreps.txt and visual representations generated by visual.m in file
visualreps.txt. Output: representations of word / visual association in file assocreps.txt. Parameter settings for results in LEX:
- Nr of hidden units: 18
- Nr of iterations: 2000
- Nr of cycles: 1
- Learning rate: 0.1

lstm4.m
Input: letterreps.txt and a list of alphabetic strings to be learned in file lstmstrings.txt. Output: lstmstrreps.txt. Parameter settings for 
results in LEX:
- Nr of hidden units: 10
- Nr of iterations: 1000
- Nr of cycles: 1
- Learning rate: 0.1

Note that the network architectures used in LEX are notoriously sensitive to connection initialization, and the above programs use the Matlab 
random number generator for that purpose. The consequence is that multiple runs may be required for replication of results reported in LEX.

-------------------
CODE DOCUMENTATION
-------------------
All programs share a common structure and variable naming policy, which is described in what follows; differences of detail are documented
by inline comments within the code. Note that the guiding principle for the code was clarity rather than processing efficiency, so that variable 
and event handler names are maximally descriptive and executable code is sequential rather than segmented into interacting subroutines. 

Program structure
Structural sections are clearly demarcated in the code.

1. Each file starts with the standard Matlab header, which should not be edited.
2. Functions: used, for example, in the network training procedure.
3. Initialization: initializes program-internal settings.
4. Input: loads relevant data files and contains event handlers for user input.
5. Train: implements the backpropagation training algorithm for artificial neural networks to train the network.
6. Run: Passes input data through the trained network to generate and output results.
7. Graphical display of network behaviour.
