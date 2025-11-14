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
- I decided to use Pydriller to analyse the commits of the repository. 
- I cloned the repo locally and then did git checkout v4.57.0 to have the correct version.
  - I then put that local path in my pydriller script.
- Due to the script taking a long time to run I added a progress tracker
- I decided to use "commit.committer_date" although one coul also have used "commit.author_date"
  - I did this because this more accuratley represents when the fix has actually bin fixed and merged.  

### Calculate and plot the total number of defects per month. Why do you think the number of defects dropped sharply in October 2025?
See plot under ![alt text](TASK1_defects_per_month.png)


**Why do you think the number of defects dropped sharply in October 2025?**
- It seems that the release tag v4.57.0 has no more commits after October 3rd:
- Using git log: git log --since="2025-10-01" --oneline
  - 8ac2b916b0 (HEAD, tag: v4.57.0) Release: v4.57.0
  - 2ccc6cae21 v4.57.0 Branch (#41310)"
- Why is that? We can see that one Commit is "Release: v4.57.0" meaning this release has been finished. The rest of Octobers commits which are AFTER this release are not part of our analysis since we specifically checked out this tag.
- Thats why we do not find such little defects in that month.

### Calculate and plot the number of defects per month for the two files with the highest number of defects.

See plot under ![alt text](TASK1_top2_files_defects_per_month.png)

### In which month were the most defects introduced? How would you explain it? Manually examine the repository for that month (e.g., change logs, releases, commit messages) and come up with a hypothesis.

Looking at the graph we can see that for BOTH files March 2025 has the MOST defects in commit messages mentioned. 
Now this Repository is very active and there are a lot of defects in most of the months mentioned in commit messages. So it is **not really unusually high**.
When we look at the Repository for that month we can see that:

**For modeling_utils.py**:
- Refactor: There happened a MAJOR refactor *071a161d3e [core] Large/full refactor of `from_pretrained` (#36033)*  and also some other commits mentiond refactoing: *1c4b62b219 Refactor some core stuff (#36539)*, *66291778dd Refactor Attention implementation for ViT-based models (#36545)*
  - refactoring can also introduce bugs which then have to be fixed
- New features added: Deepseek: *(eca74d1367 [WIP] add deepseek-v3 (#35926))* also "Gemma 3" is mentioned
- A lot of other fixes: regarding dtype and also some memory management

**For init.py**:
- New features added: 
  - Deepseek: (eca74d1367 [WIP] add deepseek-v3 (#35926))
  - 6acd5aecb3 Adding Qwen3 and Qwen3MoE (#36878)
  - 4303d88c09 Add Phi4 multimodal (#36939)
  - 1d3f35f30a Add model visual debugger (#36798)
  - 6515c25953 Add Prompt Depth Anything Model (#35401)

**Releases**:
 - There have been multiple releases: v4.49.0 up until "v4.50.3-DeepSeek-3, origin/v4.50.3-DeepSeek-3-release" --> There were total of 9 releases!


**Conclusion**: 
- We can see that in both files there was a lot of activity regarding adding new stuff. --> Introduces bugs and also bugfixes.
- In modeling_utils.py there were some refactorings which can also possible lead to the introduction of bugs and the fixing of them. Especially the "[core] Large/full refactor of `from_pretrained`".
  - We can also see that this file has MORE defects in commit messages mentioned than init.py --> This suits our analysis of modeling_utils.py having refactors. 
- There were a lot of releases in that month so a lot of general activity.
- These factors lead to a high possibility of bugs being introduced. Which in turn obviously influences how many bugs have been FIXED also (what we are looking for)

### What are the limitations of this method for finding defective hotspots?
Since we are just analysing commit messages, there are several drawbacks:

- Regarding Commit message quality:
  - Not all commit messages might have an appropriate message
    - eg there is a bugfix but there might not be a keyword contained.
  - We must decide what keywords to filter: 
    - there are many ways to describe if there was a bug fixed. (Different developers use different keywords, different languages etc)

- Regarding no context information :
  - We cannot conclude from the commit message, in which file the bug was fixed, if there were more than 1 file changed in that commit (eg fixes bug in file 1, edits unrelated file 2)
  - We are just analysing when a bug (supposedly) gets *fixed* not when it gets *introduced*. Noone writes: bug introduced, since obviously introducing a bug is done unintentionally. (At least not easily, we can find it out if we do further research using some issue system) --> 
    - The point above makes it hard to identify which code changes introduced the bug, which is crucial for hotspot analysis
  - We dont know how large the bug is, or if its just a typo fix for example.

- Regarding overall hotspot identification limitations:
  - We only capture fixed bugs, not existing one. We gain no information about how the current state of the repo is/ where there are hotspots. 
  - We cannot accurately identify emerging hotspots using this technique alone (eg a utility file that gets changed alot will have a lot of changes in this analysis but is not really a hotspot).
  - We have no other metrics available like size, complexity, coupling cohesion --> We need to use these other metrics in combination with this one for it to be useful!




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