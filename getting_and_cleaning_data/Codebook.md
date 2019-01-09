# Codebook for the tidy dataset

This dataset contains what was requested in question 5 of the peer reviewed assignment, that is, the average of each variable for each activity and each subject.

The dataset has 68 columns: subject, activity, and 66 variable columns for the mean of each measurement. The measurements are both the mean and standard deviation of the following signals:

t_bodyacc_xyz
t_gravityacc_xyz
t_bodyaccjerk_xyz
t_bodygyro_xyz
t_bodygyrojerk_xyz
t_bodyaccmag
t_gravityaccmag
t_bodyaccjerkmag
t_bodygyromag
t_bodygyrojerkmag
f_bodyacc_xyz
f_bodyaccjerk_xyz
f_bodygyro_xyz
f_bodyaccmag
f_bodyaccjerkmag
f_bodygyromag
f_bodygyrojerkmag

Note that the 8 of the above signals have 3 vector components: x,y and z. 

Variable names have the structure: ```domain_signal_measurement_axis```. Domain is a single letter (t or f) denoting whether the measurement is from either time or Fourier transform domains. Signal is the simply the signal being captured. Measurement denotes either mean or standard deviation. Axis denotes the respective vector component of 3D signals (x, y or z). 