import matplotlib.pyplot as plt
import numpy as np

with open('transient-base.csv') as f:
	lines = (line for line in f if not line.startswith('#'))
	data1 = np.loadtxt(lines, delimiter=',')

with open('transient-elbow.csv') as f:
	lines = (line for line in f if not line.startswith('#'))
	data2 = np.loadtxt(lines, delimiter=',')

with open('transient-wrist.csv') as f:
	lines = (line for line in f if not line.startswith('#'))
	data3 = np.loadtxt(lines, delimiter=',')

# Amplifier 1
Ts1   = data1[:,0] * 1E6 # micro-seconds
Vmcu1 = data1[:,1]
Vm1   = data1[:,3]
Im1   = data1[:,5]

# Amplifier 2
Ts2   = data2[:,0] * 1E6 # micro-seconds
Vmcu2 = data2[:,1]
Vm2   = data2[:,3]
Im2   = data2[:,5]

# Amplifier 3, 4
Ts3   = data3[:,0] * 1E6 # micro-seconds
Vmcu3 = data3[:,1]
Vm3   = data3[:,3]
Im3   = data3[:,5]

fig1, ax = plt.subplots(2, 2, facecolor='w')
fig1.suptitle('Amplifier Transient Responses', fontsize=20, fontweight='bold')

# Plot base motor transient
ax[0,0].plot(Ts1, Vmcu1, label='$V_{mcu1}$', lw=2)
ax[0,0].plot(Ts1, Vm1, label='$V_{motor}$', lw=2)
ax[0,0].plot(Ts1, Im1, label='$I_{motor}$', lw=2)
ax[0,0].legend(fontsize=12)
ax[0,0].set_title('Base Motor', fontsize=14)
ax[0,0].set_xlabel('Time ($\\mu s$)', fontsize=12)
ax[0,0].set_ylabel('Magnitude (V, A)', fontsize=12)
ax[0,0].grid(lw=0.5)

# Plot elbow motor transient
ax[0,1].plot(Ts2, Vmcu2, label='$V_{mcu2}$', lw=2)
ax[0,1].plot(Ts2, Vm2, label='$V_{motor}$', lw=2)
ax[0,1].plot(Ts2, Im2, label='$I_{motor}$', lw=2)
ax[0,1].legend(fontsize=12)
ax[0,1].set_title('Elbow Motor', fontsize=14)
ax[0,1].set_xlabel('Time ($\\mu s$)', fontsize=12)
ax[0,1].set_ylabel('Magnitude (V, A)', fontsize=12)
ax[0,1].grid(lw=0.5)

# Plot wrist motor transient
ax[1,0].plot(Ts3, Vmcu3, label='$V_{mcu3}$', lw=2)
ax[1,0].plot(Ts3, Vm3, label='$V_{motor}$', lw=2)
ax[1,0].plot(Ts3, Im3, label='$I_{motor}$', lw=2)
ax[1,0].legend(fontsize=12)
ax[1,0].set_title('Wrist Motor', fontsize=14)
ax[1,0].set_xlabel('Time ($\\mu s$)', fontsize=12)
ax[1,0].set_ylabel('Magnitude (V, A)', fontsize=12)
ax[1,0].grid(lw=0.5)

# Plot wrist motor transient
ax[1,1].plot(Ts3, Vmcu3, label='$V_{mcu4}$', lw=2)
ax[1,1].plot(Ts3, Vm3, label='$V_{motor}$', lw=2)
ax[1,1].plot(Ts3, Im3, label='$I_{motor}$', lw=2)
ax[1,1].legend(fontsize=12)
ax[1,1].set_title('Claw Motor', fontsize=14)
ax[1,1].set_xlabel('Time ($\\mu s$)', fontsize=12)
ax[1,1].set_ylabel('Magnitude (V, A)', fontsize=12)
ax[1,1].grid(lw=0.5)

fig1.subplots_adjust(
	left=0.125,
	bottom=0.11,
	right=0.9,
	top=0.9,
	wspace=0.175,
	hspace=0.3,
)

# fig2, ax2 = plt.subplots(1, 1)
# ax2.plot(Ts1, Vm1, label='$V_{motor1}$', lw=2)
# ax2.plot(Ts2, Vm2, label='$V_{motor2}$', lw=2)
# ax2.plot(Ts3, Vm3, label='$V_{motor3}$', lw=2)
# ax2.plot(Ts3, Vm3, label='$V_{motor4}$', lw=6, alpha=0.25)
# ax2.legend()

plt.show()
