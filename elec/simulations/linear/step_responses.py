import matplotlib.pyplot as plt
import numpy as np

with open('step1.csv') as f:
	lines = (line for line in f if not line.startswith('#'))
	data1 = np.loadtxt(lines, delimiter=',')

with open('step2.csv') as f:
	lines = (line for line in f if not line.startswith('#'))
	data2 = np.loadtxt(lines, delimiter=',')

with open('step3.csv') as f:
	lines = (line for line in f if not line.startswith('#'))
	data3 = np.loadtxt(lines, delimiter=',')

# Amplifier 1
Ts1   = data1[:,0] * 1E3 # milli-seconds
dpos1 = data1[:,1]
apos1 = data1[:,2]
err1  = data1[:,3]

# Amplifier 2
Ts2   = data2[:,0] * 1E3 # milli-seconds
dpos2 = data2[:,1]
apos2 = data2[:,2]
err2  = data2[:,3]

# Amplifier 3, 4
Ts3   = data3[:,0] * 1E3 # milli-seconds
dpos3 = data3[:,1]
apos3 = data3[:,2]
err3  = data3[:,3]

fig1, ax = plt.subplots(2, 2, facecolor='w')
# fig1.suptitle('Amplifier Transient Responses', fontsize=20, fontweight='bold')

# Plot base motor transient
ax[0,0].plot(Ts1, dpos1, label='Desired Position', lw=2)
ax[0,0].plot(Ts1, apos1, label='Actual Position', lw=2)
ax[0,0].plot(Ts1, err1, label='Error', lw=2)
ax[0,0].legend(fontsize=12)
ax[0,0].set_title('Base Motor', fontsize=14)
ax[0,0].set_xlabel('Time ($ms$)', fontsize=12)
ax[0,0].set_ylabel('Degrees', fontsize=12)
ax[0,0].grid(lw=0.5)

# Plot elbow motor transient
ax[0,1].plot(Ts2, dpos2, label='Desired Position', lw=2)
ax[0,1].plot(Ts2, apos2, label='Actual Position', lw=2)
ax[0,1].plot(Ts2, err2, label='Error', lw=2)
ax[0,1].legend(fontsize=12)
ax[0,1].set_title('Elbow Motor', fontsize=14)
ax[0,1].set_xlabel('Time ($ms$)', fontsize=12)
ax[0,1].set_ylabel('Degrees', fontsize=12)
ax[0,1].grid(lw=0.5)

# Plot wrist motor transient
ax[1,0].plot(Ts3, dpos3, label='Desired Position', lw=2)
ax[1,0].plot(Ts3, apos3, label='Actual Position', lw=2)
ax[1,0].plot(Ts3, err3, label='Error', lw=2)
ax[1,0].legend(fontsize=12)
ax[1,0].set_title('Wrist Motor', fontsize=14)
ax[1,0].set_xlabel('Time ($ms$)', fontsize=12)
ax[1,0].set_ylabel('Degrees', fontsize=12)
ax[1,0].grid(lw=0.5)

# Plot wrist motor transient
ax[1,1].plot(Ts3, dpos3, label='Desired Position', lw=2)
ax[1,1].plot(Ts3, apos3, label='Actual Position', lw=2)
ax[1,1].plot(Ts3, err3, label='Error', lw=2)
ax[1,1].legend(fontsize=12)
ax[1,1].set_title('Claw Motor', fontsize=14)
ax[1,1].set_xlabel('Time ($ms$)', fontsize=12)
ax[1,1].set_ylabel('Degrees', fontsize=12)
ax[1,1].grid(lw=0.5)

fig1.subplots_adjust(
	left=0.125,
	bottom=0.11,
	right=0.9,
	top=0.9,
	wspace=0.175,
	hspace=0.3,
)

plt.show()
