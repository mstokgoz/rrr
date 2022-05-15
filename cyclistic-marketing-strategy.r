{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "63a53967",
   "metadata": {
    "papermill": {
     "duration": 0.007598,
     "end_time": "2022-05-15T00:24:24.289227",
     "exception": false,
     "start_time": "2022-05-15T00:24:24.281629",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Google Data Analytics Professional Certificate Capstone #\n",
    "\n",
    "### Author: Serkan TOKGÖZ\n",
    "\n",
    "\n",
    "### Briefing: #\n",
    "\n",
    "Hi, I am Serkan :) This is my capstone of the Google Data Analytics Certificate programme. I discovered some marketing strategies for Cyclistic, the company who provides rental bikes for casual customers and members. In this self-study, I am going to share these strategies for you which analysed with R Programming Language.\n",
    "\n",
    "**Tidyr, Lubridate, plots, bar charts and some date-time shortcuts used in this \"Case Study\" and was coded by me.**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a1d65531",
   "metadata": {
    "papermill": {
     "duration": 0.005909,
     "end_time": "2022-05-15T00:24:24.301572",
     "exception": false,
     "start_time": "2022-05-15T00:24:24.295663",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Cyclistic Marketing Strategy - Self Case Study\n",
    "\n",
    "**Goal:** Design marketing strategies aimed at converting casual riders into annual members. In order to\n",
    "do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why\n",
    "casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are\n",
    "interested in analyzing the Cyclistic historical bike trip data to identify trends.\n",
    "\n",
    "## Step 1: Ask\n",
    "\n",
    "How do annual members and casual riders use Cyclistic bikes differently?\n",
    "\n",
    "* What is the problem trying to be solved?\n",
    "The main difference between the annual members and casual riders according to usage of Cyclistic bikes.\n",
    "\n",
    "## Step 2: Prepare\n",
    "\n",
    "For the purposes of this case study, there is an assumption that the datasets are appropriate and will enable Data Analyst to answer the business questions. The data has been made available by Motivate International Inc. under this license.) This is public data that you can use to explore how different customer types are\n",
    "using Cyclistic bikes. But data-privacy issues are prohibited from using riders’ personally identifiable information.\n",
    "\n",
    "There are 12 datasets related to casual and annual members usage, for the past 12 months. \n",
    "\n",
    "\n",
    "**Lets assign the datasets to a dataframe and see what we have.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "cb1a6e05",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:24:24.318397Z",
     "iopub.status.busy": "2022-05-15T00:24:24.316252Z",
     "iopub.status.idle": "2022-05-15T00:24:24.701676Z",
     "shell.execute_reply": "2022-05-15T00:24:24.699681Z"
    },
    "papermill": {
     "duration": 0.396577,
     "end_time": "2022-05-15T00:24:24.704679",
     "exception": false,
     "start_time": "2022-05-15T00:24:24.308102",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(lubridate)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "ae843167",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:24:24.859329Z",
     "iopub.status.busy": "2022-05-15T00:24:24.720394Z",
     "iopub.status.idle": "2022-05-15T00:24:59.270973Z",
     "shell.execute_reply": "2022-05-15T00:24:59.268833Z"
    },
    "papermill": {
     "duration": 34.563256,
     "end_time": "2022-05-15T00:24:59.274241",
     "exception": false,
     "start_time": "2022-05-15T00:24:24.710985",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.6     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mas.difftime()\u001b[39m masks \u001b[34mbase\u001b[39m::as.difftime()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mdate()\u001b[39m        masks \u001b[34mbase\u001b[39m::date()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m          masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mintersect()\u001b[39m   masks \u001b[34mbase\u001b[39m::intersect()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m             masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32msetdiff()\u001b[39m     masks \u001b[34mbase\u001b[39m::setdiff()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32munion()\u001b[39m       masks \u001b[34mbase\u001b[39m::union()\n",
      "\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m531633\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m729595\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m822410\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m804352\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m756147\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m631226\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m359978\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m247540\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m103770\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m115609\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m284042\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m371249\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(dplyr)\n",
    "path = '../input/cyclistic-members-usage/' \n",
    "secondname = '-divvy-tripdata.csv'\n",
    "\n",
    "## I just preferred to use R for importing data, because I have just 12 datasets in this case study.\n",
    "month1 <- read_csv(paste(path,\"202105\",secondname, sep=\"\"))\n",
    "month2 <- read_csv(paste(path,\"202106\",secondname, sep=\"\"))\n",
    "month3 <- read_csv(paste(path,\"202107\",secondname, sep=\"\"))\n",
    "month4 <- read_csv(paste(path,\"202108\",secondname, sep=\"\"))\n",
    "month5 <- read_csv(paste(path,\"202109\",secondname, sep=\"\"))\n",
    "month6 <- read_csv(paste(path,\"202110\",secondname, sep=\"\"))\n",
    "month7 <- read_csv(paste(path,\"202111\",secondname, sep=\"\"))\n",
    "month8 <- read_csv(paste(path,\"202112\",secondname, sep=\"\"))\n",
    "month9 <- read_csv(paste(path,\"202201\",secondname, sep=\"\"))\n",
    "month10 <- read_csv(paste(path,\"202202\",secondname, sep=\"\"))\n",
    "month11 <- read_csv(paste(path,\"202203\",secondname, sep=\"\"))\n",
    "month12 <- read_csv(paste(path,\"202204\",secondname, sep=\"\"))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "699533df",
   "metadata": {
    "papermill": {
     "duration": 0.008762,
     "end_time": "2022-05-15T00:24:59.293135",
     "exception": false,
     "start_time": "2022-05-15T00:24:59.284373",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Combining all the data in one Dataframe**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "020c1d04",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:24:59.315475Z",
     "iopub.status.busy": "2022-05-15T00:24:59.312919Z",
     "iopub.status.idle": "2022-05-15T00:25:17.683635Z",
     "shell.execute_reply": "2022-05-15T00:25:17.681881Z"
    },
    "papermill": {
     "duration": 18.384252,
     "end_time": "2022-05-15T00:25:17.686389",
     "exception": false,
     "start_time": "2022-05-15T00:24:59.302137",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C809ED75D6160B2A</td><td>electric_bike</td><td>2021-05-30 11:58:15</td><td>2021-05-30 12:10:39</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.90</td><td>-87.63</td><td>41.89</td><td>-87.61</td><td>casual</td></tr>\n",
       "\t<tr><td>DD59FDCE0ACACAF3</td><td>electric_bike</td><td>2021-05-30 11:29:14</td><td>2021-05-30 12:14:09</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.88</td><td>-87.62</td><td>41.79</td><td>-87.58</td><td>casual</td></tr>\n",
       "\t<tr><td>0AB83CB88C43EFC2</td><td>electric_bike</td><td>2021-05-30 14:24:01</td><td>2021-05-30 14:25:13</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.92</td><td>-87.70</td><td>41.92</td><td>-87.70</td><td>casual</td></tr>\n",
       "\t<tr><td>7881AC6D39110C60</td><td>electric_bike</td><td>2021-05-30 14:25:51</td><td>2021-05-30 14:41:04</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.92</td><td>-87.70</td><td>41.94</td><td>-87.69</td><td>casual</td></tr>\n",
       "\t<tr><td>853FA701B4582BAF</td><td>electric_bike</td><td>2021-05-30 18:15:39</td><td>2021-05-30 18:22:32</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.94</td><td>-87.69</td><td>41.94</td><td>-87.70</td><td>casual</td></tr>\n",
       "\t<tr><td>F5E63DFD96B2A737</td><td>electric_bike</td><td>2021-05-30 11:33:41</td><td>2021-05-30 11:57:17</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.88</td><td>-87.63</td><td>41.89</td><td>-87.62</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t C809ED75D6160B2A & electric\\_bike & 2021-05-30 11:58:15 & 2021-05-30 12:10:39 & NA & NA & NA & NA & 41.90 & -87.63 & 41.89 & -87.61 & casual\\\\\n",
       "\t DD59FDCE0ACACAF3 & electric\\_bike & 2021-05-30 11:29:14 & 2021-05-30 12:14:09 & NA & NA & NA & NA & 41.88 & -87.62 & 41.79 & -87.58 & casual\\\\\n",
       "\t 0AB83CB88C43EFC2 & electric\\_bike & 2021-05-30 14:24:01 & 2021-05-30 14:25:13 & NA & NA & NA & NA & 41.92 & -87.70 & 41.92 & -87.70 & casual\\\\\n",
       "\t 7881AC6D39110C60 & electric\\_bike & 2021-05-30 14:25:51 & 2021-05-30 14:41:04 & NA & NA & NA & NA & 41.92 & -87.70 & 41.94 & -87.69 & casual\\\\\n",
       "\t 853FA701B4582BAF & electric\\_bike & 2021-05-30 18:15:39 & 2021-05-30 18:22:32 & NA & NA & NA & NA & 41.94 & -87.69 & 41.94 & -87.70 & casual\\\\\n",
       "\t F5E63DFD96B2A737 & electric\\_bike & 2021-05-30 11:33:41 & 2021-05-30 11:57:17 & NA & NA & NA & NA & 41.88 & -87.63 & 41.89 & -87.62 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| C809ED75D6160B2A | electric_bike | 2021-05-30 11:58:15 | 2021-05-30 12:10:39 | NA | NA | NA | NA | 41.90 | -87.63 | 41.89 | -87.61 | casual |\n",
       "| DD59FDCE0ACACAF3 | electric_bike | 2021-05-30 11:29:14 | 2021-05-30 12:14:09 | NA | NA | NA | NA | 41.88 | -87.62 | 41.79 | -87.58 | casual |\n",
       "| 0AB83CB88C43EFC2 | electric_bike | 2021-05-30 14:24:01 | 2021-05-30 14:25:13 | NA | NA | NA | NA | 41.92 | -87.70 | 41.92 | -87.70 | casual |\n",
       "| 7881AC6D39110C60 | electric_bike | 2021-05-30 14:25:51 | 2021-05-30 14:41:04 | NA | NA | NA | NA | 41.92 | -87.70 | 41.94 | -87.69 | casual |\n",
       "| 853FA701B4582BAF | electric_bike | 2021-05-30 18:15:39 | 2021-05-30 18:22:32 | NA | NA | NA | NA | 41.94 | -87.69 | 41.94 | -87.70 | casual |\n",
       "| F5E63DFD96B2A737 | electric_bike | 2021-05-30 11:33:41 | 2021-05-30 11:57:17 | NA | NA | NA | NA | 41.88 | -87.63 | 41.89 | -87.62 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C809ED75D6160B2A electric_bike 2021-05-30 11:58:15 2021-05-30 12:10:39\n",
       "2 DD59FDCE0ACACAF3 electric_bike 2021-05-30 11:29:14 2021-05-30 12:14:09\n",
       "3 0AB83CB88C43EFC2 electric_bike 2021-05-30 14:24:01 2021-05-30 14:25:13\n",
       "4 7881AC6D39110C60 electric_bike 2021-05-30 14:25:51 2021-05-30 14:41:04\n",
       "5 853FA701B4582BAF electric_bike 2021-05-30 18:15:39 2021-05-30 18:22:32\n",
       "6 F5E63DFD96B2A737 electric_bike 2021-05-30 11:33:41 2021-05-30 11:57:17\n",
       "  start_station_name start_station_id end_station_name end_station_id start_lat\n",
       "1 NA                 NA               NA               NA             41.90    \n",
       "2 NA                 NA               NA               NA             41.88    \n",
       "3 NA                 NA               NA               NA             41.92    \n",
       "4 NA                 NA               NA               NA             41.92    \n",
       "5 NA                 NA               NA               NA             41.94    \n",
       "6 NA                 NA               NA               NA             41.88    \n",
       "  start_lng end_lat end_lng member_casual\n",
       "1 -87.63    41.89   -87.61  casual       \n",
       "2 -87.62    41.79   -87.58  casual       \n",
       "3 -87.70    41.92   -87.70  casual       \n",
       "4 -87.70    41.94   -87.69  casual       \n",
       "5 -87.69    41.94   -87.70  casual       \n",
       "6 -87.63    41.89   -87.62  casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "allData <- rbind(month1, month2, month3, month4, month5, month6, month7, month8, month9, month10, month11, month12)\n",
    "head(allData)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c41f914c",
   "metadata": {
    "papermill": {
     "duration": 0.00935,
     "end_time": "2022-05-15T00:25:17.705458",
     "exception": false,
     "start_time": "2022-05-15T00:25:17.696108",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 3: Process\n",
    "\n",
    "In this step we are going to follow these steps:\n",
    "\n",
    "**1.** Check the data for errors.\n",
    "\n",
    "**2.** Choose your tools.\n",
    "\n",
    "**3.** Transform the data so you can work with it effectively."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "ec18e460",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:17.727377Z",
     "iopub.status.busy": "2022-05-15T00:25:17.725731Z",
     "iopub.status.idle": "2022-05-15T00:25:18.178190Z",
     "shell.execute_reply": "2022-05-15T00:25:18.176152Z"
    },
    "papermill": {
     "duration": 0.466271,
     "end_time": "2022-05-15T00:25:18.181173",
     "exception": false,
     "start_time": "2022-05-15T00:25:17.714902",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 5,757,551\n",
      "Columns: 5\n",
      "$ ride_id       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"C809ED75D6160B2A\", \"DD59FDCE0ACACAF3\", \"0AB83CB88C43EFC…\n",
      "$ rideable_type \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"electric_bike\", \"electric_bike\", \"electric_bike\", \"elec…\n",
      "$ started_at    \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2021-05-30 11:58:15, 2021-05-30 11:29:14, 2021-05-30 14…\n",
      "$ ended_at      \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2021-05-30 12:10:39, 2021-05-30 12:14:09, 2021-05-30 14…\n",
      "$ member_casual \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"casual\", \"casual\", \"casual\", \"casual\", \"casual\", \"casua…\n",
      "Rows: 5,757,551\n",
      "Columns: 5\n",
      "$ ride_id       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"C809ED75D6160B2A\", \"DD59FDCE0ACACAF3\", \"0AB83CB88C43EFC…\n",
      "$ rideable_type \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"electric_bike\", \"electric_bike\", \"electric_bike\", \"elec…\n",
      "$ started_at    \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2021-05-30 11:58:15, 2021-05-30 11:29:14, 2021-05-30 14…\n",
      "$ ended_at      \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2021-05-30 12:10:39, 2021-05-30 12:14:09, 2021-05-30 14…\n",
      "$ member_casual \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"casual\", \"casual\", \"casual\", \"casual\", \"casual\", \"casua…\n"
     ]
    }
   ],
   "source": [
    "## Drop unnecessary columns\n",
    "\n",
    "cleanedData <- allData %>%\n",
    "select(ride_id, rideable_type, started_at, ended_at, member_casual)\n",
    "\n",
    "glimpse(cleanedData)\n",
    "\n",
    "cleanedData <- cleanedData %>%\n",
    "drop_na()\n",
    "\n",
    "glimpse(cleanedData)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "76325531",
   "metadata": {
    "papermill": {
     "duration": 0.009505,
     "end_time": "2022-05-15T00:25:18.201076",
     "exception": false,
     "start_time": "2022-05-15T00:25:18.191571",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I just wanted to compare the row numbers after using **drop_na()** function. It seems that there were no rows valued as NA, because the number of rows were equal after **drop_na()** was used."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4971d93c",
   "metadata": {
    "papermill": {
     "duration": 0.009239,
     "end_time": "2022-05-15T00:25:18.219592",
     "exception": false,
     "start_time": "2022-05-15T00:25:18.210353",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 4: Analyze\n",
    "\n",
    "In this step we are going to follow these steps:\n",
    "\n",
    "**1.** Aggregate your data so it’s useful and accessible.\n",
    "\n",
    "**2.** Organize and format your data.\n",
    "\n",
    "**3.** Perform calculations.\n",
    "\n",
    "**4.** Identify trends and relationships."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "ff5ccb14",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:18.242474Z",
     "iopub.status.busy": "2022-05-15T00:25:18.240560Z",
     "iopub.status.idle": "2022-05-15T00:25:25.025203Z",
     "shell.execute_reply": "2022-05-15T00:25:25.023310Z"
    },
    "papermill": {
     "duration": 6.799289,
     "end_time": "2022-05-15T00:25:25.028381",
     "exception": false,
     "start_time": "2022-05-15T00:25:18.229092",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C809ED75D6160B2A</td><td>electric_bike</td><td>2021-05-30 11:58:15</td><td>2021-05-30 12:10:39</td><td>casual</td></tr>\n",
       "\t<tr><td>DD59FDCE0ACACAF3</td><td>electric_bike</td><td>2021-05-30 11:29:14</td><td>2021-05-30 12:14:09</td><td>casual</td></tr>\n",
       "\t<tr><td>0AB83CB88C43EFC2</td><td>electric_bike</td><td>2021-05-30 14:24:01</td><td>2021-05-30 14:25:13</td><td>casual</td></tr>\n",
       "\t<tr><td>7881AC6D39110C60</td><td>electric_bike</td><td>2021-05-30 14:25:51</td><td>2021-05-30 14:41:04</td><td>casual</td></tr>\n",
       "\t<tr><td>853FA701B4582BAF</td><td>electric_bike</td><td>2021-05-30 18:15:39</td><td>2021-05-30 18:22:32</td><td>casual</td></tr>\n",
       "\t<tr><td>F5E63DFD96B2A737</td><td>electric_bike</td><td>2021-05-30 11:33:41</td><td>2021-05-30 11:57:17</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr>\\\\\n",
       "\\hline\n",
       "\t C809ED75D6160B2A & electric\\_bike & 2021-05-30 11:58:15 & 2021-05-30 12:10:39 & casual\\\\\n",
       "\t DD59FDCE0ACACAF3 & electric\\_bike & 2021-05-30 11:29:14 & 2021-05-30 12:14:09 & casual\\\\\n",
       "\t 0AB83CB88C43EFC2 & electric\\_bike & 2021-05-30 14:24:01 & 2021-05-30 14:25:13 & casual\\\\\n",
       "\t 7881AC6D39110C60 & electric\\_bike & 2021-05-30 14:25:51 & 2021-05-30 14:41:04 & casual\\\\\n",
       "\t 853FA701B4582BAF & electric\\_bike & 2021-05-30 18:15:39 & 2021-05-30 18:22:32 & casual\\\\\n",
       "\t F5E63DFD96B2A737 & electric\\_bike & 2021-05-30 11:33:41 & 2021-05-30 11:57:17 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| C809ED75D6160B2A | electric_bike | 2021-05-30 11:58:15 | 2021-05-30 12:10:39 | casual |\n",
       "| DD59FDCE0ACACAF3 | electric_bike | 2021-05-30 11:29:14 | 2021-05-30 12:14:09 | casual |\n",
       "| 0AB83CB88C43EFC2 | electric_bike | 2021-05-30 14:24:01 | 2021-05-30 14:25:13 | casual |\n",
       "| 7881AC6D39110C60 | electric_bike | 2021-05-30 14:25:51 | 2021-05-30 14:41:04 | casual |\n",
       "| 853FA701B4582BAF | electric_bike | 2021-05-30 18:15:39 | 2021-05-30 18:22:32 | casual |\n",
       "| F5E63DFD96B2A737 | electric_bike | 2021-05-30 11:33:41 | 2021-05-30 11:57:17 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C809ED75D6160B2A electric_bike 2021-05-30 11:58:15 2021-05-30 12:10:39\n",
       "2 DD59FDCE0ACACAF3 electric_bike 2021-05-30 11:29:14 2021-05-30 12:14:09\n",
       "3 0AB83CB88C43EFC2 electric_bike 2021-05-30 14:24:01 2021-05-30 14:25:13\n",
       "4 7881AC6D39110C60 electric_bike 2021-05-30 14:25:51 2021-05-30 14:41:04\n",
       "5 853FA701B4582BAF electric_bike 2021-05-30 18:15:39 2021-05-30 18:22:32\n",
       "6 F5E63DFD96B2A737 electric_bike 2021-05-30 11:33:41 2021-05-30 11:57:17\n",
       "  member_casual\n",
       "1 casual       \n",
       "2 casual       \n",
       "3 casual       \n",
       "4 casual       \n",
       "5 casual       \n",
       "6 casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>member_casual</th><th scope=col>duration_time</th><th scope=col>start_date</th><th scope=col>month_value</th><th scope=col>year_value</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C809ED75D6160B2A</td><td>electric_bike</td><td>2021-05-30 11:58:15</td><td>2021-05-30 12:10:39</td><td>casual</td><td> 744 secs</td><td>2021-05-30</td><td>5</td><td>2021</td></tr>\n",
       "\t<tr><td>DD59FDCE0ACACAF3</td><td>electric_bike</td><td>2021-05-30 11:29:14</td><td>2021-05-30 12:14:09</td><td>casual</td><td>2695 secs</td><td>2021-05-30</td><td>5</td><td>2021</td></tr>\n",
       "\t<tr><td>0AB83CB88C43EFC2</td><td>electric_bike</td><td>2021-05-30 14:24:01</td><td>2021-05-30 14:25:13</td><td>casual</td><td>  72 secs</td><td>2021-05-30</td><td>5</td><td>2021</td></tr>\n",
       "\t<tr><td>7881AC6D39110C60</td><td>electric_bike</td><td>2021-05-30 14:25:51</td><td>2021-05-30 14:41:04</td><td>casual</td><td> 913 secs</td><td>2021-05-30</td><td>5</td><td>2021</td></tr>\n",
       "\t<tr><td>853FA701B4582BAF</td><td>electric_bike</td><td>2021-05-30 18:15:39</td><td>2021-05-30 18:22:32</td><td>casual</td><td> 413 secs</td><td>2021-05-30</td><td>5</td><td>2021</td></tr>\n",
       "\t<tr><td>F5E63DFD96B2A737</td><td>electric_bike</td><td>2021-05-30 11:33:41</td><td>2021-05-30 11:57:17</td><td>casual</td><td>1416 secs</td><td>2021-05-30</td><td>5</td><td>2021</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & member\\_casual & duration\\_time & start\\_date & month\\_value & year\\_value\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <drtn> & <date> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t C809ED75D6160B2A & electric\\_bike & 2021-05-30 11:58:15 & 2021-05-30 12:10:39 & casual &  744 secs & 2021-05-30 & 5 & 2021\\\\\n",
       "\t DD59FDCE0ACACAF3 & electric\\_bike & 2021-05-30 11:29:14 & 2021-05-30 12:14:09 & casual & 2695 secs & 2021-05-30 & 5 & 2021\\\\\n",
       "\t 0AB83CB88C43EFC2 & electric\\_bike & 2021-05-30 14:24:01 & 2021-05-30 14:25:13 & casual &   72 secs & 2021-05-30 & 5 & 2021\\\\\n",
       "\t 7881AC6D39110C60 & electric\\_bike & 2021-05-30 14:25:51 & 2021-05-30 14:41:04 & casual &  913 secs & 2021-05-30 & 5 & 2021\\\\\n",
       "\t 853FA701B4582BAF & electric\\_bike & 2021-05-30 18:15:39 & 2021-05-30 18:22:32 & casual &  413 secs & 2021-05-30 & 5 & 2021\\\\\n",
       "\t F5E63DFD96B2A737 & electric\\_bike & 2021-05-30 11:33:41 & 2021-05-30 11:57:17 & casual & 1416 secs & 2021-05-30 & 5 & 2021\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 9\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | member_casual &lt;chr&gt; | duration_time &lt;drtn&gt; | start_date &lt;date&gt; | month_value &lt;dbl&gt; | year_value &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| C809ED75D6160B2A | electric_bike | 2021-05-30 11:58:15 | 2021-05-30 12:10:39 | casual |  744 secs | 2021-05-30 | 5 | 2021 |\n",
       "| DD59FDCE0ACACAF3 | electric_bike | 2021-05-30 11:29:14 | 2021-05-30 12:14:09 | casual | 2695 secs | 2021-05-30 | 5 | 2021 |\n",
       "| 0AB83CB88C43EFC2 | electric_bike | 2021-05-30 14:24:01 | 2021-05-30 14:25:13 | casual |   72 secs | 2021-05-30 | 5 | 2021 |\n",
       "| 7881AC6D39110C60 | electric_bike | 2021-05-30 14:25:51 | 2021-05-30 14:41:04 | casual |  913 secs | 2021-05-30 | 5 | 2021 |\n",
       "| 853FA701B4582BAF | electric_bike | 2021-05-30 18:15:39 | 2021-05-30 18:22:32 | casual |  413 secs | 2021-05-30 | 5 | 2021 |\n",
       "| F5E63DFD96B2A737 | electric_bike | 2021-05-30 11:33:41 | 2021-05-30 11:57:17 | casual | 1416 secs | 2021-05-30 | 5 | 2021 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C809ED75D6160B2A electric_bike 2021-05-30 11:58:15 2021-05-30 12:10:39\n",
       "2 DD59FDCE0ACACAF3 electric_bike 2021-05-30 11:29:14 2021-05-30 12:14:09\n",
       "3 0AB83CB88C43EFC2 electric_bike 2021-05-30 14:24:01 2021-05-30 14:25:13\n",
       "4 7881AC6D39110C60 electric_bike 2021-05-30 14:25:51 2021-05-30 14:41:04\n",
       "5 853FA701B4582BAF electric_bike 2021-05-30 18:15:39 2021-05-30 18:22:32\n",
       "6 F5E63DFD96B2A737 electric_bike 2021-05-30 11:33:41 2021-05-30 11:57:17\n",
       "  member_casual duration_time start_date month_value year_value\n",
       "1 casual         744 secs     2021-05-30 5           2021      \n",
       "2 casual        2695 secs     2021-05-30 5           2021      \n",
       "3 casual          72 secs     2021-05-30 5           2021      \n",
       "4 casual         913 secs     2021-05-30 5           2021      \n",
       "5 casual         413 secs     2021-05-30 5           2021      \n",
       "6 casual        1416 secs     2021-05-30 5           2021      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(cleanedData)\n",
    "## I want to add time_duration, so datetime columns needs to be seperated.\n",
    "\n",
    "cleanedData <- cleanedData %>%\n",
    "mutate(cleanedData, duration_time = (ended_at - started_at)) %>%\n",
    "mutate(cleanedData, start_date = date(started_at)) %>%\n",
    "mutate(cleanedData, month_value = month(start_date)) %>%\n",
    "mutate(cleanedData, year_value = year(start_date))\n",
    "\n",
    "head(cleanedData)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "9dd494e3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:25.055149Z",
     "iopub.status.busy": "2022-05-15T00:25:25.053539Z",
     "iopub.status.idle": "2022-05-15T00:25:41.648549Z",
     "shell.execute_reply": "2022-05-15T00:25:41.644399Z"
    },
    "papermill": {
     "duration": 16.612451,
     "end_time": "2022-05-15T00:25:41.652773",
     "exception": false,
     "start_time": "2022-05-15T00:25:25.040322",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>member_casual</th><th scope=col>duration_time</th><th scope=col>start_date</th><th scope=col>month_value</th><th scope=col>year_value</th><th scope=col>string_ym_value</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C809ED75D6160B2A</td><td>electric_bike</td><td>2021-05-30 11:58:15</td><td>2021-05-30 12:10:39</td><td>casual</td><td> 744 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>DD59FDCE0ACACAF3</td><td>electric_bike</td><td>2021-05-30 11:29:14</td><td>2021-05-30 12:14:09</td><td>casual</td><td>2695 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>0AB83CB88C43EFC2</td><td>electric_bike</td><td>2021-05-30 14:24:01</td><td>2021-05-30 14:25:13</td><td>casual</td><td>  72 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>7881AC6D39110C60</td><td>electric_bike</td><td>2021-05-30 14:25:51</td><td>2021-05-30 14:41:04</td><td>casual</td><td> 913 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>853FA701B4582BAF</td><td>electric_bike</td><td>2021-05-30 18:15:39</td><td>2021-05-30 18:22:32</td><td>casual</td><td> 413 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>F5E63DFD96B2A737</td><td>electric_bike</td><td>2021-05-30 11:33:41</td><td>2021-05-30 11:57:17</td><td>casual</td><td>1416 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 11\n",
       "\\begin{tabular}{lllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & member\\_casual & duration\\_time & start\\_date & month\\_value & year\\_value & string\\_ym\\_value & day\\_of\\_week\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <drtn> & <date> & <dbl> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t C809ED75D6160B2A & electric\\_bike & 2021-05-30 11:58:15 & 2021-05-30 12:10:39 & casual &  744 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t DD59FDCE0ACACAF3 & electric\\_bike & 2021-05-30 11:29:14 & 2021-05-30 12:14:09 & casual & 2695 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t 0AB83CB88C43EFC2 & electric\\_bike & 2021-05-30 14:24:01 & 2021-05-30 14:25:13 & casual &   72 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t 7881AC6D39110C60 & electric\\_bike & 2021-05-30 14:25:51 & 2021-05-30 14:41:04 & casual &  913 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t 853FA701B4582BAF & electric\\_bike & 2021-05-30 18:15:39 & 2021-05-30 18:22:32 & casual &  413 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t F5E63DFD96B2A737 & electric\\_bike & 2021-05-30 11:33:41 & 2021-05-30 11:57:17 & casual & 1416 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 11\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | member_casual &lt;chr&gt; | duration_time &lt;drtn&gt; | start_date &lt;date&gt; | month_value &lt;dbl&gt; | year_value &lt;dbl&gt; | string_ym_value &lt;chr&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| C809ED75D6160B2A | electric_bike | 2021-05-30 11:58:15 | 2021-05-30 12:10:39 | casual |  744 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| DD59FDCE0ACACAF3 | electric_bike | 2021-05-30 11:29:14 | 2021-05-30 12:14:09 | casual | 2695 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| 0AB83CB88C43EFC2 | electric_bike | 2021-05-30 14:24:01 | 2021-05-30 14:25:13 | casual |   72 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| 7881AC6D39110C60 | electric_bike | 2021-05-30 14:25:51 | 2021-05-30 14:41:04 | casual |  913 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| 853FA701B4582BAF | electric_bike | 2021-05-30 18:15:39 | 2021-05-30 18:22:32 | casual |  413 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| F5E63DFD96B2A737 | electric_bike | 2021-05-30 11:33:41 | 2021-05-30 11:57:17 | casual | 1416 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C809ED75D6160B2A electric_bike 2021-05-30 11:58:15 2021-05-30 12:10:39\n",
       "2 DD59FDCE0ACACAF3 electric_bike 2021-05-30 11:29:14 2021-05-30 12:14:09\n",
       "3 0AB83CB88C43EFC2 electric_bike 2021-05-30 14:24:01 2021-05-30 14:25:13\n",
       "4 7881AC6D39110C60 electric_bike 2021-05-30 14:25:51 2021-05-30 14:41:04\n",
       "5 853FA701B4582BAF electric_bike 2021-05-30 18:15:39 2021-05-30 18:22:32\n",
       "6 F5E63DFD96B2A737 electric_bike 2021-05-30 11:33:41 2021-05-30 11:57:17\n",
       "  member_casual duration_time start_date month_value year_value string_ym_value\n",
       "1 casual         744 secs     2021-05-30 5           2021       2021-5-1       \n",
       "2 casual        2695 secs     2021-05-30 5           2021       2021-5-1       \n",
       "3 casual          72 secs     2021-05-30 5           2021       2021-5-1       \n",
       "4 casual         913 secs     2021-05-30 5           2021       2021-5-1       \n",
       "5 casual         413 secs     2021-05-30 5           2021       2021-5-1       \n",
       "6 casual        1416 secs     2021-05-30 5           2021       2021-5-1       \n",
       "  day_of_week\n",
       "1 1          \n",
       "2 1          \n",
       "3 1          \n",
       "4 1          \n",
       "5 1          \n",
       "6 1          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "## After, to grouping year-month values, we need year-month string column.\n",
    "\n",
    "cleanedData <- cleanedData %>%\n",
    "mutate(cleanedData, string_ym_value = paste(year_value, month_value,\"1\", sep=\"-\")) %>%\n",
    "mutate(cleanedData, day_of_week = wday(start_date))\n",
    "head(cleanedData)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "38883b15",
   "metadata": {
    "papermill": {
     "duration": 0.009943,
     "end_time": "2022-05-15T00:25:41.675832",
     "exception": false,
     "start_time": "2022-05-15T00:25:41.665889",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "For calculations, I am going to use multiple dummy dataframes."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "840b041a",
   "metadata": {
    "papermill": {
     "duration": 0.009797,
     "end_time": "2022-05-15T00:25:41.695558",
     "exception": false,
     "start_time": "2022-05-15T00:25:41.685761",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Step 5: Share"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "cc83720c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:41.719422Z",
     "iopub.status.busy": "2022-05-15T00:25:41.717754Z",
     "iopub.status.idle": "2022-05-15T00:25:42.168013Z",
     "shell.execute_reply": "2022-05-15T00:25:42.166234Z"
    },
    "papermill": {
     "duration": 0.465726,
     "end_time": "2022-05-15T00:25:42.171090",
     "exception": false,
     "start_time": "2022-05-15T00:25:41.705364",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>rideable_type</th><th scope=col>mean_duration_time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>classic_bike </td><td>1175.5653 secs</td></tr>\n",
       "\t<tr><td>docked_bike  </td><td>4992.4470 secs</td></tr>\n",
       "\t<tr><td>electric_bike</td><td> 920.0664 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " rideable\\_type & mean\\_duration\\_time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t classic\\_bike  & 1175.5653 secs\\\\\n",
       "\t docked\\_bike   & 4992.4470 secs\\\\\n",
       "\t electric\\_bike &  920.0664 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 2\n",
       "\n",
       "| rideable_type &lt;chr&gt; | mean_duration_time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| classic_bike  | 1175.5653 secs |\n",
       "| docked_bike   | 4992.4470 secs |\n",
       "| electric_bike |  920.0664 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  rideable_type mean_duration_time\n",
       "1 classic_bike  1175.5653 secs    \n",
       "2 docked_bike   4992.4470 secs    \n",
       "3 electric_bike  920.0664 secs    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "##Average and Max usage of bikes\n",
    "\n",
    "result1 <- cleanedData %>%\n",
    "select(rideable_type, duration_time)\n",
    "\n",
    "result1 <- result1 %>%\n",
    "group_by(rideable_type) %>%\n",
    "summarize(mean_duration_time = mean(duration_time))\n",
    "result1\n",
    "library(ggplot2)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "88fc0018",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:42.194857Z",
     "iopub.status.busy": "2022-05-15T00:25:42.193211Z",
     "iopub.status.idle": "2022-05-15T00:25:42.776223Z",
     "shell.execute_reply": "2022-05-15T00:25:42.774275Z"
    },
    "papermill": {
     "duration": 0.59759,
     "end_time": "2022-05-15T00:25:42.779000",
     "exception": false,
     "start_time": "2022-05-15T00:25:42.181410",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n",
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nZvE9n/VadeLS6WhfDL6vW7du/+kkM3WnQ1WL12uQ/VTq8Q1vH0266o4ur0TWeS0qSL+811O7\nUjJdlYzEPwcO35I9Q4hel5bw/ZmLQ8elnd046Kej11qah32quboOjnzg/pIhO2c9+uvprIsE\n1MyE17p/qOhMo9vH5H/z3K7UW+4/I6+X5vmstuM7f9n879kUe+6nunTp4uaF6YmrfzqV+vTb\ngxqHm0Sk0sjnvus6cv7p1MHRQZPm74jtNvGhNrEiUuVN5aGeb8492rtHGaN39bIcCwYA4OqG\nLp3xQbXud8fW7tS1Q4Oqxf/5af5nK3bf1PuzHlEh4uzapsSg1W+1H2J8tkG5kP3bN34489vY\n0uaMw1vemfvlo90ezPdK9eZKKybeX/fJL+MrNe7xSNsoOfnd7M8Sb31Yln3smqFDj2rjJmyq\n26rn8Eda2U/snD1p6snIIDmSedWlhZTMo09jmFFE3n/3w/QaDR/u2ijHS3XvLXlpedNRLWMb\n9Hq0UyWLbe3CT37891yrUatae7F/6uquvVKvufuMvORpsDv49XMNuk1KuMagzO6Dnc4Q2bdv\n30ZhQVnTikFEQvS69MR1/6U5Hr+jrKtssjaLt0zZvOZE53YHvKr36B7r4VYAAFDUWMp3/uuv\n8BEjXlu88KNvMoIqV6s55oMfXny0rYiIzvzN1iWD+4/65t0xnxlL1W/Q5IM/9t9q+/CWO8Y+\nN3DwAw/dfz3rrfPEgo0lXn1+4kefz3hdCYu+8+GJs99oFWbJCnbx49ZMS33s3a9XPff453ZV\nLdu05/K3Tjdr8sPVl5VXn1GN3mhff9fKV575u9ZLV2SsqEYjd68t/8y4qQs/npSYYahQ8+Zx\nn4we3bvl9WzaxSVfc6XecvcZeUlRPduHeG9kyLKUqFFTX7u9Zvnc14s0bdrUk4Wc2/bbluPH\nt6z6eqfxtlmv9rMdm9T98TXvfrmowsWrl+c91nVZieHvPrnGq/rsN7IGuXnxxReXLVvmehwR\nEbFixQpPugIKpy7fpuU9UxEwv4M575mAwurMmTORkZF5z1eEOdMvHDmdWb5c8UA3ohGe7rH7\n6Xx63XGLx/avez0rO/nzT8v2Hj10yNb4/ooi4kxPEZEShksHkCON+szkNG/r19MSAAAIIJ2p\nWPlyec8GD3ka7JoWC0qNut6/m+OGPP+WSOqx3wcMeXVcdM3hccEici7TadFn7YE7a3forUG6\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = result1, aes (x =rideable_type, y = mean_duration_time, fill = mean_duration_time)) + \n",
    "geom_bar(stat=\"identity\", width = 0.5) + labs(title = \"Average Usage of Bike Types\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cba66ca5",
   "metadata": {
    "papermill": {
     "duration": 0.011061,
     "end_time": "2022-05-15T00:25:42.801527",
     "exception": false,
     "start_time": "2022-05-15T00:25:42.790466",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Docked bikes has more average usage time than other bikes. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "e99ef354",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:42.827319Z",
     "iopub.status.busy": "2022-05-15T00:25:42.825505Z",
     "iopub.status.idle": "2022-05-15T00:25:43.491287Z",
     "shell.execute_reply": "2022-05-15T00:25:43.489154Z"
    },
    "papermill": {
     "duration": 0.681961,
     "end_time": "2022-05-15T00:25:43.494330",
     "exception": false,
     "start_time": "2022-05-15T00:25:42.812369",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 5 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rideable_type</th><th scope=col>mean_duration_time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>classic_bike </td><td>1730.1535 secs</td></tr>\n",
       "\t<tr><td>member</td><td>classic_bike </td><td> 827.7710 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>docked_bike  </td><td>4992.4470 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>electric_bike</td><td>1159.1658 secs</td></tr>\n",
       "\t<tr><td>member</td><td>electric_bike</td><td> 727.2024 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rideable\\_type & mean\\_duration\\_time\\\\\n",
       " <chr> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & classic\\_bike  & 1730.1535 secs\\\\\n",
       "\t member & classic\\_bike  &  827.7710 secs\\\\\n",
       "\t casual & docked\\_bike   & 4992.4470 secs\\\\\n",
       "\t casual & electric\\_bike & 1159.1658 secs\\\\\n",
       "\t member & electric\\_bike &  727.2024 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rideable_type &lt;chr&gt; | mean_duration_time &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| casual | classic_bike  | 1730.1535 secs |\n",
       "| member | classic_bike  |  827.7710 secs |\n",
       "| casual | docked_bike   | 4992.4470 secs |\n",
       "| casual | electric_bike | 1159.1658 secs |\n",
       "| member | electric_bike |  727.2024 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rideable_type mean_duration_time\n",
       "1 casual        classic_bike  1730.1535 secs    \n",
       "2 member        classic_bike   827.7710 secs    \n",
       "3 casual        docked_bike   4992.4470 secs    \n",
       "4 casual        electric_bike 1159.1658 secs    \n",
       "5 member        electric_bike  727.2024 secs    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "result2 <- cleanedData %>%\n",
    "select(rideable_type, duration_time, member_casual)\n",
    "\n",
    "result2 <- result2 %>%\n",
    "group_by(member_casual, rideable_type) %>%\n",
    "summarize(mean_duration_time = mean(duration_time)) %>%\n",
    "arrange(rideable_type, -mean_duration_time, member_casual)\n",
    "result2"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "8bd016f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:43.521417Z",
     "iopub.status.busy": "2022-05-15T00:25:43.519285Z",
     "iopub.status.idle": "2022-05-15T00:25:44.230623Z",
     "shell.execute_reply": "2022-05-15T00:25:44.227342Z"
    },
    "papermill": {
     "duration": 0.728012,
     "end_time": "2022-05-15T00:25:44.233738",
     "exception": false,
     "start_time": "2022-05-15T00:25:43.505726",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n",
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n0aNTBvaoIiJNm1+asbXPN1NW3fVuv7wj2FO2jhv9+PFL7vrfuV1t5qnPP9mePO2bJ1tajSLS\noHFL5y99Ppj+d+8pHUpn2ZVJJ3+fsj0zcu7spxpE6kWkcTPLtTc+KSLpR99ffCDt8c+euzIx\nQkQaXnLJ3zf0fW3B3mk9fyxydUeLiD9rre1NXxc5X+/YbMJEiUu1uBEuH/Vn0bsLc4RJEZ3B\nFBFh9EzhTOXRg65plXem7GqAkCPYhcDJdVtM1raeHZ+IRJS7bsaM6wqM0++WPpvXrVmw7+DR\no0f3/POrpzGy/M1XNFrydP/bm7dve0mzZm3bd+5YO8FLu19zLOzGduVz/t3zumqfvrtKJN/e\ndtZ949wR+tTde9VzLWkHfldV98PXX5l3NKvzoAh72/N3bOWhiHK9G5w7n2WK6djeajolkrzl\nL31EDU+qExFFb7mlqnXamn0nI4te3Q67iD9rrbj5esdmEyZKXKrFjeD77qLqVTULtLCrAUKO\nYBcCboeq6ExeRnA5TkwYPOzfqGbXd23bvEPTa2/uOfyux0VEp4994vXP7tjyx4bNf/+z6ccF\nb81qeetLL9/btrh23+dYpLx/YpuijYpS8EKZSn2feuEmfb9bnnpy8a0v9aklIvook05v/fbb\nz5S84ylGf2eNvBSdiORbonEG5ZSIqGqBdr1OUVW399Xt+1rbOfWboufrFZtNmChxqRY3wqEF\nK3zcXUTFFFxH7GqAkOMauxBI7FAnK/W3HZnZj26yJf3Yr1+/39NyH9SUdmDu78ft78x74a47\nb+7ZpX3N+OwnTiVt+Wz26wtqNmvf7857Jr48e/4DjTZ+Nd9Lu+9zLNJXG3N/ia/4dL+12pUF\nRhh422Xm+I4v39Fow+yx2zKcImKtcp3qTl982hmRzfzuhLFTlx05j6WEHBV71LAlLdljy159\nrsyda1KyRCTukuYu2/7lSTZPu+rK/OxgavlOtb2vbt/XWnHz9Y7NJkyUuFSLG+H8dhce7GqA\nkCPYhUBs3Qc6xLkfHzPl183/7tzy24yxc7IiO7Wz5v6taYxppLqdn6746/jJo1v/+GHymPki\nsv9IsiE+44tP33zxw6Xbdv23/a+fP/7qgLV6VxExFdPu+xyLtO6FRz9Ztm7Htk2fzXjkvf/S\nbx/fucjRmgx65dKotInPfCMipujLRrZNfGf0hMWrftu7a9unMx/4Ysupq7pVusAlVsaVb/tI\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = result2, aes (x =member_casual, y = mean_duration_time, fill = mean_duration_time)) + \n",
    "geom_bar(stat=\"identity\", width = 0.5) + labs(title = \"Average Usage of Bike Types\") + facet_grid(~rideable_type)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "39b5edc9",
   "metadata": {
    "papermill": {
     "duration": 0.011963,
     "end_time": "2022-05-15T00:25:44.258460",
     "exception": false,
     "start_time": "2022-05-15T00:25:44.246497",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "It seems that members do not use docked bikes. However, docked bikes have a longer average duration time, and these time values related to casual riders. There is an opportunity to earn member from docked bike casual riders."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "66f2b571",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:25:44.287003Z",
     "iopub.status.busy": "2022-05-15T00:25:44.284748Z",
     "iopub.status.idle": "2022-05-15T00:26:09.226866Z",
     "shell.execute_reply": "2022-05-15T00:26:09.224889Z"
    },
    "papermill": {
     "duration": 24.95917,
     "end_time": "2022-05-15T00:26:09.229720",
     "exception": false,
     "start_time": "2022-05-15T00:25:44.270550",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'string_ym_value'. You can override using\n",
      "the `.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 24 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>string_ym_value</th><th scope=col>member_casual</th><th scope=col>mean_duration_time</th></tr>\n",
       "\t<tr><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2021-05-01</td><td>casual</td><td>2293.8580 secs</td></tr>\n",
       "\t<tr><td>2021-05-01</td><td>member</td><td> 878.3346 secs</td></tr>\n",
       "\t<tr><td>2021-06-01</td><td>casual</td><td>2227.2859 secs</td></tr>\n",
       "\t<tr><td>2021-06-01</td><td>member</td><td> 880.6672 secs</td></tr>\n",
       "\t<tr><td>2021-07-01</td><td>casual</td><td>1967.4103 secs</td></tr>\n",
       "\t<tr><td>2021-07-01</td><td>member</td><td> 854.3591 secs</td></tr>\n",
       "\t<tr><td>2021-08-01</td><td>casual</td><td>1727.1822 secs</td></tr>\n",
       "\t<tr><td>2021-08-01</td><td>member</td><td> 846.0487 secs</td></tr>\n",
       "\t<tr><td>2021-09-01</td><td>casual</td><td>1668.8994 secs</td></tr>\n",
       "\t<tr><td>2021-09-01</td><td>member</td><td> 824.0674 secs</td></tr>\n",
       "\t<tr><td>2021-10-01</td><td>casual</td><td>1720.4382 secs</td></tr>\n",
       "\t<tr><td>2021-10-01</td><td>member</td><td> 750.1241 secs</td></tr>\n",
       "\t<tr><td>2021-11-01</td><td>casual</td><td>1386.8176 secs</td></tr>\n",
       "\t<tr><td>2021-11-01</td><td>member</td><td> 678.2838 secs</td></tr>\n",
       "\t<tr><td>2021-12-01</td><td>casual</td><td>1409.6574 secs</td></tr>\n",
       "\t<tr><td>2021-12-01</td><td>member</td><td> 660.2963 secs</td></tr>\n",
       "\t<tr><td>2022-01-01</td><td>casual</td><td>1822.6473 secs</td></tr>\n",
       "\t<tr><td>2022-01-01</td><td>member</td><td> 718.8906 secs</td></tr>\n",
       "\t<tr><td>2022-02-01</td><td>casual</td><td>1602.5071 secs</td></tr>\n",
       "\t<tr><td>2022-02-01</td><td>member</td><td> 684.3318 secs</td></tr>\n",
       "\t<tr><td>2022-03-01</td><td>casual</td><td>1957.3434 secs</td></tr>\n",
       "\t<tr><td>2022-03-01</td><td>member</td><td> 717.4997 secs</td></tr>\n",
       "\t<tr><td>2022-04-01</td><td>casual</td><td>1771.9456 secs</td></tr>\n",
       "\t<tr><td>2022-04-01</td><td>member</td><td> 689.5442 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 24 × 3\n",
       "\\begin{tabular}{lll}\n",
       " string\\_ym\\_value & member\\_casual & mean\\_duration\\_time\\\\\n",
       " <dttm> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t 2021-05-01 & casual & 2293.8580 secs\\\\\n",
       "\t 2021-05-01 & member &  878.3346 secs\\\\\n",
       "\t 2021-06-01 & casual & 2227.2859 secs\\\\\n",
       "\t 2021-06-01 & member &  880.6672 secs\\\\\n",
       "\t 2021-07-01 & casual & 1967.4103 secs\\\\\n",
       "\t 2021-07-01 & member &  854.3591 secs\\\\\n",
       "\t 2021-08-01 & casual & 1727.1822 secs\\\\\n",
       "\t 2021-08-01 & member &  846.0487 secs\\\\\n",
       "\t 2021-09-01 & casual & 1668.8994 secs\\\\\n",
       "\t 2021-09-01 & member &  824.0674 secs\\\\\n",
       "\t 2021-10-01 & casual & 1720.4382 secs\\\\\n",
       "\t 2021-10-01 & member &  750.1241 secs\\\\\n",
       "\t 2021-11-01 & casual & 1386.8176 secs\\\\\n",
       "\t 2021-11-01 & member &  678.2838 secs\\\\\n",
       "\t 2021-12-01 & casual & 1409.6574 secs\\\\\n",
       "\t 2021-12-01 & member &  660.2963 secs\\\\\n",
       "\t 2022-01-01 & casual & 1822.6473 secs\\\\\n",
       "\t 2022-01-01 & member &  718.8906 secs\\\\\n",
       "\t 2022-02-01 & casual & 1602.5071 secs\\\\\n",
       "\t 2022-02-01 & member &  684.3318 secs\\\\\n",
       "\t 2022-03-01 & casual & 1957.3434 secs\\\\\n",
       "\t 2022-03-01 & member &  717.4997 secs\\\\\n",
       "\t 2022-04-01 & casual & 1771.9456 secs\\\\\n",
       "\t 2022-04-01 & member &  689.5442 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 24 × 3\n",
       "\n",
       "| string_ym_value &lt;dttm&gt; | member_casual &lt;chr&gt; | mean_duration_time &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| 2021-05-01 | casual | 2293.8580 secs |\n",
       "| 2021-05-01 | member |  878.3346 secs |\n",
       "| 2021-06-01 | casual | 2227.2859 secs |\n",
       "| 2021-06-01 | member |  880.6672 secs |\n",
       "| 2021-07-01 | casual | 1967.4103 secs |\n",
       "| 2021-07-01 | member |  854.3591 secs |\n",
       "| 2021-08-01 | casual | 1727.1822 secs |\n",
       "| 2021-08-01 | member |  846.0487 secs |\n",
       "| 2021-09-01 | casual | 1668.8994 secs |\n",
       "| 2021-09-01 | member |  824.0674 secs |\n",
       "| 2021-10-01 | casual | 1720.4382 secs |\n",
       "| 2021-10-01 | member |  750.1241 secs |\n",
       "| 2021-11-01 | casual | 1386.8176 secs |\n",
       "| 2021-11-01 | member |  678.2838 secs |\n",
       "| 2021-12-01 | casual | 1409.6574 secs |\n",
       "| 2021-12-01 | member |  660.2963 secs |\n",
       "| 2022-01-01 | casual | 1822.6473 secs |\n",
       "| 2022-01-01 | member |  718.8906 secs |\n",
       "| 2022-02-01 | casual | 1602.5071 secs |\n",
       "| 2022-02-01 | member |  684.3318 secs |\n",
       "| 2022-03-01 | casual | 1957.3434 secs |\n",
       "| 2022-03-01 | member |  717.4997 secs |\n",
       "| 2022-04-01 | casual | 1771.9456 secs |\n",
       "| 2022-04-01 | member |  689.5442 secs |\n",
       "\n"
      ],
      "text/plain": [
       "   string_ym_value member_casual mean_duration_time\n",
       "1  2021-05-01      casual        2293.8580 secs    \n",
       "2  2021-05-01      member         878.3346 secs    \n",
       "3  2021-06-01      casual        2227.2859 secs    \n",
       "4  2021-06-01      member         880.6672 secs    \n",
       "5  2021-07-01      casual        1967.4103 secs    \n",
       "6  2021-07-01      member         854.3591 secs    \n",
       "7  2021-08-01      casual        1727.1822 secs    \n",
       "8  2021-08-01      member         846.0487 secs    \n",
       "9  2021-09-01      casual        1668.8994 secs    \n",
       "10 2021-09-01      member         824.0674 secs    \n",
       "11 2021-10-01      casual        1720.4382 secs    \n",
       "12 2021-10-01      member         750.1241 secs    \n",
       "13 2021-11-01      casual        1386.8176 secs    \n",
       "14 2021-11-01      member         678.2838 secs    \n",
       "15 2021-12-01      casual        1409.6574 secs    \n",
       "16 2021-12-01      member         660.2963 secs    \n",
       "17 2022-01-01      casual        1822.6473 secs    \n",
       "18 2022-01-01      member         718.8906 secs    \n",
       "19 2022-02-01      casual        1602.5071 secs    \n",
       "20 2022-02-01      member         684.3318 secs    \n",
       "21 2022-03-01      casual        1957.3434 secs    \n",
       "22 2022-03-01      member         717.4997 secs    \n",
       "23 2022-04-01      casual        1771.9456 secs    \n",
       "24 2022-04-01      member         689.5442 secs    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "result3 <- cleanedData %>%\n",
    "select(rideable_type, duration_time, member_casual, string_ym_value)\n",
    "\n",
    "result3$string_ym_value <- as.POSIXct(result3$string_ym_value)\n",
    "\n",
    "\n",
    "result3 <- result3 %>%\n",
    "group_by(string_ym_value, member_casual) %>%\n",
    "summarize(mean_duration_time = mean(duration_time)) %>%\n",
    "arrange(string_ym_value, -mean_duration_time, member_casual)\n",
    "\n",
    "result3"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "401a7ac0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:26:09.260523Z",
     "iopub.status.busy": "2022-05-15T00:26:09.258780Z",
     "iopub.status.idle": "2022-05-15T00:26:09.644429Z",
     "shell.execute_reply": "2022-05-15T00:26:09.642373Z"
    },
    "papermill": {
     "duration": 0.403512,
     "end_time": "2022-05-15T00:26:09.647033",
     "exception": false,
     "start_time": "2022-05-15T00:26:09.243521",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n",
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nTet1vv/Vqf/71+PzZm8a8sAsadPryVlzJ93Te+unr4x/f2fwEYrtR/d5AeXl7YeWXDt2+sJX\nZl/s/HfWiCETv9DGPT1v1sOD/vnu/Slr9wfWefmeOxZv0vqOmDB7xpRrG8vT9/T7eG92+E8X\nkQkPLDqv510zZjzas4Xl9SeGvrw5NXi3X04b72rX55nZo8r3xQBQNjhih1OUuWvein+9Mz8c\n3yLKLCJ1Z6SPn7oy1etPMJuqdO835orr28XZRKRmtVtmv3P/tjxvTM76HJ//2h5dGyfYpUH9\n6VMS9thjgw9RbD8pVrUcZgeUg/rDp1zTtoaI9B/Z6IMR65+YfEdtuyp1ru9T6eUvNqVJ56q5\nh99584+0GR8+eJ7LIiINzj3P+821r8/cdPW09uE8PTBKo9HT+neuKiJNml+Qs/naD6etvvlp\nLUi3R1NGDLiyZQW9JAAiRbDDKTr07W9WV+tAqhMRe2L3Z57pHvi5543X/vztl4t37v7333//\n/vW7QKOjUq/LGi2f2Pvm5m1bN2vatHXbDhfWTgg+RLH9AIaR0PTY3zZml81kSa5tP/ZHS6yq\naJomIln//KBp/nuv6Vb4WS7vbpH24Tw94Po2lQp+7tK9+pJXV2f94wzSbbXLa5XpLAGUK4Id\nTpE/X1NM1qLtvvyDEwbe+mdU02s6tW7evslVvboMHXK/iJjU2Aeef7vfb+s3/Lzp140rFr/0\n7Hk3PfHkHa2L9uDRtCD9AAZVzAdj1CirSXV99NHbSuFWxRLm04susEZbFEUN3m1UTLH9Azgz\n8Bk7nKKk9nU8md9vyT32obe81BU9e/b8ISs/65+5PxxwvzLvsSG39OrSsW2t+GPX1qX+9vbs\n5xfXatq25y23T3py9vy7G/20dH5BbxneYwcY8o6uzfL5RaSkfoCzh6tqd82fveyI136M7dUJ\nY6Z/vq9UnSz96XDBz6uW7HJV71Ym3QI4PXHEDqcotu7d7ePW3D9q2pg7rks0p783c47H0amN\ny5KT20jzr12y6pfrW1Y5vHPTG8+/JCK79qWdF5/z7pIFma6E69o1VHL2vr/0H1eNm0REFEvj\nKMsX0/6v6709LBk7F06fblIUEbHEFN+PL6Zyhc4bKD/W6HbDWie9OGKCY8TNTapHb1j+/Lu/\nHX5icpVSdfLtY6PfdA9rVc2xacXCBTuyh73SwRrtirxbAKcngh1OkaI6Hn515vPTXpw9dXSa\n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\nLXTuBfVe+/fHQvQUQtTr3rDSPo/6LJIiiY89FpRgQUm3oFDjEOyq78MH/7lau3zyuA7hmwYf\nefMbfgDNs+WDO+6cp55y4YxFw1pmH/wEvjXlFCFWbygNNLQffILYWBpIP8td2f7Vk1r/Eovy\n5fM/5N19Rp3DNv3+0rdWV8suabY//LpiOfz6C8aSNaPKjkjIv2/aTWN+S2nT6x8d2p7Wqmff\nbrffMiXyU1ZnBedXEjGdKk1z+1vLdF3f8PTkMeUav3r6hxsf6Bb+f/nnfkWz6Hog/H9XWsWL\nOimzME+C1SRYUOHCWFDHwILC8Yz32FWfb8v/1q37Ifz/oG+HJxiyZx96vi7661mwrODzomCl\nv4r0UMn9dy2wd79lwaRR5Ve1w517ok1997M94Zv+4h++9vg69ahb2f7Vo7na3Ngxa+3s6esL\nfeXbC39/98EPd5489GZFiKzTmvg8a3/3Bg9OJ/+j4cOHf1fkPwZnVNkRKdr+9Ld7fPMe+efQ\n/n3PObNzw4wqvDc5XtOp6jT//dq2tMYjXivn/06tk7/uqQN/Pa7e/X5/ZOc17+x01j7nGJyF\neRKsJsGCMoEFdXQWFI5nnLGrvlMua+Gdv+qpt1uem5P6zar5FjVtcJtMIYRQrC1d1tXzXjjn\nxt5Wz7YX5i9QKj+1XrJn2a8l/pGnuL5duzbSqDmbdWjrvvOKVuOWTH6/3vi2Gf7X5j/iqtd9\nWIPUkl2LKtu/erPocffU78eOu3vUrb0v79uxRQMtUPzbfz9b+fqn2V1HTurdSAhRq+n1Xdyf\n3zdx3i3DL8zUPK8//pTP0bVTqlUIYVFE6e6dBw6cmJER+VRXMmdU2RGxpjXX9c9Xrf7polNO\n2L/1l5cWPyeE2Ppn/ulph59WOVK8ptM860Xz0/Tue/1rj++8u3PLN7a7tnvohuef/CXvtsZC\nCPHT3EkvBa9tX9/560cv/Htz0eBHzjrWZlElcqwmwYKKhgVV7VkAJhHsqq/++ZNu3TPn5ZVP\nvHPAd0Kj5qMmT2vz1/tmJk4Z9fDcFyeMXuUL6a17XH92/pLKOvH8vlkI8cz0+8s31mp497/m\nn9Fs4LSbymYvnzUpz6vktO82bcp1FsP9qzcL1Vb/rjmPf7Tyhf+sXvn+in1KSlaDBo0vHzP1\n8u7twr8/FYtj/Nxpi+c9t2jmpIKQq1n78x+46crwz7a95PSyxXNvvPOc5U+PPRZmVNkRcWZf\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = result3, aes (x =string_ym_value, y = mean_duration_time, fill = mean_duration_time)) + \n",
    "geom_bar(stat=\"identity\", width = 0.5) + labs(title = \"Average Usage Per Month\") + facet_grid(~member_casual)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b0ba42dc",
   "metadata": {
    "papermill": {
     "duration": 0.012802,
     "end_time": "2022-05-15T00:26:09.673341",
     "exception": false,
     "start_time": "2022-05-15T00:26:09.660539",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "It seems that, casual riders' duration time at summer are greater than the other seasons. Special offer can be presented to casual riders in these summer months."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "b983365b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:26:09.703258Z",
     "iopub.status.busy": "2022-05-15T00:26:09.701457Z",
     "iopub.status.idle": "2022-05-15T00:26:09.734933Z",
     "shell.execute_reply": "2022-05-15T00:26:09.732521Z"
    },
    "papermill": {
     "duration": 0.051652,
     "end_time": "2022-05-15T00:26:09.738001",
     "exception": false,
     "start_time": "2022-05-15T00:26:09.686349",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>member_casual</th><th scope=col>duration_time</th><th scope=col>start_date</th><th scope=col>month_value</th><th scope=col>year_value</th><th scope=col>string_ym_value</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>C809ED75D6160B2A</td><td>electric_bike</td><td>2021-05-30 11:58:15</td><td>2021-05-30 12:10:39</td><td>casual</td><td> 744 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>DD59FDCE0ACACAF3</td><td>electric_bike</td><td>2021-05-30 11:29:14</td><td>2021-05-30 12:14:09</td><td>casual</td><td>2695 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>0AB83CB88C43EFC2</td><td>electric_bike</td><td>2021-05-30 14:24:01</td><td>2021-05-30 14:25:13</td><td>casual</td><td>  72 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>7881AC6D39110C60</td><td>electric_bike</td><td>2021-05-30 14:25:51</td><td>2021-05-30 14:41:04</td><td>casual</td><td> 913 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>853FA701B4582BAF</td><td>electric_bike</td><td>2021-05-30 18:15:39</td><td>2021-05-30 18:22:32</td><td>casual</td><td> 413 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "\t<tr><td>F5E63DFD96B2A737</td><td>electric_bike</td><td>2021-05-30 11:33:41</td><td>2021-05-30 11:57:17</td><td>casual</td><td>1416 secs</td><td>2021-05-30</td><td>5</td><td>2021</td><td>2021-5-1</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 11\n",
       "\\begin{tabular}{lllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & member\\_casual & duration\\_time & start\\_date & month\\_value & year\\_value & string\\_ym\\_value & day\\_of\\_week\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <drtn> & <date> & <dbl> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t C809ED75D6160B2A & electric\\_bike & 2021-05-30 11:58:15 & 2021-05-30 12:10:39 & casual &  744 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t DD59FDCE0ACACAF3 & electric\\_bike & 2021-05-30 11:29:14 & 2021-05-30 12:14:09 & casual & 2695 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t 0AB83CB88C43EFC2 & electric\\_bike & 2021-05-30 14:24:01 & 2021-05-30 14:25:13 & casual &   72 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t 7881AC6D39110C60 & electric\\_bike & 2021-05-30 14:25:51 & 2021-05-30 14:41:04 & casual &  913 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t 853FA701B4582BAF & electric\\_bike & 2021-05-30 18:15:39 & 2021-05-30 18:22:32 & casual &  413 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\t F5E63DFD96B2A737 & electric\\_bike & 2021-05-30 11:33:41 & 2021-05-30 11:57:17 & casual & 1416 secs & 2021-05-30 & 5 & 2021 & 2021-5-1 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 11\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | member_casual &lt;chr&gt; | duration_time &lt;drtn&gt; | start_date &lt;date&gt; | month_value &lt;dbl&gt; | year_value &lt;dbl&gt; | string_ym_value &lt;chr&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| C809ED75D6160B2A | electric_bike | 2021-05-30 11:58:15 | 2021-05-30 12:10:39 | casual |  744 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| DD59FDCE0ACACAF3 | electric_bike | 2021-05-30 11:29:14 | 2021-05-30 12:14:09 | casual | 2695 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| 0AB83CB88C43EFC2 | electric_bike | 2021-05-30 14:24:01 | 2021-05-30 14:25:13 | casual |   72 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| 7881AC6D39110C60 | electric_bike | 2021-05-30 14:25:51 | 2021-05-30 14:41:04 | casual |  913 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| 853FA701B4582BAF | electric_bike | 2021-05-30 18:15:39 | 2021-05-30 18:22:32 | casual |  413 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "| F5E63DFD96B2A737 | electric_bike | 2021-05-30 11:33:41 | 2021-05-30 11:57:17 | casual | 1416 secs | 2021-05-30 | 5 | 2021 | 2021-5-1 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 C809ED75D6160B2A electric_bike 2021-05-30 11:58:15 2021-05-30 12:10:39\n",
       "2 DD59FDCE0ACACAF3 electric_bike 2021-05-30 11:29:14 2021-05-30 12:14:09\n",
       "3 0AB83CB88C43EFC2 electric_bike 2021-05-30 14:24:01 2021-05-30 14:25:13\n",
       "4 7881AC6D39110C60 electric_bike 2021-05-30 14:25:51 2021-05-30 14:41:04\n",
       "5 853FA701B4582BAF electric_bike 2021-05-30 18:15:39 2021-05-30 18:22:32\n",
       "6 F5E63DFD96B2A737 electric_bike 2021-05-30 11:33:41 2021-05-30 11:57:17\n",
       "  member_casual duration_time start_date month_value year_value string_ym_value\n",
       "1 casual         744 secs     2021-05-30 5           2021       2021-5-1       \n",
       "2 casual        2695 secs     2021-05-30 5           2021       2021-5-1       \n",
       "3 casual          72 secs     2021-05-30 5           2021       2021-5-1       \n",
       "4 casual         913 secs     2021-05-30 5           2021       2021-5-1       \n",
       "5 casual         413 secs     2021-05-30 5           2021       2021-5-1       \n",
       "6 casual        1416 secs     2021-05-30 5           2021       2021-5-1       \n",
       "  day_of_week\n",
       "1 1          \n",
       "2 1          \n",
       "3 1          \n",
       "4 1          \n",
       "5 1          \n",
       "6 1          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(cleanedData)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "e819d052",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:26:09.768553Z",
     "iopub.status.busy": "2022-05-15T00:26:09.766809Z",
     "iopub.status.idle": "2022-05-15T00:26:10.213129Z",
     "shell.execute_reply": "2022-05-15T00:26:10.210598Z"
    },
    "papermill": {
     "duration": 0.464087,
     "end_time": "2022-05-15T00:26:10.215576",
     "exception": false,
     "start_time": "2022-05-15T00:26:09.751489",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'day_of_week'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>day_of_week</th><th scope=col>member_casual</th><th scope=col>average_duration_of_week_day</th><th scope=col>day</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>7</td><td>casual</td><td>2051.5668 secs</td><td>Saturday </td></tr>\n",
       "\t<tr><td>7</td><td>member</td><td> 886.8430 secs</td><td>Saturday </td></tr>\n",
       "\t<tr><td>6</td><td>casual</td><td>1752.5112 secs</td><td>Friday   </td></tr>\n",
       "\t<tr><td>6</td><td>member</td><td> 772.6730 secs</td><td>Friday   </td></tr>\n",
       "\t<tr><td>5</td><td>casual</td><td>1673.2608 secs</td><td>Thursday </td></tr>\n",
       "\t<tr><td>5</td><td>member</td><td> 746.2833 secs</td><td>Thursday </td></tr>\n",
       "\t<tr><td>4</td><td>casual</td><td>1625.5540 secs</td><td>Wednesday</td></tr>\n",
       "\t<tr><td>4</td><td>member</td><td> 744.9022 secs</td><td>Wednesday</td></tr>\n",
       "\t<tr><td>3</td><td>casual</td><td>1587.8214 secs</td><td>Tuesday  </td></tr>\n",
       "\t<tr><td>3</td><td>member</td><td> 735.5760 secs</td><td>Tuesday  </td></tr>\n",
       "\t<tr><td>2</td><td>casual</td><td>1863.9445 secs</td><td>Monday   </td></tr>\n",
       "\t<tr><td>2</td><td>member</td><td> 762.7352 secs</td><td>Monday   </td></tr>\n",
       "\t<tr><td>1</td><td>casual</td><td>2217.8035 secs</td><td>Sunday   </td></tr>\n",
       "\t<tr><td>1</td><td>member</td><td> 903.5035 secs</td><td>Sunday   </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " day\\_of\\_week & member\\_casual & average\\_duration\\_of\\_week\\_day & day\\\\\n",
       " <dbl> & <chr> & <drtn> & <chr>\\\\\n",
       "\\hline\n",
       "\t 7 & casual & 2051.5668 secs & Saturday \\\\\n",
       "\t 7 & member &  886.8430 secs & Saturday \\\\\n",
       "\t 6 & casual & 1752.5112 secs & Friday   \\\\\n",
       "\t 6 & member &  772.6730 secs & Friday   \\\\\n",
       "\t 5 & casual & 1673.2608 secs & Thursday \\\\\n",
       "\t 5 & member &  746.2833 secs & Thursday \\\\\n",
       "\t 4 & casual & 1625.5540 secs & Wednesday\\\\\n",
       "\t 4 & member &  744.9022 secs & Wednesday\\\\\n",
       "\t 3 & casual & 1587.8214 secs & Tuesday  \\\\\n",
       "\t 3 & member &  735.5760 secs & Tuesday  \\\\\n",
       "\t 2 & casual & 1863.9445 secs & Monday   \\\\\n",
       "\t 2 & member &  762.7352 secs & Monday   \\\\\n",
       "\t 1 & casual & 2217.8035 secs & Sunday   \\\\\n",
       "\t 1 & member &  903.5035 secs & Sunday   \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| day_of_week &lt;dbl&gt; | member_casual &lt;chr&gt; | average_duration_of_week_day &lt;drtn&gt; | day &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 7 | casual | 2051.5668 secs | Saturday  |\n",
       "| 7 | member |  886.8430 secs | Saturday  |\n",
       "| 6 | casual | 1752.5112 secs | Friday    |\n",
       "| 6 | member |  772.6730 secs | Friday    |\n",
       "| 5 | casual | 1673.2608 secs | Thursday  |\n",
       "| 5 | member |  746.2833 secs | Thursday  |\n",
       "| 4 | casual | 1625.5540 secs | Wednesday |\n",
       "| 4 | member |  744.9022 secs | Wednesday |\n",
       "| 3 | casual | 1587.8214 secs | Tuesday   |\n",
       "| 3 | member |  735.5760 secs | Tuesday   |\n",
       "| 2 | casual | 1863.9445 secs | Monday    |\n",
       "| 2 | member |  762.7352 secs | Monday    |\n",
       "| 1 | casual | 2217.8035 secs | Sunday    |\n",
       "| 1 | member |  903.5035 secs | Sunday    |\n",
       "\n"
      ],
      "text/plain": [
       "   day_of_week member_casual average_duration_of_week_day day      \n",
       "1  7           casual        2051.5668 secs               Saturday \n",
       "2  7           member         886.8430 secs               Saturday \n",
       "3  6           casual        1752.5112 secs               Friday   \n",
       "4  6           member         772.6730 secs               Friday   \n",
       "5  5           casual        1673.2608 secs               Thursday \n",
       "6  5           member         746.2833 secs               Thursday \n",
       "7  4           casual        1625.5540 secs               Wednesday\n",
       "8  4           member         744.9022 secs               Wednesday\n",
       "9  3           casual        1587.8214 secs               Tuesday  \n",
       "10 3           member         735.5760 secs               Tuesday  \n",
       "11 2           casual        1863.9445 secs               Monday   \n",
       "12 2           member         762.7352 secs               Monday   \n",
       "13 1           casual        2217.8035 secs               Sunday   \n",
       "14 1           member         903.5035 secs               Sunday   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "result4 <- cleanedData %>%\n",
    "select(rideable_type, duration_time, member_casual, string_ym_value, day_of_week)\n",
    "\n",
    "result4 <- result4 %>%\n",
    "group_by(day_of_week, member_casual) %>%\n",
    "summarize(average_duration_of_week_day = mean(duration_time)) %>%\n",
    "mutate (day =  case_when(day_of_week == 1 ~ \"Sunday\",\n",
    "                         day_of_week == 2 ~ \"Monday\",\n",
    "                         day_of_week == 3 ~ \"Tuesday\",\n",
    "                         day_of_week == 4 ~ \"Wednesday\",\n",
    "                         day_of_week == 5 ~ \"Thursday\",\n",
    "                         day_of_week == 6 ~ \"Friday\",\n",
    "                         day_of_week == 7 ~ \"Saturday\")) %>%\n",
    "arrange(-day_of_week)\n",
    "                        \n",
    "                    \n",
    "\n",
    "result4"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "f2eee760",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-15T00:26:10.246827Z",
     "iopub.status.busy": "2022-05-15T00:26:10.244981Z",
     "iopub.status.idle": "2022-05-15T00:26:10.625355Z",
     "shell.execute_reply": "2022-05-15T00:26:10.623218Z"
    },
    "papermill": {
     "duration": 0.39864,
     "end_time": "2022-05-15T00:26:10.627976",
     "exception": false,
     "start_time": "2022-05-15T00:26:10.229336",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n",
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = result4, aes (x = reorder(day,-average_duration_of_week_day), y = average_duration_of_week_day, fill = average_duration_of_week_day)) + \n",
    "geom_bar(stat=\"identity\", width = 0.5) + labs(title = \"Favorite Day of Biking\") + facet_grid(~member_casual)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "20cc4ad8",
   "metadata": {
    "papermill": {
     "duration": 0.015308,
     "end_time": "2022-05-15T00:26:10.658305",
     "exception": false,
     "start_time": "2022-05-15T00:26:10.642997",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Casual riders average usage time on Saturday and Sunday is greater than the other days. It seems that special offers should be done at weekends to earn this casuals as member."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 110.192321,
   "end_time": "2022-05-15T00:26:10.998226",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-05-15T00:24:20.805905",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
