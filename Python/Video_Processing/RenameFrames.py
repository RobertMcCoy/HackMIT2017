import os
path = '08AD/B'
files = os.listdir(path)
i = 1

for file in files:
    os.rename(os.path.join(path, file), os.path.join(path, 'b_8D_'+str(i)+'.jpg'))
    i = i+1
