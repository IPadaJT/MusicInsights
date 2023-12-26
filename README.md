# MusicInsights
An SQL-centered approach to understanding and discovering trends and insights within a database. The data source involves csv files containing information about the products of the store, store customers and store employees. Technologies used for this project involved pandas and Python for exploration and, if necessary, cleaning of the dataset. SQL was used to query the data and find insights that can drive data-driven decision-making. 

# Introduction
Music has been a huge industry since it's creation. As a form of art and outlet of creativity, music is a universal comfort for people. As a major business, music has become a multi-billion dollar that encompasses the creation, distribution and publishing of music. For these reasons, businesses need to have a better understanding of their data to reveal insights and trends that can be used to drive growth.

# Goals
The goals of this projects are to provide its' stakeholders a more complete view of their business through the data. Using this database, actionable insights can be discovered by exploring and analyzing customer preferences, top-sellers, and market trends. By querying the data, stakeholders for this business should have data-driven knowledge which can be used to optimize their business operations and strategies. Here are some of the questions that I will be finding answers to:
1. What are the top selling artists, albums, and genres?
2. Which employees are high-performing?
3. Is there a customer preference for the type of media? Does this differ based on a type of demographic?

# Datasource
This data is sourced from Kaggle which can be found [here](https://www.kaggle.com/datasets/samaxtech/chinook-music-store-data?select=chinook.db)

# Cleaning/Exploring the Data
All this information is present in the ExploringData Jupyter Notebook. My first step in the exploration process was to read in the csv files to DataFrames but given the large number of files, I opted to automate the process using Python. 

![image](https://github.com/IPadaJT/MusicInsights/assets/117694350/b569850b-319c-4aa7-ae0e-8bcee7196836)

This block of code iterates through each csv file in my resources folder and reads them into dataframes into a empty dictionary. Within the dictionary of dataframes, I renamed them and iterated through the dictionary to make them variables that could be called on. 

For each DataFrame, I checked for nulls and duplicates. Initially, I decided to remove all rows with null values and create a "clean" version of the csv for SQL import. But within the context of the data, I decided to use the original data to give a more complete view of the customer demographic and products within the store. 

# SQL Setup
Under the Tables.sql file is the code used to create each table within my database so that the csv files could be imported to postgreSQL

# SQL Queries

# SQL Answers

# Data Vizualization

# Conclusions
