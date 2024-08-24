import matplotlib.pyplot as plt
import numpy as np
NSTEPS = 1000
DT = 0.01
t_e = NSTEPS * DT
time = np.arange(0, t_e, DT)
posn = np.zeros(NSTEPS)
for i in range(0, NSTEPS - 1):
    posn[i + 1] = posn[i] + np.sqrt(DT) * np.random.normal(0, 1)
fig, axes = plt.subplots(1, 1, figsize=(16, 9), dpi=400)
axes.plot(time, posn, label="Wiener Process")
axes.grid()
axes.legend()
fig.show()
fig.savefig("WienerProcess.png")
