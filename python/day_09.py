import numpy as np
import scipy.ndimage
from collections import Counter

with open('input09.txt') as f:
    data = f.read().split('\n')
    data = [[int(char) for char in line] for line in data]

A = np.asarray(data)

fp = np.asarray([
    [0, 1, 0],
    [1, 0, 1],
    [0, 1, 0]
])
condmin = A < scipy.ndimage.minimum_filter(A, footprint=fp, mode='constant', cval=1000000)

result = A[condmin] + 1
#result = np.zeros(A.shape)
#result[condmin] = A[condmin] + 1
print("part 1: ", result.sum())

labels, _ = scipy.ndimage.label(A < 9)
flat_labels = labels.flatten()
flat_labels = np.delete(flat_labels, np.where(flat_labels == 0))
values = [v for k, v in Counter(flat_labels).most_common(3)]
print("part 2: ", np.product(values))