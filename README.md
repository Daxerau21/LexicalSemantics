# LexicalSemantics
Matlab programs implementing a neural network based lexical semantics system

This README file was generated on 2021-01-25 by Hermann Moisl.
Last updated: 2021-01-25.

-------------------
GENERAL INFORMATION
-------------------
Title of Dataset: Dynamical systems implementation of intrinsic lexical meaning
Contact Information
 Name: Hermann Moisl
 Institution: Newcastle University, UK
 Email: hermann.moisl49@gmail.com
 ORCID: 0000-0002-5911-0373

This dataset contains data and software associated with an article submitted to the journal Cognitive Linguistics by Hermann Moisl entitled 
'Dynamical systems implementation of intrinsic lexical meaning', henceforth LEX. The full reference will be provided if and when LEX is accepted
for publication. The software files are components of an artificial neural network architecture shown in Figure 3 of LEX, and the .txt 
files are referenced by these components either as input or output, as described below. 

DATA & FILE OVERVIEW
File List: 

DATA FILES
All data files are in .txt Unicode encoding.

alphabet.txt: a list of the letters of the alphabet.
lettermaps.txt: the letter bitmaps corresponding to the example in Figure 4 in LEX.
lettercodes.txt: the vectorized letter bitmaps which are input to the letter subnet of Figure 3 in LEX.
letterreps.txt: 26 representation vectors, one for each letter, output by the letter subnet.

visualmaps.txt: the visual bitmaps corresponding to those in Figure 5 in LEX.
visualcodes.txt: the vectorized visual bitmaps which are input to the visual subnet of Figure 3 in LEX.
visualreps.txt: visual representation vectors, one for each image in Figure 5, output by the visual subnet.

wordlist.txt: List of words to be learned.
wordreps.txt: word representation vectors, one for each word, output by the word subnet of Figure 3 in LEX.

assocreps.txt: vectors representing the association of words and visuals output by the association subnet of Figure 3 in LEX.


PROGRAM FILES
Matlab program files are in .txt format. The .m extension denotes the code file, and the .fig extension the associated GUI file.

letter.m and letter.fig: implementation of the letter subnet of Figure 3 of LEX. 
visual.m and visual.fig: implementation of the visual subnet of Figure 3 of LEX.
word.m and word.fig: implementation of the word subnet of Figure 3 of LEX.
assoc.m and assoc.fig: implementation of the association subnet of Figure 3 of LEX.
lstm4.m and lstm4.fig: implementation of the Long Short-Term Memory (LSTM) network require for Figure 12 in LEX.
pca.m: implementation of principal component analysis used by the above programs to reduce output vector dimensionality.
cl.m: implementation of hierarchical cluster analysis for tree diagrams of network output.

The program and data files are structurally related, as described in the next section.

HOW TO USE THE DATASET
Programs require the standard Matlab environment to run. All the data and program files must be downloaded into 
the same folder and the Matlab environment pointed to that folder. The programs are designed to be run in
the following order and use the following data files:

1. letter.m generates letter representations used by word.m. Input: lettercodes.txt and alphabet.txt. Output: letterreps.txt and, where specified,
   a learning trajectory plot. 
2. word.m generates word representations used by assoc.m. Input: letterreps.txt and wordlist.txt. Output: wordreps.txt and, where specified,
   a learning trajectory plot.
3. visual.m generates visual representations used by assoc.m. Input: visualcodes.txt. Output: visualreps.txt and, where specified,
   a learning trajectory plot.
4. assoc.m generates representations of the association between word and visual input. Input: wordreps.txt and
   visualreps.txt. Output: assocreps.txt and, where specified,
   a learning trajectory plot.

To generate Figure 12 in LEX, lstm4.m is used. Input: letterreps.txt and lstmstrings.txt. Output: lstmstrreps.txt and, where specified,
a learning trajectory plot.

Programs are invoked by typing the program name, with .m extension, in the Matlab environment window. The program generates 
the associated GUI, which requires input parameters from the user. The results reported in LEX used the following parameters:

letter.m
- Initialization: Sets program-internal variables.
- Load letter codes: Loads lettercodes.txt.
- Nr of hidden units: Requires user entry. For LEX, this was 24.
- Nr of iterations: Number of training iterations. For LEX, this was 2000.
- Nr of cycles: Number of iterations of the training procedure for any given input/output pair. For LEX, this was 1.
- Learning rate: For LEX, this was 0.1.
- Show training graph: Shows the error curve over the training interval 1..nr of iterations. Note that selecting this radically slows 
  the training process. It is useful for experimentation in determining optimal network settings.
- Train: Starts the training procedure.
- Show trajectories 2-D and 3-D: Select two or three dimensional learning trajectories. Neither needs to be selected. If one or the other is, 
  then there is a lag, possibly substantial, while Matlab constructs the graph.
- Run: Generates letter representations as output in letterreps.txt and draws the training trajectory if selected.

word.m
Use is analogous to that of letter.m. Input is letterreps.txt. Output is wordreps.txt. Parameter settings for results in LEX:
- Nr of hidden units: 20
- Nr of iterations: 1200
- Nr of cycles: 1
- Learning rate: 0.1

visual.m
Use is analogous to that of letter.m. Input is visualcodes.txt. Output is visualreps.txt. Parameter settings for results in LEX:
- Nr of hidden units: 18
- Nr of iterations: 2000
- Nr of cycles: 1
- Learning rate: 0.1

assoc.m
Use is analogous to that of letter.m. Input is wordreps.txt and visualreps.txt. Output is assocreps.txt. Parameter settings for results in LEX:
- Nr of hidden units: 18
- Nr of iterations: 2000
- Nr of cycles: 1
- Learning rate: 0.1

lstm4.m
Use is analogous to that of letter.m. Input is letterreps.txt and lstmstrings.txt. Output is lstmstrreps.txt. Parameter settings for results in LEX:
- Nr of hidden units: 10
- Nr of iterations: 1000
- Nr of cycles: 1
- Learning rate: 0.1

Note that the network architectures used in LEX are notoriously sensitive to connection initialization, and the above programs use the Matlab random 
number generator for that purpose. The result is that multiple runs may be required for replication of results reported in LEX.

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
