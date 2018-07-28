# DS Language Analysis

In this data analysis project, we aim to understand how the choice of programming language is affected by the preference of a data science task. 

Our exploratory data analysis report can be found [here](results/report.md).

## Question

Does someone's favorite data science task have an effect on their choice between R and Python?

## Variables

* Programming Language
	* Python
	* R

* Data science task
	* Wrangling
	* Visualization
	* Machine Learning


## Confounding Variables

* Academic Background of the user.
    * Computer Science/Computer Engineering
    * Mathematics/Statistics
    * Other

We think the academic background would be a confounding variable as people with Computer Science/Computer Engineering background would have been introduced to Python as part of their degree and R would have been introduced to students of Mathematics/Statistics degrees. However, we do not anticipate any bias towards R or Python by students of any other degrees.

* Does the user enjoy/love coding?
    * Yes
    * No
    * Indifferent

We think the user's outlook towards coding could be a confounder as Python is a General purpose programming language and it can be used in various areas, and its application is not limited Data Science/Statistics whereas R is a Statistical programming language and is mainly used only in the fields of Data Science and Statistics.

* First Programming Language of the user.
    * Python
    * R
    * SAS
    * Matlab
    * C, C++, C#, Java, JavaScript
    * Others

We think a person's first programming language will be very influential as it dictates their style of coding and will also be a deciding factor in what they seek for in other languages. Some of the languages, listed above are more closely related to Python whereas some others are more related to R.  


* Number of programming languages actively being used.
    * 1
    * 2
    * 3
    * 4
    * \> 5

We believe that the number of programming languages a person actively uses could be a deciding factor as it can dictate how comfortable the user is in using different syntaxes and will also be indicative of how flexible the user.

* Years of coding experience prior to using Python/R
    * < 1
    * 1 - 5
    * \> 5

We believe that the years of coding experience could be a confounder as it can be indicative of how open the user is in selecting a Statistical programming language over a General purpose programming language. However, we also realize that it is possible that a user can become highly opinionated when they have greater experience, and they might prefer Python. This could be an interesting variable to analyze.


## Statistical Analysis

For the statistical analysis, we are planning to use Generalized Linear Model(GLM) as the response variable is discrete and we have more than two groups when we consider the confounding variable.

## Survey Questions


 Survey link:  https://goo.gl/forms/zdl0VlHK2NwAfflE3
 

## How to Run the Data Analysis Pipeline

`make all`: To run the complete pipeline.

`make clean`: To delete all plots, rendered documents and wrangled data.

`make remove`: To delete all plots, rendered documents, wrangled data as well as the raw data.


## How to run the tests

`Rscript tests/tests.R`: To run all the tests

## UBC Office Of Research Ethics Guidelines Pertaining To Our Survey


* As a part of our survey, if our online survey company 
 is outside Canada, we will inform the respondents about the same.


*  As a part of our survey, we assure no personal information will be collected during the survey study like (Student no, Name). To avoid directly identifying the respondents

* As a part of our survey, we will ensure individual identity will be protected as per UBC and FIPP research guidelines



## Authors: 

- Nazli Ozum Kafaee

- Prash Medirattaa

- Avinash Prabhakaran
