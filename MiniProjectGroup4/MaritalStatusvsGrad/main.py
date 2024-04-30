import matplotlib.pyplot as plt
import pandas as pd

# read csv and store in dataFrame
data = pd.read_csv('outcomes.csv')

# get data from single/married
categories = data['Outcome']
single_counts = data['Single']
married_counts = data['Married']

fig, axes = plt.subplots(2, 1, figsize=(10, 12))
# single bar graph
axes[0].bar(categories, single_counts, color='b', label='Single')
axes[0].set_title('Educational Outcomes for Single Individuals')
axes[0].set_xlabel('Outcome')
axes[0].set_ylabel('Count')
axes[0].legend()
axes[0].grid(True)

# Married bar graph
axes[1].bar(categories, married_counts, color='r', label='Married')
axes[1].set_title('Educational Outcomes for Married Individuals')
axes[1].set_xlabel('Outcome')
axes[1].set_ylabel('Count')
axes[1].legend()
axes[1].grid(True)

plt.tight_layout()

plt.show()
