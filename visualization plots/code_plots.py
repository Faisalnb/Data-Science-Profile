# -*- coding: utf-8 -*-
"""
Created on Sat Jan  8 23:15:29 2022

@author: FB
"""

# =============================================================================
#                                       Pie                    
# =============================================================================



print(plt.style.available)
from matplotlib import pyplot as plt
%matplotlib inline

# Language Popularity
slices = [59219, 55466, 47544, 36443, 35917]
labels = ['JavaScript', 'HTML/CSS', 'SQL', 'Python', 'Java']
explode=[0,0,0,0.1,0]

plt.pie(slices,labels=labels,
        explode=explode,autopct='%1.1f%%',
        startangle=90,shadow=True,
        wedgeprops={'edgecolor':'black'})

plt.title('Pie Chart: popular languages')
plt.show()


# =============================================================================
#                                       Line                    
# =============================================================================



# Median Developer Salaries by Age
ages_x = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]

dev_y = [38496, 42000, 46752, 49320, 53200,
         56000, 62316, 64928, 67317, 68748, 73752]

# Median Python Developer Salaries by Age
ages_x = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
py_dev_y = [45372, 48876, 53850, 57287, 63016,
            65998, 70003, 70000, 71496, 75370, 83640]


# Median JavaScript Developer Salaries by Age
js_dev_y = [37810, 43515, 46823, 49293, 53437,
            56373, 62375, 66674, 68745, 68746, 74583]

plt.style.use('ggplot')
plt.plot(ages_x,dev_y,color='k',ls='--',label='All dev')
plt.plot(ages_x,py_dev_y,lw=3,label='Python dev')
plt.plot(ages_x,js_dev_y,lw=3,label='Javascript dev')
plt.ylabel('Salaries in USD')
plt.xlabel('Ages')
plt.title('Median Salaries (USD) by Age')
plt.legend()
plt.grid(True)
plt.show()

# =============================================================================
#                                       Vbars                    
# =============================================================================



import numpy as np
x_indexes=np.arange(len(ages_x))
width= 0.25


plt.style.use('fivethirtyeight')
plt.bar(x_indexes-width,dev_y,width=width)
plt.bar(x_indexes,py_dev_y,width=width)
plt.ylabel('Salaries in USD')
plt.xlabel('Ages')
plt.bar(x_indexes+width,js_dev_y,width=width)
plt.xticks(x_indexes,labels=ages_x)

# =============================================================================
#                                       Hbars                    
# =============================================================================


import pandas as pd
from collections import Counter

data = pd.read_csv('G:\\My Drive\\FB\PLots\\data1.txt')
ids = data['Responder_id']
lang_responses = data['LanguagesWorkedWith']

language_counter = Counter()

for response in lang_responses:
    language_counter.update(response.split(';'))

languages = []
popularity = []

for item in language_counter.most_common(15):
    languages.append(item[0])
    popularity.append(item[1])

languages.reverse()
popularity.reverse()

plt.barh(languages, popularity)

plt.title("Most Popular Languages")
# plt.ylabel("Programming Languages")
plt.xlabel("Number of People Who Use")

plt.tight_layout()

plt.show()

# =============================================================================
#                                       Stack                    
# =============================================================================


minutes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
player1 = [8, 6, 5, 5, 4, 2, 1, 1, 0]
player2 = [0, 1, 2, 2, 2, 4, 4, 4, 4]
player3 = [0, 1, 1, 1, 2, 2, 3, 3, 4]
labels = ['player1', 'player2', 'player3']
colors = ["#008fd5", "#fc4f30", "#6d904f" ]

plt.stackplot(minutes,player1,player2,player3, labels=labels, colors=colors)
plt.legend(loc=(0.07,0.05))
plt.title('Stack plot for efforts of 3 players')
plt.show()


# =============================================================================
#                                    colors & fill between                    
# =============================================================================

data = pd.read_csv('G:\\My Drive\\FB\\PLots\\data2.txt')
ages = data['Age']
dev_salaries = data['All_Devs']
py_salaries = data['Python']
js_salaries = data['JavaScript']

plt.plot(ages, dev_salaries, color='#444444',
         linestyle='--', label='All Devs')

plt.plot(ages, py_salaries, label='Python')

overall_median = 57287

plt.fill_between(ages, py_salaries, dev_salaries,
                 where=(py_salaries > dev_salaries),
                 interpolate=True, alpha=0.25, label='Above Avg')

plt.fill_between(ages, py_salaries, dev_salaries,
                 where=(py_salaries <= dev_salaries),
                 interpolate=True, color='red', alpha=0.25, label='Below Avg')

plt.legend()

plt.title('Median Salary (USD) by Age')
plt.xlabel('Ages')
plt.ylabel('Median Salary (USD)')

plt.tight_layout()

plt.show()


# =============================================================================
#                                  Hist                    
# =============================================================================

data = pd.read_csv('G:\\My Drive\\FB\\PLots\\data3.txt')

ages=data['Age'] 
bin = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
median_age=29

plt.hist(ages,bins=bin,edgecolor='black',log=True)
plt.axvline(median_age,color='red',label='Age Median')
plt.xlabel('Age')
plt.ylabel('Frequencies')
plt.title('Age wise distribution')
plt.legend()
plt.title()


# =============================================================================
#                                  Scatter                    
# =============================================================================

data = pd.read_csv('G:\\My Drive\\FB\\PLots\\data4.txt')
view_count=data['view_count']
likes=data['likes']
ratio=data['ratio']


plt.style.use('seaborn')
plt.scatter(view_count,likes,ratio, c=ratio,
            cmap='viridis' , edgecolor= 'black', alpha=1)
plt.xscale('log')
plt.yscale('log')

cbar=plt.colorbar()
cbar.set_label('Like /Dislike ratio')

plt.title('Youtube video analysis')
plt.xlabel('View count')
plt.ylabel('Dislikes')
plt.show()

plt.imshow(a,cmap='hot', interpolation='nearest')
plt.show()

# =============================================================================
                                   Heatmaps
# =============================================================================

import seaborn as sns
flight_data=sns.load_dataset('flights')
df=flight_data.pivot('year','month','passengers')
sns.heatmap(df,cmap='hot')



