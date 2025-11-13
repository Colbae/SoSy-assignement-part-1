# Fundamentals of Software Systems (FSS)
## Software Evolution - Part I Assignment
**Group g16**

---

## Prerequisites

- **Python Version**: 3.12
- **Installation**:
  ```bash
  python -m venv .venv
  .venv\Scripts\activate  # Windows
  # source .venv/bin/activate  # macOS/Linux
  pip install -r requirements.txt
  ```

---

## Task 1: Defect Analysis

### Approach & Design Decisions


### Calculate and plot the total number of defects per month. Why do you think the number of defects dropped sharply in October 2025?



### Calculate and plot the number of defects per month for the two files with the highest number of defects.


### In which month were the most defects introduced? How would you explain it? Manually examine the repository for that month (e.g., change logs, releases, commit messages) and come up with a hypothesis.


### What are the limitations of this method for finding defective hotspots?

---

## Task 2: Complexity Analysis

### Selected Complexity Metrics
1. **[Metric 1 ]**: 
2. **[Metric 2 ]**: 

### Approach & Design Decisions

### Calculate the complexity of all .py files in the repository using the selected metrics.

### Visualize the complexity hotspots. The visualization should effectively convey which parts of the code are more complex or change more frequently. Feel free to use any visualization of your choice and explain the rationale behind your decision.


### What can you say about the correlation between the two complexity measures in this repository? For example, if you selected CC and LoC, what can you say for the statement “Files with more lines of code tend to have higher cyclomatic complexity”?


---

## Task 3: Coupling Analysis

### Approach & Design Decisions


### Calculate the logical coupling for each file pair in the repository. Visualize the 10 most coupled file pairs using a visualization of your choice that effectively conveys the coupling relationships. Select one of these 10 most coupled file pairs and comment on their relationship.

**Top coupled pairs:**
[]

**Selected Pair Analysis**: 
- **File 1**: 
- **File 2**:

**Comment on their relationship**:


### Repeat the steps of the bullet point above, but consider only file pairs where the one file is a Python test file, i.e., starts with “test ”, and the other is a Python non-test file. How would you explain this type of coupling? Is it a code smell that requires attention and signals potential refactoring opportunities or is it something different?


**Top coupled pairs:**
[]

**Selected Pair Analysis**: 
- **File 1**:
- **File 2**:


**Explanation of this Coupling**: 



### Writing tests is a time-consuming task and developers often omit it, thus, automated test generation tools have been implemented and are widely used. One of the most popular test generation tools for Python is Pynguin, that takes as input a .py file and generates passing tests for that file. Pynguin writes the generated tests to a new file in a separate folder, isolated from the project’s test suite. Suppose that you are tasked with implementing an option for Pynguin to place the tests directly in the project’s test suite, specifically in the test file that is most closely “related” with the input .py file. Discuss at least three (3) implementations for selecting the most “related” test file given a (non-test) .py file. You do not have to implement these options at this stage.

#### Strategy 1:


#### Strategy 2:


#### Strategy 3:


### Select two of the three test placement implementations you proposed above. Where would they place automatically-generated tests for the src/transformers/generation/utils.py file?

**Using Strategy 1**: 

**Using Strategy 2**:


---
## Team Members
- Noah Ziegler
- Colin Bächtold
- Piotrmaciej Wojtaszewski